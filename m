Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964080;
	b=HNw2ImfakT5yqB31ezMPtVFRH5txe4vC6yay3PgoG6avAT+9ubfgm9aZ73pqRXSKJ4pk
	 fdQqjrASQIegJ93t99Z7Ag5jIs8nrDJJAM5A7JxqRiVtSPeJswggY7pxcFHjxObfZJ9g7
	 ss6Hz+6zGeCVuJe5hBXf1K53O+BS7hdyda/sScaW0zFxcorMhAe5Bh5uwHgrlWe1CB6vx
	 bl7ctokOCT8DO/LX2Z9wJFAvpynaXL3YCLa8HScMUGYAYtmFzXo0RLRxn0vN3PD+unFrC
	 eMCxVg+Cw+Z9ys+wOt7HPPgPq6XLoGjYfaIZRn0+pu2+bxBvyNG6zNzAKYkAWWlzYug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
	b=RkESxsOyxa6aKn4j7gJTEgNgEos22zvJUrhluRBOIoEgvNN8mLz+7mjNeLLqmkjcvxmH
	 alVwRkNCCgawlivRgNV6Wd1ATacrjFflxBuqTuT45NSqJQtbsaTm3he7kC/dFofJHWg27
	 hO++IWUAvIdGRYY+2VDbwXvgClGdfPghYGRtik4sS2g1iBwuNXEwUNvYu/2irjkqpQJRJ
	 2cAmQ/TYJU4vjDsx8o443Js4rw8k6p9FKUI0enDuLa2pwP79awyivVUWJoyQIXTNiPESC
	 RcokbTt/1P/ci9EUdU63Me+3qQJY6mA3mScz+dbRABVEOgVuNFVPR1kZDXIzl8EC8Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bmWTSGeD;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBBE606A32F
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 11:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABBBE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bmWTSGeD
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so3002415e9.3
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 03:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793964078; x=1794568878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
        b=bmWTSGeDEyRgw3Rr66WU71/HBLPF++E77hiVxVe5mQUGqMlvwX4en0t5YLXeCl/LZK
         LmUf1MywC1/4VKgZRiTSmty35QLyBqr5/5CkKIsTNGZokKe2LtFmjMtz+S7ni2H8xZBd
         38uid3mLVNQdJHng0L0lA71yHJtG6KK1IMrhqnSTCq5spCmstYPxpbJHu0QQupb2ZuTu
         9cZA15ZBFUTUTwLCvPSM3+nku+epbwYDA21+hsx7ECFiKXawrZTSBHckAEXeSutOl8hD
         6zmZfEyQDuGUDrBRw1MqoinhTvoUFBRa4FJ0H6U8udsZ9/mqEYKNRhY7l+VlILdZWZjb
         TntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964078; x=1794568878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
        b=xlGU91X/5dlo1bTHeYqFrmSX9DEOjTyYpckc5civwEWmXhTsefgO7w1ihcClArnrwW
         sLSTvWn2VZbmUtDq8oIvgabnXCiXkOtO1YdgRsicFsKgeke/8hfu4j2zGGRoVvEHrkno
         9UljNvuQFYE6SsUVxidkHb7QZorRtCVH6Idc0sGn88+bHwBP5W4bT4Me8F6UDEBJe3Ba
         oGSqmnNz1/stKypxCVnYxxR+o98aR59sbvaIN1qLyx1XqE6r3QVIf8kVWahrPhorN4ce
         j6v7o4mzXYT5A2dL/VoLqn7tWGFmFqbmrTqFFqLRHr6OssRda1xSd5Cek5YRt6wliW8X
         siYg==
X-Forwarded-Encrypted: i=1; AKwUvByGdjue3JaBTywj+tzfx5rEJQuvP52wdQ4eoF0OUnPOO2Wd1FYfwWEQDRxqW5MuFhrmX7c1JdWYlXsV@vger.kernel.org
X-Gm-Message-State: APuU4Z+hkHFwZ83SeJz1tNdW8HLvhmkKr9P/6NMI+Z1KRIHc/CEFwgJG
	jiqR0iPDxMhg5ejQ35NGvpnai0gKXoSXYRIL+Fv6tKWlSZEYC8ngCc4RSuVGyvVMPR0=
X-Gm-Gg: AYBFou0KTGbVmLiK9Qzl5CDvhSw2EqdNlZm2iIie0wMVSD83wlr759qurZ4CnsduYRN
	1WTtCGHsTq3SCdKMHnONKAA3N7jYECEUPfHBF62TktRsE8Dr9YkrNz4XofbaUsNQqwjMIZatX+E
	FTI4Ko01aR7ka/ziReNAa6bjsOJLlQOzgfvHACEIZG3wsvyUSBo85wTqXmPrsKlN9fM4bM6CVry
	pf6ladUvxP91rbAzTXCNaKxb5V2x2dx0V/ca1NT6mnW0FUyTWZ/v1Pq26K5Un/AXHKMzzHXOG6R
	9Zh9TX2ldof3VYQPYeAi2+rhSHcWZbnh8gRPqDBz4NDIvFvfOovLvkNvzwOOeyIYRSzA94AZrsv
	lnJRX6KWLPMWESdZMqc1j4whTd81jNzVHoHw/HirEVwvWmlUPKK8nVPBplXlWr3ied3nbCyIT8M
	7sb9U6RKaUE6LEm+cWJrzwOb1o09w/i7ogUiWurP404jUjc97Lj8H5Sfa/zPmo0da7v6U4yzk3w
	GfNmSyFv122zESa3Y/PbBQR8ry2TsQWiGcWSktHsT8qNxTSNTnqQvDX1D6FieJKes6cYdzmDZ6Z
	9ZRuIY2fOBK2SYYIENpj5DrMqkSVOUy7UhOhq5/fOExbTm5dFnJZHt65skyjP3M=
X-Received: by 2002:a05:600c:a015:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4b6df11d637mr31306905e9.15.1793964078175;
        Fri, 06 Nov 2026 03:21:18 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2028d9bsm102404695e9.9.2026.11.06.03.21.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 03:21:17 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add HiBy
Date: Fri,  6 Nov 2026 12:19:56 +0100
Message-ID: <20261106112000.1612-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106112000.1612-1-olivier@mgcrea.io>
References: <20261106112000.1612-1-olivier@mgcrea.io>
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

HiBy makes digital audio players, among them the R1.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7602034374d7..0bbab57d6c25 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -732,6 +732,8 @@ patternProperties:
     description: HEAD acoustics
   "^hechuang,.*":
     description: Shenzhen Hechuang Intelligent Co.
+  "^hiby,.*":
+    description: Guangzhou HiBy Technology Co., Ltd.
   "^hideep,.*":
     description: HiDeep Inc.
   "^himax,.*":
-- 
2.39.5

