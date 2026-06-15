Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE7E26E710;
	Mon, 15 Jun 2026 06:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505223; cv=none; b=tEgXfUZWMgU3HwknORYZIYNMqp4Yf0HABgaACVbd07zPTG9L22HzwYcwNtZAzZOI8bMLA89WXRBKchWH3VNjlLNLmqukcezAdzPouXAtG1FRVfAczUXQNoYCGdW0H2/xM9MBvpaeosObLbTdYRBUHzpdem2iZ2EyS7yxEHDdfB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505223; c=relaxed/simple;
	bh=o1t21UpA2llGuzZ1+0n8A5xfFa9g7EzB1SnXLXlY4jY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=niSqwaZ1Jz/RgK8UakNbDpDJ7hu04oGDCUlhAEB0ZVNwsb13wMhjw+s3b8Z/o3SSkwyexMmLtx3wIoPFMRclc8TRVKxjOhA8DMcVSyTT6u/3xUvh8zv2bn+P/WpaHsGhUfygu1lCQUZP6kRMFMPzexiOP3jMIXCk51NCLyso8fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHkcS+nC9q+3qTEw--.38990S2;
	Mon, 15 Jun 2026 14:33:34 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Paul Cercueil <paul@crapouillou.net>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: pengpeng@iscas.ac.cn
Subject: [PATCH] mtd: rawnand: ingenic: handle ECC clock enable failures
Date: Mon, 15 Jun 2026 14:33:32 +0800
Message-ID: <20260615063332.48127-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHkcS+nC9q+3qTEw--.38990S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww43tr48ZryrCw18Gw1kGrg_yoW8GFWUpF
	WUJayjkay8WF10kw47Ja1Uua45uw1Iv3yxuFy5A3Wv93Z5AF18ta48J34qvFs5Zw48C3W3
	Jw17tF1rCryUAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUL0edUUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

ingenic_ecc_get() obtains a provider device reference and then enables
the ECC clock before returning the ECC handle.

The clk_prepare_enable() return value is currently ignored.  If enabling
the clock fails, the function still returns the ECC handle and keeps the
provider device reference even though the acquire operation did not
complete.

Return the clock enable error and drop the provider device reference on
that failure path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
index 525c34c281b6..beb033705cf3 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
@@ -67,6 +67,7 @@ static struct ingenic_ecc *ingenic_ecc_get(struct device_node *np)
 {
 	struct platform_device *pdev;
 	struct ingenic_ecc *ecc;
+	int ret;
 
 	pdev = of_find_device_by_node(np);
 	if (!pdev)
@@ -78,7 +79,11 @@ static struct ingenic_ecc *ingenic_ecc_get(struct device_node *np)
 	}
 
 	ecc = platform_get_drvdata(pdev);
-	clk_prepare_enable(ecc->clk);
+	ret = clk_prepare_enable(ecc->clk);
+	if (ret) {
+		put_device(&pdev->dev);
+		return ERR_PTR(ret);
+	}
 
 	return ecc;
 }
-- 
2.50.1 (Apple Git-155)

