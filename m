Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175074;
	b=C7+xfgtIwY13+7j08RPcDobr37vzPdR56nQcA9gIzjz2OFqw8DfQKRcQ+r031rzBoBss
	 PX4W6pnHrUiStOHvwgmT6sOwtigH0aok2KWFUja1Od5512UdCsz9U1ixwiiRnJSCWEf+j
	 NWHrNt5pPaRLWsCFqe/e/YQoQmoaPpTqmVJNhB6MJ2K7OJIHsQMS2vYrgo8Yqek0WPrer
	 BwJeR9fAklImCs7KXuJHepxsUtuFDM0Aax4bKtxzkA/jit3XjGB+/zS2h5Osu0niYAHc6
	 XY+VswvDGKMyKNzvy6yLMfE6v1ZRG+nZSpzVdcY10GxA2JVrPNWxfBhNgntG4gZJEng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c3MqZWVsTnMJn23OLpBicaKYPzlOBkBVg7IXSGl2h+8=;
	b=L0enpjxXbIKej8495wIEmtfOjKu06/ZchQd7IH/Fwtca3WzR79zCuZrPch8ZGlA3Hyph
	 c11v+KI6rtj0J2Oww8ETSg6R963Ajv1pLzREfqUICynBWROxhFx60qkGS0zioHBv3iVqs
	 G4EcFN37J8zBFa+b6JuFEAN8kcogza+nBrI6qfo1V0H+JxvqFcN3UzJZZ3uyQcOd6LM5n
	 ESRxRBNeCAt9YMptMa4pVd6fSWozGsXZVr2Ug9wioHY3vsYTvuRwvYaVqTdmOxzAYbnO8
	 QHem8u0rfg3mF1Cx6anhOlmne9/Zvn087GhC8PzgDq1VFTO8S/gHJClLskF02epZImQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xQcgXUzv;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3038606A336
	for <linux-mips@vger.kernel.org>; Sun,  8 Nov 2026 21:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3038606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xQcgXUzv
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so133018a91.3
        for <linux-mips@vger.kernel.org>; Sun, 08 Nov 2026 13:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175073; x=1794779873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3MqZWVsTnMJn23OLpBicaKYPzlOBkBVg7IXSGl2h+8=;
        b=xQcgXUzvkRsMSCLSNAa5J27caRShtGeC/mdLiBxrOft71Oi6uyY4jBxeu8ZgpagdMY
         CEdL924bOHI6HMQtjFLvLbkFUe3k5R1MgSeQu5/8/lTkA7ueyvMqBpcINUAwm4f9JWQj
         DzS/+UfADWW0t/36eFaTDv0fQ803XteYOBtTGpEjokRFGn0H5BC+xnjCxsX2irZUgXc8
         S+aQBQTRdonKK3CgE9izPM4tYWRNbLmRd4WxWjQAF2k9Lj34c2Dwjn6JpWtfxMVH0bl6
         MKSr9idkUMdj+p06lnVljjwudhctp/QZRzukIAA3hQbezQwg2k+U/hyRKpbtPbKNDmJe
         HefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175073; x=1794779873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c3MqZWVsTnMJn23OLpBicaKYPzlOBkBVg7IXSGl2h+8=;
        b=0DAC13eQAxydCfUaSgd8KzzIbaSndWNo9ecfl4PJN4vXDoIwLelrd+zhiRr5Dl/arA
         dZsgeF7h2rbTnL2viDAMUB+gAJ669M1kIqF2HHWvDJAD+zoXsUnzg93zsyXN/sf0B9uo
         4oRUlBmja5tNGSJlztGE9HvUeiIsLs82dGgB6J2rJ0cS0iqm7fuPw+LzFB9ULMzqHpYW
         EW8VC5KlRpIGdWqeMpdeU66ltouWsmNAsW45ss9klyXVsCDS2VhN5rUMFsxBfDlDbgrP
         W+jEagKlrRlqZhkiMDdilWtjdCqyzC/8iInoj9N+kXIqaIlK9fytgWsnccyi2YkmuwGV
         plFg==
