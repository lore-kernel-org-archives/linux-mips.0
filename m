Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2CD4CA270;
	Mon,  7 Sep 2026 12:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785245; cv=none; b=Q34FQHninSN4D/52Wr30GpYEAdykCNLMJrNn4ySxtiL0/beqZdE9p00WNXdjN/i3xJ/U4QsAquduFi8B+g42T11LCpy5R4HGHCmBTmTr8w23aZpYol2U3IKACJKD9e8wre4eJDIFu6UnHYVCUKy2T8U/dhnuuNjuDsTLmaLArv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785245; c=relaxed/simple;
	bh=6rZTytL69j6CpLD/oEagF1g2bjXrp/x/ZC6FmJMqqY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jo5qrgQ+Hg82tePdaXYe26sLdVERHE+3zA3dWWv+IfLwuwn/N6JxP6H08rM2qRgpFuiFWAPQcytWRTR2VXR+sY53XrzWLR7RFkXDC5oiVNnClyjKynsnmTNrTTaZOznuwu1jH2bz0wbrzRdTdmoAFTcpona/vGlzG005+8loCzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YZn03Icd; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YZn03Icd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 519DC4E41567;
	Mon,  7 Sep 2026 12:47:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FA9460383;
	Mon,  7 Sep 2026 12:47:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1532111C7AF1C;
	Mon,  7 Sep 2026 14:47:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788785241; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D2/9j4zuJdpqtP7yhz1/mgU9l6GOdLZAykPvnpy/HEk=;
	b=YZn03IcdpISlxpt5o6nAxWg4m54ZOD+rhA3On+9B2uQzwEsqjcctFbh6ImCYlJlRFRFgTE
	faWsW26+C+VzlEXfV2UwOjaOTE+4dJYW8/nhs8cuWWl/Wu9vIjI4RcsZo+ROL8iZ+9ca7G
	m7R6hQF/UV6Gk6tRrTtjK2UrE3G9h18rRlC9EoGBb+g/6Pn7jW4xuSBY23p7QKuIhORSUD
	g8sxH7KG9GzPaOzf5LgFfw1oVXq3tL4lrlRvf+udR0A1pVHBkBWcuGCcbI8EeJTbQcDoC4
	WH9stkDlkhUsAxtH4CFs4lX924+sQwQCrrao4VhHEDUQ0W6mbzPH//NlC0jSYA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 07 Sep 2026 14:46:38 +0200
Subject: [PATCH v3 4/5] clocksource: mips-gic-timer: Simplify
 gic_next_event() for per-cpu timer
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260907-sync-gic-counters-v3-4-3d891ddabdaf@bootlin.com>
References: <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
In-Reply-To: <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, 
 Chao-ying Fu <cfu@wavecomp.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Paul Burton <paulburton@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
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

