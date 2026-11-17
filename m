Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909090;
	b=jOLOhuPc/XPXZ3ONZlypdQR45qHSEbDbRhkzgBtsunrkDCXKZMdvkDyDtSHJK1ibGr7M
	 HEPfcWFRdbwZAGl97Sdc0aXwViM8TnmJhAss3O4M58q7KR9OCvmFJdAl4nZ94WoeIYwxs
	 Zn5vmdwHH9PNDPK52uqAWc3pj5cdGi5VvLX+8H2NOqg2KxG4O4S+6VLBhib2O9K/ySUeq
	 r7Hk/YUf/ykaFHwPet+GMP1xtGWrxfVHp0J4BBpVrKqCW09vae4l2sQIb7PnknGYKvElK
	 gxbqdkMi4SCsZ3f32YdvMSnojb6C28hRPwBhntoV+E5mZ2jvO1QGgSLgvJNSMZZ7rRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909090;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=lRhqM7LAgl/X+6g5+JRRCWTiassQyFmX1v5QtTJrszQ=;
	b=xQ6szP/7wo1CLCRilbdwvvutZwQW+KKJDs6otpJtK87oec8YGJ+D566iw5iZJWB3P4hT
	 /OFdSCZ3qbu6tjWcx6VkevRJUt6Q8ErIB/hNEnCosKUybQGNMfiIJRf3v3UiceFXRQEPO
	 JS73Iys18iR89eqMi1MVxCfbDwZgVvjXXbX5tszVwGNWrs90uVKReA9vuCSAiBZ1jNQ/j
	 Fq1YGfHatrw65I2ZUAADjNHK2MWlk4lrBXsAS6LDgJ2erVMt1nNEQzvGiimnsu9A5V1lQ
	 FzIhGoz/OEf++COj7Z0l8x0TodZolo7dtt3xzj29isW6CdwappaH9Cp6KuCOxM3g3ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=rpdrXaI1;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E761606A33F;
	Tue, 17 Nov 2026 09:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E761606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=rpdrXaI1
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 385DD517A51;
	Tue, 17 Nov 2026 10:51:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794909087; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lRhqM7LAgl/X+6g5+JRRCWTiassQyFmX1v5QtTJrszQ=;
	b=rpdrXaI1Kog22getWpr/KAxXpYYdrJ8579MegbefvWftDSGOLYzZaJZ9AIwTFLTl7OAuBc
	0GGHYCtjI7/klIL6EteSS9xQChG5/jY9rJ4wJDIPiDkLgj4/ia3k9yOTMkjE3NkFeSrMAN
	6D2mUZbcejN/oxHTplMZqgRxFZUyUsbZU8dzi04xm1+yQ6CuZfrbArntFWE0KxGKAQSfV4
	pQOUJxhG31HyaNV5zYtGSWqUwZqImsn5wJHjOgMfqrpSFoVPW91FOacQNXooIJ5zU/vHM/
	MWoy5dEyDLAn5D5YdALBvx9uHzJ6VAbLj9WBdJRu4N3MF4YHLkpPCdW7wOmbRw==
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
Subject: [PATCH v12 3/5] clocksource/timer-econet-en751221: Disable IRQ until cevt registered
Date: Tue, 17 Nov 2026 09:51:15 +0000
Message-Id: <20261117095117.173316-4-cjd@cjdns.fr>
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

Eliminate a race condition where cevt_interrupt may trigger before
clockevents_config_and_register has been called, and dev->event_handler
is at that point NULL. Additionally, NULL check dev->event_handler in
interrupt callback just in case clockevents_config_and_register failed.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index 714702b9ef12..f2c4c1ee0a56 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -75,7 +75,10 @@ static irqreturn_t cevt_interrupt(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
-	dev->event_handler(dev);
+
+	if (dev->event_handler)
+		dev->event_handler(dev);
+
 	return IRQ_HANDLED;
 }
 
@@ -104,12 +107,11 @@ static int cevt_init_cpu(uint cpu)
 	reg = ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
 	iowrite32(reg, reg_ctl(cpu));
 
-	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
-
-	/* Do this last because it synchronously configures the timer */
 	clockevents_config_and_register(cd, econet_timer.freq_hz,
 					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
 
+	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
+
 	return 0;
 }
 
@@ -178,6 +180,8 @@ static int __init timer_init(struct device_node *np)
 		goto out_membase;
 	}
 
+	irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);
+
 	ret = request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
 				 &econet_timer_pcpu);
 
-- 
2.39.5

