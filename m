Received: from mailapp01.imgtec.com ([195.59.15.196]:42014 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012601AbbHFAkl0P85x (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Aug 2015 02:40:41 +0200
Date: Wed, 5 Aug 2015 17:40:32 -0700
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v4 3/3] MIPS: set stack/data protection as non-executable
Message-ID: <20150806004032.GA24016@NP-P-BURTON>
References: <20150805234348.20722.71740.stgit@ubuntu-yegoshin>
 <20150805234936.20722.60927.stgit@ubuntu-yegoshin>
 <20150805235543.GG2057@NP-P-BURTON>
 <55C2A50A.50805@imgtec.com>
 <55C2A6FE.1020003@caviumnetworks.com>
 <55C2A91B.1090704@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <55C2A91B.1090704@imgtec.com>
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: David Daney <ddaney@caviumnetworks.com>, daniel.sanders@imgtec.com, linux-mips@linux-mips.org, cernekee@gmail.com, Zubair.Kakakhel@imgtec.com, geert+renesas@glider.be, david.daney@cavium.com, peterz@infradead.org, heiko.carstens@de.ibm.com, paul.gortmaker@windriver.com, behanw@converseincode.com, macro@linux-mips.org, cl@linux.com, pkarat@mvista.com, linux@roeck-us.net, tkhai@yandex.ru, james.hogan@imgtec.com, alexinbeijing@gmail.com, rusty@rustcorp.com.au, Steven.Hill@imgtec.com, lars.persson@axis.com, aleksey.makarov@auriga.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, luto@amacapital.net, dahi@linux.vnet.ibm.com, markos.chandras@imgtec.com, eunb.song@samsung.com, kumba@gentoo.org
Message-ID: <20150806004032.n-18CwXqh6y_7JxeA7xbtqfJeruRhur87h2D9VVFP6s@z>

On Wed, Aug 05, 2015 at 05:23:55PM -0700, Leonid Yegoshin wrote:
> It is actually any application which requests non-executable stack
> protection and needs some emulation BEFORE GLIBC cancels that non-executable
> stack protection due to libraries.
> 
> If you build all libraries with PT_GNU_STACK 'non-executable' and use
> application with the same protection then you can't emulate even a single
> instruction - it crashes immediately. So, it is not a bad application, it is
> a bad choice for emulation space in past.

...snip...

> Create a buildroot FS with PT_GNU_STACK 'non-executable' libraries. Then run
> ssh_keygen on CPU without FPU and look.
> 
> You also may try to run MIPS R2 Debian on MIPS R6 CPU, and see a spectacular
> failure of ssh_keygen (it tries to emulate MIPS R2 instruction before first
> library is loaded and that fails due to non-executable stack protection.

All of that sounds like perfectly valid reasons to move the FP branch
delay emulation away from using the stack, which we absolutely do need
to do. They do not however justify changing the default flags & breaking
backwards compatibility.

Thanks,
    Paul
