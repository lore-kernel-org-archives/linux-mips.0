Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F1C1DED5C;
	Wed,  6 May 2026 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778066126; cv=none; b=p2TtvLSAZ7a0/HJ0n7OZeOPVDOkd3FPVHMv4U1sQkLpmcdW8H8cmgN+qVEYeHcX8Ap/u5mh8ml5DtmcgRptRz1aVJhvLCguJsAoKjDkIYS9+AAy1eBJ8xJ95ETw7rp5vyWYN7/Q2zrd5u7foGJoaVOEKGmc62oVw5VX9FhkehRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778066126; c=relaxed/simple;
	bh=v6VeViMA/SQM5sY8jpftJH3uArXwjYY0C3+i59VfwfM=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fmo+rW9tqBTMUilodMhGIqOJD2s8TbIQlq1K3cwZDejiI7/r+ZFb3uDmj8SemNapxXrFFGv5NbNwRInzXA44kY6IIP3ReIqPbBl0uBk0Ki3HrDt7OKE7qKhE5PQR1tOkVzgsHlbYYUPe6EUD+miUSqwnKaYdzN7aTuDBeh1M6P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 798A192009C; Wed,  6 May 2026 13:15:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7358092009B;
	Wed,  6 May 2026 12:15:21 +0100 (BST)
Date: Wed, 6 May 2026 12:15:21 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: DEC: Remove IRQF_ONESHOT reference for IOASIC DMA
 error IRQs
Message-ID: <alpine.DEB.2.21.2605061142040.46195@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

There is no need for IOASIC DMA error interrupts to use the IRQF_ONESHOT 
flag, because while they do need to have the source cleared only at the 
conclusion of handling, the action handler supplied is either run in the 
hardirq context with interrupts disabled at the CPU level or, where IRQ 
threading has been forced, the primary handler has the IRQF_ONESHOT flag 
implicitly added and therefore the original action handler, now run as 
the thread handler and with interrupts enabled in the CPU, is executed 
with the originating interrupt line masked.  Therefore no interrupt will 
retrigger regardless until the original request has been handled.

Link: https://lore.kernel.org/r/20260127135334.qUEaYP9G@linutronix.de/
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/dec/ioasic-irq.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

linux-dec-ioasic-irq-irqf-oneshot.diff
Index: linux-macro/arch/mips/dec/ioasic-irq.c
===================================================================
--- linux-macro.orig/arch/mips/dec/ioasic-irq.c
+++ linux-macro/arch/mips/dec/ioasic-irq.c
@@ -78,10 +78,7 @@ static struct irq_chip ioasic_dma_irq_ty
  * cleared.  This cannot be done until after a corrective action has been
  * taken and this also means they will not retrigger.  Therefore they use
  * the `handle_fasteoi_irq' handler that only clears the request on the
- * way out.  Because MIPS processor interrupt inputs, one of which the I/O
- * ASIC is cascaded to, are level-triggered it is recommended that error
- * DMA interrupt action handlers are registered with the IRQF_ONESHOT flag
- * set so that they are run with the interrupt line masked.
+ * way out.
  *
  * This mask has `1' bits in the positions of informational interrupts.
  */
