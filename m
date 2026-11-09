Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246479;
	b=i33ZWBrUucIb4HmsOJdNMh/CZdbUlNm+qD8YPq3EpOhXne5JFJFNdFAyYoRquPhNLFLD
	 ywsFBupf8tzFz4cs8vwBBo439NZJyqhLoDvD9JZfmBX5qTVCEbFEbA7yO5eS7+qcfSF5r
	 uC/u93Hu/10y+gNuWQg8hTk0nv+YUMIFhnYt4aULDtgLbl1eESqkfvKOX50PwuZ0EM99G
	 fPZKv/afBf+Cv7MBd7HATRAMdhh1+zEUtexYALraHcRln/cpKzfeTHi82/V/JydJFPiIW
	 AG4GH/8Oi8h27zuqsilkpGE5jOFvY4elapjQ/nveeB1S792feFOeF5A6v14m6dT+xbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
	b=VGFT4ikdthO+0cuWhGEc3I0ipPOBaT0ecZgvMneCniSNZxs7Fv53zpMImjIWPSSeAycz
	 oMpNE4WK5SJdBdOxWSREvL47QpUSyODcXdttMIXatb5YjDmPl87jY9beYgMegcRDLfsYX
	 7GyVVhhGN8TSU7eEueIxe1sFmWwskVws1umISoPdSnoF7OshcaUEew5D3PBhIpfM9q69n
	 skpfCT6RNPSt2VsfHUYE5JKQBNBCUCsd/95klIVLlFJW6CfQShzmr68uZlIbqwV7wjGsA
	 s7itgCoxnN/HrEa6ogr4EMrt1mIPQ370ISlNps/JUjxo3l9BUa/C98sf91yt3lINHtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=MFMPWOpo;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218D8606A330
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 17:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 218D8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=MFMPWOpo
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e10a70540so737156f8f.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 09:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794246477; x=1794851277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
        b=MFMPWOpo43dn5I1qLYVi+siaves6bKUxpU+2z6KSLJOGW+k6XXXCZ/2Zq/3TzkKRq9
         rECDoRbS+9RSxP6R9UjtOXuRjxwLpqWKonygKkfVyZY8yQjaQn/u3wYCOjPf42hWeCwa
         CIBnG7qOVkvrOT7lqfXuY0b3qC+lOYprtBpVfQBB86zDLQ3oFaJEYufBcEyJib12Zlqh
         0yvxgJXlHscZ+tfG0XB2HKmEl8VYO3k9LY+LQlKUHRtktaRfYwBr9QLN3Ha79m/TyaKt
         npmafvEiuFD7uPqa4LjQ0IuZDAWzZGMQP6tZDSEtUa62nOo4TMBBQoUcfFVPs1K947wk
         oQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246477; x=1794851277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
        b=bmco9vZ/+rEMN99FxwCl2ir1E/2M7VnEEhIH8Otg3Q2NAk6X03ZIvDLKRzqZw5TJ2/
         lU9IpKDmENmGFZX2mGREMbMR+p2DyRCmNWH/1sKHaazaG0Gza1tJH0l2lmXwYe+lH0ff
         W/mglgJU5VM1/epEZcns19XX/1UQbf546JsHgUMi9qT3mX1XnaqDR98W514QRyJNlxZ4
         zFxocmu8EHcXglXoNTahWN3oqwEqPA/gIw5okRYKInsbCe+/70GX5rcr56TZA5UAxJ2r
         uTQHuWGOnKKMXFCEy6I6Wy1x75qCQcnhVdnSZkoNWJMV7SbJztH1Nb5q8gmC335Cy9Sv
         olkg==
X-Forwarded-Encrypted: i=1; AL+hErGumlAaVy9XckWEXBZ1rKWfkh7P4gnXAnIf3KHnuripyl61IKElYOwYl+UZLGOn/pHNzKwpkp9/gz5+@vger.kernel.org
X-Gm-Message-State: APuU4Z9fct/8J/LD2X7HQoeVOrEfeEPVckXQ4APByNvStHUqj+1BZ1Hc
	W582RCx7UI3Mpv1g4xOWlQD04e/JIZpYN4kDYXVGB+drXXGPIld6UR4uuhGArFFxDzw=
X-Gm-Gg: AYBFou1M4JeL9LVd2VSecVn/NU4Yq+5hRri2ETDDBTxw1BlsAvE2KDw0UmDPF7Obmt0
	jVww7ETSOgh/uAqKLoCyBEL2jzr6xntz7gKXNVvXFEbac7N89t+c9TIS3QM2lpqZJ1xsolfsuQY
	4vAxiKB1BeYEBDU8cTEJMQ6K6s0u7RMDmV2CeWaSCLkou/kV788GkvyGRZXL8d83XECKvYyu+m/
	YW+/ZAN9octg3BO++vm5nWm64llh5GwCkkOSxQmlvBHFz6rH5yZZaD6haD0Kytfbye3OHRdrkt1
	8nXz3MPn7E9robD+i7usN94hsoD/R0IistxB6md0HXkqaZx1ojOMl0vX1eC694yTdpFcVCXkkv9
	WRI7DrCQKPptUR+TnN5XuvwtciZThcNVkYCcGbJ53dBdHD1v9Gf0pwRHqDzmNqQxSJQjvIy5QKn
	ToXmC++8ATgBb9vsEnRJjo7I/1H7o9mpUsmR1DavtTOcvAE8KV0f7PzyxOyMLVXv3fBKNlCbagf
	nE73Ehmwu25LDXXOKE0jXC46fFbT6+SeB/nRw1BCSMzbVDGho/oGXNHXFSeIlnqwnGoF7CIvabW
	vMHMW6AqSJcrakrdvqIx60zI/gVjMNrsXprkPAWEiEJQ/4HF8PZ9DebdJd26RG0=
X-Received: by 2002:a05:6000:40cd:b0:491:4e13:fde5 with SMTP id ffacd0b85a97d-4982d03bde3mr421828f8f.8.1794246477535;
        Mon, 09 Nov 2026 09:47:57 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm167322f8f.53.2026.11.09.09.47.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:47:57 -0800 (PST)
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/5] dt-bindings: vendor-prefixes: Add HiBy
Date: Mon,  9 Nov 2026 18:46:36 +0100
Message-ID: <20261109174640.96951-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109174640.96951-1-olivier@mgcrea.io>
References: <20261109174640.96951-1-olivier@mgcrea.io>
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

