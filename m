Received: from mail-wr0-x244.google.com ([IPv6:2a00:1450:400c:c0c::244]:33659
        "EHLO mail-wr0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993376AbdGJPyE5hPLg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 10 Jul 2017 17:54:04 +0200
Received: by mail-wr0-x244.google.com with SMTP id x23so25870239wrb.0
        for <linux-mips@linux-mips.org>; Mon, 10 Jul 2017 08:54:04 -0700 (PDT)
Subject: Re: [PATCH 4/6] irqchip: brcmstb-l2: Remove some processing from the
 handler
References: <20170707192016.13001-1-opendmb@gmail.com>
 <20170707192016.13001-5-opendmb@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <3a27d1b1-23ca-3237-92ba-d91299448f33@gmail.com>
Date: Mon, 10 Jul 2017 08:53:55 -0700
MIME-Version: 1.0
In-Reply-To: <20170707192016.13001-5-opendmb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <f.fainelli@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Doug Berger <opendmb@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Kevin Cernekee <cernekee@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, "open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20170710155355.Q0V_PojLwoSQcARJsNH5k_SoZzTmUG7Ofb97M_r3wkM@z>

On 07/07/2017 12:20 PM, Doug Berger wrote:
> Saving the generic chip pointer in the brcmstb_l2_intc_data prevents
> the need to call irq_get_domain_generic_chip().  Also don't need to
> save parent_irq and base there since local variables in the
> brcmstb_l2_intc_of_init() function are just as good.
> 
> The handle_edge_irq flow or chained_irq_enter takes care of the
> acknowledgement of the interrupt so it is redundant to clear it in
> brcmstb_l2_intc_irq_handle().
> 
> irq_linear_revmap() is a fast path equivalent of irq_find_mapping()
> that is appropriate to use for domain controllers of this type.
> 
> Defining irq_mask_ack is slightly more efficient than just
> implementing irq_mask and irq_ack seperately.
> 
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
