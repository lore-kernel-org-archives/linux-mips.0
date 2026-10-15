Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E22A3C1D42;
	Thu, 15 Oct 2026 14:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076047; cv=none; b=RzQdUsdYyKQcC2bTSOXQ5CC6HcJUVuOIC8fuhNVNGIEgITd+Lv+wLuEGHP/kYWQKiAPU3zejTNUSOWBKe2BZ5k6niPZ97SD8MJLMmf6/GIgUYMC/vWQjdCVQRXptXi097VGW1EwWm/BBRz+bY/mJDM76bJOd36gVFaUci5cNALw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076047; c=relaxed/simple;
	bh=x0XMny1qGGl4AJoowktjLCWIaQ/7L5RzSu5rS1V5VRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OUQnRhGjtQSHppn7p7Hno1bGZewhUO28N4ytXgTLpEOJmwWx1/T6otPiJ7NEbJEPwzMg+ebnHKVqDfFB/RhoJkgdwwZ+DBelqAjJj+oOovCTnBK1g496rmwkSBF0rtjdnG83KfYEnLbr3pOmj1bpyL2ulMGQwEsEbDbuZ/71p88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Vt0ZQ9yn; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Vt0ZQ9yn"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C4A85AF19A;
	Thu, 15 Oct 2026 16:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1792076043; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lRhqM7LAgl/X+6g5+JRRCWTiassQyFmX1v5QtTJrszQ=;
	b=Vt0ZQ9ynjYIIXKMjDgxhftCzy1mXBTsYNmCsMmsiyHcPcd96ym+FVFel93f5BeBORoIpbR
	PXYW6W84F6YZ1fdTv66P1VQwyIK4FApVVQcIte5E4Zt2ZXCuLzCAEySRqBpZJchp5xOGww
	rQ4WQ6Fz5mzKc3Dp0rU0QAgM4bpUuTkcZEdQeRgiY9gWaV1V4kd9mv67Zcl0+asFF+5flu
	4WbzeKpIPQ5wOLJURUc/u9S9uZkKo6d49glxYZ5vz2tLhJwcEhr6rpsbbY2CbcWTt6zAVV
	2S+st7SLKCnADX4JkBjf2QHTuKAmZrmk7+6+38ELn7kFupCMbMwRcMsvc4xiQA==
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
Subject: [PATCH v10 3/5] clocksource/timer-econet-en751221: Disable IRQ until cevt registered
Date: Thu, 15 Oct 2026 14:53:29 +0000
Message-Id: <20261015145331.453837-4-cjd@cjdns.fr>
In-Reply-To: <20261015145331.453837-1-cjd@cjdns.fr>
References: <20261015145331.453837-1-cjd@cjdns.fr>
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

