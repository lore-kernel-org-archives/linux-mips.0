Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523E61A5B9E;
	Tue, 16 Jun 2026 00:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571438; cv=none; b=W27IMpPi+RC/CU1KU5Bdew3gNN7F0mOmFQJqD3iekiLy3eSoJZf4xSjfOppB5F2hYfC195Pwt/NZyh9hrAwVMsAL+ca2QuJL9CBGz5sbDfkcsN2SuFBEWM79eR6ePQPOu/WHBJW/JEausWsVFUxXwnyOlZ+Xzffx5EdYnk8VN6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571438; c=relaxed/simple;
	bh=jzXSw1NSRItsNgBN/BqZOzmE323y+m8y5t2GVlf/Cl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mXwF3fL9o/0h41xk9VvJVvz+vgzPaNDAA4XPHp1xTlq/t91fg8wB7lvplCGMj00dyeEFo/oRiDObqV0PD9pm881ecTggs7vh2JViqfdmQgHqgAGfW6YR11x2FeldRPwibDry2kJUe9Oh9gPRqRhUtpsjYt/rRRWJdcfBD1Q5smw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABnTONrnzBqZL3eFA--.5396S2;
	Tue, 16 Jun 2026 08:57:15 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Paul Cercueil <paul@crapouillou.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] memory: jz4780-nemc: publish drvdata before creating children
Date: Tue, 16 Jun 2026 08:57:13 +0800
Message-ID: <20260616005713.10474-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABnTONrnzBqZL3eFA--.5396S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFyDXF4UZry7AF4rAr4kCrg_yoW8WF4kpF
	WxXayIkr4UWFy2kr1xtw1DZFy3A3WrA3y8tryfCa4ru343uFyvq3s5JFy8Aan8AFWxX3Wa
	qF1Uta1xZaykZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8
	JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8-
	B_UUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The NEMC child drivers can call exported helpers that fetch the parent
controller state with dev_get_drvdata(dev->parent).  jz4780_nemc_probe()
currently creates child platform devices before storing the controller
pointer in the parent drvdata, so a child that probes immediately can
observe a NULL parent drvdata pointer.

Store the controller pointer before creating child devices.  Also
depopulate child devices during remove before disabling the controller
clock so child teardown still runs while the parent resources are
available.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/memory/jz4780-nemc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
index 1a8161514d03..1c1d1d019f77 100644
--- a/drivers/memory/jz4780-nemc.c
+++ b/drivers/memory/jz4780-nemc.c
@@ -331,6 +331,8 @@ static int jz4780_nemc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	platform_set_drvdata(pdev, nemc);
+
 	/*
 	 * Iterate over child devices, check that they do not conflict with
 	 * each other, and register child devices for them. If a child device
@@ -379,7 +381,6 @@ static int jz4780_nemc_probe(struct platform_device *pdev)
 		}
 	}
 
-	platform_set_drvdata(pdev, nemc);
 	dev_info(dev, "JZ4780 NEMC initialised\n");
 	return 0;
 }
@@ -388,6 +389,7 @@ static void jz4780_nemc_remove(struct platform_device *pdev)
 {
 	struct jz4780_nemc *nemc = platform_get_drvdata(pdev);
 
+	of_platform_depopulate(&pdev->dev);
 	clk_disable_unprepare(nemc->clk);
 }
 
-- 
2.50.1 (Apple Git-155)

