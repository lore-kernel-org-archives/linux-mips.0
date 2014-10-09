Received: from mailapp01.imgtec.com ([195.59.15.196]:62800 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011019AbaJIXK1MU4Hp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Oct 2014 01:10:27 +0200
Message-ID: <543715D7.1020505@imgtec.com>
Date: Thu, 9 Oct 2014 16:10:15 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] MIPS: Setup an instruction emulation in VDSO protected
 page instead of user stack
References: <20141009195030.31230.58695.stgit@linux-yegoshin> <20141009200017.31230.69698.stgit@linux-yegoshin> <20141009224304.GA4818@jhogan-linux.le.imgtec.org>
In-Reply-To: <20141009224304.GA4818@jhogan-linux.le.imgtec.org>
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
Message-ID: <20141009231015.fE5wh-WaODO04yl2HIxL_9bHC8bK92J9MsO35HgNPeI@z>

>> Small stack of emulation blocks is supported because nested traps are possible
>> in MIPS32/64 R6 emulation mix with FPU emulation.
> Could you please clarify how this nesting of emulation blocks could
> happen now that signals are handled more cleanly.
>
> I.e. isn't the emuframe stuff only required for instructions in branch
> delay slots, and branches shouldn't be in branch delay slots anyway, so
> I don't get how they could nest.
>
It may be a case for mix of FPU and MIPS R6 emulations. I just keep both 
emulators separate as much as possible but I assume that without prove 
it may be stackable - some rollback is needed to join both and it may 
(probably) cause a double emulation setup - dsemul may be called twice 
for the same pair of instructions. I didn't see that yet, honestly and 
you may be right.

And as for signals - it is a different issue, some signal may happen 
before or after emulated instruction in emulation block and I see that. 
But I see it only before because of probability for it is a lot of 
higher. Unwinding is need because signal handler may not return but 
longjump to somewhere.
