Received: from mail-oa0-f47.google.com ([209.85.219.47]:60534 "EHLO
        mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6855803AbaFXTqHTxITy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Jun 2014 21:46:07 +0200
Received: by mail-oa0-f47.google.com with SMTP id n16so924821oag.34
        for <linux-mips@linux-mips.org>; Tue, 24 Jun 2014 12:46:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140624183024.GA1258@redhat.com>
References: <1403560693-21809-1-git-send-email-keescook@chromium.org>
        <1403560693-21809-4-git-send-email-keescook@chromium.org>
        <20140624183024.GA1258@redhat.com>
Date: Tue, 24 Jun 2014 12:46:01 -0700
Message-ID: <CAGXu5j+Khz+HH3QvfNWa3FdUspTEf-xLchBMLyCC_QN42xpLZA@mail.gmail.com>
Subject: Re: [PATCH v7 3/9] seccomp: introduce writer locking
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Return-Path: <keescook@google.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Oleg Nesterov <oleg@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>, Alexei Starovoitov <ast@plumgrid.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Daniel Borkmann <dborkman@redhat.com>, Will Drewry <wad@chromium.org>, Julien Tinnes <jln@chromium.org>, David Drysdale <drysdale@google.com>, Linux API <linux-api@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mips@linux-mips.org, linux-arch <linux-arch@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
Message-ID: <20140624194601.6MvNQFalwDwB_B8HeGZCdVdhOFAIVp9nf_aDl_G0-PA@z>

On Tue, Jun 24, 2014 at 11:30 AM, Oleg Nesterov <oleg@redhat.com> wrote:
> I am puzzled by the usage of smp_load_acquire(),

It was recommended by Andy Lutomirski in preference to ACCESS_ONCE().

> On 06/23, Kees Cook wrote:
>>
>>  static u32 seccomp_run_filters(int syscall)
>>  {
>> -     struct seccomp_filter *f;
>> +     struct seccomp_filter *f = smp_load_acquire(&current->seccomp.filter);
>>       struct seccomp_data sd;
>>       u32 ret = SECCOMP_RET_ALLOW;
>>
>>       /* Ensure unexpected behavior doesn't result in failing open. */
>> -     if (WARN_ON(current->seccomp.filter == NULL))
>> +     if (WARN_ON(f == NULL))
>>               return SECCOMP_RET_KILL;
>>
>>       populate_seccomp_data(&sd);
>> @@ -186,9 +186,8 @@ static u32 seccomp_run_filters(int syscall)
>>        * All filters in the list are evaluated and the lowest BPF return
>>        * value always takes priority (ignoring the DATA).
>>        */
>> -     for (f = current->seccomp.filter; f; f = f->prev) {
>> +     for (; f; f = smp_load_acquire(&f->prev)) {
>>               u32 cur_ret = SK_RUN_FILTER(f->prog, (void *)&sd);
>> -
>>               if ((cur_ret & SECCOMP_RET_ACTION) < (ret & SECCOMP_RET_ACTION))
>>                       ret = cur_ret;
>
> OK, in this case the 1st one is probably fine, altgough it is not
> clear to me why it is better than read_barrier_depends().
>
> But why do we need a 2nd one inside the loop? And if we actually need
> it (I don't think so) then why it is safe to use f->prog without
> load_acquire ?

You're right -- it should not be possible for for any of the ->prev
pointers to change.

>>  void get_seccomp_filter(struct task_struct *tsk)
>>  {
>> -     struct seccomp_filter *orig = tsk->seccomp.filter;
>> +     struct seccomp_filter *orig = smp_load_acquire(&tsk->seccomp.filter);
>>       if (!orig)
>>               return;
>
> This one looks unneeded.
>
> First of all, afaics atomic_inc() should work correctly without any barriers,
> otherwise it is buggy. But even this doesn't matter.
>
> With this changes get_seccomp_filter() must be called under ->siglock, it can't
> race with add-filter and thus tsk->seccomp.filter should be stable.

Excellent point, yes. I'll remove that.

>>       /* Reference count is bounded by the number of total processes. */
>> @@ -361,7 +364,7 @@ void put_seccomp_filter(struct task_struct *tsk)
>>       /* Clean up single-reference branches iteratively. */
>>       while (orig && atomic_dec_and_test(&orig->usage)) {
>>               struct seccomp_filter *freeme = orig;
>> -             orig = orig->prev;
>> +             orig = smp_load_acquire(&orig->prev);
>>               seccomp_filter_free(freeme);
>>       }
>
> This one looks unneeded too. And note that this patch does not add
> smp_load_acquire() to read tsk->seccomp.filter.

Hrm, yes, that should get added.

> atomic_dec_and_test() adds mb(), we do not need more barriers to access
> ->prev ?

Right, same situation as the run_filters loop. Thanks!

-Kees

-- 
Kees Cook
Chrome OS Security
