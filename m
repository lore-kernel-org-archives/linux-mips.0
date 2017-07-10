Received: from mail-wr0-x244.google.com ([IPv6:2a00:1450:400c:c0c::244]:36360
        "EHLO mail-wr0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993423AbdGJPybnsOfg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 10 Jul 2017 17:54:31 +0200
Received: by mail-wr0-x244.google.com with SMTP id 77so25802987wrb.3
        for <linux-mips@linux-mips.org>; Mon, 10 Jul 2017 08:54:31 -0700 (PDT)
Subject: Re: [PATCH 5/6] irqchip: brcmstb-l2: Abstract register accesses
References: <20170707192016.13001-1-opendmb@gmail.com>
 <20170707192016.13001-6-opendmb@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7cd8c234-f048-fdc7-6e66-277de550265a@gmail.com>
Date: Mon, 10 Jul 2017 08:54:21 -0700
MIME-Version: 1.0
In-Reply-To: <20170707192016.13001-6-opendmb@gmail.com>
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
Message-ID: <20170710155421.B-Bbp30ZgIgiayKn85aGqRLEm9y5Dx1CBPIN8wdCExc@z>

On 07/07/2017 12:20 PM, Doug Berger wrote:
> Added register block offsets to the brcmstb_l2_intc_data structure
> for the status and mask registers to support reading the active
> interupts in an abstracted way.  It seems like an irq_chip method
> should have been provided for this, but it's not there yet.
> 
> Abstracted the implementation of the handler, suspend, and resume
> functions to not use any hard coded register offsets.
> 
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
