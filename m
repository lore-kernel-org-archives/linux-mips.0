Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5E501296;
	Fri, 18 Sep 2026 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745321; cv=none; b=AoCDtG+GOIZomvLveLCEVVPWCNGJrg/v+dpU1cS0Qf5hUwhSjetJd0y2r3z9neIKv50DR92XAeGiNS7Oqgk5YevOoKBVfN7sFT0CpoV+Wj6eQ3mDpYMwsm0exGalHYjrYms6EdE3ZMFqPNkLtb/UTngrAX2Oq2CJtP+8GG/WUeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745321; c=relaxed/simple;
	bh=9cxKqRSzDI1k9DZMBIppT7I1D0ocQhPQ6p2OsQkLhW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WObILques19hnffBrdXmYbxLqOHs/1f+VlYyX6DzKhwTXjuB8TT+eGcRqEbqee7IdXScAQHRCxR7hMW0QeJNZDhEUfjka4QZP+tBof3EhFG6ogBrsbmJYjykNm577hahbkWFu+LQtHungEG00t+g8V4vw7VkDjo8/aTi5vPWlBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=uS0adGKB; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="uS0adGKB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C3A34DFAE1;
	Fri, 18 Sep 2026 17:28:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789745311; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q6cAAX9tCyXcIpCsb2E2vZSxmNLsA1iEdhH9bQm/us8=;
	b=uS0adGKBAJomhqpunxhzpjqXJPkPv1g45R+/ASpyvZS2CN/E8P1zBzrAKk4Vfw10sEaJNC
	MU2gEM8mGmOAm69ES9x2LlD1q41W4jOTBraW0BlDhuD0zWEWSKynHnxJ8JhJpgGWy+aDyX
	PbOX775hQ9oR9L3dVBaZ0YssFNJF/859cg46OatNujIPtOTzcPY7hF/yRSa7nA9qNUmH57
	rF5YMgdGmZuite3BcAkvjaE5MoJdrwcH10chBnyzYLKLXOh41RP3Ku3RQPgxh7UQuuXroN
	27qb7FKX7/0TdwHbtADeL5fs/rwlZvJ7AQDHjAn4ZsjSL7uB+f1+zhgq+vug4g==
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
Subject: [PATCH v8 1/5] clocksource/timer-econet-en751221: fix refcount leak
Date: Fri, 18 Sep 2026 15:28:18 +0000
Message-Id: <20260918152822.343811-2-cjd@cjdns.fr>
In-Reply-To: <20260918152822.343811-1-cjd@cjdns.fr>
References: <20260918152822.343811-1-cjd@cjdns.fr>
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

