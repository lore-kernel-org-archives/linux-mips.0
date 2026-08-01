Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262A03C3F58;
	Sat,  1 Aug 2026 19:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785611453; cv=none; b=pLHvbmKw1RzM6idQuxD1wGN7rxPIvWInW/0rqsi+oNbdTBuxFsqOK1YWiW+O11c3E3i7mI1lBtj9+f7PMnRrPRJVdLUmABrgBGlNbUHsKpuQOdLcdaiyfFWPjT+UltGtuL5FjTPIGrc6Ev4gS5bJcNi7l8x834cD14YxLP3y/ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785611453; c=relaxed/simple;
	bh=Qar4yd4+FV93X1KYsOTID/6NaMk8WhMUKjfzOj0wGDc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uyKavyBu2gQn6VPQloQVv8l8CLGRi6RMZ5aVxrrwzSVESZQqZJPfjZ/ymzyz+dF5GskigrZdRGGgjOSZiAVF5Pr42UTuGTyF4aXQe2YQNRrD1MAlht1+RtwOm9sVEW155PsimvFXyN1uqtL2JNe7ZVioKygZRcoLRi3DZ/+aZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=jLqCuady; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="jLqCuady"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5ookk7ltIJmfsbWLAf3r1+WwNm8oHQmar1Kj2emteLQ=;
  b=jLqCuadyVGvjgpJal0twCucZhEvWjfm73U9kzL4jfJPDHFnA5wyIA2vr
   Z90pRGIGrYkGXzF/2y8kItxt0jggQB2e2s7hz1Jnsxje6v4CfhE94sdhw
   /6KzNPl2vEovMWhQETHlxNv5Zq5hAqQchdF5p45NPFv88uBBSS6yMjtRa
   8=;
X-CSE-ConnectionGUID: NhNQH1BORJGp0g9TxUVSQA==
X-CSE-MsgGUID: O7Lqcbg7QP2oUF8oYeGD1g==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,198,1779141600"; 
   d="scan'208";a="288769018"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 21:10:09 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: kernel-janitors@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: BCM47XX: drop unneeded semicolon
Date: Sat,  1 Aug 2026 21:10:02 +0200
Message-Id: <20260801191002.1383835-16-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a function-like macro expands to an expression, that expression
doesn't need a semicolon after it.  All uses have been verified to
have their own semicolons.

This was found using the following Coccinelle semantic patch:

@r@
identifier i : script:ocaml() { String.lowercase_ascii i = i };
expression e;
@@

*#define i(...) e;

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/mips/bcm47xx/buttons.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bcm47xx/buttons.c b/arch/mips/bcm47xx/buttons.c
index 46994f9bb..e76ca34c8 100644
--- a/arch/mips/bcm47xx/buttons.c
+++ b/arch/mips/bcm47xx/buttons.c
@@ -512,7 +512,7 @@ static int __init bcm47xx_buttons_copy(const struct gpio_keys_button *buttons,
 }
 
 #define bcm47xx_copy_bdata(dev_buttons)					\
-	bcm47xx_buttons_copy(dev_buttons, ARRAY_SIZE(dev_buttons));
+	bcm47xx_buttons_copy(dev_buttons, ARRAY_SIZE(dev_buttons))
 
 int __init bcm47xx_buttons_register(void)
 {

