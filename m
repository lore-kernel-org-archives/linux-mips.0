Received: from alvesta.synopsys.com ([198.182.60.77]:65134 "EHLO
        alvesta.synopsys.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6815756Ab3GBESFEpv2B convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 2 Jul 2013 06:18:05 +0200
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v2] of: Specify initrd location using 64-bit
Date: Tue, 2 Jul 2013 04:17:46 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075137087@IN01WEMBXA.internal.synopsys.com>
References: <1372702835-5333-1-git-send-email-santosh.shilimkar@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Vineet.Gupta1@synopsys.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: "grant.likely@linaro.org" <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Salter <msalter@redhat.com>, Aurelien Jacquiot <a-jacquiot@ti.com>, James Hogan <james.hogan@imgtec.com>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Jonas Bonn <jonas@southpole.se>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "x86@kernel.org" <x86@kernel.org>, "arm@kernel.org" <arm@kernel.org>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, "robherring2@gmail.com" <robherring2@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
Message-ID: <20130702041746.5JDMbUcbPmh8UYSqFZS3MlYwV3pOsOPuTJrIxGafCCo@z>

On 07/01/2013 11:52 PM, Santosh Shilimkar wrote:
> On some PAE architectures, the entire range of physical memory could reside
> outside the 32-bit limit.  These systems need the ability to specify the
> initrd location using 64-bit numbers.
>
> This patch globally modifies the early_init_dt_setup_initrd_arch() function to
> use 64-bit numbers instead of the current unsigned long.
>
> There has been quite a bit of debate about whether to use u64 or phys_addr_t.
> It was concluded to stick to u64 to be consistent with rest of the device
> tree code. As summarized by Geert, "The address to load the initrd is decided
> by the bootloader/user and set at that point later in time. The dtb should not
> be tied to the kernel you are booting"
>
> More details on the discussion can be found here:
> https://lkml.org/lkml/2013/6/20/690
> https://lkml.org/lkml/2012/9/13/544
>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Mark Salter <msalter@redhat.com>
> Cc: Aurelien Jacquiot <a-jacquiot@ti.com>
> Cc: James Hogan <james.hogan@imgtec.com>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: x86@kernel.org
> Cc: arm@kernel.org
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: bigeasy@linutronix.de
> Cc: robherring2@gmail.com
> Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-c6x-dev@linux-c6x.org
> Cc: linux-mips@linux-mips.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-xtensa@linux-xtensa.org
> Cc: devicetree-discuss@lists.ozlabs.org
>
> Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
> ---

Acked-by: Vineet Gupta <vgupta@synopsys.com>  [For arch/arc bits]

-Vineet
