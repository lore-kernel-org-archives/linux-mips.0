Received: from mx0.aculab.com ([213.249.233.131]:37047 "HELO mx0.aculab.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with SMTP
        id S6825736AbaAWLknsHcyV convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Jan 2014 12:40:43 +0100
Received: from mx0.aculab.com ([127.0.0.1])
 by localhost (mx0.aculab.com [127.0.0.1]) (amavisd-new, port 10024) with SMTP
 id 29567-09 for <linux-mips@linux-mips.org>;
 Thu, 23 Jan 2014 11:40:35 +0000 (GMT)
From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH 2/2] clocksource: Make clocksource register functions
 void
Date: Thu, 23 Jan 2014 11:40:35 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6D46489C@AcuExch.aculab.com>
References: <1390461166-36440-1-git-send-email-wangyijing@huawei.com>
 <52E0C889.6000106@prisktech.co.nz>
In-Reply-To: <52E0C889.6000106@prisktech.co.nz>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <David.Laight@ACULAB.COM>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: 'Tony Prisk' <linux@prisktech.co.nz>, Yijing Wang <wangyijing@huawei.com>, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kevin Hilman <khilman@deeprootsystems.com>, "linux@lists.openrisc.net" <linux@lists.openrisc.net>, Sekhar Nori <nsekhar@ti.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Daniel Walker <dwalker@fifo99.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Jonas Bonn <jonas@southpole.se>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Richard Weinberger <richard@nod.at>, "x86@kernel.org" <x86@kernel.org>, Tony Lindgren <tony@atomide.com>, Ingo Molnar <mingo@redhat.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, David Brown <davidb@codeaurora.org>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Mike Frysinger <vapier@gentoo.org>, "user-mode-linux-devel@lists.sourceforge.net" <user-mode-linux-devel@lists.sourceforge.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jeff Dike <jdike@addtoit.com>, Barry Song <baohua@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "user-mode-linux-user@lists.sourceforge.net" <user-mode-linux-user@lists.sourceforge.net>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, Michal Simek <monstr@monstr.eu>, Jim Cromie <jim.cromie@gmail.com>, "microblaze-uclinux@itee.uq.edu.au" <microblaze-uclinux@itee.uq.edu.au>, Hanjun Guo <guohanjun@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Bryan Huntsman <bryanh@codeaurora.org>, "uclinux-dist-devel@blackfin.uclinux.org" <uclinux-dist-devel@blackfin.uclinux.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Message-ID: <20140123114035.B2by8dtH_Gts407_GmdKfd9PaAQ5lVLZI4ddik8_opA@z>

From: Linuxppc-dev Tony Prisk
> On 23/01/14 20:12, Yijing Wang wrote:
> > Currently, clocksource_register() and __clocksource_register_scale()
> > functions always return 0, it's pointless, make functions void.
> > And remove the dead code that check the clocksource_register_hz()
> > return value.
> ......
> > -static inline int clocksource_register_hz(struct clocksource *cs, u32 hz)
> > +static inline void clocksource_register_hz(struct clocksource *cs, u32 hz)
> >   {
> >   	return __clocksource_register_scale(cs, 1, hz);
> >   }
> 
> This doesn't make sense - you are still returning a value on a function
> declared void, and the return is now from a function that doesn't return
> anything either ?!?!
> Doesn't this throw a compile-time warning??

It depends on the compiler.
Recent gcc allow it.
I don't know if it is actually valid C though.

There is no excuse for it on lines like the above though.

	David
