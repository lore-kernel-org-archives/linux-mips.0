Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175071;
	b=zhpRI+n6q9ImWSDW3hhJYpqS/qe4/ZgYmn+rb2GCsUz/jNO8YzWhTC6P/jVkKFe+g3Uh
	 sBaycKzF5sBgpv+XjtcqAXWNIFMS4/alULJ/RsHCT/KinZeQt4C0IqCDz38VTxaIt4xLJ
	 zBOw/FpwbV7p44cSf8SKlCF5NcDGSDQHGwRTZBZX8qAoSB4KtIe5Aaq2QVMERzAg6r/l8
	 absZvqmQfIe/7oD8W/UVuht/c5xEK4Blah6YEHrpmB4uhto9+x2deuJGmGKGLFR4AAvqQ
	 +N9nA5mQEhzpdwdvDRJVJ1wd4bWUyz9B1J+hw0HRSa4rlXshcAGk3PGt9IeLT5GToQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mS/3ui3U/tGmUVdMDE9L/0+hrd8sTEoFW9MAEra65NE=;
	b=X7AKolUZRwCL0qrqkTpen0IAIZyPYUek+yDcoGunGwvJBJLcsmuUQvwrqYUbZ24aIfSM
	 50QNkzTnsQORmPnCmfuFYyK2CMnuYmkydUlZJuqiQ7aXiKBEnt7DqZEENbwC3Nw9AcIkq
	 3NJYu+DZW9kPJmgSbTIwaYmGJ7Y+0YuiqY6s64uX/ZHojvFlHPjtDSgzZCxmrkbD4+BBS
	 B73mY1wmTzJFQ5WNZpzOEL7Xikap7uFs8Ygb4/pTWDHtlMLAIB8VGyVMeMlS9ze3Tp8VU
	 VNf3FKirDPzNuShp9+zQfHp/oJ1rgywvzy1QCS557CLMdL0lOcietGGVUWQEDuZ1yKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bygJju3r;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645A1606A33B
	for <linux-mips@vger.kernel.org>; Sun,  8 Nov 2026 21:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645A1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bygJju3r
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b147e06befso69804a91.2
        for <linux-mips@vger.kernel.org>; Sun, 08 Nov 2026 13:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175071; x=1794779871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mS/3ui3U/tGmUVdMDE9L/0+hrd8sTEoFW9MAEra65NE=;
        b=bygJju3rhH16O/9kouZAhHixWlGelgLUlqnJ3c2EjKxjtWU4M0l8fnBBmoenPyIpRw
         0/QkmVx6JjZjjzyKhAly2yDpB+asS2DgcO9XBecS8KwJHA62arR5DNg22SFyBNXmun47
         AWKmZNDi8k2L4aGq4MGZzK5rtnXQ5X7fv+gBWUX73OPSa3KRxel+zBU6T3AUZMXyTGa1
         l5pDsuWcj33afL2JNg52RyVoP07XPTmCgKPNGwhe5tIJ+9qstJDKuBxRsDFqEBIkiwBm
         0Kchi/PeuZPNb4AEL2vUtHoDegZRcezQCxQWOXwKRq9mG1WQHNBErtoodvRSTAv4B5mo
         aNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175071; x=1794779871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mS/3ui3U/tGmUVdMDE9L/0+hrd8sTEoFW9MAEra65NE=;
        b=j56S++wRTn2ZktTlmfjxqokiNxsRcDevMRg2L726X6l6Ah1ugqEd3XGh5IyRXIYubX
         2wU/aokUq/cyCF7cNnPAXHT7mOTbgrT1URwQ1yRk7SQsaxGzZzCRhsveybcaK43+BpK9
         ZSRbJuQT2DcUa+9ps+wIxQOP8p6Kg+W1WnsueN3KkfbrVagyKpMfgLz2oONGuQmA+Ru+
         5QL8msMBbPwy/k/Z9zqGBVMh5RINO+B52bt0gwNt40Gizx/SnG3hPCsdotNz2afs+szv
         mSVDMCvdStIXApy0g8BTApZrD99mGIgxu9sQRF5NUv0pkaNAcyjEvx3cOfCYe8pFndCa
         YITQ==
