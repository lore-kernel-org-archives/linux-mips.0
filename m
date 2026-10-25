Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918701;
	b=w6EDqCBdSPG+AE0kFIoFdAk3B6GuBx04Taj5kqwjku3fI0YPzFOB/l6N28t3bjSuz6Fs
	 QEJvjF8+pSbzIiUZxIMkM9msqEEMeQN2xFLmwpUqD7c7i6WgsSEO9kyy7IUHg40nJPEfL
	 T/mkphMOtFNOTAuI8KYSjsLlaqBkk0E38BQ82mHSW2S2vKe1mAgw5sYvGcIYTIEg9O50D
	 nVLk9rgCQLbtkM0XUdOv0FoJTS42iHrvABsSOxP+iQuv3xC6iOJzU07MJE98mIgtyISgV
	 52x0dFCaC31JgPZJ6DPIcqGs88FjIAziiCloKcZWvLA8FzsRwWmJS7oXoQafEaU/wFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
	b=BEzckZw2k6fDs7fsBMsQantGxFaUbgZkNYEBazgdCB9qRZpm9XEFeBZxUv2ipR1UCk23
	 gyv2R/L2kPbppZK3ODZ/ESBmkAsAr00EJlJlaYcnBfzqb1i8ABTPzie77xthKzNedFXYh
	 kSHcLRFBV67Jb76nxQTU6dpv/Be0GATyFiJgm6vdJvCWwW7u/cvOwNKGQtHtt3K4urqA6
	 q3MhbTkRwTqA44lPq0jLmz4wS5TQbvqtlDsUzGoD/+3baV9S5cyqF4DlTgqrz+wQi+aQd
	 kqdKjwcA4CiOWC/Gfz8zirnmVz59x8QRZ3/ZEWufGRayiQntkfEStHyPqWeL2abi4eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=0h1zAkhN;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0B5606A31E
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 08:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D0B5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=0h1zAkhN
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1531779f8f.0
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918699; x=1793523499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
        b=0h1zAkhNBCBfd+jMzU1ahmkYzTEgQQ7x+lhVNLUYDmjw3PIaPbGtlr0/DJDLJs9bB9
         ZYYAk1ShE6Zc5Zg4Oj/TNh3II9+juLMnZ2qsq+qLNxiYqbDWIt6sJR38LvjuTjy7QJOB
         Rd6HZvQiPCnAUQGNvPIuI8h7tIAjvUfBs1oI8W94xL2A4Zv4RSV2oOZLDG7bxKn177LY
         WZze2MMpmOIYFbs6cJqjJpGefUvmDNhdhQIcgLZK5gJC0LEycMYe7T7wHSmiuBig+0Jf
         gqLamkHFKXvEObKYGGu5MgYVKeVXl9Fqin2rBLu4T1WSt4hYmKSeUyaPNHOUsKLKu07s
         0o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918699; x=1793523499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
        b=uIa/P/rjiS/KR+G/vP6+JXkiGaE3kuYUBKi9BVXZ7zaW0F8P2FoIeoYQPORvesgOXT
         EXDtXSE4u7ny+CV1sOZqaONDzVKbqqyiEkMNm5Ltij12ENIV8b/ewDLJroSf6OeD9ElZ
         7OYlNNdPzXQbMbj2EjsXqTagVFfcoEoxiECdaLVW4YqTlsWuAmeiPcLg20sGHmTkzqCA
         qsmbCtAoVaZIJMY/yWgahJHyYpgv0Yv5eEAPyFQ1Y805At7G/CqKPLyJGTuL5I09TCH1
         W3YGs2bsxSK6rylKaKVCTxjUWzwciFUhpSg+LwQZLl56pFs3Pp0Pt024g4wV7WIVicA7
         etyA==
X-Forwarded-Encrypted: i=1; AKwUvBzd0Qal85ZND2cDhLXLHYAck2AV5iNbFAJMZghjnr4eHv1uyQGK9R9sqqkhdSOasoLiMhsOqEKzoFVi@vger.kernel.org
X-Gm-Message-State: AFq9FYJxkzDj/LQa152MSRI7lCU4/az4yIma5ufo5UTfloR2swU+mwW4
	Pb+UNsye6E+B7rG7QZdfvsKxLORPTLmRFjAoStHMq89fyRDlT9drtd5QdStSvVaBVe8=
X-Gm-Gg: AYBFou2+ZzPNjj3Gc7sI1qKllFhKlPMtLf1sugdeXDsaymV+nX7Nx1qaN0LLAj8+8MP
	P828N0UL/RVzKsiljY8uZh5IfeqUb0MzisvsKftEiAmz6HYtJG7AZBepJ6pewYtqtj8ockHzifY
	2Vjd6cCcNc5FYJvYIqSexVLaPfE7WgMKNny8zxfSMvH4HDIWI1XeupL1R1NC1SqxxDQavCZjO++
	Kd9Tbfap0fZuxRhfdYWc7uprpLyNRbPslhan6ezTNgNksrvcuah363XJGKc+knZLn1Q9E6IdFD2
	ASrNM9PHrxnZniLlIsCYcDXCvAeuW1vYCKYTCAQogCvIPQhS2aKSb7hNuxM8DjKrKdkFkYRUHT/
	shYqeR7EHMmyULJCx4ShSi5rfsRuNl3EFvduOoje5CPDnt0B5j1wA+o1296Fis5V8EtHTaVaQ1w
	gVGbjsZXX8y9l/OmMyh7lhwJwKaFXWZwEdJKm2S3d0DD9x8wFJXnhWSibKCh9NVxQfv9l1Tcsft
	UTxgCJWVhMuVKR8SNOJbn7szQy+hWc651yf0D7I+i0oXaWtSoq9ZTJ8ais/C7pTUkfc8uCQ9wqz
	nLf+kKyxxWnVRqwESXAz3P2oH3t6zaCCdGNOAMfiNoIcmUk7Y7Urppc4Fg0U7WYPudeHG4xIf+M
	H5hUctyfXmSCOSe/WE+c=
X-Received: by 2002:a05:600c:5248:b0:4a2:150f:15fc with SMTP id 5b1f17b1804b1-4a35ac91242mr67013405e9.5.1792918698790;
        Sun, 25 Oct 2026 01:58:18 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm9094542f8f.17.2026.10.25.01.58.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:58:18 -0700 (PDT)
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
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/5] dt-bindings: vendor-prefixes: Add HiBy
Date: Sun, 25 Oct 2026 09:58:12 +0100
Message-ID: <20261025085816.60405-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025085816.60405-1-olivier@mgcrea.io>
References: <20261025085816.60405-1-olivier@mgcrea.io>
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
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..b5bb11c20471 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -722,6 +722,8 @@ patternProperties:
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

