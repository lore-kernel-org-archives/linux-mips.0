Received: from bh-25.webhostbox.net ([208.91.199.152]:60694 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006895AbbDUPlhTTwbl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Apr 2015 17:41:37 +0200
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.85)
        (envelope-from <linux@roeck-us.net>)
        id 1YkaIm-002QEB-N2
        for linux-mips@linux-mips.org; Tue, 21 Apr 2015 15:41:32 +0000
Date: Tue, 21 Apr 2015 08:41:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: mips build failures due to commit 8dd928915a73 (mips: fix up
 obsolete cpu function usage)
Message-ID: <20150421154108.GA20223@roeck-us.net>
References: <20150420194028.GA10814@roeck-us.net>
 <20150420210933.GB31618@fuloong-minipc.musicnaut.iki.fi>
 <87fv7up15k.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fv7up15k.fsf@rustcorp.com.au>
Return-Path: <linux@roeck-us.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20150421154108.8_W1EHSJ57Lv-170K4qcNBgmOUNDD2t1Y_Xq9vljNyU@z>

On Tue, Apr 21, 2015 at 01:45:35PM +0930, Rusty Russell wrote:
> Aaro Koskinen <aaro.koskinen@iki.fi> writes:
> > Hi,
> >
> > On Mon, Apr 20, 2015 at 12:40:28PM -0700, Guenter Roeck wrote:
> >> the upstream kernel fails to build mips:nlm_xlp_defconfig,
> >> mips:nlm_xlp_defconfig, mips:cavium_octeon_defconfig, and possibly
> >> other targets, with errors such as
> >> 
> >> arch/mips/kernel/smp.c:211:2: error:
> >> 	passing argument 2 of 'cpumask_set_cpu' discards 'volatile' qualifier
> >> 	from pointer target type
> >> arch/mips/kernel/process.c:52:2: error:
> >> 	passing argument 2 of 'cpumask_test_cpu' discards 'volatile' qualifier
> >> 	from pointer target type
> >> arch/mips/cavium-octeon/smp.c:242:2: error:
> >> 	passing argument 2 of 'cpumask_clear_cpu' discards 'volatile' qualifier
> >> 	from pointer target type
> >> 
> >> The problem was introduced with commit 8dd928915a73 (" mips: fix up
> >> obsolete cpu function usage"). I would send a patch to fix it, but I
> >> am not sure if removing 'volatile' from the variable declaration(s)
> >> would be a good idea.
> >
> > I think removing volatile from cpu_callin_map declaration should be OK,
> > since test_cpu (only reader) uses test_bit which takes care of it:
> >
> > 	static inline int test_bit(int nr, const volatile unsigned long *addr)
> 
> No, that got replaced too, with cpumask_test_cpu AFAICT.
> 
> You can open-code it, like so:
> 
>         test_bit(0, cpumask_bits(cpu_callin_map));
> 
> But you probably want to put a barrier in that loop instead of relying
> on volatile.
> 
The following might do it. Note that I can not really test it since I don't have
a real mips system, and qemu gets rcu hangs if I enable more than one CPU (I see
that with older kernels as well, so it is not a new problem). Someone will have
to test the patch on a real multi-core system.

Guenter

---
