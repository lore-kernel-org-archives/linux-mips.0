Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624142;
	b=3bRz7Nq/CQXxrVFV3ZHyat7FkeJXbMu9SjD8eC7lMg0969mWq3xoXFcWyrx+MFNwi/Gm
	 tFHhrje0tv71OgHQD9Dq6XldeKRRHB2gr0eo369EEvXksJ5tsLLvxAX9GmQhP61qVavLY
	 Z+evaGGVPDbbOXSW5ePASmB0KtBvh7EK8Gimqo4hmHo74gfzck3a1X6vVkvsqFGpjSjZ+
	 GpJaGP+E7DowmubBf4pxEuHuMgEEdpYkQBng92suVad1dkthxdZ40kssH4KAGnOjk7vA1
	 hoWPyxT0j5CNzLkb7NY/vV6P0U4GASPTqnbOis7V4VyVaVJWWvRVVbnVwTCv92Pqplg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=b3zipjW6FCv6jer+zbTeZRYq6wiTPflhk4lNUgGm5Zc=;
	b=dqgOj2N8CNw4WPnCe/ZrqeOpgr8b20d2vsBiB76Hs5prFSqFzdtWUQaKFq3AZMznAG5M
	 mAkmK9OrjaDtYqjlUS6BO5jHk8EsABtAi4zjyRgUoao35FnU/185FGUO8HjWpe9ueTKHP
	 TrdZt60L5Bu4F0g0ckmPQlML32QxALtpXwkQQXoXBuihOrKf5R2QjW8o/7kwdqW8SweWV
	 xec76cX5zzm6cDYPibaYxbfXsLlRlGpJQB5JBp2OssaA+Yg1xRvxFfE8MazW9hjYNH4ax
	 eBI+U0M6BB9dRJOouBItb9H4Ojxq8WL4FOa/ArcQ+1jO5SAwi8KvNX1gwBKfPuo22rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JuDHlVhA;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC9606A333
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 16:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22DC9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JuDHlVhA
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so46733095e9.2
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624140; x=1796228940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3zipjW6FCv6jer+zbTeZRYq6wiTPflhk4lNUgGm5Zc=;
        b=JuDHlVhArm+WGJekmJ5knaQDjynikJO1Q9f94INqpk/0Vl8Y7TwOcAzM6OGcoNE4cD
         FLuK6XeTAaQXww64JN6iSIABmPaKi8gg7IVN1kw8Hx8vZAbeQKcf2UUIWSuVi+dSM3M1
         3P5NINhC5cH9YqeNYR8689AZf+NbCtKBU7ADgzFr/7QG1Ix1R0ppKAhiRkKgZhj1KYUM
         oxYokX6lKTeL3nqPOb5Kg+lmfmU2yMEqx3L2IPpYL5iLc2bffFk1CiS6xZyuKm+12E+P
         AunDFeN2xuCb6CUh0O+ee8KdbzBZMshzNbq1XLhYE0zI2H0jxK/17ZmuXnnqf/7g0UI7
         PM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624140; x=1796228940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3zipjW6FCv6jer+zbTeZRYq6wiTPflhk4lNUgGm5Zc=;
        b=1iLIF3YBv1Own1nODwGLi3rjvn8731tGtTRlLK+TZLrC38lXJf8wZCwkdJVaIXjytJ
         bi/4TTqTQQfBQLwJuR+fVbJ2RUJkE6W/up+XxOtFDDXHvbE0yWgyBUbH9pmzQMaDxorF
         cZCYVVsEHvBIzmUCRqN9jUTc1eo2EQ7ZqOQETmXjf/WI9+p5BMoYg02fA1J92pp8lYkH
         ylb5yIzxtGdkS+UvIrpS6zIZwkqaFBW+yn7+1DMixgT8ri0uoo8lzAj54dj/++gwvTC+
         1tptoLq4715wBNjnMCo5bMitjWFgPTI7N/P9g1q9Dap7zPlP3OOXVlPVV7/56or+Owg5
         JYVw==
