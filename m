Received: from mail-ob0-f172.google.com ([209.85.214.172]:46008 "EHLO
        mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6843091AbaFMVxncXIuG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Jun 2014 23:53:43 +0200
Received: by mail-ob0-f172.google.com with SMTP id uy5so3448538obc.3
        for <linux-mips@linux-mips.org>; Fri, 13 Jun 2014 14:53:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMEtUuwKRUYN_qdnCj42G3Z1UT3vMYPoJqXd2_PjV+_J3WA+8w@mail.gmail.com>
References: <1402457121-8410-1-git-send-email-keescook@chromium.org>
        <1402457121-8410-7-git-send-email-keescook@chromium.org>
        <CAMEtUuwKRUYN_qdnCj42G3Z1UT3vMYPoJqXd2_PjV+_J3WA+8w@mail.gmail.com>
Date: Fri, 13 Jun 2014 14:53:37 -0700
Message-ID: <CAGXu5jJjq=Yw4+fax6nEKyLxKR4N9wd5ReNgU+bUb266GFUEgw@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] seccomp: add "seccomp" syscall
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
To: Alexei Starovoitov <ast@plumgrid.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-api@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>, Oleg Nesterov <oleg@redhat.com>, Will Drewry <wad@chromium.org>, Julien Tinnes <jln@chromium.org>, David Drysdale <drysdale@google.com>, John Johansen <john.johansen@canonical.com>, Andrew Morton <akpm@linux-foundation.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mips@linux-mips.org, linux-arch <linux-arch@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
Message-ID: <20140613215337.eUBFyCvMtnrNlqABVKyorWI4ze6Syy3Snxkogq-KOSA@z>

On Fri, Jun 13, 2014 at 2:22 PM, Alexei Starovoitov <ast@plumgrid.com> wrote:
> On Tue, Jun 10, 2014 at 8:25 PM, Kees Cook <keescook@chromium.org> wrote:
>> This adds the new "seccomp" syscall with both an "operation" and "flags"
>> parameter for future expansion. The third argument is a pointer value,
>> used with the SECCOMP_SET_MODE_FILTER operation. Currently, flags must
>> be 0. This is functionally equivalent to prctl(PR_SET_SECCOMP, ...).
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> Cc: linux-api@vger.kernel.org
>> ---
>> diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
>> index b0881a0ed322..1713977ee26f 100644
>> --- a/include/linux/syscalls.h
>> +++ b/include/linux/syscalls.h
>> @@ -866,4 +866,6 @@ asmlinkage long sys_process_vm_writev(pid_t pid,
>>  asmlinkage long sys_kcmp(pid_t pid1, pid_t pid2, int type,
>>                          unsigned long idx1, unsigned long idx2);
>>  asmlinkage long sys_finit_module(int fd, const char __user *uargs, int flags);
>> +asmlinkage long sys_seccomp(unsigned int op, unsigned int flags,
>> +                           const char __user *uargs);
>
> It looks odd to add 'flags' argument to syscall that is not even used.

FWIW, "flags" is given use in the next patch to support the tsync option.

-Kees

-- 
Kees Cook
Chrome OS Security
