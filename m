Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624137;
	b=T4hM4qsyFK24k5QWIoSyRQ4CHVngcdc6t6C9OwDXlat+e0rzk6YhEur+7t5cK8PClhU4
	 XpsEKYYUSBNCFKkNHo3ZDuXHRrlo5Buc5F4uJliKS+QgRhOu3JAT+0ULBOPtylIlBdonW
	 TRgU7A05U9munN+UQ19n4Iy/RWgZdacp7jpmvWY3VwNnPv0bfVTd0hVySAOAs1POmVlwu
	 OVjOqZA3qtHj0T/1muYDbXjmiuJcTJv8dsuseADPvaQPpQPW1VTOnLivIYSDK5ov/186t
	 ZnYhLVFi1L4OtmDTxtwRY3sgDVHs/NTKPzi356pBjTzrLeUa5ItaGBtivK0ejcF1LOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=;
	b=xVfzulVmNFc9GHvuHdya51ABeCg3JdT8yQDED2AQSydAXRR2vJ4fFWEQrODIjRvmeiZu
	 1kf9MD1Qav3T7dM6Ts2hcN8I805siQC/kXIdh3S8Mt59atNmPhpjoAtgNfP3RLjJHOxTO
	 37EOGVgo8laiK0m5mZ9b+yQADAnPzqlGt6F7lgpyQAmAhGGxKeOLc3VTW+TFRLOUxH9N1
	 ZmyYSWMVFBCa7SfAZtrQjLp4T2jO0kNdoNXAZSVYs7E4gaENjpH5WcEidjhnGuXYISHVP
	 9fFxP1tJFv+tN0SpU3R0rm7Th4t+jisaYV7qTp5Lzx70gcQLmCdNBr5Z7cnN7uEJf0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M7Ja1AuV;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807B7606A339
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 16:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807B7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M7Ja1AuV
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so77387445e9.1
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624136; x=1796228936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=;
        b=M7Ja1AuVeoTnyB9RFWfQgwgxmrXhovapQSDTqFdDe/H3GNmks+5G+Y8h126tI4bDRC
         CGqnWVxzvwmw5bPwaYmH7vIajDu6p5aY0JlCGB/sB2xoy+Qf6mMRjn7xXCz4WatyQliT
         Pg4ZVjN4qnNsbAsOpRD0E80PBC9utkVvB/Au6vos32uomnmIt+hWiz1tH0mQHYMHeT7k
         VQ4qkFZhB5/qClO7ygQ+2jYQz446RIr3o8chXvrtLqsWQ7pgDZlgXN0O/bzaSN+INWT3
         7Q3iW4EVd4OUrUGDQM/LQBVpBxphPEyNQef/1/IWpLF+NTinFscXPmAZ+yom1Bfp/WsT
         BhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624136; x=1796228936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=;
        b=gBc9uSSko5/cyQSdpRB+MplCd0hNXxg1rM+W4pK8w9IxGtvxqN9Og8NIKl9CASAn37
         I3nXn6hwjCDYHzSfRE90yk8w/3JyvGnIodSeIy7ZOLIdb7uIqWHoGSkyWKWG/iRdfqkY
         EpEtCuSP9VPJMPm6sP53H0p0e1aZIrf/AP3WOstQRlc/PuAtrAYjGLkRcQ8GQRnnWjut
         UykyNcsA+77J96veU0Ggibh4Iy0lsnftbl6C+30hFfyt77q2Dq+iSMluIQirGyGfItgU
         SsQDRdnO3xKgm2fhf029M4cp9bw9pobyC5KgYCaaI3XfD9Y10LxEEmR378XmcuXQ7zYu
         EXeQ==
X-Forwarded-Encrypted: i=1; AL+hErHv2ygWtdW0+lvSKFy/MOBkYKLEAskZsWOjM3aijfgq6yrJapNXA5uTtV5ociGH7mR7uuy2ikhgx1Yx@vger.kernel.org
X-Gm-Message-State: APuU4Z931DtH4Xm4NV0mEPlC6ACBfiMOdBsFUFqOrDwKmeJ7DIRl5kbx
	NGCH0GoP4sruhPCG53iSLFElbdx618j9iiQDNId87I0Q6w7gPySyKZKayoNWpk4s54M=
