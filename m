Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794770763;
	b=RJUdSBE6GqBGkH/GK/ItgeA43W6rSkR7cpNWDsqs47qwbP4ZBckmgDRNves3iZ+DBLhs
	 iRij50ymBhWDDWUY/LOlgNbicDuM0t+GOyEztXMuL7V8Vp+EZ23aJwHBNE39w4tpCE4zu
	 UmMxJaj4LjwaqKCYnd2EGjXdxGLM9VM7tEDOBqSGSTBNnlAISlO/WCRx7m47VxSidvvgy
	 zGQTF2qpK8vX5lQ4Htfit08jigo/UC89hCmUYkuj53K2YQKe9rpZQOx8AVTRuarAvH1Cr
	 vPf/QzaS7d38hSuzfUl2WdhkKYpx7Z7og8Vj1aNF3IStuAI2YKImAMigIJiYk/viyxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770763;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YfA12bPf4P7sGYZa/N5/B7BUHIf1k5T8Y6EXeCqRlwo=;
	b=cpGVFiGdnt96LdsSqSTob5ShjEmc3Yt/LWkOr74XitK6aUy5jtNaWEqoMXxd0mCrmiia
	 M2E0F3lxs9cxG5IHzewPncC5E39dhKtHdFNM0rtJECXtPFmfe1Al4mPgB6uFXtmooKR5p
	 +d327F5bpUM3ttJGXNtJXUwLsM0PU8PiSQJeH0vp4LaQeP9St94q8ssru/3uPGlJ6KZBa
	 j2T/CHNIA3WqE5h5LKnmRJTqIJAeshzVP6J+eEuNsz6tbtqZBtBCMzD2SmnYEVOGR3u51
	 0V9TKMX+R8dnc0RAD8fP/gwoD/jhxBlqNqaiw7rkTAeMii6TVUE//LqIK5QSwLPjxcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bV+2jqd9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD4606A336;
	Sun, 15 Nov 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bV+2jqd9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794770763;
	b=VnckCZ7jTJsSdN6zquGQ0O5ntLA21xhY5kzELOpLOicBNjs/6p0VhBcDD2+b8Xqdxlew
	 BfHcDoNGjHRce50VLyQ55kwwCHFk2vY7dR33qMuLbPPZs9JIwP2ojB4UQOzb6aNNVOslh
	 /vFcVtqwTs0iZh4HL4Pt0rxR4JS8TnijDUWAcI5JAV9EguHqUtyAYkRr+0jRlmD8FMTsv
	 N5uFsUTbDh7tgq2OyK+JCDDzTsQ5OPC7PYK1Wkj6UZnAGWpSze0BKI1XriuYIkDWpYZja
	 mfRh2BGroWIQjHGv/1Fy61zI8H+LGyCrIZFBBGcjUczaSFbXYzLzwKRymjHlycT9h6w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794770763;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YfA12bPf4P7sGYZa/N5/B7BUHIf1k5T8Y6EXeCqRlwo=;
	b=NxmeJJXXx8HR0P9/xuhIuNAJnixmHHooeo0KJekSdvCfK+KI9bSE28BWYcFkmr6XKctf
	 Kh+7xCaRz+jFyTqRaOK+U6qqjNUsnNFLz1Ctz5+bsFb9XqeP/fHRea4Z1L72R4guXVU8+
	 Dt8N6FwrnowmQ5K16K1YukDFngcp0Xny3BcxpIAwQgIVZpJ3koFySZJsIFYj+KOdXVyGT
	 5GrqMCy5bB5OFqO3425hQKdPqrmBEhgkb+MG2woq9psXBaTzJ5Ou7LByc8maIS7Xb/IF1
	 aSIbxHF6mFRRhJNOVroCO6X64xgp91s6UOXohNCSfWfwc7iyDKrtzem2PQR2c9WG+Cw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EC6F1F000C6;
	Sun, 15 Nov 2026 19:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770763;
	bh=YfA12bPf4P7sGYZa/N5/B7BUHIf1k5T8Y6EXeCqRlwo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bV+2jqd9bvCDnkUVxu4jPvbYkprAYUTDppRVHjFYeNnJsT2doGXlF17EZcecU2WSs
	 L6vhBoyAhN4yxLPPIj1bpGyXw+8GSJQc2eYmqUcjc9FgbQnlHyh44otySZbmfbLXQY
	 rkxAyYWJOffgwl/OwBUf8qHH4fD0ti7H42nTKS1Lok5ZlcPvQYo6+ntrB6jRj3lBwd
	 WABf9a8Ei1UNGApFeiNzxReV5vjM7oNSonEq1eKA3XinJO21M9uC4EfVubWC74dDPP
	 odESlPGSqfbXSElmhjivNWWOadSxMG36XRTrw0o2Pcn4nU2ENrK4cZhRr4+Hkfb3s8
	 gn4rXcgrD+zgQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9B93D4A164;
	Sun, 15 Nov 2026 19:26:01 +0000 (UTC)
From: Akshat Singh via B4 Relay <devnull+automobilehacks.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 19:26:02 +0000
Subject: [PATCH 2/3] irqchip/econet-en751221: Chain the handler to all
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
Message-Id: <20261115-en751221-intc-all-lines-v1-2-dc03a40f47f0@gmail.com>
References: <20261115-en751221-intc-all-lines-v1-0-dc03a40f47f0@gmail.com>
In-Reply-To: <20261115-en751221-intc-all-lines-v1-0-dc03a40f47f0@gmail.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Akshat Singh <automobilehacks@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794770761; l=3558;
 i=automobilehacks@gmail.com; s=20261115; h=from:subject:message-id;
 bh=AvBYJRpDnd41ctnJewbCqRqAPcY/Z1Tf3CIjkBU4Efw=;
 b=W9ZlGo4y+FhOFrEJ8Gf7H7kaeZI2jCtb+l+YdpSYHi63LaASsb68HRvZDSypqmS73otIyflTv
 LjmPfKqpOJBDRMonApm3X/ShfbyHXeeEub3pMp7XQ+p9sm4/QmyFiPo
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

On a Nokia G-140W-C, whose 34Kc does not report VEIC, this delayed
received packets by up to 10 ms, and ping round-trip times to the device
cycled through 1-11 ms.

Without VEIC, chain the handler to every parent interrupt listed in the
device tree. One interrupt usually raises several lines, so the later
runs of the handler find nothing pending; don't count those as spurious.

VEIC mode is unchanged.

Signed-off-by: Akshat Singh <automobilehacks@gmail.com>
---
 drivers/irqchip/irq-econet-en751221.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-econet-en751221.c
index 2ca5d9018..5930c67c3 100644
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
+			int parent = irq_of_parse_and_map(node, i);
+
+			if (!parent) {
+				pr_warn("%pOF: DT: Failed to get IRQ %d from 'interrupts'\n",
+					node, i);
+				continue;
+			}
+
+			irq_set_chained_handler_and_data(parent, econet_intc_from_parent,
+							 domain);
+		}
 	}
 
 	econet_intc.domain = domain;

-- 
2.43.0


