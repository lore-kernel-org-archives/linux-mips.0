Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624126;
	b=sUQQpFkAqRRYyG/EHwe4oZFMSdX7fHf6lRIe4BQ6x7cBgykwdzgCpsdpgcUMJuoQCLSM
	 cvQb0f0qyi6aOKJReA6RqUg5R+uMQ1miYya6QmZYMZPIPa9VbNz9mNkdUIg9pmFIv2ybl
	 S54F+d7m6Rc4XEgaQEsyAeO9fSs8KaBeivDbIvAat7b4vjg7vTof/lFSUm12Bv/RsK8Ca
	 pKrwyQdsR8geIWntjut+0aaKsj214PGQmWc0HKaX8XWgVvNdnYsWhpv6UVI/bCWPA/A0z
	 8JczYHT2j6LF6jcFXAOh5mBke7m1aweZ3UhMQhn8ipXE8/Gle6ayvb6yxJ4/Q3Lh5pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
	b=BILqPjkV8Wjg6yzJ1ZKy/s8x7wzvR6W/5KtHPNILTZKrEttlxc9Izb1XyUnbdV0HqVbf
	 1FXJyOpRUHjHLG52TUrAERqJk1ZdUzS0V6iAt+j5QZIOnp+JiZCxtb/0ReilErKpEKkI3
	 osNJnC+D94YW2KQzKoZZSBfSV/5q22XF2aTvT0x2mr4ZvrfHCfKi4wO2nojEY84uotPUf
	 SByO6MRC2y90bhm5HnHgnxDDFrkNIktP9ZrZvULdutgMBvgvaHyMfNW6k4vAH0GhDu5Ro
	 zMCB0wopQ0AuJD/QWQDWOR3OygI2Ngv6JYFYjTih57WhFsamNWSTAyQnVtCEQJzY1zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Lo7MJUFE;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894D2606A333
	for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 16:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 894D2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Lo7MJUFE
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so43145725e9.2
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 08:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624124; x=1796228924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
        b=Lo7MJUFECANehTUUolZEwHLlSbcAVnU/5fbdfWieLfVAhlye/yHc4o0AYGdoSIbUqA
         azACxwY1sGS2+BKHaH3yV0x7vslu65W12rRVOyXqDf+WYwxWmzJp6Lt899jSwME0Wh06
         zNOmktMVqNHpHKd56kNtM4Nhvpr+Pch0j1tkSkKfiytMiOKltCs5Ia0do+A8LVErsX3/
         ci4g1dpE7Sn+z627yGypM/Jrl0Xx9t0P2dgbkIN3fI61XZmyut5vaVHjr6CPfCdskW5N
         xjH5SlEX0nUixO6+do7UGprtp7LswCzRoQicPQ27IuwIbrJlWjhVIBBtDcjTTREEzrcH
         ayhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624124; x=1796228924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
        b=jK99Q00/WRUgWyMg5XwV1HNoqvmSywRqVOZugl6Fj3OhBfxnlHqLr28UQCCsvRykL0
         r5Po8SHydYyMccWisvMLmdfKI0+xEi+SN6CFSvdknMjjKp4Hp7A+jQ4WTY521DxQey1F
         kWQujZYivmY/PuargDDxD4oBtcSrKF8ETELYNUlM/L/V2UTKnnWaDhTktwVNb7GfNSk/
         nd9WSXby980O5YuL1L75LBP+dz7q1UJGYFTlbjmOLWUwNFKto/Zm6snl6Bj0laYTJfpa
         xK5htmijDkDExMVJavH5K6a5R1QjVtQJhKOw6d4zItyVEQdnBHmGGDLIHFZqwaguNxKu
         Nljw==
X-Forwarded-Encrypted: i=1; AL+hErHXS1X1cJcc5VYFmOdIK276xaPYLXhmhAPI2EroMWS/0DbTA531Xltzd2bi5u8hgU5yr6AglEMse3hQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8C5f9p40HcDxX2JrPuB7Lf+BeW2jl62CWJoKONGvgFNBErLCmY
	d2nyCIPhXJ17jVlRVag4wi3+G1ECUPBnFDo7mGd5LI+U8zAcLzRyuFb5HjlnVVFdmGo=
X-Gm-Gg: AZFdTZeIwNqYpCnJORAhlYZr1dPyVZvYZOqHdXk001PhxagQuXeFjX/otA2WTvMtMqx
	kbnEuwBUYzcOzF8r5pRxNM1vRZeiE4FqSCKeJpjWYVQvxjVC2OUqED38yom1bwX1h4WXE3oOJ6X
	WA2KlhH2VmEL8XktPfnkRblQ0nqe3IN5L0Bja7WmP6jH4ala8YeeRCGgvQWyHuW0L2v3e6roJoX
	GuAqcHCxVyF88EtW0/JR/ld9YwM2JAMP9s15lL5DzR5RT5jEZDV4+FF2KSnwZJLWi0nc3TaEWOt
	VrOutl9rzxiYri948vMG5qksfls4Qy7mNUEGfGZtvQuWIQhdQtpAwlw0DMFtwSWIO74r49pE66d
	gJrmTDXqU+V0lPHT+PmGrWmXbNDgx0Dp4X9KL+orlicvWcECNWDkBgJ34RnJW+PqsqquWWlv+6N
	2YI9BAd2Q/W6bwgfTOdxQJIPKV4dgdW5ELlPcA2LpS4mXvxFijgiX+6aOquEvwooD8MeIs8h44k
	6FPzBPmzK8A+VHyAWmd4Vte7BWGVthcmMBHqOvgXQnhoJiRQGBvDt8A9kSbu7iWg7LCnGrlFz7+
	xVh5IaILlu2XS4flfNX2H+iWv2VB5TNiiUSZFQtUBLcxMQ==
X-Received: by 2002:a05:600c:848d:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb88810b2dmr361648545e9.16.1795624123960;
        Wed, 25 Nov 2026 08:28:43 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:43 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:29 +0000
Subject: [PATCH 03/10] mtd: maps: int0800: Use named initializers for
 acpi_device_id
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
Message-Id: <20261125-acpi-mtd-v1-3-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=833;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=blggJzzi34PPFng5frzDjV1f6bR0P7BZrevZFLsW314=;
 b=ZHZnM3Lf8DzUboiERoH/ypcNIiAQvRVlt4l5CMlhz7vJ+CymRE50z5L8UPm9qLmBzcXPpEYvV
 3V+SKJgc8HhAzjwEkWT9COXnLzIMM7NmIiKpGWF+rOcWTSAb6lbGtOg
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/int0800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/int0800.c b/drivers/mtd/maps/int0800.c
index 1f5a7c4936dd..feb721908989 100644
--- a/drivers/mtd/maps/int0800.c
+++ b/drivers/mtd/maps/int0800.c
@@ -88,7 +88,7 @@ static void int0800_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int0800_ids[] = {
-	{ "INT0800", 0 },
+	{ .id = "INT0800" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, int0800_ids);

-- 
2.53.0

