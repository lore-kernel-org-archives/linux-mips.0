Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743297;
	b=zdpQjjwiSjdGtvntEKmPKXvWC4Kl6iLdB5SEVmCjmUw1T99QFH/w6V4Hoy1eouoVXYcn
	 zO+qE5FYR/JQYQX/9pnfw4Kn7dCuZc0xmTwiscxTp6YcMsL5no8XZLy3If89oh/oHzQrJ
	 RNl2E87xthWcyyBnQtGxo1X8eIF4gl9dnbmDfG737DB5ZTd0UykY496djW/JNVmdt8IRS
	 e2+MtnDloyEUhZIkoUH0TONB1GXz6nNsGc3sjQSFlpKUWCOXEDDV7d7xMmML6gx8IyLd0
	 n1bPhPnXbR7fL6axDo2iSXYtOVTe3t9FOM+lupUc/hWBigZgC374KDzI8rxmk2zdhmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MirqYe8nGD6bdZo8+2WIbYbNAILTGlaBKqpD9T2g0tA=;
	b=NQYNdnspdT6tHeNgGqK5vQ1AkCh80oIzs/0RH1KXP/QPAiEjxklMYBDAHDGWGR3p29Ju
	 G1mJQbwqD4xzQZrRFMbBnVRPt0RtXlM2MYxcALQFa54VyMzvwr17ngEgif+I6QWKAd3SU
	 q+JUk0MuNXIxcBF1ebMxpIhOQe6/+4yLRjbxn44rseMZkIUU3sj19i+8NY+cq8/IB+7yH
	 T87rb6u6kPBTbzvSJxfyMkr3Tu9EGUOtFYoFvrILXnBYNLamYO8bz1kUnf6eOxJjQKRak
	 xlpNCzLIZdYukYR6FdTfOrgTHvZXD2SkDqM7aqugvTV7FOPyILGUSLFcSoOfzFvMNHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=d9aaqTWu;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5084A606A331
	for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 08:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5084A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=d9aaqTWu
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1df146015so4044535e9.0
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 01:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792743295; x=1793348095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MirqYe8nGD6bdZo8+2WIbYbNAILTGlaBKqpD9T2g0tA=;
        b=d9aaqTWuLAdbujXHLgdWrka7BhzwwgUunILAT3DEPb/HdhU6s4RWA/Mrb5c/nswGdg
         dbVh2Q/FOfg0ElTxR/8tj/Y+ov2qCBrILkeDvZ6EOoll7J3ha2hYaWWxAtlbI/2kprz2
         ipJl5msr8xkScN4ZgvoAECEoH/sYGl+cbgxui8IKOmVuaPevOYwHG5p8Nm77wzL3mGAK
         iHIcrF0ZXoLnaIFQWuwF2mz7+JTkw2dzrVeebBZIAP7R40zfhJ96eeNgM8qZdHx4fC5F
         QyqBg7CBkNWI9NZE/IUJ51H/IRpj6Ct59bLUDzPUtzRXuwYMQ6QxlzpDO3ZHZakVlisU
         XKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743295; x=1793348095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MirqYe8nGD6bdZo8+2WIbYbNAILTGlaBKqpD9T2g0tA=;
        b=U7voCwz65bFK26saANSSUfmmnmMj/XZdxRwqfA2yLD2Mprn953WSNyIBmpjxQLI3Si
         8OQVPgxJUTI2ef665xhvM6EKiLESrV+YcHRzio2RLcn73uZyXVVKnQPAFIZVURG9bQ99
         4lrlI3Kl+qLl6rewaTpNpPjGtHhW5H8+v/C4FWdCkvsqVC48TUVDx/Glc5HGF/o/0p5j
         cf4FLAcVg+3W9PjqzBS5aMbi1WsbFRW8Lz4yDUWIYfHs5dRn0grc8WZJykZX8yK1vrTS
         7C9WUcflDK3IVfZWlrEgc0ffY9GH1ZkFoUbqeK1vCCe3HYoPAO9DC6VcAFJGk4u4Oupv
         Nx0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNr/Lb0gY5D2SYnWGx3BcoPSUDZldd5MgZL9pG9PQHTsgQw7spzYhX61Sd+gaco0UGD68yPXTnYJN6@vger.kernel.org
X-Gm-Message-State: AFq9FYILNsLHneeGdaEzZ4vdV1efg9nVGi5K4tRoGyDxGkAldfoaNwMW
	yPViLaNORtuJVJ07ol1TP7b1jHvEwJGUzYVpMajl/U9hPbsOC6UAjfLpyIeXPM6hBj4=
