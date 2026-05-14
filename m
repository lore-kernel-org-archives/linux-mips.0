Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A435198A17;
	Thu, 14 May 2026 00:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717181; cv=none; b=Bpry0C1SeElZ+RVuRey1C9ro19JdhgRIPzcLG/nuDzl3dN2rkdtFTDuq3FSnjMGWrsGhqrYJHhPZ4Du8Gup19UMKwOiYdFuU1v965u32DZI5cpVQ9CF4W8TD9lyhitBWUQws7qJYfh6Vbhx9W7QbKmsPE1yB2C/xQNdtwXVvXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717181; c=relaxed/simple;
	bh=oZNBhEbHSvwxysGd4ekKEToBKkq9YVk15RpEEgR1s7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pD35BPOgJ1hO9KcwQh1a6OUYIDVF2uznv4rzUpNoGxFaXBg4WQgX8/Ie1efQbS5vAUNb0Leak3qLbm95pCRxZQVS+hJyNTtAgTdik3lEtqSwQovsJAhvhBSu9prVGsqTGYyvSUOaFkGatIoLb9ryOAbOsRiN6yYP9rnPAgOY6/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=feRVeWam; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="feRVeWam"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBF273CAB62;
	Thu, 14 May 2026 02:06:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778717176; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=r5PfJvgee09PC78soNW2xInK8l/vzvC6AIBcmRiE2E8=;
	b=feRVeWamZvF5bqsiVDNeVM3WoKz9S9c/BSQvIWOO9hWVNjgC1nmLQxtdHY8+tc6KDQAfuk
	GOmju/9WEzvxmB8NpRWXhi+/ZYKaj2CA6dXB1h7kJRhZUV16TMp3YrV6ZDW6S3K5nIo/dL
	UsdhAZE53flDoYTiSjMkEB3yeMDvezrhuWfBef4XmutMIHARvoHCj3tzmnAR5fqZU5KxK8
	JfUJ7hHtSqRv5jYvKRj+FxgGiTS05fwdEgV4MBGzqQGzpQxKGOxBN0LY4YVFan5As9egKg
	rewWyL8atzkQLME7waIhyKkBQZNmas1nufVMBUodzFLOjGo31IN61re1W1BIFg==
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
Subject: [PATCH v2 2/5] clocksource/timer-econet-en751221: Move generic logic out of cevt_init
Date: Thu, 14 May 2026 00:05:58 +0000
Message-Id: <20260514000601.3430262-3-cjd@cjdns.fr>
In-Reply-To: <20260514000601.3430262-1-cjd@cjdns.fr>
References: <20260514000601.3430262-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In preparation for supporting either a percpu IRQ or multiple IRQ
numbers, simplify cevt_init with common code moved out.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 31 +++++++++++++--------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index 4008076b1a21..5def3e536b21 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -126,6 +126,19 @@ static void __init cevt_dev_init(uint cpu)
 	iowrite32(U32_MAX, reg_compare(cpu));
 }
 
+static void __init cevt_setup_clockevent(struct clock_event_device *cd,
+					 struct device_node *np,
+					 int irq, int cpu)
+{
+	cd->rating		= 310;
+	cd->features		= CLOCK_EVT_FEAT_ONESHOT |
+				  CLOCK_EVT_FEAT_C3STOP;
+	cd->set_next_event	= cevt_set_next_event;
+	cd->irq			= irq;
+	cd->cpumask		= cpumask_of(cpu);
+	cd->name		= np->name;
+}
+
 static int __init cevt_init(struct device_node *np)
 {
 	int i, irq, ret;
@@ -146,21 +159,11 @@ static int __init cevt_init(struct device_node *np)
 	for_each_possible_cpu(i) {
 		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
 
-		cd->rating		= 310;
-		cd->features		= CLOCK_EVT_FEAT_ONESHOT |
-					  CLOCK_EVT_FEAT_C3STOP |
-					  CLOCK_EVT_FEAT_PERCPU;
-		cd->set_next_event	= cevt_set_next_event;
-		cd->irq			= irq;
-		cd->cpumask		= cpumask_of(i);
-		cd->name		= np->name;
-
+		cevt_setup_clockevent(cd, np, irq, i);
+		cd->features |= CLOCK_EVT_FEAT_PERCPU;
 		cevt_dev_init(i);
 	}
 
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
-			  "clockevents/econet/timer:starting",
-			  cevt_init_cpu, NULL);
 	return 0;
 
 err_unmap_irq:
@@ -203,6 +206,10 @@ static int __init timer_init(struct device_node *np)
 	if (ret < 0)
 		return ret;
 
+	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+			  "clockevents/econet/timer:starting",
+			  cevt_init_cpu, NULL);
+
 	sched_clock_register(sched_clock_read, ECONET_BITS,
 			     econet_timer.freq_hz);
 
-- 
2.39.5

