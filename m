Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743297;
	b=BGWw3qrPCFOuifkL+f7E5T1W9VALVI1fdBPkIBFuuAAY/9q+vAeu2DPXHfpu8EXAZJyr
	 UtMrD3jVwHulQV3PrFyqDmEfMtym81XipT2uNmRpn/29bDklkYFe5APgNoWQsdomi41JT
	 Yo+W9GFbXuWGPTZHAUC6qvXYFDfykTZX2NKQ0II9KaS/7buxnyAKkTktd4uoQAvt1evHt
	 RMp6lnSKFePLHen9oivBYFErIkE43EQu/I4jSYjZBqlHn2sIUNhYP3NGD5SHeytkGyehm
	 UqOn8OGabNmSy/g54k9EF+EdmNGDfnqiMZ4JWvqR4gy9Vp4dl1o/bCzHEaoUdGprdVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NmiJqs2kgKUg/nVVPvElS1K3GJHM8TwPnke+Kpv8F8c=;
	b=s4431/8BACowT5lHmLcuCtWhlihzmiy+rNX/NwLQveCGiE9Vo5RV/4Zd5wbLvtr1XKzT
	 CpOVWRscF3FEGCXosAWpc40+SnzpcNgLxiDRNMtXRBkri9kXvTiRSFzJXVHl3jcJYA4PM
	 O7NvroPgU/a3VYLBQwNEOlDs77VsnMRnm1/qr1YjZu1mTFjW+6jpkS48gWSEKIyD5Jdk7
	 GOr/7EEdv2gtgu2t1bA4NN7tEVlTrIS7OTj83G872MxbDK1t2wI8eNJhLeZMeBUigSsrq
	 7s1YlIYry95VM15uMT2TJuzpCoX0svc9HUvXzFHZ8GlguI/efq2r/aUdpSCbUbomOUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=shrSCUWD;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6FC606A327
	for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 08:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6FC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=shrSCUWD
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so4474045e9.1
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 01:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792743296; x=1793348096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmiJqs2kgKUg/nVVPvElS1K3GJHM8TwPnke+Kpv8F8c=;
        b=shrSCUWDJO3P86ZUe+xzX8Ud7eisYtxJcj9uofLLJ0hu1+6qrcydcuj5pCMw+qhbFW
         BMI0NjQs39Q7yR6s3u2OTCVxFEHFRoi8rKQLw9LG3unM0mx17deWNESOuTc8fuWb0enT
         RKgXziX0Frbk+5yG7fBd5NVTFRtmN8EvtT+m/hPZnmJCEbvG1XAMiM+o367yoIGYIhVU
         3zUaZbsQh1Jl3L6ZkLQVWVQsxo/yq98347ztXF1kYqZet51x0PMy/xMlABoYRbGIkbcW
         9SB5fKsXww1kAs5iIf3XcCEu/z4jKS0D/cIvYdeRGcJYjQUPZvZ6V2DnN3Jar+4etsSX
         TWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743296; x=1793348096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmiJqs2kgKUg/nVVPvElS1K3GJHM8TwPnke+Kpv8F8c=;
        b=AviEf/2rRs3DM3IUGs7LD+7EBaQ6XlyLtbYkwZSUUMulnen7nDuOWxZpNsrVWXnmu6
         mcWKxgzBG15gmJ6axYblCAI5/AJ31j//6HeW+CmIH0IxmRQvtHhut52X87UY7+zmYdoh
         ns2ilyD7zzLhab/8iF7OUyW/svl0RW4jCLRnyqIVo2U2Av8u6pSzTHWAmA4ZsWHMtwtQ
         E+aVn/4n7+yF5MKuoR1rqHU1/3NJ0ZHn20HqBPZ2cpdeS24Wl1W3TRg9ti9qPBmAicQP
         4JS7s0mLq7/SJ9TwNgcKKhTcT/G2yNKLNReyTV+9rGeBtNSU3uPPbGqtnnDdn84vIJUc
         M0Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxm7BjdcCvUQ/hZtJ/9tYLhe45E00WqhsgRkaGifqdGcbvLrqaLzTV9Fekk4/wLJkPMs70XEjGMC3Mb@vger.kernel.org
X-Gm-Message-State: AFq9FYLXTQTIvKP0QDYfgSe/b/vcBO6DDbwJqTKTWKkTkj7UexU8Y0v9
	WNXdJZKqt38/nNgJvb0d0rnPmuO8og1nZsL+mkLAOLC0Tf+MziNSME3EHYy8z47sSns=
X-Gm-Gg: AYBFou2r8XwpNo3heHPBY8DK5vEj6L5J0ub67+qsie+Wz8s79mvFssvkOgRaxH8en2X
	mVpLDjpJiHqADk76g7BpiStWMnH9ffL05piiNqWqYeARuvViKhhwzBXg3d3/I/rhOgshzKaB/+F
	U7nI9vtHPDN0JKOGvodfWc+ruZQ6sARKExMpYyNs/ZtVtcMklvJLVjAdbE7BMhIJyPbNeMwkb/M
	KpY9p5YhNBgOGXxIaYhCYM8YTxoeOouMBtBTWidJfIs/G4ynbTD7NQs5pDIr/2MwguRgguXAIYZ
	bfkwMmyPHsJOWXKVPWE8E58I0CW13jw4JsJW4YtsX7YPXwOiwwWyEVw3S1MZTNMs6vhIedk9Khr
	vqk2EMb1jDLqjWfMGxKe7mUylCklqYVqN4QvFADYiZipQBCPfjLEovzH1DOGcerLVcU7Fg5ZpSt
	96RFEt2aVe8GAYj7CbkNvXJs2f6hYzoR2nQSgMy0KBkqJFCJwoAzJJm4qPZDPO3L1UORlaSyR17
	/Vt/uJvYwDVutIZWEyNH/kUqGFWBdN25CLPg2JhJyVLdFoc2GwREvORyFzd7lHzj2nHkWHle8GH
	IzQXpUNEWncA
X-Received: by 2002:a05:600c:c87:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a211ca674amr24100465e9.16.1792743296063;
        Fri, 23 Oct 2026 01:14:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b2absm55750745e9.13.2026.10.23.01.14.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 01:14:55 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] ASoC: dt-bindings: ingenic,aic: Add the X1600
Date: Fri, 23 Oct 2026 10:14:53 +0200
Message-ID: <20261023081454.44350-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's AIC is the X1000's, but its bit clock divider register
differs (see the next patch). Give it its own compatible, with no
fallback.

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

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

