Received: from mail-la0-f43.google.com ([209.85.215.43]:52343 "EHLO
        mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6842554AbaFXTwJVuMZQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Jun 2014 21:52:09 +0200
Received: by mail-la0-f43.google.com with SMTP id e16so30183lan.16
        for <linux-mips@linux-mips.org>; Tue, 24 Jun 2014 12:52:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGXu5jJjuNmf=FRzUPMChvL4D_xkg034pUbRAbaK38f37GYC0A@mail.gmail.com>
References: <1403560693-21809-1-git-send-email-keescook@chromium.org>
 <1403560693-21809-5-git-send-email-keescook@chromium.org> <20140624191815.GA3623@redhat.com>
 <CALCETrVgpP=zOtiQafVgcic2T95TdEM5DTvHYXWTbcZ14xBqHQ@mail.gmail.com>
 <20140624193055.GA4482@redhat.com> <CALCETrU9x05ADgz9JToiw_BuCPz1h0xmOh=1R3eojL9far1aEA@mail.gmail.com>
 <CAGXu5jJjuNmf=FRzUPMChvL4D_xkg034pUbRAbaK38f37GYC0A@mail.gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 24 Jun 2014 12:51:43 -0700
Message-ID: <CALCETrUCK0g3nTQP+Oh7-JXh-mODAC-Bemr1fCYMJyDvjFPcjQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/9] seccomp: move no_new_privs into seccomp
Content-Type: text/plain; charset=UTF-8
Return-Path: <luto@amacapital.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kees Cook <keescook@chromium.org>
Cc: Oleg Nesterov <oleg@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@plumgrid.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Daniel Borkmann <dborkman@redhat.com>, Will Drewry <wad@chromium.org>, Julien Tinnes <jln@chromium.org>, David Drysdale <drysdale@google.com>, Linux API <linux-api@vger.kernel.org>, X86 ML <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mips@linux-mips.org, linux-arch <linux-arch@vger.kernel.org>, LSM List <linux-security-module@vger.kernel.org>
Message-ID: <20140624195143.-6bJPjakhb_WfHpFiWRjvWDflhRvnC2ZfdafxGT3QHk@z>

On Tue, Jun 24, 2014 at 12:50 PM, Kees Cook <keescook@chromium.org> wrote:
> On Tue, Jun 24, 2014 at 12:34 PM, Andy Lutomirski <luto@amacapital.net> wrote:
>> On Tue, Jun 24, 2014 at 12:30 PM, Oleg Nesterov <oleg@redhat.com> wrote:
>>> On 06/24, Andy Lutomirski wrote:
>>>>
>>>> On Tue, Jun 24, 2014 at 12:18 PM, Oleg Nesterov <oleg@redhat.com> wrote:
>>>> >>
>>>> >> -struct seccomp { };
>>>> >> +struct seccomp {
>>>> >> +     unsigned long flags;
>>>> >> +};
>>>> >
>>>> > A bit messy ;)
>>>> >
>>>> > I am wondering if we can simply do
>>>> >
>>>> >         static inline bool current_no_new_privs(void)
>>>> >         {
>>>> >                 if (current->no_new_privs)
>>>> >                         return true;
>>>> >
>>>> >         #ifdef CONFIG_SECCOMP
>>>> >                 if (test_thread_flag(TIF_SECCOMP))
>>>> >                         return true;
>>>> >         #endif
>>>>
>>>> Nope -- privileged users can enable seccomp w/o nnp.
>>>
>>> Indeed, I am stupid.
>>>
>>> Still it would be nice to cleanup this somehow. The new member is only
>>> used as a previous ->no_new_privs, just it is long to allow the concurent
>>> set/get. Logically it doesn't even belong to seccomp{}.
>>
>> We could add an unsigned long atomic flags field to task_struct.
>
> I thought that had gotten shot down originally, but given the current
> state of the patch series, it would be effectively identical, since my
> earlier attempt at keeping sizes the same (with alternate accessors)
> was too messy. I will change this as well.
>
>> Grr.  Why isn't there an unsigned *int* atomic bitmask type?  Even u64
>> would be better.  unsigned long is useless.
>
> Useless beyond 32 bits. ;)

It basically guarantees 32 wasted bits on 64-bit systems.

I guess that unsigned long foo[64/BITS_PER_LONG] would work, bit that's hideous.

--Andy
