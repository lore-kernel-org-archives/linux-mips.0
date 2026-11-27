Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795806;
	b=ZQ04/kE81nQa+Qf8PtEFSUNjmgr5+AUA53EHEFkgG+H/XTCXPAfmvWm+hj/d4Tq4ryEM
	 o/f6vkK+3yttcogbrqZyrcrRjKa1sKyyI6tKVCxqtc50L4gH1U7D5GWYJPmq76tSdtkEW
	 t7jv4IN7imo8o754mjp679FdJTv+FMHwRQIhzNH17FP1YkqLRHKIQQ+5btoRNcbh8yRgW
	 4X/wb1kwXEfpmA8KCrz6aDu2Mt5yTJ0lhj7A8VPK1YZJVcC1Tm0I4AQV8fB5KzSdx5i1M
	 W7DyDU5OCwuGePjIb4eibY05/fdxDkfrMyPsQzHa+zcwVQY/73EmCkRjEhLM1FZ8AQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795806;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=E5HE6QdriOjfRYPhHQNXELIzDoO+4VVClycyA66PLDU=;
	b=IInmLQpFKSboy053chgg80TqanGQkpySM/I2vgXVpb0FTlgX5NVkphJdQ9CW9r9t3nP1
	 1iWQ4MZZ6yJlB0x4dKe4aRYGtw8QjN4M23GifWv2NKR0NhG5VAPX741eaz69t16qWtS+m
	 8togLcnyAK2VoR+2m4uWqV6ZtfoujtB0CvCEeGAIikDvcNv3xvebt24UnSv+brhPKKcGw
	 qZBp2pdehkzqSS9xrUDtU5SpRkuxNDMhe3QFvb1SQuv9A+W2f13SOZGoxfI7HJAH+jeZ2
	 yw08DqLl3Z56qq7mKW1amDCWzpq0jfxJWbVkr5UJDtcEbcIOqC7O2IdrIv/B2nrMQjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AQyVPrBB;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B825606A688
	for <linux-mips@vger.kernel.org>; Fri, 27 Nov 2026 16:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B825606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AQyVPrBB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D4B3E4E417C8;
	Fri, 27 Nov 2026 16:10:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A10186049C;
	Fri, 27 Nov 2026 16:10:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D16D11E90CFA;
	Fri, 27 Nov 2026 17:10:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795795803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E5HE6QdriOjfRYPhHQNXELIzDoO+4VVClycyA66PLDU=;
	b=AQyVPrBBPU+BeOdcRTeCSwnO3kaL25XDTVWKEH2SxP8Z6LmWOvXGZ/uyu1q4mP0vSDrSIH
	zSB+3B7WmKQvoDhRLKGY84TIWX4sJ0we2fK4wVkDvO75KP+WqRxiCZkVNoJ0cZ1WwDCVQx
	PVHnHMD64EknzSD35Ryw26ZM+v8IFJuMXWOzCQSxh7Jv72RhHui2qNVP810wJGPLYylXaM
	3VSElc4fTfULOkbjrRVnNOblNzBjwxP9cYNLJbIg1RqZ4SSMr1sdAqqh3nVVTEfh886NRn
	3dNH5TcJL8ASn5V/C+pyhbF+ldHmwhgBgavzr2Y7UmAZpaHUA4RVSuBLoO0vcg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 27 Nov 2026 17:09:50 +0100
Subject: [PATCH 2/4] dt-bindings: clock: add Mobileye EyeQ6H I2C clock
 indexes
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
Message-Id: <20261127-b4-eyeq6h-i2c-v1-2-d3232984fe83@bootlin.com>
References: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
In-Reply-To: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add #defines for the EyeQ6H I2C clocks. The I2C controllers need
these clocks.

Constant prefixes are:
 - EQ6HC_WEST_I2C_SER: west I2C serial clock
 - EQ6HC_EAST_PER_OCC: east peripheral clock
 - EQ6HC_EAST_I2C_SER: east I2C serial clock

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 include/dt-bindings/clock/mobileye,eyeq5-clk.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/mobileye,eyeq5-clk.h b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
index f353c2988035f..d37f52bdeea74 100644
--- a/include/dt-bindings/clock/mobileye,eyeq5-clk.h
+++ b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
@@ -45,6 +45,11 @@
 #define EQ6HC_WEST_PLL_PER	0
 #define EQ6HC_WEST_PER_OCC	1
 #define EQ6HC_WEST_PER_UART	2
+#define EQ6HC_WEST_I2C_SER	3
+
+#define EQ6HC_EAST_PLL		0
+#define EQ6HC_EAST_PER_OCC	1
+#define EQ6HC_EAST_I2C_SER	2
 
 #define EQ6HC_SOUTH_PLL_VDI		0
 #define EQ6HC_SOUTH_PLL_PCIE		1

-- 
2.53.0

