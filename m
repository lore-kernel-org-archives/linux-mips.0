Received: from mailapp01.imgtec.com ([195.59.15.196]:2077 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013910AbbKQKYnicB-9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 Nov 2015 11:24:43 +0100
Subject: Re: [PATCH 10/14] irqchip/mips-gic: Add a IPI hierarchy domain
References: <1446549181-31788-1-git-send-email-qais.yousef@imgtec.com>
 <1446549181-31788-11-git-send-email-qais.yousef@imgtec.com>
 <alpine.DEB.2.11.1511071323471.4032@nanos> <5644AC66.2070508@imgtec.com>
 <alpine.DEB.2.11.1511161817400.3761@nanos>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <564B0064.1060202@imgtec.com>
Date: Tue, 17 Nov 2015 10:24:36 +0000
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.11.1511161817400.3761@nanos>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20151117102436.6DC8dCZkdEizBq7viaxo-8dSHfI7qyJxScx39yXp8GA@z>

On 11/16/2015 05:24 PM, Thomas Gleixner wrote:
>
> int ipi_get_hw_irq(int irq)
> {
> 	struct irq_data *d = irq_get_irq_data(irq);
> 	return d ? irqd_to_hwirq(d);
> }
>   
> Hmm?
>

We need cpu as an argument too.

Taking your other comments into account and ignoring the random mapping 
space for now. I think I can expand that to do the right thing for when 
the IPI domain is per cpu or consecutive.

Thanks,
Qais
