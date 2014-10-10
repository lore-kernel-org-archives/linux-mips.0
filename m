Received: from mailapp01.imgtec.com ([195.59.15.196]:45162 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011026AbaJJAHUX9kjm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Oct 2014 02:07:20 +0200
Message-ID: <5437232F.60800@imgtec.com>
Date: Thu, 9 Oct 2014 17:07:11 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] MIPS: Setup an instruction emulation in VDSO protected
 page instead of user stack
References: <20141009195030.31230.58695.stgit@linux-yegoshin> <20141009200017.31230.69698.stgit@linux-yegoshin> <20141009224304.GA4818@jhogan-linux.le.imgtec.org> <543715D7.1020505@imgtec.com> <20141009234044.GB4818@jhogan-linux.le.imgtec.org>
In-Reply-To: <20141009234044.GB4818@jhogan-linux.le.imgtec.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, Zubair.Kakakhel@imgtec.com, geert+renesas@glider.be, david.daney@cavium.com, peterz@infradead.org, paul.gortmaker@windriver.com, davidlohr@hp.com, macro@linux-mips.org, chenhc@lemote.com, richard@nod.at, zajec5@gmail.com, keescook@chromium.org, alex@alex-smith.me.uk, tglx@linutronix.de, blogic@openwrt.org, jchandra@broadcom.com, paul.burton@imgtec.com, qais.yousef@imgtec.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, markos.chandras@imgtec.com, dengcheng.zhu@imgtec.com, manuel.lauss@gmail.com, akpm@linux-foundation.org, lars.persson@axis.com
Message-ID: <20141010000711.4RZsdG7Qqe8sONrimtzypOqB_xMSHPm1FWfb6GqYfr0@z>

On 10/09/2014 04:40 PM, James Hogan wrote:
>
>> It may be a case for mix of FPU and MIPS R6 emulations. I just keep both
>> emulators separate as much as possible but I assume that without prove
>> it may be stackable - some rollback is needed to join both and it may
>> (probably) cause a double emulation setup - dsemul may be called twice
>> for the same pair of instructions. I didn't see that yet, honestly and
>> you may be right.
> If the only time they're used is for emulation of a branch delay slot
> instruction which should never be another branch, and signals always
> undo the emuframe before being handled (btw, should the BD bit in cause
> get set if rewinding for signal handlers/gdb?), then it stands to reason
> it should never nest.

I don't want to give a chance. If it is proved excessive, then slashing 
it - 15minutes, it doesn't harm.

OK, I will spend some time to look into that, it have sense to 
reconsider after unwinding signals.

>
> You could then avoid the whole stack and per-thread thing and just have
> a maximum of one emuframe dedicated to each thread or allocated on
> demand, and if there genuinely is a use case for nesting later on, worry
> about it then.

As I understand, you propose to allocate some space in mmap.

This requires a stuff to handle allocation of user space beyond VMAs.
It also may have some pain during thread creation, stopping and 
subsequent cloning because that memory allocator should service that 
events too and it may be not easy if emulation blocks are packed into 
page. If it is not packed then it waste of user space and put additional 
constraint to number of thread on single mmap.

Some cooperation with GLIBC may be needed to prevent re-use of user 
address space, at a moment not sure the extent of it.

I estimated that it can be much more troubling.

>
> So long as the kernel handles a long sequence of sequential emulated
> branches gracefully (not necessarily correctly).
>
I don't understand a question. Each pair/single instruction is emulated 
separately but there is some pipeline of that, even in FPU emulator, it 
is just not this patch issue.
