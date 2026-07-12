Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1311AF4E9;
	Sun, 12 Jul 2026 02:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783824977; cv=none; b=Z/KCbFMBA4pLYGfKJ+EZpMEU5TMB6w7ObC7Xgt6DOtjzOAO5UbiIaMkZwua8VpNdDLLP/67Ln9Kr6LAcWg1IcUUVhmPICQE9JteoHLNhuzQphd2Z6fZ+h7gX2uNJ0ghsJ9iWH3vwQEdKKgP+qS5ep8QPKW9JQAIikNE92MiaTlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783824977; c=relaxed/simple;
	bh=tRLasxGtarCDZZPimPl4cIw90cNB8efUVXsdzvBZ+is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=er4SpHCPeA2M9JIhGTsmCguDivxPZkF3qqBrOH8tuxpfLLYnspgtFCsWCZNter/tFWzFXQy6IDxquQqWbN1Ilfv+nlccqF1w0waA8dN69AOiy1JdPpBcEyclrKR14JDNwd6u2deD+q8FaiPRSPY+tvQ3ow82dsSr2nd6o3RevlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFwgsxk+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFwgsxk+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C02CC2BCB3;
	Sun, 12 Jul 2026 02:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783824976;
	bh=tRLasxGtarCDZZPimPl4cIw90cNB8efUVXsdzvBZ+is=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=JFwgsxk+7wHb6fjqJTjoJvQrHyh8V0OQmBbu8MWYW/6ahJifD65cm4EOB8JWIwMCH
	 hQbZveFfjex/yAQv6MviumTgkhYEpKSORAS8LeoGG4ojVHDoDsZoFF8I/Ek8n3YUH2
	 U8Gz6jfOUogPpIucTKBixFwBApLnFgL+lEZ/37W6n4foM/oLaj3FbOBqps6IGL3qoe
	 DrOC4YQP3wxxBrs5XD2Zk9bgla9v3wqJoLd0YfFU8uhSe07J04sQMyXbeEZ17+JmGv
	 57zZ0bwV0iciFAc+Fgzo/5NaJc2eCnPX06/Swkys+ohkm4GVhkzKDTeVBkrTmfFok/
	 bS8d/KIg+745g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7EDC43458;
	Sun, 12 Jul 2026 02:56:16 +0000 (UTC)
From: Miles Krause via B4 Relay <devnull+mileskrause5200.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 22:56:14 -0400
Subject: [PATCH] memory: jz4780-nemc: Use dev_err_probe() for clock error
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-jz4780-nemc-dev-err-probe-v1-1-afb6f6a82752@gmail.com>
X-B4-Tracking: v=1; b=H4sIAE0CU2oC/yXMQQ6CMBBG4auQWTtJS0TQqxgXTPurQ2IhUyRGw
 t2tuvwW762UYYpMp2olw6JZx1TgdxWFe59uYI3FVLv64FrveXjv285xwiNwxMIw48lGAccYmuY
 onUjvqfST4aqv3/t8+Ts/ZUCYv0Patg9fu3LBfQAAAA==
X-Change-ID: 20260711-jz4780-nemc-dev-err-probe-ddc559b8bba1
To: Paul Cercueil <paul@crapouillou.net>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Miles Krause <mileskrause5200@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783824975; l=1329;
 i=mileskrause5200@gmail.com; s=20260710; h=from:subject:message-id;
 bh=AGXKyAp8ExZItIFAOU025OlxKNPfZ4JXCxmTSMbLIcw=;
 b=SDDaywFXq9ZUBuE9d/dzRpi6j2R3tWaDdqA5QU+YnuLmwC3kKXNmSMh86RV1486tDk+AV38ra
 UYpwCdm8frkDyAv7nMmDfrl/I5oeINAZDoBm41DRXcT/Nrv7fHubaU2
X-Developer-Key: i=mileskrause5200@gmail.com; a=ed25519;
 pk=QNhNjcQarqig3ColJBIEr3DYfWM1PHpP7z+6thxWXaU=
X-Endpoint-Received: by B4 Relay for mileskrause5200@gmail.com/20260710
 with auth_id=861
X-Original-From: Miles Krause <mileskrause5200@gmail.com>
Reply-To: mileskrause5200@gmail.com

From: Miles Krause <mileskrause5200@gmail.com>

Use dev_err_probe() to simplify clock acquisition error handling and
avoid logging probe deferral as an error.

No functional change.

Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
---
Built with:

make O=out W=1 drivers/memory/jz4780-nemc.o

To: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/memory/jz4780-nemc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
index 1a8161514d03..1bf17057cbf5 100644
--- a/drivers/memory/jz4780-nemc.c
+++ b/drivers/memory/jz4780-nemc.c
@@ -313,10 +313,9 @@ static int jz4780_nemc_probe(struct platform_device *pdev)
 	writel(0, nemc->base + NEMC_NFCSR);
 
 	nemc->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(nemc->clk)) {
-		dev_err(dev, "failed to get clock\n");
-		return PTR_ERR(nemc->clk);
-	}
+	if (IS_ERR(nemc->clk))
+		return dev_err_probe(dev, PTR_ERR(nemc->clk),
+				     "failed to get clock\n");
 
 	ret = clk_prepare_enable(nemc->clk);
 	if (ret) {

---
base-commit: 8111c7f3723f414b7f655a3880775cbbd0e9de8e
change-id: 20260711-jz4780-nemc-dev-err-probe-ddc559b8bba1

Best regards,
--  
Miles Krause <mileskrause5200@gmail.com>


