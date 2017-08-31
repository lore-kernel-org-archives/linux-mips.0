Received: from mail-wm0-x243.google.com ([IPv6:2a00:1450:400c:c09::243]:37686
        "EHLO mail-wm0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994821AbdHaAgtCAhbj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 31 Aug 2017 02:36:49 +0200
Received: by mail-wm0-x243.google.com with SMTP id x189so3358889wmg.4
        for <linux-mips@linux-mips.org>; Wed, 30 Aug 2017 17:36:49 -0700 (PDT)
Subject: Re: [PATCH] irqchip: irq-bcm7120-l2: Use correct I/O accessors for
 irq_fwd_mask
References: <1504032187-53035-1-git-send-email-f.fainelli@gmail.com>
 <2c52e192-9cb2-0e53-ddc2-23e25d1ae5bc@arm.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6344fffc-4125-a3b9-ce96-741f4d8becfb@gmail.com>
Date: Wed, 30 Aug 2017 17:36:29 -0700
MIME-Version: 1.0
In-Reply-To: <2c52e192-9cb2-0e53-ddc2-23e25d1ae5bc@arm.com>
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
To: Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org
Cc: opendmb@gmail.com, bcm-kernel-feedback-list@broadcom.com, Kevin Cernekee <cernekee@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@linux-mips.org>
Message-ID: <20170831003629._TusuYJ1puoTY1UPbpAhb3kXbm-vPbmRR_PX-4Ll8No@z>

On 08/30/2017 03:48 AM, Marc Zyngier wrote:
> On 29/08/17 19:43, Florian Fainelli wrote:
>> Initialization of irq_fwd_mask was done using __raw_readl() which
>> happens to work for all cases except when using ARM BE8 which requires
>> readl() (with the proper swapping). Move the initialization of the
> 
> s/readl/writel/, I presume?

Correct, just submitted a v2 with that fixed, thanks.
-- 
Florian
