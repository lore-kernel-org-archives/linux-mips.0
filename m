Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955789;
	b=F2mWX9g044rriuBk89z4DEfUZ1SWzJsNf5dDvPSD1cz5mdx88fEwf24K3/h2hF0AZ0ND
	 WPRE2anoWSQRo3+QbYqdsSqspm+HMTJ2HDH48kyIjdQ906CZhzfznqbASVG7+Ue40ZgRM
	 4ItvtHCzhN19GV49Xk2R2PQadvWwD7+ccZBCZYjxQr2XpGhspSWba4kgAAuuQjuQwpRqo
	 3tv6K3KKzSbFNrQ2fYivOvjCk8sTpddl69SJlvDxjjIoc3zU28r/IE4dU9bgSX3ZNiQuV
	 +6p+HXKV/yf8eIplf81y/9JQmH94McrD45WjMx33EN+UNUAN1z7WLSAtRZjTUYv6vsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7DeFc9otasxZEGZwFUzRH8RX2baoMN1ocp4U5Fzi2nY=;
	b=RICFD/qYpDpBHKNdd1N33SHzWhRs+IQnrWzi2BFb9z5OaoQ5Twst8xuHLAQCkuFkRYv0
	 foglCuTXsa+KH12qDM4G/hOGCwdAc/M1i+vCclgiRzB0dylyqp83QTH2l4PtN0tZCFQxp
	 3iZuA9Cgx+JWNqEWDL+0iZJSAS+wBe1xweLDPuZJaJKar9/YD0Q+D1BNroTtjKceGOAZl
	 s75JiSewgMRDfSW8l8sJ1hXQ0vejNN0/e7YPOJCgwdELFjzVX9ENcEIH6WJEERyEnPxf8
	 ybLZ0uqrpRdJxwveSzfYQwcpsg+0UHwqqdAZqpE3wiOrRbKncfLcdhbatVL3o/C6nnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oh7valtr;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8884E606A322
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 19:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8884E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oh7valtr
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1134439f8f.3
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955787; x=1793560587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DeFc9otasxZEGZwFUzRH8RX2baoMN1ocp4U5Fzi2nY=;
        b=oh7valtrkmKMdQvevEIpsbvmUYS2B86kxe5EKnfOszdH2bZ5JD/mQJdXd09w1JLvB1
         Qt1vbg3Ag8vO2VyqUOg8spaLE9Nqrc+6dCGWuHUVb4MXjPWuoAJRqu25eCTysrd0lbdA
         0NMw6g6MsvCMwt3BnY8Uua8CgnqlLA8TlLqL5jiY0Vk+Z94uq0caKIoBaVdRsfHK/xo/
         E64RojtF55nfs9sE+8L7z3dxtzKnjbMkinWa9wtWlJ+r2gvs+NVqTmQ7mrozV5b/3cZ6
         xIjZwiYjoAs4ZgGnwDpSG1hhuXxplXaeMIimJHEVDVT2tp1G71EcmMTTLBU1NF1GlkWW
         ecCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955787; x=1793560587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DeFc9otasxZEGZwFUzRH8RX2baoMN1ocp4U5Fzi2nY=;
        b=hg0zNzspXWN6WrKiuiegfOhd137T7Ij30n+C6xc6703ugMyXvTVWzi0LfpWkvDNlio
         SNBPEvsBf8TdrZthA6yiL9g+/xc7Om4UzZJzrYknFjnkrlsRDKufYM67nVdgsG0qZh/5
         qQgb7lOy/zTFOjWxJpffHioX/gCEUEPZOLrJ88fLkv7Nf2h6JVjAYE2rBSsAF8cNFrVm
         GSWMMpNfFtfVOvBUyuxcRAX4+oJCAXS4+wuN+GAEJJoQcL27PwHABJ3PJgIUztTqyWmz
         oRrr6/yQZ5zW59mNxCsHqfFVUvu1cK1fHsWRzZnmKtnCgurpsCaq9eI+FGpGXsahTOLR
         i1Jg==
X-Forwarded-Encrypted: i=1; AKwUvBxuB61Wi9OOHFMD2Q9oqz/ochmqC8gt13Jx6N8uLsCOde/sePw5THD1RRBkXxb7Gvkojml4SKX7RvhB@vger.kernel.org
X-Gm-Message-State: AFq9FYLZpvBbzECvpscWqiR+p9XKMX0VC8Ds8/lKQnoga/jfAPuMm3WA
	2Kfo0UmGBZREiphASg/nhyuYNiX6Kq8J2Z3tTMAP+TKNFsx/LO+khfu+2l4gvIFlYeo=
X-Gm-Gg: AYBFou3xJQbk1eqWCJjeLUpLvgdSFf7CBpT/WFNbV/PCWFaUsn8cB6x5K5YsZtWcpA6
	IHNyj1OAxhw/UFiP2w8IX8b+6AcwDF16nCJGJw8yENWdiWU/MXP0CCLEewJJ3CJw0nxNZab8lcK
	b13m63hPwDyVBZ9ImxbLExq0pv18GwEAClLcNPEPtT9d6YLD1S448thXS7GryB3U6Z13B95oWHX
	Y0fooPraRtl0+1SIbVjJ+PuaOaGG7ep5CCfcPFqTgSefeW3It5/XzpjaUKuYhlbiBxm0TAT7BdT
	HL+o3Xg0QcQAX36F+zVFTHXnMrhTeiR3XrtaHK9GiZhhhASSQa1eLpjLOKatFsRNoplapH1I5Sq
	Kkgs1dSsoJCEsBvbtPJ5Vcnq8T+04TLk3eeqex0Px6pw+nv3f/5MMGl5WqCW8hkAMUc0lVpO/zg
	D5s869CJx0tQFg1DQhy5h9ayX01mkVFr+OIGShiSDvZJKvtte49VynxHe1M14wibXIbAJQ4Ek/J
	O30xvopNzC0CirrjQO2pv6RavPAu+Yrrzeq8ADfTkLXfIBY3LE/VVYK/oV4+U5dgSVoib5AwzZJ
	bGshQ+f1isabZeXuggV9S3g8RkpGO6vNutY=
X-Received: by 2002:adf:ff81:0:b0:48d:f58f:c98 with SMTP id ffacd0b85a97d-48e3eb9e34amr6121463f8f.40.1792955786568;
        Sun, 25 Oct 2026 12:16:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm10082051f8f.13.2026.10.25.12.16.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:26 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] dt-bindings: pwm: Add the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 20:16:23 +0100
Message-ID: <20261025191624.9219-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025191624.9219-1-olivier@mgcrea.io>
References: <20261025191624.9219-1-olivier@mgcrea.io>
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

The X1600 has an eight-channel PWM controller of its own, separate from
the TCU timers that drive the PWMs of earlier Ingenic SoCs
(ingenic,tcu.yaml), so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/pwm/ingenic,x1600-pwm.yaml       | 47 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml b/Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
new file mode 100644
index 000000000000..3ecaa92a5ca2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/ingenic,x1600-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 PWM controller
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The eight-channel PWM controller of the Ingenic X1600 SoC, separate from
+  the TCU timers that drive the PWMs of earlier Ingenic SoCs.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: ingenic,x1600-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#pwm-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@134c0000 {
+        compatible = "ingenic,x1600-pwm";
+        reg = <0x134c0000 0x200>;
+        clocks = <&cgu 21>;
+        #pwm-cells = <3>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..c905aa13bcbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12878,6 +12878,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 PWM DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.39.5