X-Forwarded-Encrypted: i=1; AL+hErHHMGQcQxnAxatNCG06mUy3tORzdufmgUd2kxfy5XG9pnq/SSLJCFbSGUowmWeNaw04DD56a7CSGoOM@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xs88A5YlIPtEQC8WqHIw6sPWWHdHvf8q40u/hDi6/dc8gcHTB
	/7entg9Hut35ibPJLbNrVH42VAP4mgxRnbW0BABnxLutR6xmjr8NCI9Yxk+7LT9unwQ=
X-Gm-Gg: AZFdTZdd/KfoHvMB0hIs1OAEIRjQtAN8ji496QR/T6slkyS3Ynz1eOMoKGMhSB6o2oN
	ZMXlRW8DK7kbic3DGp9QiaTnm7Ubj5UFQ0/+8puV7c3bgXgMJLhTqKXG6qs/ux2UTLAnjDOs9nP
	6YHlGJ9wvuuBNkzMatlNR73HvhlFsGQTSXXj5yH3dkYNmS3BPCVSsXSJtOpZ8eyJyjWazF0X5Y6
	XUYb8eBkHjkWdsfKAjK95b7X8moWnq+l09zHEIK2uGxkBYh9j3WjaIolB3C4jZxH98nyg3X7453
	MoyRAzoKPTuB/9ufypTfIQVaPCtPHBslipNehL4hyIKTNNfGLh7x9TIqQj7AMqb2y+4PXVu3ff9
	q+ou5MOapQH22LllwNaDxBN5fHT7P80bzU+JMovmxNVmthp0CKNqW2dQGaaGxj2shpFa6b89IWz
	8Cbj8uWQjyVmAENyK0hLM7FFKk82SE0Ru5oLW7A954oUtBRZVY9dK8NfthoiOEt7VRDiQ+RQDS8
	svEPGPiFX5ZDCWU1mqfj7BP88RzedBVxAU7Q61+3VM4ijbUok84uEGAPTkeB5RRV4Mb/WWv64hk
	7PUMCEtbhJYKCStY2IN6Fm5zdEdcGiTQ29rR5xa3VyWdbQ==
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr469106785e9.15.1795624140547;
        Wed, 25 Nov 2026 08:29:00 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:29:00 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:36 +0000
