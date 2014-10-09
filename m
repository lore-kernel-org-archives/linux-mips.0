Received: from mailapp01.imgtec.com ([195.59.15.196]:21336 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010880AbaJIWnMWClVq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Oct 2014 00:43:12 +0200
Date: Thu, 9 Oct 2014 23:43:04 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v2 2/3] MIPS: Setup an instruction emulation in VDSO
 protected page instead of user stack
Message-ID: <20141009224304.GA4818@jhogan-linux.le.imgtec.org>
References: <20141009195030.31230.58695.stgit@linux-yegoshin>
 <20141009200017.31230.69698.stgit@linux-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20141009200017.31230.69698.stgit@linux-yegoshin>
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org, Zubair.Kakakhel@imgtec.com, geert+renesas@glider.be, david.daney@cavium.com, peterz@infradead.org, paul.gortmaker@windriver.com, davidlohr@hp.com, macro@linux-mips.org, chenhc@lemote.com, richard@nod.at, zajec5@gmail.com, keescook@chromium.org, alex@alex-smith.me.uk, tglx@linutronix.de, blogic@openwrt.org, jchandra@broadcom.com, paul.burton@imgtec.com, qais.yousef@imgtec.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, markos.chandras@imgtec.com, dengcheng.zhu@imgtec.com, manuel.lauss@gmail.com, akpm@linux-foundation.org, lars.persson@axis.com
Message-ID: <20141009224304.6RPyeEEuESuav9mJiBr2HUehgtiGcKWq5aNkvlwB0MA@z>

Hi Leonid,

On Thu, Oct 09, 2014 at 01:00:17PM -0700, Leonid Yegoshin wrote:
> Signal happend during run in emulation block is handled properly - EPC is
> changed to before an emulated jump or to target address, depending from point of
> signal.

Great!

> Small stack of emulation blocks is supported because nested traps are possible
> in MIPS32/64 R6 emulation mix with FPU emulation.

Could you please clarify how this nesting of emulation blocks could
happen now that signals are handled more cleanly.

I.e. isn't the emuframe stuff only required for instructions in branch
delay slots, and branches shouldn't be in branch delay slots anyway, so
I don't get how they could nest.

Thanks
James
