Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4A5384250;
	Sat, 16 May 2026 21:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778968655; cv=none; b=pgyN1einOKvLGB1NfsjnfUVuoe2zkqs3QIMvNq75LJWvRuBir0Q4WpL96LKJ4tugGRYh9Wf5uU1OxRGV3oP2TbNcA9taACDUBeKFjPHCREFCM1CPwVlw9dluRqeCiu523ZAbMZWDbGhqOhCxtHnVWJPiQtefPk8oPvl0jK3Y3DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778968655; c=relaxed/simple;
	bh=gBGMI6S3o4+n+8pLpjBQ+nXTfkXL9j4qXfNkTwzvv5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sFzotNIIkjnbr+7hLhOr1X4hZ0uYGgHVm27MXk1wBavtsEsR1aqtgxnAyuRfmV5WLgxorfbxka5skE22j88KXR5UhtGAPFQddG1yrRxNXisTmx53sLS+zdPTIwYIC8Rlug1WjGUz69rHw9RtELw8wnphWJwKTKjAsUEF8QXfkQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=kvIOV0+Z; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="kvIOV0+Z"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EAE23F9C13;
	Sat, 16 May 2026 23:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778968651; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=m+6v+hjQch8RJ+bE8KqFuX68S8nN6mY6vSXBtyBFUJQ=;
	b=kvIOV0+ZYsHZNjVB+jG6+n5X7x9owhx6JRCGPHpygCfYUPGhjv14v08Lga6SRt2uId12xB
	2/z1EidcqOCgroyt+eA3OU+dccxH6xqScRbTXQslEFGvgImYz5ggKmHK8yEPRsZofX32k+
	Bn0A1m5v1ta+GkmPnDntumn5F5Cnb7ZHpN6Vv8ffjc9JXRUaUkgT9TCO9r56/7ehMpEZxH
	IyNVVI0KO9JsAk5HWsfuIweRXRQGSSDc3AlwShhZ++AXDVVxmRsEsKIyxVIuR8qYAZFN5G
	VDW8IEQr7Ya7yHX3DsYgLDYIxRPbOjDqx0YKMmI7p6jivZqPqMGoGPskDzqQAA==
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
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v4 3/4] clocksource/timer-econet-en751221: Disable IRQ until cevt registered
Date: Sat, 16 May 2026 21:57:19 +0000
Message-Id: <20260516215720.4160831-4-cjd@cjdns.fr>
In-Reply-To: <20260516215720.4160831-1-cjd@cjdns.fr>
References: <20260516215720.4160831-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Eliminate a race condition where cevt_interrupt may trigger before
clockevents_config_and_register has been called, and dev->event_handler
is at that point NULL.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index 155471f68e6f..ed750e39cc4f 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -104,12 +104,11 @@ static int cevt_init_cpu(uint cpu)
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
 
@@ -177,6 +176,8 @@ static int __init timer_init(struct device_node *np)
 		goto out_membase;
 	}
 
+	irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);
+
 	ret = request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
 				 &econet_timer_pcpu);
 
-- 
2.39.5

