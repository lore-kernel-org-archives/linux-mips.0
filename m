From: "Hanks Li" <hli@quicklogic.com>
Subject: RE: IDE DMA mode in Big endian for mips
Date: Wed, 17 Oct 2001 13:52:20 -0400
Message-ID: <APEOLACBIPNAFKJDDFIICEDCCBAA.hli@quicklogic.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011017.113842.41627007.nemoto@toshiba-tops.co.jp>
Sender: owner-linux-mips@oss.sgi.com
To: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
Cc: linux-mips@oss.sgi.com
Message-ID: <20011017175220.pZOxoxiahAKnYujdWqfMkVsuSky9JkuCfZtXr3JiYkU@z>

Thanks Atsushi San, the patch did help. The partition check can pass now.
But my boot (such as: usb, ethernet, etc.) could not continue after solving
the IDE problem.

Could anybody give me a hint?

Thanks

Hanks Li


-----Original Message-----
From: owner-linux-mips@oss.sgi.com
[mailto:owner-linux-mips@oss.sgi.com]On Behalf Of Atsushi Nemoto
Sent: Tuesday, October 16, 2001 10:39 PM
To: hli@quicklogic.com
Cc: linux-mips@oss.sgi.com
Subject: Re: IDE DMA mode in Big endian for mips


>>>>> On Tue, 16 Oct 2001 10:28:56 -0400, "Hanks Li" <hli@quicklogic.com>
said:
hli> We are working on the IDE/ATAPI for mips. When I changed to Big
hli> endian mode, the following information appared, and the program
hli> hang.

When I tried PCI-IDE in BigEndian (with 2.4.6 kernel), this patch
solved my problem.

--- linux/drivers/ide/ide-dma.c:1.1.1.1	Fri Jul  6 11:24:54 2001
+++ linux/drivers/ide/ide-dma.c	Fri Aug 17 20:17:30 2001
@@ -492,7 +492,11 @@
 			SELECT_READ_WRITE(hwif,drive,func);
 			if (!(count = ide_build_dmatable(drive, func)))
 				return 1;	/* try PIO instead of DMA */
+#if defined(__mips__) && defined(__BIG_ENDIAN) /* XXX mips only? */
+			outl(cpu_to_le32(hwif->dmatable_dma), dma_base + 4); /* PRD table */
+#else
 			outl(hwif->dmatable_dma, dma_base + 4); /* PRD table */
+#endif
 			outb(reading, dma_base);			/* specify r/w */
 			outb(inb(dma_base+2)|6, dma_base+2);		/* clear INTR & ERROR flags */
 			drive->waiting_for_dma = 1;
---
Atsushi Nemoto
