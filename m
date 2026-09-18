Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBF15038F0;
	Fri, 18 Sep 2026 15:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745782; cv=none; b=IHkKQeJxlBPJGya/HKIFQnS1yJU209sJSzn3mB0+8hqI08tgQy+RY3gQ+XcCBNINZc2APRah0Ao1gG3fptYOWs20Pn/AR/tBF5ubfNEz4q/ov5d94wJ8rKOCdcxWGfBbMbyYoRTxjyL1y0ggvznTuPKZhZWzqkbtQQQtEbzQaXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745782; c=relaxed/simple;
	bh=9cxKqRSzDI1k9DZMBIppT7I1D0ocQhPQ6p2OsQkLhW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=frBr9EUp5NBT0qeYeTk/oTG2jkQOIECO5ewy/7guJwEPw96DB5xh4L6KP8I1m3MM3p3bWoWBFL2hi7pxEXQLQa7kjt43/zAsIsbs3jcfUMd54xHZmh21D/UZoZFjMtfvelM7gH802TYOszlkFYaFyCeqJ2ZfL19aEnbRKPCdJNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=M9Vv1oBk; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="M9Vv1oBk"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36A674DE073;
	Fri, 18 Sep 2026 17:36:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789745778; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q6cAAX9tCyXcIpCsb2E2vZSxmNLsA1iEdhH9bQm/us8=;
	b=M9Vv1oBkeXW97PMRh4KKgbEAEuM/2AvVrgE1NS+mpyVpA01HZSDWH7Ddek62pTlW1vVx4+
	ljKacrKXvTxmdaGe+A3Ug5r7q4wvY9hffz/gddMzDczHRXbilYRi9aGq34YjiHYfa1iG5g
	ijKEbV+VxX1ATf1gdyeZDDFo4al2IFRqEEoC2AmLV2vYTePR82RrFadCUl5u44OetBlgHh
	u/ny1zeraHU14DDnxokhSMsVoEAcLXkLbqcnmkWmNxao+KO8n/6SFjYy9/LUSPmf+2VNYf
	l/Vy1nI56hYoYFtsMAN8oFWSmfRdU1ks8Yrp6Bad6tQCcw0Q5bKiWiBKjr+w5w==
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
Subject: [PATCH v9 1/5] clocksource/timer-econet-en751221: fix refcount leak
Date: Fri, 18 Sep 2026 15:36:02 +0000
Message-Id: <20260918153606.344143-2-cjd@cjdns.fr>
In-Reply-To: <20260918153606.344143-1-cjd@cjdns.fr>
References: <20260918153606.344143-1-cjd@cjdns.fr>
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

