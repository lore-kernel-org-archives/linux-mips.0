Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5260429039;
	Fri, 31 Jul 2026 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785499390; cv=none; b=fjltKvp43x4HEwt/z7ikYNlps49j1bVqDrrEi0+ZOmsG+N26hS97EvzGupZOuSKwO0+Wzafxnkx/yOewD8ILkgAAKB/ardCVSYRviyuAQAwl2PAAoRf0zG3vpIqcrKhqe9vEzpRkzHP6pAgYxnaNc7B1PWtDvzoi/YIuiBIiSZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785499390; c=relaxed/simple;
	bh=9cxKqRSzDI1k9DZMBIppT7I1D0ocQhPQ6p2OsQkLhW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mIFaWER0sNOovMRM5pNOIL2t4bi3tan9u7sk4GkKfhvpIkbx4sGp1S9kt5kog2geVwnMfMY0cEtCf35byGKnmIO7g1yGUXTYcw99x+EWwH9r1ikvevjYARE7Ww+RBfpAYtGgS7E+nhcmkjNK4acBDBI/FhNACUxHmG0QQrVZanE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=K6nnlHDC; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="K6nnlHDC"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B97A11D0F3;
	Fri, 31 Jul 2026 14:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1785499380; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q6cAAX9tCyXcIpCsb2E2vZSxmNLsA1iEdhH9bQm/us8=;
	b=K6nnlHDCXa8kdLBW5LU6xyPfIM5j/dPEZErOxvSA0/Wek3ajlXSCXVp5yllsslpY5eOpTQ
	HxbHrQHzLgCnuWaHQkSMRJ4o9tDXoH9+7Yc60OCAOYrDxtBoyaiAYEfoAVcbCOAl0+Rnbi
	DRp+leW5vRmHAuHENmABVvgUXxa1vKGnuHByFJR1vo2aPENZN7rrMxaZnCcjSCvwyPe/6z
	bQPEf0u/paxGR2huRYlP0Li7tW30QxC+mT4rVV2iCNedwQIqggHh/0GF5YpJUNv/TRjndU
	zHxtZsTrKUfyjD4ZOjeDHNqmz8c6S035w3WpnPLruVP/h/8v4XhyeAjtWA7bdw==
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
Subject: [PATCH v7 1/5] clocksource/timer-econet-en751221: fix refcount leak
Date: Fri, 31 Jul 2026 12:02:42 +0000
Message-Id: <20260731120246.1296955-2-cjd@cjdns.fr>
In-Reply-To: <20260731120246.1296955-1-cjd@cjdns.fr>
References: <20260731120246.1296955-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: "Alexander A. Klimov" <grandmaster@al2klimov.de>

Every value returned from of_clk_get() is supposed to be cleaned up
via clk_put() once not needed anymore.

Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index 4008076b1a21..1859335345b5 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -181,6 +181,7 @@ static int __init timer_init(struct device_node *np)
 	}
 
 	econet_timer.freq_hz = clk_get_rate(clk);
+	clk_put(clk);
 
 	for (int i = 0; i < num_blocks; i++) {
 		econet_timer.membase[i] = of_iomap(np, i);
-- 
2.39.5

