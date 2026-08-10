Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F5E3F9F3B;
	Mon, 10 Aug 2026 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371968; cv=none; b=l7xKnjUFJuzNh5NbuOgAoVECMPyzlvlUAHC87HqQ7IKkiqMIfMqF5dWXRzVjwQAxQoUaeOyMIiCCa0lyfGy77HHwCFQok2AJoFh0k+Ljr9NXaD18LaOj+yvWYFPkPbk5sat6oa9UtJPMJnO+8j1TVfD2s2TrfqXQ4WcInn9Tt0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371968; c=relaxed/simple;
	bh=BlgTe9eHIHHj3BBVdmL2qiqhw7LhfAxU9QFccUWDyPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eIah+BF+FbiEeZqwK6ipvXQG9b/2GnGDrXDD52hvlTQ/TuVrfUDQTQ3K4TbupPvBp7uRM7KgMdA9N2Ejrm8HsP/NwY6BwF9KuaUqp2a84kY5F+lk/T1ujTqufBTxtKDqTacMyGITknQ1iTnbPjX0DPkovzMNYzaQre5nGdsBdrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Izie+GZT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Izie+GZT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6F1591A153D;
	Mon, 10 Aug 2026 14:26:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43AB26033B;
	Mon, 10 Aug 2026 14:26:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD50F11C4A8BC;
	Mon, 10 Aug 2026 16:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786371964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vkyzIOICzk01mRUA/4rsZz8uXiX46tgQ58Wp375yyf0=;
	b=Izie+GZTdz/E+GREzUS4m+xVU5XXgU8MeTh6fAuE+/XPf7IuJHMM6V6i/1YxEQXfawRTxS
	GFuUvXhGydfYlndqe9BCk4MENAjrMS0q+GCyk0xYr3HmicDPZKsYkM7UN+eqlay14ej2EX
	0WFQMKotMMCkCK20R7GF0BcRrYM1wNwKWb+byj2M1ZjpgGpi+9jvO/XaXGmh65xqTA7D3w
	mWs+ojVl+mbWj1W2CT8X4NH3KraVg3yX+0GbP4QML09Cygzr3BHUh21om7NcHGgaaD6/Wl
	2g04NbpuRoedQQm2zXDRlywmfNo4fizpa6HMvYzySjxcmbNPGo/vK0ihIQNnqA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 10 Aug 2026 16:25:41 +0200
Subject: [PATCH v2 4/5] clocksource: mips-gic-timer: Set next GIC event on
 the correct VP
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-sync-gic-counters-v2-4-dfe8b2c376b0@bootlin.com>
References: <20260810-sync-gic-counters-v2-0-dfe8b2c376b0@bootlin.com>
In-Reply-To: <20260810-sync-gic-counters-v2-0-dfe8b2c376b0@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, 
 Chao-ying Fu <cfu@wavecomp.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Paul Burton <paulburton@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

gic_next_event() programs the next event on the clock_event_device's target
CPU. When that CPU is not the current one, the compare register is reached
through the GIC VO (other/redirect) window, which is first pointed at the
target VP with write_gic_vl_other().

On a multi-cluster system each cluster has its own GIC. The VO window of
the local GIC is what write_gic_vl_other() redirects, so when the target
CPU belongs to another cluster, write_gic_vo_compare() lands in the
wrong GIC, overwriting the COMPARE register of a VP in the local cluster.

Redirect the core-other region to the target CPU's GIC local block
with mips_cm_lock_other_cpu() using CM_GCR_Cx_OTHER_BLOCK_LOCAL before
writing GIC_VO_COMPARE, and release it with mips_cm_unlock_other()
afterwards. This ensures that the correct VP is accessed in all cases.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clocksource/mips-gic-timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index a1669266c94d..ddbb2f827bf0 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -61,8 +61,9 @@ static int gic_next_event(unsigned long delta, struct clock_event_device *evt)
 	if (cpu == raw_smp_processor_id()) {
 		write_gic_vl_compare(cnt);
 	} else {
-		write_gic_vl_other(mips_cm_vp_id(cpu));
+		mips_cm_lock_other_cpu(cpu, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
 		write_gic_vo_compare(cnt);
+		mips_cm_unlock_other();
 	}
 	res = ((int)(gic_read_count() - cnt) >= 0) ? -ETIME : 0;
 	return res;

-- 
2.55.0

