Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909093;
	b=apNHbN6P2/0Y3Pn/DsANLERP9hvoB2Gyism1cq8COhUdHlyw0Lts0noHfzhTfl4MYwuE
	 vJcrbyDVjDUUFmoYYY36ld89qz+lZGQbfl1vPIzhsDX1xA5jGRdn82adxq3H4IM/gjRrs
	 87GK5tFtPHuiwycMt93CBouw0QiHDqZbx0TVXK6HUtF5dNau5OfzcQeXM0hsZAXsBOGF5
	 +SC2xC0jI13eZyC9DFCuTnuqJlvIRMlFpE/gr81XWUWUHMPcjX7/iLyzxhwSB7NroFFPA
	 i4i7KDHi/CHN5twBwY3bXYzlMyXpI596+66Z7ZNAddRyZrJIxqIJYW7bXkNIHn14TWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909093;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Bo4Pkqkj8MYnxBK3j+0sK35BN5q+7GSDcZpoAAftl5U=;
	b=3wm7yl9oIZixdehKVNHxbPEJ9h6XpsQnPLwxYti/zJtwC2jiAflYbNPrj/pFfcUZzCPx
	 EMaVYRnUzvBPmZoEsXiIKNE/ctdEExqL9Hv19tzW4mPlgthR2L9BUloiWo+bkfwSZfJhv
	 hDM5GmLAEn7nmBcYOCSAamGJwYEOy0NsyuemDmeg2nD4knx1+NuVS2bBpXpzUgaydCSCO
	 473O41GlG3raBbIhYbdVOGfGIlRvb0ZnTE4b2PGYmZbAEXUBhEWzLvGMMeTdbimtMOpqK
	 Bg2uqvkKPhkPZwQnewvEPRGWx++SWe9hLzYPTSlvcY3tc8Ycc0CCgBHyldxJu87/W3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=gp35gJtB;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD733606A8A1;
	Tue, 17 Nov 2026 09:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD733606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=gp35gJtB
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DA1A511CD6;
	Tue, 17 Nov 2026 10:51:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794909090; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bo4Pkqkj8MYnxBK3j+0sK35BN5q+7GSDcZpoAAftl5U=;
	b=gp35gJtBq7m5TV94fMl6K1Ep1Rslv5jBQgwnD+E58gQ1qVBufyC0ZC9AN9vj5Qh3okrtLS
	peeCJaV1xRNlDuIYLL8qhU4HHWeS4eK5aM8TN0/S+siauj6o7aATSvy87aPJ0kGtizuqO+
	+qK6i2HzfQWurfhhCaIRkA73SN4fcWCIYMyTmPMkHRhwy+/rh61oyAg678jZpVm3cR1U20
	FLjUY2aLxl718X7KLYndRzfZycpK4a3KrZZITqbM5NPUC74AhKysTXToP7l25NNh4eJBVZ
	65JGzq1gNASjE8NNgYAW99XU/UY/jQakn3tf9RPDlcs8usDq9vqa/o2opkYIFw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org,
	daniel.lezcano@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	naseefkm@gmail.com,
	robh@kernel.org,
	tglx@kernel.org,
	grandmaster@al2klimov.de,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v12 5/5] clocksource/timer-econet-en751221: Do not use NR_CPUS for resource array size
Date: Tue, 17 Nov 2026 09:51:17 +0000
Message-Id: <20261117095117.173316-6-cjd@cjdns.fr>
In-Reply-To: <20261117095117.173316-1-cjd@cjdns.fr>
References: <20261117095117.173316-1-cjd@cjdns.fr>
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
X-Last-TLS-Session-Version: TLSv1.3

Each pair of VPEs has one timer block, so the number of blocks is half
the number of CPUs on the hardware. However, since NR_CPUS is a
configuration, it is possible that it will be less than the number of
actual CPUs on the hardware which will cause the array to be too small
for the specified DT.

Switch to an allocated buffer for storing the iomem resources, as is
done for the IRQs.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 29 ++++++++++++++-------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index edb3db3125ce..9f28cc238372 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -19,11 +19,10 @@
 #define ECONET_BITS			32
 #define ECONET_MIN_DELTA		0x00001000
 #define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
-/* 34Kc hardware has 1 block and 1004Kc has 2. */
-#define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
 
 static struct {
-	void __iomem	*membase[ECONET_NUM_BLOCKS];
+	void __iomem	**membase;
+	int		num_membase;
 	int		*irqs;
 	int		num_irqs;
 	bool		is_percpu;
@@ -37,6 +36,10 @@ static DEFINE_PER_CPU(struct clock_event_device, econet_timer_pcpu);
  */
 static inline void __iomem *reg_ctl(u32 timer_n)
 {
+	/* reg_ctl() is used to check if a clock exists */
+	if (timer_n >> 1 >= econet_timer.num_membase)
+		return NULL;
+
 	return econet_timer.membase[timer_n >> 1];
 }
 
@@ -202,11 +205,6 @@ static int __init timer_init(struct device_node *np)
 		       num_irqs);
 		return -EINVAL;
 	}
-	if (num_blocks > ARRAY_SIZE(econet_timer.membase)) {
-		pr_err("%pOFn: Too many regs: max %zd got %d\n", np,
-		       ARRAY_SIZE(econet_timer.membase), num_blocks);
-		return -EINVAL;
-	}
 	if (num_blocks == 0) {
 		pr_err("%pOFn: At least one reg block must be provided\n", np);
 		return -EINVAL;
@@ -227,6 +225,15 @@ static int __init timer_init(struct device_node *np)
 	if (!econet_timer.irqs)
 		return -ENOMEM;
 
+	econet_timer.num_membase = num_blocks;
+	econet_timer.membase = kcalloc(num_blocks,
+				       sizeof(*econet_timer.membase),
+				       GFP_KERNEL);
+	if (!econet_timer.membase) {
+		ret = -ENOMEM;
+		goto out_kfree_irqs;
+	}
+
 	for (i = 0; i < num_blocks; i++) {
 		econet_timer.membase[i] = of_iomap(np, i);
 		if (!econet_timer.membase[i]) {
@@ -305,13 +312,17 @@ static int __init timer_init(struct device_node *np)
 			irq_dispose_mapping(econet_timer.irqs[i]);
 	}
 out_membase:
-	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
+	for (int i = 0; i < num_blocks; i++) {
 		if (econet_timer.membase[i]) {
 			iounmap(econet_timer.membase[i]);
 			econet_timer.membase[i] = NULL;
 		}
 	}
 
+	kfree(econet_timer.membase);
+	econet_timer.membase = NULL;
+
+out_kfree_irqs:
 	kfree(econet_timer.irqs);
 	econet_timer.irqs = NULL;
 
-- 
2.39.5

