From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: RE: custom ide driver causes "Badness in smp_call_function"
Message-ID: <000501c5aa6a$3beadc30$0300a8c0@intra.lexbox.org>
Date: Fri, 26 Aug 2005 20:16:09 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1125071244.7298.2.camel@localhost.localdomain>
Content-Class: urn:content-classes:message
Return-Path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: unlisted-recipients, no To-header on input, IMB Recipient 1 <mspop3connector.david.sanchez@lexbox.fr>
Cc: linux-mips@linux-mips.org
Message-ID: <20050826181609.s_qYSUcpjLYxLzLgDBdszlVwPjUZBItgGo4ogThUwtk@z>

Alan,

Thanks for your suggestion.
I'm not sure how to write a .fixup handler.  I did some Googling, but got
nowhere.  I looked through drivers/ide to see what drive->unmask was doing.
I found this in ide-io.c:
     if (drive->unmask)
          local_irq_enable();
And this in ide-taskfile.c:
     if (!drive->unmask)
          local_irq_disable();
I modified both of these files so that execution would be as if unmask = 1.
This resulted in no change of behavior.

Bryan  

-----Original Message-----
From: Alan Cox [mailto:alan@lxorguk.ukuu.org.uk] 
Sent: Friday, August 26, 2005 11:47 AM
To: Bryan Althouse
Cc: linux-mips@linux-mips.org; 'Ralf Baechle'
Subject: RE: custom ide driver causes "Badness in smp_call_function"

On Gwe, 2005-08-26 at 10:58 -0400, Bryan Althouse wrote: 
> Ralf,
> 
> The patch doesn't seem to make any difference. :(

Assuming your hardware is sane another approach might be to force
drive->unmask = 1. That will mean that PIO mode is running with
interrupts enabled which should avoid the problem.

Add a .fixup handler to your driver (assuming you are using a recent
2.6.x) and in the handler do something like this:

+void ide_unmask_interrupts(ide_hwif_t *hwif)
+{
+       int i;
+       for (i = 0; i < 2; i++) {
+               ide_drive_t *drive = &hwif->drives[i];
+               if(drive->present)
+                       drive->unmask = 1;
+       }
+}

hopefully that will be early enough.