X-Gm-Gg: AZFdTZfs8g10jOgkh9IYYoeq7CoSPVpwhwLAJjSGRuyrPV07p9W16xZq1sTSa4HokHG
	FZoZ0siOZtyVQPDNvYbWHv2IILwU+9ZrVO/VMUn080+cR7WMqFkGtbhu6hhpULgrQh7+OykqEyT
	KiwNcRraQ2XSBk+gT541sQMqfoShuXEA1sonnx8z3GgPa2aktqIJpzwCP1dI8Zz/whe6lvuSx0N
	K5rjHdIEgLZ5TVu5sOZhF+7a238A8bb6yHwr8T5UOr+QzWRJTgDAMHVwC8nMivMYK7gG9KdsP9o
	aM9uwKArQ5xthOozxcKtUSC6JWU7KnDbdDEdd/ssxkB1qAdXNrVhV3KPig2gbMNuIxE8ip99gzU
	HaaZH1VI2eSfCWMkaED2r2RYnu/L0e3mKxrweVFj5RxfJNl0EoGlRIW1owzeRDGc9BxjKd0ctfW
	xZkE4Ny0dAvLTZp8gkm1wFyGeUKe+1PvrrQjE5iRLSMCUbvsHYyVnRQHTHVTxV4HPAfvlkzoX3d
	qCd+SbOXsHuklbG+CDY3vLSKPvCslcSeBEcYaP4MtwHiU+KiPN8Km1ih1oi1TJcX8vC0Q8p5bOR
	siMXzTvSACb86VWciqmlm+KAxtvazCkNnWtXEpsGT9WyPdMDJtLuZfA5Lnlu8jrGEkc=
X-Received: by 2002:a05:600c:468b:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb888160c2mr388121675e9.15.1795624135909;
        Wed, 25 Nov 2026 08:28:55 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:55 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:34 +0000
Subject: [PATCH 08/10] mtd: maps: Unify list terminator for of_device_id
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
Message-Id: <20261125-acpi-mtd-v1-8-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=2018;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=qZ3dtpaE4yo6DqKw2ZZxvSONBhZmYTuwo6Yz4wDKiAA=;
 b=uXOj27KlhNAZizznn9ogyLPuEGUV9GthH9XWkHXihalhOuNlIXntNNK6vnlTDONhse9U1m2BX
 wgOwv22X4fNCfrJ4kS4rB81GgUoV5JAjSZu8Y1OsSvN/EQwWtziAtg6
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/lantiq-flash.c      | 2 +-
 drivers/mtd/maps/physmap-versatile.c | 4 ++--
 drivers/mtd/maps/sun_uflash.c        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 519126abb9a5..1ee15d50bd7f 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -177,7 +177,7 @@ static void ltq_mtd_remove(struct platform_device *pdev)
 
 static const struct of_device_id ltq_mtd_match[] = {
 	{ .compatible = "lantiq,nor" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ltq_mtd_match);
 
diff --git a/drivers/mtd/maps/physmap-versatile.c b/drivers/mtd/maps/physmap-versatile.c
index 2e779111bf79..9d308c4f21e5 100644
--- a/drivers/mtd/maps/physmap-versatile.c
+++ b/drivers/mtd/maps/physmap-versatile.c
@@ -58,7 +58,7 @@ static const struct of_device_id syscon_match[] = {
 		.compatible = "arm,realview-pbx-syscon",
 		.data = (void *)REALVIEW_FLASHPROT,
 	},
-	{},
+	{ }
 };
 
 /*
@@ -77,7 +77,7 @@ static const struct of_device_id syscon_match[] = {
 
 static const struct of_device_id ebi_match[] = {
 	{ .compatible = "arm,external-bus-interface"},
-	{ },
+	{ }
 };
 
 static int ap_flash_init(struct platform_device *pdev)
diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
index cac780cd23f9..2960cebdb0dd 100644
--- a/drivers/mtd/maps/sun_uflash.c
+++ b/drivers/mtd/maps/sun_uflash.c
@@ -138,7 +138,7 @@ static const struct of_device_id uflash_match[] = {
 	{
 		.name = UFLASH_OBPNAME,
 	},
-	{},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, uflash_match);

-- 
2.53.0

