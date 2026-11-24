Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795509939;
	b=SC150b+oiQM74lJDs9RPBYLyGd/5y4Ku9oFlsYW7ZeO0/VCbiDJtjTcyMudRtzQdkw4n
	 b80jevK8utIh5KcsWSzVyNc7AHUeg5fwxVtum7uzGtQpRibWKbGstVWR3AIRbKVdXj3JA
	 tvKepGkv1iCjchfAM/JRJq6VxwcpfKjBGESoS0DsEYTYgdIfhXgoVggMwTm7p9g8nifwU
	 iAW05+TLU1bOi4tT3rfMyxPzXny1p3AJSE4tQqUaYmTte2JuH6t8PT5bZCCVgc+aW8plj
	 l9gzPWanNd4Em6haKgDjDo19K4UZau0iSdH9qjJ6Hy2ziLp12zPQNXgKcROH2GtsNjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509939;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Dfdj6p9cM6m0jnsefG/KNhl4NoE+8/uZaNn6snsselM=;
	b=L0XQ+W/BGkOcIt9OkYqLjz1avpjC5H6J9Nd/ytHuMuUHPZI/zyi86wtAs4L+Kc4aSdCC
	 mevzCu49mq1y3Rjr10/e2mjyXnIqEP+snZFZyyXzUC9u364+xeHEKYr/uho0ZYn7B6EUa
	 yyT9UTqqPnMMsaiy6hY7SId+Ii894sJOgY9aq7+WxwRMvLcsvc1M3yA7rpQM+ls8yiJbi
	 /OaxYnKKjVuquZ9vd8p+i6NOpHheUMrnd0vAGhe2gAyTkypET7l11j4zgAWTIPICFqfkB
	 u1zjo5+SnlJFpsP5eRhLu72SavXrRpqADpOUyZNOPVAeoweiVMtBY8Qr/7O8xq++hlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nj1Ws89f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C4E606A333;
	Tue, 24 Nov 2026 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nj1Ws89f
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795509939;
	b=ze9TlwD1kA4LHRyvOsrkqxQojhIqUOq4V0BeT491FkUnigPYEJZfah3/v6Dk3ysfF3UD
	 quR/6b2ulXgon/dLknEpT8BRu1x6sPVFM86bUjhVVFPwQaHXATzY/qIPW5DCxeU02jXU6
	 0Z9as3nqYPqe6Rf5UmNGs6Jis9ZFJU1niissBIbO9CUwokwNsjwotebHr/TqQQQwM+eHJ
	 +8K4K7k/S5mJdDqZQOXRlO/ESdj8VzxNvXVW7qVSRUtcIynyYMEYbqQp8ruBbqdBfwEO3
	 nAunTn7iy8E4fvaVItcwmY9D/s8ySSQRF2aY242rcn99zHF0H/AOtrB/AD3tAFbwJqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795509939;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Dfdj6p9cM6m0jnsefG/KNhl4NoE+8/uZaNn6snsselM=;
	b=12Eufhhsue8hqxTauf8pe7YTU1uxCDExgJ6H1Zol9Iu6ssnOKMmdbMacc52PGpc/j3ws
	 JBs9j+vEp6mjSWRDBI6N3s20qR3RXC1cP1ey3C9Eny037MIAkY5kNzIFxsBgf5KOVjCzv
	 PgvBF+nJ5nKp1m37P1hXYBwHyTUAeDgiiePBaah7tOX2sdETjQmKO6uP0S3TgJKjO+mER
	 0/BRZYGbgnuhM3sqXlAlVjn5VvjO49evRkM09yfkOJSyeR4xwN4s/gHK1bq/Xdro/u0dB
	 4r7WeuWfKXpHb/2C8HmPZAMLM7J+r0oG65ZmUZC6LTLEOj+QhQDlqotT853EGeW3jkw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA3B31F000D2;
	Tue, 24 Nov 2026 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795509939;
	bh=Dfdj6p9cM6m0jnsefG/KNhl4NoE+8/uZaNn6snsselM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Nj1Ws89fwzWLkMEBG4Wfy1FQalSWvrjJWP+ETI8gqs3jaMOtgUsko+2QKca+DyGfY
	 Qx1L1Dy2n+GjfQDarfK5HMCHv44jKyE03L+Mngqe9CVKqfqCMBrIjh+jOZ6a+haAKu
	 /GOzu7qUdAHJCzl9gNntM+wzhFnNcq/wUNogyFsZsNXYjYFOhsRBFRNlgGEJomYeoe
	 KUEGAICp7SDhNbcy9hKhtVt2pNQrIpsDNjNag4LtsEDVw7Ng4EhRK8yYIZVGmw9Z5U
	 3zftrb+8+C/b19uxx1gL/ar4BvRK9ycUHfYYzuma1aC1msIFNtzOIHGpLxmwpDWrHp
	 UgR9rRRcNWrlA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3B3284C964;
	Tue, 24 Nov 2026 08:45:27 +0000 (UTC)
