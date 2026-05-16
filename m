Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D62F328631;
	Sat, 16 May 2026 18:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956027; cv=none; b=dsUGVlrE/t5ulGtSMfq1GvkqhL1m9A0CsX7AfOWWWW6VnAMagOVnx4g6MjYov3fYTkT7POm2YY+qJMS5oMuw9lPL4R0uD8YkZrAA+zj2u++Q+sF5kWuEsS45liyDMF75HE4scrdrNwnZgS3XHKH3ratKeyWkgVrqly3NAk1OY2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956027; c=relaxed/simple;
	bh=gBGMI6S3o4+n+8pLpjBQ+nXTfkXL9j4qXfNkTwzvv5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Csrig9weEV+DfSlfHwOHLoXo0dF6EBQnpATH9THHgVcXVti6sBuQBlIhYjBZ8dsTxPR/rRsySFW3CUCpGr61XTYRVco5xS5NyCq9aVt507FZ9qxFNV9ciMB3XsMA4j914GjBEvWtx5D40DUyC9tnCYx83jfUg9lnZ7JVUsB0ucs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=RCt5sJWL; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="RCt5sJWL"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8790E3F738F;
	Sat, 16 May 2026 20:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778956017; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=m+6v+hjQch8RJ+bE8KqFuX68S8nN6mY6vSXBtyBFUJQ=;
	b=RCt5sJWLKHhMe6N5KcbmNv1JAThwTBq8QcrA/jqviI8f9YEw3m+2tbgkn43lQjMUMXPHjV
	P0k/FVWKMRssCu74g10i7oDmzrNmOB+nZfhlvijF3ufrbQWS28tfhmY3aiOwLhYvSET6nR
	p2tSGQRBB9Vl1EfHooKnUR3PKDRJI5qZFfs99q/gGEaLC+wvdjrlUbRgH3kIdmGu+iClf5
	pTXiY7zmerm1ZREzuNCMMTh9Satgl2Awq62S1eSwh2emZmSg3erUzkPbCsf1LBrkoXMY7m
	9JZfm8EPriVxvaCWUInKYdW18s0bsx80i3CBIcanJpjsmp6ATM3eO7itSmYoYA==
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
Subject: [PATCH v3 3/4] clocksource/timer-econet-en751221: Disable IRQ until cevt registered
Date: Sat, 16 May 2026 18:26:47 +0000
Message-Id: <20260516182648.3987792-4-cjd@cjdns.fr>
In-Reply-To: <20260516182648.3987792-1-cjd@cjdns.fr>
References: <20260516182648.3987792-1-cjd@cjdns.fr>
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

