Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA038399D;
	Thu, 15 Oct 2026 16:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083272; cv=none; b=Mpm7W9IPPOeSyrTQE5IDfrbDlSqk6sOthZgTPvrUcK42x9LXLyXruTxVjbHYXA5KEz/bFmEN3hDRRddvrieiY4W6d+YTrdYjTgvRUMArHY03zupXoyN5UrOs3olERao39aleR0llOy0Q/Jb+VMYdv1dySI+OWa+WUMNXeqoubOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083272; c=relaxed/simple;
	bh=x0XMny1qGGl4AJoowktjLCWIaQ/7L5RzSu5rS1V5VRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nvysLiueQ24DJBq5JejwNsG/ezoEzX//enou5jFOXGbp+dAsECtvJO+72Kp+BRZTrlLXjYIPNuTRhThKGYPPylWelTjsVoXekKc19Gzgy4POuMCFETNHNn0WM8er1IK1OOTtewL5kbOdCKaXwSa13hoa0b0B0RNjK2/PKHl6qnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=sBzXEYDP; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="sBzXEYDP"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BFBD5B37D1;
	Thu, 15 Oct 2026 18:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1792083256; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lRhqM7LAgl/X+6g5+JRRCWTiassQyFmX1v5QtTJrszQ=;
	b=sBzXEYDPI2L+k0X/53X/CWJ+6LxVMiNcTpp9835drzxi4RUwuW88aeS5/PafrHpdLon5U0
	bLZaiR9e1vZK4u7664vv//Hi+zMKwoCZyStglXDxlKAOE+I+NT9AhZYf/smZo1DyK16MBG
	QPHhNeFK4yNHdL3tEU3eTmlPBT6oKHEwlTxUVIN50wb6RisL9GeOFfs/SNwUPESWMBKs3S
	gl/KxnUy39KtEmfOi7nre0h7L8WYv6nN3cVkNbIpcUTyy0o2asGirnUx/gdouSb7pUJ0SB
	pw31pW/Y4t8UPpHRDHk8ZRTBPiaYXdT+BbxkxSzFxYB4IrOEYXLhBGcEdUfKlA==
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
Subject: [PATCH v11 3/5] clocksource/timer-econet-en751221: Disable IRQ until cevt registered
Date: Thu, 15 Oct 2026 16:54:02 +0000
Message-Id: <20261015165404.519741-4-cjd@cjdns.fr>
In-Reply-To: <20261015165404.519741-1-cjd@cjdns.fr>
References: <20261015165404.519741-1-cjd@cjdns.fr>
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