X-Gm-Gg: AYBFou0moDl8HQ64UGopst+s1U8TTS2I+heRFwTlpdF+8TGI5WG3KbCPkrM7NI2XGZL
	3QGx0UmFZ3cZ2kBNpPwCo8JRBCMalIXQ9r/zMspXhPOzoSjLhhPyfJor96BdxxwpomUx31sWw3N
	mSD7uRuOfqmslBSIN1qCltEVTyxFSk51KgiZb+Nn4OCvgbjfEnuz5PfdHBD6H29fimP5dfK56E8
	03KZTDTH1NbzHpp7S8/Liu7W/Dm5k9jglkS65QDdRWBHghR1pct5JkWhD5g83qS+TLJEN3LM7ZL
	FWuQ2ZM9YW96HwflzL5mNdZzhZEVVPb1z8xdv7Tyd77cthq0ewtsNROK8LP7vzwjt4/tGEEQKxL
	BVshcZ4tgMoZn05uGf8pIPlhuDBt8L2tRbBMh5D4bLSaoP2o+nBiUh65yA42dY/EfqMcuRL7D9h
	/09AOdwT0+guwF/uhadB1SBKGcU1eTLZ5QQTo9iKNCN2HBJMf3fiMMK2vJroXhRG9RxRodAdW/y
	SPLrIAB1MNJV8aMreyqkDHwsFIoLZcD/RVVLtEibgnHh1cX+Y0qNDPH/3+dnvpsUgr1r/KWPWoN
	PYunf1JXiYI2
X-Received: by 2002:a05:600c:1914:b0:4a1:f736:79d1 with SMTP id 5b1f17b1804b1-4a211c9e49cmr25166785e9.16.1792743294583;
        Fri, 23 Oct 2026 01:14:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3804450bsm3520690f8f.30.2026.10.23.01.14.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 01:14:54 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 2/2] i2c: jz4780: Add support for the X1600
Date: Fri, 23 Oct 2026 10:14:52 +0200
Message-ID: <20261023081452.44118-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023081452.44118-1-olivier@mgcrea.io>
References: <20261023081452.44118-1-olivier@mgcrea.io>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X1600's I2C controller is the X1000's, except that its SDA set-up
time register (SDASU) is at 0xa0. At 0x94, where the driver writes it,
the X1600 has the spike suppression length (FSSPKLEN), so the set-up
time stays at its reset value: 116 cycles of the 140 MHz APB clock,
about 830 ns. At 400 kHz every transfer to the touch panel of a HiBy R1
ends in an abort with TXABRT 0x1000 (lost arbitration), and no
transfer works. With the set-up time written at 0xa0, they do.

Add an X1600 entry that writes SDASU there.

Tested on a HiBy R1 (Ingenic X1600) with a Hynitron CST816S touch panel,
on v7.3.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/i2c/busses/i2c-jz4780.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 695be3b21460..5e904b8e6dea 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -58,6 +58,7 @@
 #define JZ4780_I2C_ENSTA	0x9C
 #define JZ4780_I2C_SDAHD	0xD0
 #define X1000_I2C_SDAHD		0x7C
+#define X1600_I2C_SDASU		0xA0
 
 #define JZ4780_I2C_CTRL_STPHLD		BIT(7)
 #define JZ4780_I2C_CTRL_SLVDIS		BIT(6)
@@ -126,6 +127,7 @@
 enum ingenic_i2c_version {
 	ID_JZ4780,
 	ID_X1000,
+	ID_X1600,
 };
 
 /* ingenic_i2c_config: SoC specific config data. */
@@ -335,7 +337,11 @@ static int jz4780_i2c_set_speed(struct jz4780_i2c *i2c)
 	if (setup_time <= 0)
 		setup_time = 1;
 
-	jz4780_i2c_writew(i2c, JZ4780_I2C_SDASU, setup_time);
+	/* At 0x94 the X1600 has the spike suppression length. */
+	if (i2c->cdata->version >= ID_X1600)
+		jz4780_i2c_writew(i2c, X1600_I2C_SDASU, setup_time);
+	else
+		jz4780_i2c_writew(i2c, JZ4780_I2C_SDASU, setup_time);
 
 	if (hold_time > 255)
 		hold_time = 255;
@@ -751,10 +757,19 @@ static const struct ingenic_i2c_config x1000_i2c_config = {
 	.rx_level = X1000_I2C_FIFO_LEN / 2 - 1,
 };
 
+static const struct ingenic_i2c_config x1600_i2c_config = {
+	.version = ID_X1600,
+
+	.fifosize = X1000_I2C_FIFO_LEN,
+	.tx_level = X1000_I2C_FIFO_LEN / 2,
+	.rx_level = X1000_I2C_FIFO_LEN / 2 - 1,
+};
+
 static const struct of_device_id jz4780_i2c_of_matches[] = {
 	{ .compatible = "ingenic,jz4770-i2c", .data = &jz4780_i2c_config },
 	{ .compatible = "ingenic,jz4780-i2c", .data = &jz4780_i2c_config },
 	{ .compatible = "ingenic,x1000-i2c", .data = &x1000_i2c_config },
+	{ .compatible = "ingenic,x1600-i2c", .data = &x1600_i2c_config },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jz4780_i2c_of_matches);
-- 
2.39.5

