Received: from mail.windriver.com ([147.11.1.11]:32778 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993214AbcHCNcV3vKQt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Aug 2016 15:32:21 +0200
Date: Wed, 3 Aug 2016 09:31:37 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] mips: lantiq: fix irq_chip name to not land in new
 parent field
Message-ID: <20160803133136.GJ29630@windriver.com>
References: <20160802185447.3831-1-paul.gortmaker@windriver.com>
 <20160803055653.GG15910@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20160803055653.GG15910@linux-mips.org>
Return-Path: <Paul.Gortmaker@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Kevin Hilman <khilman@baylibre.com>, Marc Zyngier <marc.zyngier@arm.com>, John Crispin <john@phrozen.org>, Thomas Gleixner <tglx@linutronix.de>, linux-mips@linux-mips.org, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Message-ID: <20160803133137.6JF2-dMI0yGZaVA2Md_VWw7w26znbuuq-RTU6aIsbcg@z>

[Re: [PATCH] mips: lantiq: fix irq_chip name to not land in new parent field] On 03/08/2016 (Wed 07:56) Ralf Baechle wrote:

> On Tue, Aug 02, 2016 at 02:54:47PM -0400, Paul Gortmaker wrote:
> 
> > As of commit be45beb2df69 ("genirq: Add runtime power management
> > support for IRQ chips") the irq_chip struct got a struct *device
> > parent_device field added to it.  However, it was added at the
> > beginning of the struct, which previously was the "name" entry.
> > 
> > The driver here was using a mix of ordered struct init entries and
> > named init entries.  It was supplying the name assuming it was the 1st
> > in the order, and hence when that became a struct *device we get:
> > 
> > arch/mips/lantiq/irq.c:209:2: warning: initialization from incompatible pointer type [enabled by default]
> > arch/mips/lantiq/irq.c:209:2: warning: (near initialization for 'ltq_irq_type.parent_device') [enabled by default]
> > arch/mips/lantiq/irq.c:219:2: warning: initialization from incompatible pointer type [enabled by default]
> > arch/mips/lantiq/irq.c:219:2: warning: (near initialization for 'ltq_eiu_type.parent_device') [enabled by default]
> > 
> > While not runtime tested, I can't imagine trying to dereference a
> > a struct device field from a char string will end well.
> > 
> > Here we've used named element init entries for the name string as well
> > to fix it.
> > 
> > Fixes: be45beb2df69 ("genirq: Add runtime power management support for IRQ chips")
> > Cc: Jon Hunter <jonathanh@nvidia.com>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > Cc: John Crispin <john@phrozen.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: linux-mips@linux-mips.org
> > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> Thanks for the patch but I've already applied the identical patch
> https://patchwork.linux-mips.org/patch/13684/.

Patchwork shows that patch was from June, however I still saw the issue
on the linux-next from yesterday (or maybe the weekend?).   Is the
branch you applied it to being fed into sfr's daily merge queue?

P.
--
> 
>   Ralf
