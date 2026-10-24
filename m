Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792878283;
	b=lHZ3YOMYEyvmX8ABY6XBu2N6Bfjig7Gm1oQOuB9T6G9TG5hH8HeUr/HWCzMljTNnAADd
	 wHSsL4d8xL9pXJubtHuBcTYql/QeyZdUYEN2VG+9pA+PHdmlNp0BN8/EjUirxMZD4sn2o
	 gRDHOwmJhVvCOlUc8FlcMy7iBgEzx01f6Zrzx9LBcCy/pz75wRhKuBPsQwUO0faSLg8SJ
	 +9FPDhbtuA8jnI2zYEJ4v1xuZUVDsCDjXaFlH/FxOpN2UxXOHheT1lTBRNXU55FBKkFrb
	 11CwyF9k/t6tQGRFueaE47ZPnfN301FOyac/4zunXteD9P8sqzTJOzQghDydy1uuP/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792878283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lk9d/Gl2nz5jUnyw7wF4SHbFvcIOShutZg1r9yMeJ9I=;
	b=JdDZlrk9ahkMX+Mib2uHxM+/QIo9CeE02OxvvhxCAckdAGMbcN2N7Y7yDZGqTwRcERT7
	 t+68wkLzCsssCxRFZLF1leQ+iClml1LDeqJOYlxqmhiuRmXySTzE2wDRRWuJcPJuqvg9T
	 hXXOaNPp3HgbRYpirUIK9hc4RWsL/MzRsp1RGu8Z40cZi7mGlT9iMY49i9xz8Mbsu2Q29
	 k3wntyEwxUxdgcPFu29P/VOH1XkxzdI65q9HvId0enq2PCosQDLykzpULi6ptaUpA2TRt
	 Ho1v1EayBsEKimtFQaMnymAyiiiMdXG8YQ9OOEN9t259+Kle5VkRPWmzED0Ldo6Y82g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oRnWTIP3;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D305606A31F
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D305606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oRnWTIP3
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso17723085e9.1
        for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 14:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792878281; x=1793483081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk9d/Gl2nz5jUnyw7wF4SHbFvcIOShutZg1r9yMeJ9I=;
        b=oRnWTIP3mjVegydXsW85+Os3bvWZNyu8xPVPw6LmUM1nvwSIfLCyiKpn4SWc+W0MNb
         hRVASTt35mwM0FVk7kS6c51IETKt4jBskIa4N1OcwXcG/DcXjQucVqpomv73Vab+RzJi
         rfCFeKcDHKNOKNFVM7S5QRgDvrx3Wz2ZzCLHhiIhRemDKXppwbIzdJsDfmbkEFJUHjuw
         EhSolui+3bLtanZozEkk4eu7afXguEuErlFnCZOWPUOTUjYy4vAlmQZ0omvTyquVqZEi
         6kiYKFBY4gHdwRK93LHIhHbOWMvCTIAULOLVKGcQDFDU7L6W4CJ53jW01fo3ge+xEn3r
         6BGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792878281; x=1793483081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lk9d/Gl2nz5jUnyw7wF4SHbFvcIOShutZg1r9yMeJ9I=;
        b=sGhPPTFtkWjh+U21FFPvQCMWb3hyWgQTOGncX0ClhZm2E6u1xdFvu+bVRcwSnp6P0D
         gxtvcZjn9BCLfa73Ah6tGRqou3hYrBQS+A5CN1mFpM4tEeIeKgxAzl3cy4zXiZ45Ie1Y
         Ob91gUBvJfwiEvYI5kMhWKCIVLwYFFAhcYYRjJ1eQp+fofNDtZkaiaVhr+UDsXRSanjv
         eVfeoqWtsdkO357azSY3Hs2jFNtfD/9WEYNmZ/FOyGoGqW7T2SBRc1gtmpAMlIwuMpg/
         OSfXaCdKxNA+WNAzj9RBeDtwptzrP8bVVVi57/JcWi7CiNjZO1zteVYWQr884zaZTALh
         4mrw==
X-Forwarded-Encrypted: i=1; AKwUvBxibn7VYg1HA4ftLTEY7tHHzMOsYjN4/vKlHTn3v6pcaHqBExlCiqutEFmSq1c7nlRC/tb/LN19GIxX@vger.kernel.org
X-Gm-Message-State: AFq9FYIt3TIJip4jqs47Q2Jp3n6L2waAZ8RtcSWO8oT4oklmy1IBqfXV
	46wBmVzsTrXDmbuWvApzo5wjvzU3xSK3+Euq96VMgKdUxuUEg6G1dfZXkrudIUrdtMo=
X-Gm-Gg: AYBFou2e2GktkzhWzEcgFyxK7CrYSUWJ5+KESyF+/sa8SIhvqMqB+H1qrLwV05NARRc
	2oQGbLYVVcvV6S+wQHQOUuEjgBTGLuPYMUvqg3lhxBVHAwGUbTFlJxS06f0LHY+JlZSFbhul1RB
	AxrnLwpfX2RpDfCf9n44S9vpoaBEQmfChLrRbU8ZRkqCe+Ae3Ci0iDqIDD5rLr0HiHPtRZSoSx2
	Pwo2G5A4vwmD9qNYYddQKTB/eeO8hfm/GJj+uFTKBIL5OCmuArhBtyJSXCiLgyxN4T67bjQLUH7
	bVvlRiA0lUmL4zEZNDnxmMjpZvdPn5lSKZqgVXOxP3FEFHVrOSXvD69mIvSY6MjGOOwzLdfPLdj
	V6rRWkE+JkOWme4/GGmDTiU9qiDnepjxZB20MbwAx5DpwRzlMn4pMrsDh3qytmEUajrcO0mkOwS
	C88WocwY1wqvpKEfgISdx7IhsW4m4xItRQHLAHlBWrhrS/TD1XFNbPeL97Ma404GHuMSguE+c+V
	cfNrt4dIJMSlcK5Bxqvk2GOZSpWs9d1pHPUlAWae7FTc1iHhNAEvfBWWXHyV6K6OypnenWpVWaV
	ResQ09SWG2b995aJk5mExposhdV9YXgSdv2tqnGYsFiHWpQgjlmEVyq5JZX110IqorR3b6CJqw=
	=
X-Received: by 2002:a05:600c:4704:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a35acbd575mr48866525e9.16.1792878280936;
        Sat, 24 Oct 2026 14:44:40 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm80447905e9.15.2026.10.24.14.44.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:44:40 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: ingenic,aic: Add the X1600
Date: Sat, 24 Oct 2026 23:44:37 +0200
Message-ID: <20261024214438.33342-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024214438.33342-1-olivier@mgcrea.io>
References: <20261024214438.33342-1-olivier@mgcrea.io>
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

The X1600's AIC is the X1000's, but its bit clock divider and its mono
handling differ (see the next patch). Give it its own compatible, with
no fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/sound/ingenic,aic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
index d15c000f14e1..9ca75fb80f45 100644
--- a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
+++ b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
@@ -24,6 +24,7 @@ properties:
           - ingenic,jz4770-i2s
           - ingenic,jz4780-i2s
           - ingenic,x1000-i2s
+          - ingenic,x1600-i2s
       - items:
           - const: ingenic,jz4725b-i2s
           - const: ingenic,jz4740-i2s
-- 
2.39.5

