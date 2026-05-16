Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068683A9615;
	Sat, 16 May 2026 23:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778974804; cv=none; b=dhx1//lpSNlEQMTdCC/cVb1x3+5W1/vpxJ8GQxWdheLoOUVDbqPSiI7EhYlfNnQtysO1v0TNiyixaoBDecJa+8ijPt1tDkvX2he/izPd/Rgg+HO4Jdr1GhLuO/UNpyILtXenRHsle6O2+fISR30mETW1h3QcSqkiP+fVwNuF5GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778974804; c=relaxed/simple;
	bh=gBGMI6S3o4+n+8pLpjBQ+nXTfkXL9j4qXfNkTwzvv5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N4Rog6G+KGiA98R4gzM53yvgGKtxihb1WQVdFmOO7GzEaw/YdiGIyIlsa/bYKQxxl4/eAkpAq6t5VcY8775/h1rICmxd3Wxxqk7+g9qxJMUC95QJhMtSDuYzRmb3PjWk5HqJDfaYla/Bzngz2kyoNaukfsIVIXApbYhEl7cpt1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=im+d7sab; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="im+d7sab"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C8CE3FA5BD;
	Sun, 17 May 2026 01:39:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778974800; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=m+6v+hjQch8RJ+bE8KqFuX68S8nN6mY6vSXBtyBFUJQ=;
	b=im+d7sabMBnhQoS+rqoqCCwFWauBvt9EsOD+XZKmzDWMKrpA8zhrZoF3Dg0QzYtKjXn5gE
	w+Q9y42PZR54daYLOO8DH1oQvvEQXN6vrX43kQ+sLuXBGCuIgCURdW3GZ/M432PAEwAgzC
	H96hw7d2ClEX7bdxHiI4VxFod4rihCXgJEGdEV+crWworPjJLzkIjT541N326vrzQ137Cy
	buf4li9Qv2IUR2+IkQ/B+OhrL9FCGpYpsnbZLS2qZtmoO5rGMmyei8RWiQQ0qaCVoDae6k
	Ao56lKsizdovlIpRq8UMI1/CP400T5RYRttphvCZNJvQYm9R+5bBbMd/829DYQ==
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
Subject: [PATCH v5 3/4] clocksource/timer-econet-en751221: Disable IRQ until cevt registered
Date: Sat, 16 May 2026 23:39:42 +0000
Message-Id: <20260516233943.49502-4-cjd@cjdns.fr>
In-Reply-To: <20260516233943.49502-1-cjd@cjdns.fr>
References: <20260516233943.49502-1-cjd@cjdns.fr>
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

