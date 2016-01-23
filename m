Received: from foss.arm.com ([217.140.101.70]:41609 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27009236AbcAWPCRrbMl5 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 23 Jan 2016 16:02:17 +0100
Date: Sat, 23 Jan 2016 15:02:00 +0000
From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2 1/2] MIPS: ath79: irq: Move the MISC driver to
 drivers/irqchip
Message-ID: <20160123150200.5bc027a6@arm.com>
In-Reply-To: <1453553867-27003-1-git-send-email-albeu@free.fr>
References: <1453553867-27003-1-git-send-email-albeu@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <marc.zyngier@arm.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alban Bedel <albeu@free.fr>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Alexander Couzens <lynxis@fe80.eu>, Joel Porquet <joel@porquet.org>, linux-kernel@vger.kernel.org
Message-ID: <20160123150200.ht4445PaJ7Te5XTLUEwwPPpJEpK7SxDIcBm3TNxiUPc@z>

On Sat, 23 Jan 2016 13:57:46 +0100
Alban Bedel <albeu@free.fr> wrote:

> The driver stays the same but the initialization changes a bit.
> For OF boards we now get the memory map from the OF node and use
> a linear mapping instead of the legacy mapping. For legacy boards
> we still use a legacy mapping and just pass down all the parameters
> from the board init code.
> 
> Signed-off-by: Alban Bedel <albeu@free.fr>

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny.
