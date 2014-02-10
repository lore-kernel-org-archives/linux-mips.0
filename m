Received: from szxga01-in.huawei.com ([119.145.14.64]:28267 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6822672AbaBJBO5qb4n8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 10 Feb 2014 02:14:57 +0100
Message-ID: <52F827D3.5080906@huawei.com>
Date: Mon, 10 Feb 2014 09:13:55 +0800
From: Yijing Wang <wangyijing@huawei.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] clocksource: Make clocksource register functions
 void
References: <1390461166-36440-1-git-send-email-wangyijing@huawei.com> <52E0C889.6000106@prisktech.co.nz> <063D6719AE5E284EB5DD2968C1650D6D46489C@AcuExch.aculab.com> <alpine.DEB.2.02.1402052139560.24986@ionos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.02.1402052139560.24986@ionos.tec.linutronix.de>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <wangyijing@huawei.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>, David Laight <David.Laight@ACULAB.COM>
Cc: 'Tony Prisk' <linux@prisktech.co.nz>, John Stultz <john.stultz@linaro.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kevin Hilman <khilman@deeprootsystems.com>, "linux@lists.openrisc.net" <linux@openrisc.net>, Sekhar Nori <nsekhar@ti.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Daniel Walker <dwalker@fifo99.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Jonas Bonn <jonas@southpole.se>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Richard Weinberger <richard@nod.at>, "x86@kernel.org" <x86@kernel.org>, Tony Lindgren <tony@atomide.com>, Ingo Molnar <mingo@redhat.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, David Brown <davidb@codeaurora.org>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Mike Frysinger <vapier@gentoo.org>, "user-mode-linux-devel@lists.sourceforge.net" <user-mode-linux-devel@lists.sourceforge.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jeff Dike <jdike@addtoit.com>, Barry Song <baohua@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "user-mode-linux-user@lists.sourceforge.net" <user-mode-linux-user@lists.sourceforge.net>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, Michal Simek <monstr@monstr.eu>, Jim Cromie <jim.cromie@gmail.com>, "microblaze-uclinux@itee.uq.edu.au" <microblaze-uclinux@itee.uq.edu.au>, Hanjun Guo <guohanjun@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Bryan Huntsman <bryanh@codeaurora.org>, "uclinux-dist-devel@blackfin.uclinux.org" <uclinux-dist-devel@blackfin.uclinux.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Message-ID: <20140210011355.JBnwwS4sV1wGRyh8MJhHTisE0yTZfXspBBcVz4HJj84@z>

On 2014/2/6 4:40, Thomas Gleixner wrote:
> Yijing,
> 
> On Thu, 23 Jan 2014, David Laight wrote:
> 
>> From: Linuxppc-dev Tony Prisk
>>> On 23/01/14 20:12, Yijing Wang wrote:
>>>> Currently, clocksource_register() and __clocksource_register_scale()
>>>> functions always return 0, it's pointless, make functions void.
>>>> And remove the dead code that check the clocksource_register_hz()
>>>> return value.
>>> ......
>>>> -static inline int clocksource_register_hz(struct clocksource *cs, u32 hz)
>>>> +static inline void clocksource_register_hz(struct clocksource *cs, u32 hz)
>>>>   {
>>>>   	return __clocksource_register_scale(cs, 1, hz);
>>>>   }
>>>
>>> This doesn't make sense - you are still returning a value on a function
>>> declared void, and the return is now from a function that doesn't return
>>> anything either ?!?!
>>> Doesn't this throw a compile-time warning??
>>
>> It depends on the compiler.
>> Recent gcc allow it.
>> I don't know if it is actually valid C though.
>>
>> There is no excuse for it on lines like the above though.
> 
> Can you please resend with that fixed against 3.14-rc1 ?

OK, I will resend later.

Thanks!
Yijing.


> 
> .
> 


-- 
Thanks!
Yijing