From: Akshat Singh via B4 Relay <devnull+automobilehacks.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 08:45:30 +0000
Subject: [PATCH v2 2/3] irqchip/econet-en751221: Chain the handler to all
 parent interrupts
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-en751221-intc-all-lines-v2-2-a33a520aac81@gmail.com>
References: <20261124-en751221-intc-all-lines-v2-0-a33a520aac81@gmail.com>
In-Reply-To: <20261124-en751221-intc-all-lines-v2-0-a33a520aac81@gmail.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Akshat Singh <automobilehacks@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795509928; l=3728;
 i=automobilehacks@gmail.com; s=20261115; h=from:subject:message-id;
 bh=VZCgiuiY7QIYEHouyvIqPyfILwIC7tAkcoA/yaFvT+k=;
 b=SttxCKv/Gvd/uBU9vyU0kHgc+T9zJbhU0l30WFlwbGMzb+DJSFATrRpIotiYoSrQywPG3t4me
 t/qJIKIJfxAAcF4817M07CPS/N5vu8hKKKvvkCH0uMaApDynPdmUaln
X-Developer-Key: i=automobilehacks@gmail.com; a=ed25519;
 pk=wYmYXn6wy/XN0edTCg6D7UtE9nYLei8mbfqydGGCdf4=
X-Endpoint-Received: by B4 Relay for automobilehacks@gmail.com/20261115
 with auth_id=1535
X-Original-From: Akshat Singh <automobilehacks@gmail.com>
Reply-To: automobilehacks@gmail.com
Content-Transfer-Encoding: 7bit

From: Akshat Singh <automobilehacks@gmail.com>

The EN751221 interrupt controller does not drive one CPU interrupt line
per source. It presents the number of the pending interrupt plus one, in
binary, on the CPU interrupt lines IP2-IP7. In VEIC mode the CPU takes
that number as the vector, but without VEIC the driver chains its handler
to the first parent interrupt only, IP2 in the existing device trees. An
odd-numbered interrupt then never interrupts the CPU by itself: it is
handled only when an even-numbered one happens to run the handler, which
on an idle system is the next timer interrupt. That covers the frame
engine's QDMA (21), xHCI (17) and the first PCIe port (23).

A kernel built without CONFIG_CPU_MIPSR2_IRQ_EI always takes the
non-VEIC path. On a Nokia G-140W-C running such a kernel, this delayed
received packets by up to 10 ms, and ping round-trip times to the device
cycled through 1-11 ms.

Without VEIC, chain the handler to every parent interrupt listed in the
device tree. One interrupt usually raises several lines, so the later
runs of the handler find nothing pending; don't count those as spurious.

VEIC mode is unchanged.

Fixes: 1902a59cf5f9 ("irqchip: Add EcoNet EN751221 INTC")
Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
Signed-off-by: Akshat Singh <automobilehacks@gmail.com>
---
 drivers/irqchip/irq-econet-en751221.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-econet-en751221.c
index 2ca5d9018..4c1680152 100644
--- a/drivers/irqchip/irq-econet-en751221.c
+++ b/drivers/irqchip/irq-econet-en751221.c
@@ -18,6 +18,15 @@
  * When VPE#1 requests IRQ 30, the driver manipulates the mask bit for IRQ 29,
  * telling the hardware to mask VPE#1's view of IRQ 30.
  *
+ * The controller does not give each source its own CPU interrupt line. It
+ * presents the number of the pending interrupt plus one, in binary, on the
+ * CPU interrupt lines IP2-IP7, which a CPU in VEIC mode takes as the vector.
+ * Without VEIC, IRQ 21, for example, shows up as 22 = 0b010110 on IP3, IP4
+ * and IP6, so the controller is chained to every CPU line listed in its
+ * "interrupts" property. Chained to IP2 alone, it would see the odd-numbered
+ * IRQs only when an even-numbered one, such as the timer, happened to run
+ * the handler.
+ *
  * Copyright (C) 2025 Caleb James DeLisle <cjd@cjdns.fr>
  */
 
@@ -145,9 +154,12 @@ static void econet_intc_from_parent(struct irq_desc *desc)
 	pending0 = ioread32(econet_intc.membase + REG_PENDING0);
 	pending1 = ioread32(econet_intc.membase + REG_PENDING1);
 
-	if (unlikely(!(pending0 | pending1))) {
-		spurious_interrupt();
-	} else {
+	/*
+	 * An interrupt usually raises several CPU lines. It is handled when
+	 * the first of them runs this function, and the others find nothing
+	 * pending.
+	 */
+	if (pending0 | pending1) {
 		domain = irq_desc_get_handler_data(desc);
 		econet_intc_handle_pending(domain, pending0, 0);
 		econet_intc_handle_pending(domain, pending1, 32);
@@ -461,7 +473,22 @@ static int __init econet_intc_of_init(struct device_node *node, struct device_no
 		if (ret)
 			return ret;
 	} else {
+		int nr_parents = of_irq_count(node);
+
 		irq_set_chained_handler_and_data(irq, econet_intc_from_parent, domain);
+
+		for (int i = 1; i < nr_parents; i++) {
+			int virq = irq_of_parse_and_map(node, i);
+
+			if (!virq) {
+				pr_warn("%pOF: DT: Failed to get IRQ %d from 'interrupts'\n",
+					node, i);
+				continue;
+			}
+
+			irq_set_chained_handler_and_data(virq, econet_intc_from_parent,
+							 domain);
+		}
 	}
 
 	econet_intc.domain = domain;

-- 
2.43.0


