Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E016214A62B;
	Thu, 14 May 2026 00:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717185; cv=none; b=eD25w6WwBxtw49913Zk1S9tbpITU4ZHRWHth2cWTJl/RTth5zxX3WM4cr4l0RwRsy+93hxrbtudx+Km7blmbA/tg5soB5LeHv9F7/wNxx2M9sBfzSxTWuFWdmS2vGcJvWQCpJGUc/k/+Q6ZHmViMYX9YZ4AIsTt6R4BxoIwbirQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717185; c=relaxed/simple;
	bh=CQ6SHFve0ShlSC89aE2eYQOnpUdzDGPBF2d7JY3zHQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aegSXUij6OtVTE+AJtYEzp4g4spgAgPoIjI3VvFtY8uewd9Ow+i09xjvUwB/j5IDLJyM2GK5J5srHnJC39GHKVANjaDqAV2sqgMkOChz3WtguhE43biVZlBkSJ9KNJd7H60/+1EkNObms8nV6RvFrRtaduToM19W49pxC8t/Yvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Xloo44Gv; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Xloo44Gv"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADE353CAB7E;
	Thu, 14 May 2026 02:06:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778717180; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=TG1hR2+yRACPSEJR+pfdcc8iUip3vVJTgeUnuo2wD7Y=;
	b=Xloo44GvvB1Pm9TMvqRlaYCZ2f1rtbpEDylB4/sYB/noKHv7xb8kG9/QcOkc0xKVMm0xHI
	sMzX47M9aWoTuYgLIh7Eu30OwdK/A+0QiR9GHKYjhEWzDVnRTXZ2XzO8ZuTqoiY9FG2z1K
	Ef9NzSFNtWPL4yAllkKmy5BWADH8jOlWSdmVN6YSeRNSKf/g1xGkX7lyE7w97GUkIqM23n
	enjC7jlYD7OP25/Jx0XGfZbUXZgKc01189h5wzeGMh/OOoYa/XiDAniYY6sXbEwwZpBbp1
	1XNTskK84r21VvuROYLgKSb3r1xHZt6nqecS7YvtPvVO/f524tB+7Hzx2GqDsg==
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
Subject: [PATCH v2 3/5] clocksource/timer-econet-en751221: Always map all membase blocks
Date: Thu, 14 May 2026 00:05:59 +0000
Message-Id: <20260514000601.3430262-4-cjd@cjdns.fr>
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

The 34Kc always has 1 block and the 1004Kc always has 2, there's no reason
to not map them all, even if some CPUs are not active. Simplify the logic
to make it more maintainable.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index 5def3e536b21..e79069d9a826 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -173,7 +173,6 @@ static int __init cevt_init(struct device_node *np)
 
 static int __init timer_init(struct device_node *np)
 {
-	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
 	struct clk *clk;
 	int ret;
 
@@ -185,7 +184,7 @@ static int __init timer_init(struct device_node *np)
 
 	econet_timer.freq_hz = clk_get_rate(clk);
 
-	for (int i = 0; i < num_blocks; i++) {
+	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
 		econet_timer.membase[i] = of_iomap(np, i);
 		if (!econet_timer.membase[i]) {
 			pr_err("%pOFn: failed to map register [%d]\n", np, i);
-- 
2.39.5