Subject: [PATCH 10/10] mtd: parsers: Unify list terminator for of_device_id
 lists
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-10-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=5774;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=KOogzIvhzR8eYf+iMlhb8/yYFLWrj/S1PvoHnBRgitM=;
 b=VkPD+ID7sV7Ml7e/hOXMxbv8kZ5YRPTjrP5CRzexH7lH8bYIAqCXSWUv8DDuCLt6WWwVQ34Le
 OZotULTBoziBXkpCQurbY5qTiNItaA5MiH9TUJN3r3pgeSN9ESNfpKu
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/parsers/afs.c               | 2 +-
 drivers/mtd/parsers/bcm47xxpart.c       | 2 +-
 drivers/mtd/parsers/bcm63xxpart.c       | 2 +-
 drivers/mtd/parsers/brcm_u-boot.c       | 2 +-
 drivers/mtd/parsers/parser_imagetag.c   | 2 +-
 drivers/mtd/parsers/parser_trx.c        | 2 +-
 drivers/mtd/parsers/qcomsmempart.c      | 2 +-
 drivers/mtd/parsers/redboot.c           | 2 +-
 drivers/mtd/parsers/scpart.c            | 2 +-
 drivers/mtd/parsers/tplink_safeloader.c | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index 7ab3d50f565e..eb6abf5330ca 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -386,7 +386,7 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 
 static const struct of_device_id mtd_parser_afs_of_match_table[] = {
 	{ .compatible = "arm,arm-firmware-suite" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtd_parser_afs_of_match_table);
 
diff --git a/drivers/mtd/parsers/bcm47xxpart.c b/drivers/mtd/parsers/bcm47xxpart.c
index a412c0e7bd4e..ee7c81894b9c 100644
--- a/drivers/mtd/parsers/bcm47xxpart.c
+++ b/drivers/mtd/parsers/bcm47xxpart.c
@@ -301,7 +301,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 
 static const struct of_device_id bcm47xxpart_of_match_table[] = {
 	{ .compatible = "brcm,bcm947xx-cfe-partitions" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, bcm47xxpart_of_match_table);
 
diff --git a/drivers/mtd/parsers/bcm63xxpart.c b/drivers/mtd/parsers/bcm63xxpart.c
index 6e7b1ae8f58f..78fbe8a681cb 100644
--- a/drivers/mtd/parsers/bcm63xxpart.c
+++ b/drivers/mtd/parsers/bcm63xxpart.c
@@ -153,7 +153,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 
 static const struct of_device_id parse_bcm63xx_cfe_match_table[] = {
 	{ .compatible = "brcm,bcm963xx-cfe-nor-partitions" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, parse_bcm63xx_cfe_match_table);
 
diff --git a/drivers/mtd/parsers/brcm_u-boot.c b/drivers/mtd/parsers/brcm_u-boot.c
index cd78e432f1de..d48d8ed73ca0 100644
--- a/drivers/mtd/parsers/brcm_u-boot.c
+++ b/drivers/mtd/parsers/brcm_u-boot.c
@@ -70,7 +70,7 @@ static int brcm_u_boot_parse(struct mtd_info *mtd,
 
 static const struct of_device_id brcm_u_boot_of_match_table[] = {
 	{ .compatible = "brcm,u-boot" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, brcm_u_boot_of_match_table);
 
diff --git a/drivers/mtd/parsers/parser_imagetag.c b/drivers/mtd/parsers/parser_imagetag.c
index fab0949aabba..686ef88e3099 100644
--- a/drivers/mtd/parsers/parser_imagetag.c
+++ b/drivers/mtd/parsers/parser_imagetag.c
@@ -202,7 +202,7 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 
 static const struct of_device_id parse_bcm963xx_imagetag_match_table[] = {
 	{ .compatible = "brcm,bcm963xx-imagetag" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, parse_bcm963xx_imagetag_match_table);
 
diff --git a/drivers/mtd/parsers/parser_trx.c b/drivers/mtd/parsers/parser_trx.c
index cf3bc9735238..db1129919084 100644
--- a/drivers/mtd/parsers/parser_trx.c
+++ b/drivers/mtd/parsers/parser_trx.c
@@ -120,7 +120,7 @@ static int parser_trx_parse(struct mtd_info *mtd,
 
 static const struct of_device_id mtd_parser_trx_of_match_table[] = {
 	{ .compatible = "brcm,trx" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtd_parser_trx_of_match_table);
 
diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index 1591aea48b28..d46555138978 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -180,7 +180,7 @@ static void parse_qcomsmem_cleanup(const struct mtd_partition *pparts,
 
 static const struct of_device_id qcomsmem_of_match_table[] = {
 	{ .compatible = "qcom,smem-part" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, qcomsmem_of_match_table);
 
diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index 120b2eab21fc..f8d421a88748 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -312,7 +312,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 
 static const struct of_device_id mtd_parser_redboot_of_match_table[] = {
 	{ .compatible = "redboot-fis" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtd_parser_redboot_of_match_table);
 
diff --git a/drivers/mtd/parsers/scpart.c b/drivers/mtd/parsers/scpart.c
index ad6e9d5c3daa..e0bed5ef04d8 100644
--- a/drivers/mtd/parsers/scpart.c
+++ b/drivers/mtd/parsers/scpart.c
@@ -229,7 +229,7 @@ static int scpart_parse(struct mtd_info *master,
 
 static const struct of_device_id scpart_parser_of_match_table[] = {
 	{ .compatible = "sercomm,sc-partitions" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, scpart_parser_of_match_table);
 
diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/parsers/tplink_safeloader.c
index b770f41ef874..e9b25e236eb9 100644
--- a/drivers/mtd/parsers/tplink_safeloader.c
+++ b/drivers/mtd/parsers/tplink_safeloader.c
@@ -138,7 +138,7 @@ static void mtd_parser_tplink_safeloader_cleanup(const struct mtd_partition *ppa
 
 static const struct of_device_id mtd_parser_tplink_safeloader_of_match_table[] = {
 	{ .compatible = "tplink,safeloader-partitions" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mtd_parser_tplink_safeloader_of_match_table);
 

-- 
2.53.0

