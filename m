Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624121;
	b=ybT1zgCPZAV1bBExIOdIrCNJ+aKsQH7d/KUadpsniOuLx708urBXaDx2jhxpW6sMrXkA
	 C25oA6ilWqL5GSnbj5Wlr9lMXyIOqZ3Z2HiUvUkLguQtifD/XPh5PgB3wnTQDoD4BhoIJ
	 TExrllhj/qDMzLEjqYgtAuETpgn79odhnaVdwh/ZdaVHwcxFM3tNjCyKrd3tSh1zLAKN3
	 OCn0RcTjDFGwabR07b6wUgjjU1w0D/sbgzuDW5jWpZE8v82HhhbGlArDGvVL0k/OdGcb0
	 rjzV8NDZ4fx7ICg0rJhs+aNwRwV6+9enS4NC9W+anzE7m5ofhc98/IS/UYl02UMXObA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
	b=gJnehAXjU1cUSo75175zxZtIH6iEGrIUSyFzro9Fdgd+S+/04rcyo+UyRXeYlmHpqaeX
	 P3PcFyXuk63qfb4LATUc3QmLYjLVgiB6vV0vpMly35/lzDupcfuG4ZjSR9pNoLJwaCz6V
	 3wY4iGI5y2ZCwRnquJUlcaJfd6avvueXCHvLe9YWetRSPASMe2g+fVE1ZK7bW2RWcu3PP
	 tMgU2KQ+lNkmhv432QA5YtaJWP6ExKr1RapLqRgRheFB51ilVMYoVXoY2x3FMi8ZOlbhR
	 1taYUvYPLDEKT0AtfKAMRSw56XKJiJoXnfwXrxFlD6FYLJqPYLWN744meyB0v1ISDYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="b0s/mpGA";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0855606A335
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 16:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0855606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b0s/mpGA
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so51025715e9.2
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624119; x=1796228919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
        b=b0s/mpGAP0Dc1yFnVQPwApAxk7FX4CCUts8wdHxdUDyZWpdRR2LuQdPGHVmIW/H0hv
         mFQaVUT3U/qWEFeYEv+N59pJMRMj9bgeX9E7YL++9j2S/ntnNIgMsUe8e9NNQBlxGn9q
         se2/ozwczLBWf867Sm7u9LvNu4SAtXEMNO3zYjay5ulRZv5GmiS020ye57fmAT8d9BGh
         WIk+7CQydV66HYVKtQHJLsBoUul39r2F+W+FJ/tKc2Q0P3ToyKz4uMQpHyI95DuX6WrT
         VrFZqR5hTkFA3XDCgeFutcEYZrKpA/4cXVQgpSjvBni9w/XZiofSU8ROcz/Eu71XCjYv
         aNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624119; x=1796228919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
        b=bFSWPqPjS7G7Xb9GqJ0hXDwwIWFRrpVlb7zHM61WZ/N/capwrbY7qNLfiYNIM6xEz9
         t0wzhnEKb/Kd7NbUbAP451QBMgRgMwOF87PV1xXSL0LOlBW0R2jOsTQyOXdZ3V7bt66n
         vQy8AzNb97LJ+HD0T2RtFnOTLVfF3V4V9u/9aR0i7+PzTg2orHQtGkiglR6JGxH0WsN5
         PA5tlBAy4L8mkV5DUBzx63gWS9DS4CiF3cUbYnH0R5MZjc9ZzytxutDI7exoe9nmgcsw
         ySsR3w4I2A1zc/Cuy5HnqNbwKbRKcfmLO/Schj/UYAKUSirqt4ocImgf3hyttwKzGA/j
         DzqA==
X-Forwarded-Encrypted: i=1; AL+hErGBR5xyGClVTp833WXODEIuZ+1xzH+xsia2cta62P0B5XS0lb8IXmzBUfd6630DMkMNlndZenskBCfb@vger.kernel.org
X-Gm-Message-State: APuU4Z8ItRto8uc9/wxY0iGsEpGxGnhMdMjuOtM76c5zNry4CMKWYiAt
	hI1zm1N0bpI2EdZPDhM5eZQCNYF5UzP73NbjjM38hnaM1gDTzZ3hFLWCFw5+nlZGVmo=
X-Gm-Gg: AZFdTZeHMPJE1VSbFbStqPa7UwkjfrJBeRJ4/0L09MWSuYUUi953zMZDF8RF722IBpB
	QItENjSe+p0E6Jrz3sS4tATVcBlvy2bz9+/ogDZdw67/r5AGopSQeR7AaADmPbX6u4GC3OM935K
	pNdzTgE51uN+SJomo99TcVYyJlET7llv1gKlVTmZZgkymKG9cTY7g+u4fgz5tbI/HS3pHaIUloF
	rU7+NLXrhqlKUej9L1P+tVJgqLYYB6AvadMhpwVXpx+3QRJaYWIcnEo5oaPazTvOoMjYZTfBXmT
	q6m7hM8Ge/gDLMlYx27+9Qx1ieTr3eEfSLKjYE5wAYDYrGxMNeKi/dClStene1fGD4P2v0U3v/S
	6bXBgubFis8o5m88TzLR/kk9tNYt/aRyDypCGMP7cwnj0CBPYQIJ4BlgeUVlj9Zxwik9HZHx2x+
	WKlv/6wp0QWUW3MPnLe0fGSp9znet96loqMpzbVv8pB32eFZgbfygK8YbC0DW0j1SamSPmI9HQi
	W4Mi61U8HUBY3NqFUQn4S5PILUIJwzc+C1ZaDJ6sS0tnh9yi1lcCTN5zTwinIjyma7ebwfauVh5
	f7DqBKF+Mx2eey0wO3nD2Uy+Qj4StzFnRGlm2Hr/a2sfmQ==
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr384806975e9.20.1795624119085;
        Wed, 25 Nov 2026 08:28:39 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:38 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:27 +0000
Subject: [PATCH 01/10] mtd: maps: pismo: Use named initializers for
 i2c_device_id
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
Message-Id: <20261125-acpi-mtd-v1-1-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=851;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=IHAi0qeArnt0Dz3MPX/pMNLkcr4ipLn3XGqru6V8PMg=;
 b=FYYb5NZv5bMag5GUq5jhUZI3EA/wssPu4IODYyOGaefHzIx0GqzM1xxUbS1yXt9hVm+9RShR6
 U7w6XKaTkOyAdXUAkIbyQhY8qzilz1ISb3JVyfa0dct/S0WrrapbtfS
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the i2c_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/pismo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/pismo.c b/drivers/mtd/maps/pismo.c
index b0310fddcaa3..babb6d367623 100644
--- a/drivers/mtd/maps/pismo.c
+++ b/drivers/mtd/maps/pismo.c
@@ -250,8 +250,8 @@ static int pismo_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pismo_id[] = {
-	{ "pismo" },
-	{ },
+	{ .name = "pismo" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pismo_id);
 

-- 
2.53.0