X-Forwarded-Encrypted: i=1; AL+hErFpPBLcKfdvgVcoTrI+dZ7vGw6wH9W+PawTnsqfilZN5KTvOmfm/j3I03EZ293up1Svi/ql6Zo6V+jS@vger.kernel.org
X-Gm-Message-State: APuU4Z9bacoEaw+IdJuqp7jW2s/KtqQvOhSC7epopo4qzRKpPgMhjg+I
	ypY/iBimXY0dvrOoHAbWEJZDlMDcKuFDplIgXBvyvn+w3bI9kT2Ir7Oe
X-Gm-Gg: AYBFou0qUYuiliBE6VSfAg+sndNfe5tfPOgdjb5Ajr5dL8ACUPROuR9bngL0+zHQ/e5
	GFODpyi6fZewvGE1D/9ULpsc4rA/rBhNnrrqpowUADIVds+Hc47Nt2SljGDmq6kFfkE+aUtL8nD
	PGjzZa7OO0/yd4AjhfcJz+XhY8J3mQurzM730UwXXIOxqA0uKU/ZoO7GsDpdrE6vr/osO8EK+Hj
	h0qOpZo969SRSW3gPn5wFjQWTMRhtwCoTt6CJrTyXen2JOU8RSF7GZ8sE+/6TcmFAmGH6RmnOGC
	XEdxhmKSQ5VTONRarQwUrUbLnYY+BfuskUxaaJg/sFUfX+lRt5A8j9dPrPYE08x3OvW2wh5Kdyv
	mTGZ6BTgA59l6l52uiH08DU3SCdyHsmFDvSm8kPept7kf/PpW99arCEZ+swERLY0J16sZJd95Cp
	oQDahKhZrBYvE5Yz+v09/0ejrddAB0eXfFccawgxSSd39wM5TUX51z5FZPC7hofBQU4Uu2A/00S
	B8zeyccyJrEsgZmMXjRM8AJxsUmwmfmeiJpnsLDjP2P4Kw1ZMdozFW2pWBLPpaI0Jzuvh+jjGBZ
	WHIV+lEhlJOn5TPCltnUOx9upfvNFcTXo+kB+jxDuH1yhcPHFghk3tsYbKeLVaCc7UfNl5dCIgE
	rws3BLEwaCgfT8Dk1YxQUTM7eIE5+3yfTzvuQ0Rb1JH7O79hpPbreff9twx91podrKvzE5o3E3m
	RsBw==
X-Received: by 2002:a17:90b:39c4:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b12d2de5b4mr2232435a91.12.1794175072968;
        Sun, 08 Nov 2026 13:57:52 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm5692976a91.9.2026.11.08.13.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:57:52 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Alban Bedel <albeu@free.fr>
Cc: Radu Rendec <radu@rendec.net>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 3/3] MIPS: ath79: flush the DDR write buffers of an interrupt in parallel
Date: Sun,  8 Nov 2026 13:57:38 -0800
Message-ID: <20261108215738.113582-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108215738.113582-1-rosenp@gmail.com>
References: <20261108215738.113582-1-rosenp@gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When several devices share a CPU interrupt, plat_irq_dispatch() flushes
their DDR write buffers one after the other, waiting for each to drain
before starting the next.

Make ath79_ddr_wb_flush() take a mask of channels, and start the flush
of every channel before waiting for any of them, so that the write
buffers drain in parallel. For a single channel the sequence is
unchanged. Its only user is the built-in irqchip, so drop the export.

Keep flushing twice, as the AR7100 datasheet asks, and quote it instead
of the comment that it must be run twice.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/common.c                 | 51 ++++++++++++++++++------
 arch/mips/include/asm/mach-ath79/ath79.h |  2 +-
 drivers/irqchip/irq-ath79-cpu.c          | 13 +++---
 3 files changed, 45 insertions(+), 21 deletions(-)

diff --git a/arch/mips/ath79/common.c b/arch/mips/ath79/common.c
index 137abbc65c60..9c5e9cd6931a 100644
--- a/arch/mips/ath79/common.c
+++ b/arch/mips/ath79/common.c
@@ -9,6 +9,7 @@
  *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/types.h>
@@ -53,21 +54,47 @@ void ath79_ddr_ctrl_init(void)
 }
 EXPORT_SYMBOL_GPL(ath79_ddr_ctrl_init);
 