X-Forwarded-Encrypted: i=1; AL+hErFQqGufpZoySARwJzzV7MJruH8HvVAAM7hwcFSQp3WJ9IGdw07KMU1Sm2GJTatsNEdAreoaJNM7sH8y@vger.kernel.org
X-Gm-Message-State: APuU4Z9d7VnxQ+oCFEmi/Nl8pxbiNJNORS5lhEDmY25kJuIW9K2sYKoI
	EG2cjNe8iTS22hUz3rLTvLmQKv4BVgX/A2+q4QnzimDw77i3BA1CiT8BolCIzw==
X-Gm-Gg: AYBFou31NUCYctT7GcIQhn7pF519WaXi75GkuR85ASNfNCoRhr6K8VePQgLsI/neQYO
	oKA2rI4pLYKJ844Htc+WPFJ3dzed//B+Dp3fru02EBnoQFmDTovJr3vS8xb4UddtQEJQ4RNMeOZ
	3nA3lU1ojiK4q2v5NREQMlb/ND7yWNjQ/4bw92V1jpxUkrJ3WiJM+vN+yaE+90byUIBeEARhURh
	EPvAqivld1T9DiwrnLz5vy/iBQEpiW7QriDIKNaovYCHxXBiMYyWgQuNqeuPzTFRQFBWRUO9qrN
	mZXIJX+EF9/u6BDmutIN/Uu+BRtaHgOf9GKHFFV92UQfAhjZG4ae2Kk0TmLee0KMF74vw6jdQmM
	pa2CLjjNS03RoFGYyNG5IsZ0Kof5A3wg1K+ybrsPYnWZ0CvGO74vLh4KVYJehJIKe03IgmBkD73
	nCAQo8uNC8auoDRO+W+cD0Bu2uYM/ZagDpQdWrGCpa/BVDJwMaP5PmDNmF3bm2mX+xmmBZu7fvK
	omtzhG/+Gr0HfLrEFrYNwITi/cdceosuQ8Q9wcjCVHotsZm3c0IrB5O0CS5yGp0ObRYT7KT5Rtz
	rZZ44LWOzsdhGqkrGmMOnLRf+x7VRj3xmRot8paBap0pulJApLbR72ZSYU+02yNdC59ESGlDiXF
	VQ489A+xIA9Jswuv6Ml37zGOgFG1YjyQ0c6saBbVcJq+IWyzl0/TwyYnDQTnmE1n8AuL+x5TQjx
	CA3A==
X-Received: by 2002:a17:90b:1b01:b0:3ad:a232:4044 with SMTP id 98e67ed59e1d1-3b12d3e3821mr1721811a91.38.1794175070564;
        Sun, 08 Nov 2026 13:57:50 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm5692976a91.9.2026.11.08.13.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:57:49 -0800 (PST)
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
Subject: [PATCH v2 2/3] irqchip/ath79-cpu: flush every write buffer of a shared interrupt
Date: Sun,  8 Nov 2026 13:57:37 -0800
Message-ID: <20261108215738.113582-3-rosenp@gmail.com>
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

On AR934x and QCA953x, the WMAC and the PCIe root complex share CPU
interrupt 2, but each writes to DDR through its own write buffer, and
both have to be flushed before their handlers can see the data. The
driver keeps one write buffer per interrupt, so the last one listed in
the device tree wins.

Keep a mask of write buffers per interrupt instead, and flush all of
them. A flush is a few accesses to the DDR controller, which costs much
less than splitting the interrupt by source, as OpenWrt does with a
cascaded interrupt controller.

Document the interrupt wiring, the write buffers and why a shared line
flushes all of them.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/irq-ath79-cpu.c | 51 ++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/irqchip/irq-ath79-cpu.c b/drivers/irqchip/irq-ath79-cpu.c
index 9b7273a7f8ce..ec39c37895c0 100644
--- a/drivers/irqchip/irq-ath79-cpu.c
+++ b/drivers/irqchip/irq-ath79-cpu.c
@@ -10,6 +10,7 @@
  *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
  */
 
