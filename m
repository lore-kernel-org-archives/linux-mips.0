Received: from mailapp01.imgtec.com ([195.59.15.196]:33737 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011830AbbD1J5qR6M2U (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Apr 2015 11:57:46 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 2/2] ttyFDC: Fix to use native endian MMIO reads
Date: Tue, 28 Apr 2015 10:57:30 +0100
Message-ID: <1430215050-4995-3-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1430215050-4995-1-git-send-email-james.hogan@imgtec.com>
References: <1430215050-4995-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, linux-mips@linux-mips.org
Message-ID: <20150428095730.QxoYtiD1tD9OyXUsYsB4qOJW2g8g6xOz8okAc0PUyDE@z>

The MIPS Common Device Memory Map (CDMM) is internal to the core and has
native endianness. There is therefore no need to byte swap the accesses
on big endian targets, so convert the Fast Debug Channel (FDC) TTY
driver to use __raw_readl()/__raw_writel() rather than
ioread32()/iowrite32().

Fixes: 4cebec609aea ("TTY: Add MIPS EJTAG Fast Debug Channel TTY driver")
Fixes: c2d7ef51d731 ("ttyFDC: Implement KGDB IO operations.")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>
Cc: linux-mips@linux-mips.org
---
 drivers/tty/mips_ejtag_fdc.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/mips_ejtag_fdc.c b/drivers/tty/mips_ejtag_fdc.c
index 04d9e23d1ee1..358323c83b4f 100644
--- a/drivers/tty/mips_ejtag_fdc.c
+++ b/drivers/tty/mips_ejtag_fdc.c
@@ -174,13 +174,13 @@ struct mips_ejtag_fdc_tty {
 static inline void mips_ejtag_fdc_write(struct mips_ejtag_fdc_tty *priv,
 					unsigned int offs, unsigned int data)
 {
-	iowrite32(data, priv->reg + offs);
+	__raw_writel(data, priv->reg + offs);
 }
 
 static inline unsigned int mips_ejtag_fdc_read(struct mips_ejtag_fdc_tty *priv,
 					       unsigned int offs)
 {
-	return ioread32(priv->reg + offs);
+	return __raw_readl(priv->reg + offs);
 }
 
 /* Encoding of byte stream in FDC words */
@@ -347,9 +347,9 @@ static void mips_ejtag_fdc_console_write(struct console *c, const char *s,
 		s += inc[word.bytes - 1];
 
 		/* Busy wait until there's space in fifo */
-		while (ioread32(regs + REG_FDSTAT) & REG_FDSTAT_TXF)
+		while (__raw_readl(regs + REG_FDSTAT) & REG_FDSTAT_TXF)
 			;
-		iowrite32(word.word, regs + REG_FDTX(c->index));
+		__raw_writel(word.word, regs + REG_FDTX(c->index));
 	}
 out:
 	local_irq_restore(flags);
@@ -1227,7 +1227,7 @@ static int kgdbfdc_read_char(void)
 
 		/* Read next word from KGDB channel */
 		do {
-			stat = ioread32(regs + REG_FDSTAT);
+			stat = __raw_readl(regs + REG_FDSTAT);
 
 			/* No data waiting? */
 			if (stat & REG_FDSTAT_RXE)
@@ -1236,7 +1236,7 @@ static int kgdbfdc_read_char(void)
 			/* Read next word */
 			channel = (stat & REG_FDSTAT_RXCHAN) >>
 					REG_FDSTAT_RXCHAN_SHIFT;
-			data = ioread32(regs + REG_FDRX);
+			data = __raw_readl(regs + REG_FDRX);
 		} while (channel != CONFIG_MIPS_EJTAG_FDC_KGDB_CHAN);
 
 		/* Decode into rbuf */
@@ -1266,9 +1266,10 @@ static void kgdbfdc_push_one(void)
 		return;
 
 	/* Busy wait until there's space in fifo */
-	while (ioread32(regs + REG_FDSTAT) & REG_FDSTAT_TXF)
+	while (__raw_readl(regs + REG_FDSTAT) & REG_FDSTAT_TXF)
 		;
-	iowrite32(word.word, regs + REG_FDTX(CONFIG_MIPS_EJTAG_FDC_KGDB_CHAN));
+	__raw_writel(word.word,
+		     regs + REG_FDTX(CONFIG_MIPS_EJTAG_FDC_KGDB_CHAN));
 }
 
 /* flush the whole write buffer to the TX FIFO */
-- 
2.0.5
