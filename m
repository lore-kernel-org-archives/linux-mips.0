Received: from mail-oa0-f48.google.com ([209.85.219.48]:40356 "EHLO
        mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6854779AbaFXTIXRZlul (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Jun 2014 21:08:23 +0200
Received: by mail-oa0-f48.google.com with SMTP id m1so850199oag.21
        for <linux-mips@linux-mips.org>; Tue, 24 Jun 2014 12:08:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140624183749.GC1258@redhat.com>
References: <1403560693-21809-1-git-send-email-keescook@chromium.org>
        <1403560693-21809-8-git-send-email-keescook@chromium.org>
        <20140624172753.GA31435@redhat.com>
        <CAGXu5jKoDEXffJqFSjhO+D=5toJOA=KAomi+LQOahPDYKFbEdg@mail.gmail.com>
        <20140624183749.GC1258@redhat.com>
Date: Tue, 24 Jun 2014 12:08:16 -0700
Message-ID: <CAGXu5jKwF1cbc=4O5nXDKZT8HF7grCm+AaRz7v1VCdPVMRX-3A@mail.gmail.com>
Subject: Re: [PATCH v7 7/9] seccomp: implement SECCOMP_FILTER_FLAG_TSYNC
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
Message-ID: <20140624190816.rlg-WCKu2MtatoWjrNJrEGu2XCP6p-5f_kFFmcGjmMQ@z>

On Tue, Jun 24, 2014 at 11:37 AM, Oleg Nesterov <oleg@redhat.com> wrote:
> On 06/24, Kees Cook wrote:
>>
>> On Tue, Jun 24, 2014 at 10:27 AM, Oleg Nesterov <oleg@redhat.com> wrote:
>> > On 06/23, Kees Cook wrote:
>> >>
>> >> +static pid_t seccomp_can_sync_threads(void)
>> >> +{
>> >> +     struct task_struct *thread, *caller;
>> >> +
>> >> +     BUG_ON(write_can_lock(&tasklist_lock));
>> >> +     BUG_ON(!spin_is_locked(&current->sighand->siglock));
>> >> +
>> >> +     if (current->seccomp.mode != SECCOMP_MODE_FILTER)
>> >> +             return -EACCES;
>> >> +
>> >> +     /* Validate all threads being eligible for synchronization. */
>> >> +     thread = caller = current;
>> >> +     for_each_thread(caller, thread) {
>> >> +             pid_t failed;
>> >> +
>> >> +             if (thread->seccomp.mode == SECCOMP_MODE_DISABLED ||
>> >> +                 (thread->seccomp.mode == SECCOMP_MODE_FILTER &&
>> >> +                  is_ancestor(thread->seccomp.filter,
>> >> +                              caller->seccomp.filter)))
>> >> +                     continue;
>> >> +
>> >> +             /* Return the first thread that cannot be synchronized. */
>> >> +             failed = task_pid_vnr(thread);
>> >> +             /* If the pid cannot be resolved, then return -ESRCH */
>> >> +             if (failed == 0)
>> >> +                     failed = -ESRCH;
>> >
>> > forgot to mention, task_pid_vnr() can't fail. sighand->siglock is held,
>> > for_each_thread() can't see a thread which has passed unhash_process().
>>
>> Certainly good to know, but I'd be much more comfortable leaving this
>> check as-is. Having "failed" return with "0" would be very very bad
>> (userspace would think the filter had been successfully applied, etc).
>> I'd rather stay highly defensive here.
>
> OK, agreed. Although in this case I'd suggest
>
>                 if (WARN_ON(failed == 0))
>                         failed = -ESRCH;
>
> but I won't insist.

Excellent idea, yes! I'll include this as well.

-Kees

-- 
Kees Cook
Chrome OS Security
