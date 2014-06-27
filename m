Received: from mail-oa0-f48.google.com ([209.85.219.48]:38249 "EHLO
        mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6817913AbaF0R1MSSbIF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 27 Jun 2014 19:27:12 +0200
Received: by mail-oa0-f48.google.com with SMTP id m1so5967602oag.35
        for <linux-mips@linux-mips.org>; Fri, 27 Jun 2014 10:27:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140625180705.GB18185@redhat.com>
References: <1403642893-23107-1-git-send-email-keescook@chromium.org>
        <1403642893-23107-4-git-send-email-keescook@chromium.org>
        <20140625180705.GB18185@redhat.com>
Date: Fri, 27 Jun 2014 10:27:05 -0700
Message-ID: <CAGXu5j+97V=8H-ft0Rmn8PPR7X=m_L5vLzgneUvbv920+8Yc2w@mail.gmail.com>
Subject: Re: [PATCH v8 3/9] seccomp: introduce writer locking
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
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Alexei Starovoitov <ast@plumgrid.com>, Andrew Morton <akpm@linux-foundation.org>, Daniel Borkmann <dborkman@redhat.com>, Will Drewry <wad@chromium.org>, Julien Tinnes <jln@chromium.org>, David Drysdale <drysdale@google.com>, Linux API <linux-api@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mips@linux-mips.org, linux-arch <linux-arch@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
Message-ID: <20140627172705.fW9IacJPlSlwVNkIsfLvfx61EvSRWVXTrnsB38usjKg@z>

On Wed, Jun 25, 2014 at 11:07 AM, Oleg Nesterov <oleg@redhat.com> wrote:
> On 06/24, Kees Cook wrote:
>>
>> +static void copy_seccomp(struct task_struct *p)
>> +{
>> +#ifdef CONFIG_SECCOMP
>> +     /*
>> +      * Must be called with sighand->lock held, which is common to
>> +      * all threads in the group. Regardless, nothing special is
>> +      * needed for the child since it is not yet in the tasklist.
>> +      */
>> +     BUG_ON(!spin_is_locked(&current->sighand->siglock));
>> +
>> +     get_seccomp_filter(current);
>> +     p->seccomp = current->seccomp;
>> +
>> +     if (p->seccomp.mode != SECCOMP_MODE_DISABLED)
>> +             set_tsk_thread_flag(p, TIF_SECCOMP);
>> +#endif
>> +}
>
> Wait. But what about no_new_privs? We should copy it as well...
>
> Perhaps this helper should be updated a bit and moved into seccomp.c so
> that seccomp_sync_threads() could use it too.

Ah! Yes. I had been thinking it had been copied during the task_struct
duplication, but that would have been before holding sighand->lock, so
it needs explicit recopying. Thanks!

-Kees

-- 
Kees Cook
Chrome OS Security