-void ath79_ddr_wb_flush(u32 reg)
+static void __ath79_ddr_wb_flush(unsigned long chans)
 {
-	void __iomem *flush_reg = ath79_ddr_wb_flush_base + (reg * 4);
-
-	/* Flush the DDR write buffer. */
-	__raw_writel(0x1, flush_reg);
-	while (__raw_readl(flush_reg) & 0x1)
-		;
+	u32 __iomem *base = ath79_ddr_wb_flush_base;
+	unsigned int chan;
+
+	/*
+	 * Start every flush before waiting for any of them, so that the
+	 * write buffers drain in parallel instead of one after the other.
+	 */
+	for_each_set_bit(chan, &chans, 32)
+		__raw_writel(0x1, base + chan);
+
+	for_each_set_bit(chan, &chans, 32)
+		while (__raw_readl(base + chan) & 0x1)
+			;
+}
 
-	/* It must be run twice. */
-	__raw_writel(0x1, flush_reg);
-	while (__raw_readl(flush_reg) & 0x1)
-		;
+/**
+ * ath79_ddr_wb_flush - flush DDR write buffers
+ * @chans: mask of the write buffer channels to flush
+ *
+ * Every DMA master of the SoC (the Ethernet MACs, USB, PCIe, WMAC) writes
+ * to DDR through its own write buffer in the DDR controller. The buffer
+ * may still hold data when the device raises its interrupt, so it has to
+ * be flushed before the interrupt handler looks at the DMA'd memory.
+ * Setting bit 0 of the channel's flush register starts the flush, and the
+ * controller clears it once the buffer is empty.
+ */
+void ath79_ddr_wb_flush(unsigned long chans)
+{
+	/*
+	 * The AR7100 datasheet says to flush twice, after reading the
+	 * interrupt status of the device, to ensure that its descriptor
+	 * updates have reached memory before software reads them. It does
+	 * not say why a single flush is not enough. The datasheets of the
+	 * later SoCs drop the note, but nothing says the need went away, so
+	 * flush twice on all of them.
+	 */
+	__ath79_ddr_wb_flush(chans);
+	__ath79_ddr_wb_flush(chans);
 }
-EXPORT_SYMBOL_GPL(ath79_ddr_wb_flush);
 
 void ath79_ddr_set_pci_windows(void)
 {
diff --git a/arch/mips/include/asm/mach-ath79/ath79.h b/arch/mips/include/asm/mach-ath79/ath79.h
index 70cda74494a4..15897d0f570d 100644
--- a/arch/mips/include/asm/mach-ath79/ath79.h
+++ b/arch/mips/include/asm/mach-ath79/ath79.h
@@ -145,7 +145,7 @@ static inline int soc_is_qca956x(void)
 	return soc_is_qca9561() || soc_is_qca9563();
 }
 
-void ath79_ddr_wb_flush(unsigned int reg);
+void ath79_ddr_wb_flush(unsigned long chans);
 void ath79_ddr_set_pci_windows(void);
 
 extern void __iomem *ath79_pll_base;
diff --git a/drivers/irqchip/irq-ath79-cpu.c b/drivers/irqchip/irq-ath79-cpu.c
index ec39c37895c0..64272b15f4ed 100644
--- a/drivers/irqchip/irq-ath79-cpu.c
+++ b/drivers/irqchip/irq-ath79-cpu.c
@@ -10,7 +10,7 @@
  *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
  */
 
-#include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/of.h>
@@ -44,8 +44,8 @@ static u32 irq_wb_chans[8];
 
 asmlinkage void plat_irq_dispatch(void)
 {
-	unsigned long pending, chans;
-	int irq, chan;
+	unsigned long pending;
+	int irq;
 
 	pending = read_c0_status() & read_c0_cause() & ST0_IM;
 
@@ -57,11 +57,8 @@ asmlinkage void plat_irq_dispatch(void)
 	pending >>= CAUSEB_IP;
 	while (pending) {
 		irq = fls(pending) - 1;
-		if (irq < ARRAY_SIZE(irq_wb_chans)) {
-			chans = irq_wb_chans[irq];
-			for_each_set_bit(chan, &chans, 32)
-				ath79_ddr_wb_flush(chan);
-		}
+		if (irq < ARRAY_SIZE(irq_wb_chans) && irq_wb_chans[irq])
+			ath79_ddr_wb_flush(irq_wb_chans[irq]);
 		do_IRQ(MIPS_CPU_IRQ_BASE + irq);
 		pending &= ~BIT(irq);
 	}
-- 
2.56.0

