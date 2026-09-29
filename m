Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EE64E9C10;
	Tue, 29 Sep 2026 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684066; cv=none; b=K30egHPbVk3CoDAEINKjrPOsn75usgUEHdx22Y510KI69bMYnDUfHKcwzVsTjLf6tOBP6lWYsJ0kVAPoBADp4OgT9bZgM5wGs5R8ucpdjJvJCrm59UM6R18VMqaaK+IBIU9bZuqodWvhfkXCgr0z4HQ7guzsSfPWN3M82ZE40rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684066; c=relaxed/simple;
	bh=d97xc9Y1R18q+2AQuZhy8Mwb5qfpprWx4ATDL6YLdtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4w6atWAmRDhXdj7b5p7oHwX2XPFtPof03lOBVL314ANtDq7HZr7qp4XTDoTKQ4f6O+LmKTBfejt2KPPvG3eyXm1kuQlWDfpOjZY4F2hsapvfhfxL90jVhG16SPHv8niU8q4PznOD+Y0G30/U5Ur1PzHjdtYGvVzRtFuI0tPlrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zvlFbpd8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zvlFbpd8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 924941A105F;
	Tue, 29 Sep 2026 12:14:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66D37601BD;
	Tue, 29 Sep 2026 12:14:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A76510329529;
	Tue, 29 Sep 2026 14:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790684061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=l4yD82GHhREFsdsMccvpbDPRksBJicEaO8appZy9fvA=;
	b=zvlFbpd83vJPSd+z2K98d99iHB/vmEmqJUh/IyLuxcHQaCZJYGaBi19fb19zGmrETA/XcO
	z626Wz4HDdT9GDwe2N/x2HcjP1gj/1zb4hvskj/azS3EMoCzu2Up2LZDjd7EvHJWZjd0t6
	G4CTuR0wrq6lkLrVlRq7vmxofmgDAaHXIFEevHwskM9pBGtDcrrjFO/HJ0pNaG0026OA1N
	QFyX/Q+bZIQONvG/60f9mAa8HO3DiCJ+RktDYS9P6EEv9BDX3cp1MJNRRI+BfVnMzNvHGs
	GBcFF43/df8sdHRgnuIz+YN5WSY0trBvDiC8cK/6xgnAje4TYomfEX1ZVyfIcw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 29 Sep 2026 14:14:11 +0200
Subject: [PATCH v4 4/5] clocksource: mips-gic-timer: Simplify
 gic_next_event() for per-cpu timer
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-sync-gic-counters-v4-4-ec70c4b60434@bootlin.com>
References: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
In-Reply-To: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Aleksandar Rikalo <arikalo@gmail.com>, Paul Burton <paulburton@kernel.org>, 
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, 
 Chao-ying Fu <cfu@wavecomp.com>, Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The GIC clock event device is registered per CPU and is flagged with
CLOCK_EVT_FEAT_C3STOP. This guarantees that the set_next_event() callback
is always invoked on the CPU of the event.

Drop the code path configuring the compare register of another CPU as it
is never called and does not correctly handle the case of having multiple
clusters, and document this guarantee by adding the CLOCK_EVT_FEAT_PERCPU
flag to the clock event device features.

Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clocksource/mips-gic-timer.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 1501c7db9a8e..cdaf4ba1d509 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -52,18 +52,13 @@ static u64 notrace gic_read_count(void)
 
 static int gic_next_event(unsigned long delta, struct clock_event_device *evt)
 {
-	int cpu = cpumask_first(evt->cpumask);
 	u64 cnt;
 	int res;
 
 	cnt = gic_read_count();
 	cnt += (u64)delta;
-	if (cpu == raw_smp_processor_id()) {
-		write_gic_vl_compare(cnt);
-	} else {
-		write_gic_vl_other(mips_cm_vp_id(cpu));
-		write_gic_vo_compare(cnt);
-	}
+	write_gic_vl_compare(cnt);
+
 	res = ((int)(gic_read_count() - cnt) >= 0) ? -ETIME : 0;
 	return res;
 }
@@ -82,6 +77,7 @@ static void gic_clockevent_cpu_init(unsigned int cpu,
 {
 	cd->name		= "MIPS GIC";
 	cd->features		= CLOCK_EVT_FEAT_ONESHOT |
+				  CLOCK_EVT_FEAT_PERCPU |
 				  CLOCK_EVT_FEAT_C3STOP;
 
 	cd->rating		= 350;

-- 
2.55.0