+#include <linux/bitops.h>
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/of.h>
@@ -18,23 +19,33 @@
 #include <asm/mach-ath79/ath79.h>
 
 /*
- * The IP2/IP3 lines are tied to a PCI/WMAC/USB device. Drivers for
- * these devices typically allocate coherent DMA memory, however the
- * DMA controller may still have some unsynchronized data in the FIFO.
- * Issue a flush in the handlers to ensure that the driver sees
- * the update.
+ * The MIPS core has 8 interrupt lines: IP0/IP1 are software interrupts,
+ * IP7 is the CP0 timer, and IP2-IP6 are wired by the SoC to its devices.
+ * The wiring is fixed in hardware. Several devices can share a line, like
+ * the WMAC and the PCIe root complex on IP2 of AR934x, and their drivers
+ * then request the interrupt with IRQF_SHARED.
  *
- * This array map the interrupt lines to the DDR write buffer channels.
+ * Each DMA master writes to DDR through its own write buffer in the DDR
+ * controller, and each write buffer has its own flush register. When a
+ * device raises its interrupt, its last DMA writes may still sit in its
+ * write buffer, so the handler could read stale descriptors or data.
+ *
+ * The CPU interrupt says nothing about which device on a shared line
+ * raised it. So before running the handlers of a line, flush the write
+ * buffers of every device wired to it. Each handler then sees its
+ * device's data, checks its own status, and returns IRQ_NONE if it was
+ * not the source.
+ *
+ * irq_wb_chans maps each CPU interrupt line to the mask of the write
+ * buffer channels to flush, from the qca,ddr-wb-channel-interrupts and
+ * qca,ddr-wb-channels properties.
  */
-
-static unsigned irq_wb_chan[8] = {
-	-1, -1, -1, -1, -1, -1, -1, -1,
-};
+static u32 irq_wb_chans[8];
 
 asmlinkage void plat_irq_dispatch(void)
 {
-	unsigned long pending;
-	int irq;
+	unsigned long pending, chans;
+	int irq, chan;
 
 	pending = read_c0_status() & read_c0_cause() & ST0_IM;
 
@@ -46,8 +57,11 @@ asmlinkage void plat_irq_dispatch(void)
 	pending >>= CAUSEB_IP;
 	while (pending) {
 		irq = fls(pending) - 1;
-		if (irq < ARRAY_SIZE(irq_wb_chan) && irq_wb_chan[irq] != -1)
-			ath79_ddr_wb_flush(irq_wb_chan[irq]);
+		if (irq < ARRAY_SIZE(irq_wb_chans)) {
+			chans = irq_wb_chans[irq];
+			for_each_set_bit(chan, &chans, 32)
+				ath79_ddr_wb_flush(chan);
+		}
 		do_IRQ(MIPS_CPU_IRQ_BASE + irq);
 		pending &= ~BIT(irq);
 	}
@@ -58,7 +72,7 @@ static int __init ar79_cpu_intc_of_init(
 {
 	int err, i, count;
 
-	/* Fill the irq_wb_chan table */
+	/* Fill the irq_wb_chans table */
 	count = of_count_phandle_with_args(
 		node, "qca,ddr-wb-channels", "#qca,ddr-wb-channel-cells");
 
@@ -68,7 +82,7 @@ static int __init ar79_cpu_intc_of_init(
 
 		of_property_read_u32_index(
 			node, "qca,ddr-wb-channel-interrupts", i, &irq);
-		if (irq >= ARRAY_SIZE(irq_wb_chan))
+		if (irq >= ARRAY_SIZE(irq_wb_chans))
 			continue;
 
 		err = of_parse_phandle_with_args(
@@ -78,7 +92,10 @@ static int __init ar79_cpu_intc_of_init(
 		if (err)
 			return err;
 
-		irq_wb_chan[irq] = args.args[0];
+		if (args.args[0] >= 32)
+			return -EINVAL;
+
+		irq_wb_chans[irq] |= BIT(args.args[0]);
 	}
 
 	return mips_cpu_irq_of_init(node, parent);
-- 
2.56.0

