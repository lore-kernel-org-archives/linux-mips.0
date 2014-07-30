Received: from mail-la0-f52.google.com ([209.85.215.52]:54387 "EHLO
        mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6860088AbaG3RYAYVWFt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 30 Jul 2014 19:24:00 +0200
Received: by mail-la0-f52.google.com with SMTP id e16so1141748lan.39
        for <linux-mips@linux-mips.org>; Wed, 30 Jul 2014 10:23:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140730164344.GA27954@localhost.localdomain>
References: <cover.1406604806.git.luto@amacapital.net> <7123b2489cc5d1d5abb7bcf1364ca729cab3e6ca.1406604806.git.luto@amacapital.net>
 <20140729193232.GA8153@redhat.com> <20140730164344.GA27954@localhost.localdomain>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 30 Jul 2014 10:23:34 -0700
Message-ID: <CALCETrUVaz3JFiNbyU=r3M-E9muHa1ffn7RX+_-4V_0U-hVaPw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] x86,entry: Only call user_exit if TIF_NOHZ
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
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Will Drewry <wad@chromium.org>, X86 ML <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linux-arch <linux-arch@vger.kernel.org>, LSM List <linux-security-module@vger.kernel.org>, Alexei Starovoitov <ast@plumgrid.com>, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <20140730172334.2kjs35QEhD97GifCBN_tIZsTguZt8OHsepbnIe854LU@z>

On Wed, Jul 30, 2014 at 9:43 AM, Frederic Weisbecker <fweisbec@gmail.com> wrote:
> On Tue, Jul 29, 2014 at 09:32:32PM +0200, Oleg Nesterov wrote:
>> On 07/28, Andy Lutomirski wrote:
>> >
>> > @@ -1449,7 +1449,12 @@ long syscall_trace_enter(struct pt_regs *regs)
>> >  {
>> >     long ret = 0;
>> >
>> > -   user_exit();
>> > +   /*
>> > +    * If TIF_NOHZ is set, we are required to call user_exit() before
>> > +    * doing anything that could touch RCU.
>> > +    */
>> > +   if (test_thread_flag(TIF_NOHZ))
>> > +           user_exit();
>>
>> Personally I still think this change just adds more confusion, but I leave
>> this to you and Frederic.
>>
>> It is not that "If TIF_NOHZ is set, we are required to call user_exit()", we
>> need to call user_exit() just because we enter the kernel. TIF_NOHZ is just
>> the implementation detail which triggers this slow path.
>>
>> At least it should be correct, unless I am confused even more than I think.
>
> Agreed, Perhaps the confusion is on the syscall_trace_enter() name which suggests
> this is only about tracing? syscall_slowpath_enter() could be an alternative.
> But that's still tracing in a general sense so...

At the end of the day, the syscall slowpath code calls a bunch of
functions depending on what TIF_XYZ flags are set.  As long as it's
structured like "if (TIF_A) do_a(); if (TIF_B) do_b();" or something
like that, it's comprehensible.  But once random functions with no
explicit flag checks or comments start showing up, it gets confusing.

If it's indeed all-or-nothing, I could remove the check and add a
comment.  But please keep in mind that, currently, the slow path is
*slow*, and my patches only improve the entry case.  So enabling
context tracking on every task will hurt.

--Andy
