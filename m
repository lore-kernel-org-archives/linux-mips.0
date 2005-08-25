From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: RE: custom ide driver causes "Badness in smp_call_function"
Date: Thu, 25 Aug 2005 11:26:58 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050824152444.GE2783@linux-mips.org>
Message-ID: <20050825152131Z8225298-3678+7482@linux-mips.org>
Return-Path: <bryan.althouse@3phoenix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20050825152658.kSWkoRguc0DsIEZAbjs1TCQrXRFSaU34hNdC83AhpJY@z>

Ralf,

Thank you for your help.  
I'm doing MMIO, not PIO, but it looks like your assessment is still valid.
I've been searching for places where ide MMIO is performed with interrupts
disabled.  I got excited when I found these lines in probe_hwif() of
ide-probe.c:

   irqd = hwif->irq;
   if (irqd)
        disable_irq(hwif->irq);

I was not initializing hwif->irq in my driver, so probably the interrupts
were being disabled here, and subsequent lines were causing the SMP badness.
I added the line "hwif->irq = 0" to my driver.  Interrupts are no longer
disabled here, but still I get the SMP badness.  I'll keep looking for other
places where the interrupts might be disabled.  

Does anyone know if the mips/swarm.c driver has this problem with SMP?
Thanks!
  
Bryan
