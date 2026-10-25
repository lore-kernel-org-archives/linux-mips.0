Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918008;
	b=0TIP4IiCkXqin+2921Q9MzRcr9gsUQSLnTM84PIlNwqPKB5EIpBX5r8Gg1RBipvzO9dm
	 17jeA8SUxA1DQzsVD+gGoANSCCUKacwyY6DAmycutwbrJjkCtoYlH1MYXAN0+4eJbJhqi
	 8akIKLmm4rrkiiL3Bt1Pm02ffxaJsC9dsRnobcuZAOl5UzaIG7Vu3J2BTxr+ns+WTVkUg
	 2v8tLJhXwZqKzqFaOGTLBifE6ADLSuyl6Ga5BCoJbnVR8OuIzKpafLUlIGdjdKxUbkm7U
	 fjIU8qd4nDN97teGvdYsLU9+rCW9PXAWKCQNYpSlz2k7Ykca7Vv9VNJXrLdB3hBB9+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pSPsp8WYgTyYIXd11T+owTDZiioNpZlULQUYbYv9uh8=;
	b=NFmxQQOYLVwDMNgf7w17SjPsS2DuW7bV5CutIC20UKmV4gNrxu4aN+TBu2V5Fkqn6mSM
	 m7vzwpENFbjYA1eBq3i8fPtTljEaOJ3YavG07Yz67A1hTrRA6t1kQFwqDkR/5bO188FZt
	 2m46tYkrthRH5RnDoW6tem25YTOTCdoK9g3D+wZ3SsaRCyFQJMo3hV7efdvslKU5OVsrN
	 ppjoJ6PjuQGE9KZHfjTVgiPqI/DxTGnC2GDSMGN0pns2QmFrKT+8BJD2NR/TUJBMgJpnC
	 BpPLkTwVZ5dhnIgqLysbk3JYocO4Zt91wb0fizA7C3OFF4A3LPZawpan9XTSYrRN3WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=GglVcgwI;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B471606A326
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 08:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B471606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=GglVcgwI
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2165477f8f.3
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918006; x=1793522806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSPsp8WYgTyYIXd11T+owTDZiioNpZlULQUYbYv9uh8=;
        b=GglVcgwIKfAuJzhKvif1QWUuF1DmaBjTPt73jnHhBWyFQGu9HtWWP6M2Tz+X96NCD5
         T54adqHu+0zbxD/MI23x4hZTgKLQ/89mWBumVhcq3Bq7KBtQo8hsBKF72Tol3A1Fo49s
         MnPnsbVy5gmajXbl8wvpi9uUcTJpvb9Am1YQrIskxtNpz1XmWUMWvWi4sG6+h01t8jKu
         mW5Q9EHUpw4MeWGCe3bWziK4S7W/GF3BvX8PYIeTrctEE8cKFQ+GEIYT3dJ0r8bnSm/a
         YeNhHaZAVgRYEPVANK9zwMcPLZexrkAz5cRXuEgqjYU1fbxPN/hmC3+Noy8aTJktNeF1
         +3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918006; x=1793522806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pSPsp8WYgTyYIXd11T+owTDZiioNpZlULQUYbYv9uh8=;
        b=m2/3Om2xXQc/N0mZkSmSWxVklZDjnfMFB6nvgNHAyuQp9KcxEtCsfrr49nnmHq0lVq
         LydtYA61+adsfx4axystZ4B3Id6Q1ft37y2rWlSXvPA6vCCqMaDRjQrJqTominmPXm1D
         IkhGmDGCImQIWJIFGt608FFb2HRpC2x/t8vRRLet9kSKSGZOsC/DKOd19NzthYkkcLEp
         TO1dpgAL/bIWROhB4Zzl3dzGGh/MFa4l6A8V0bmbgTDA34kVwadI7gAR/hCKOWBE7T6x
         ZcwjCrNckQkjpdfzLumnCAzYk2yUsfnn0cJkPwf5bp/EWfBOEYIqLyh1QOW7j84iT/SK
         6UlA==
X-Forwarded-Encrypted: i=1; AKwUvBwUN1rMN3Q1vQaY1BgY/d0q2ReSkcQmXk4Jvzv9IEVu2MDa0D/oB32qZBME//et1mnETUdYCCsH4c6s@vger.kernel.org
X-Gm-Message-State: AFq9FYI2WZqZWz3NB2m9HiuCKJg5rB4+zM3nM/7cmUptNPDwIFVdxLpo
	CnpMKUcrj3e0A+ByS0/9SEV72tfoy/guH3ugBGA9RUyiTqnVhkk4tNL3yjs4kVuhNxQ7s6tGDrn
	rloHF2ko=
X-Gm-Gg: AYBFou19DJXkRFLoynhm6kB27RfEwik+QrPuduHcxYZa7MXjVjyIwUk2PYUE45wCusF
	oJ64HWup6t8PXKyQ3lkoSfiJmkD43LQqYqh3Mgund3leiHpg3ie5Yqew+k/flkMhlSFPByg3Y7I
	S2e2CYdT8BUAcaz5rsHtbhRdlC8CYBr43Q8c0E6HRU/J4AG1qELtDFTC+W2BiVbj3NLE3ZiEkgX
	JbOA5EhfQwCJ/vInw8vim/acxasrQAqvb2OkLlnNLfpiHiRRJrxqKbrixoUwHhfs6NSVUVmpy/e
	j5TAYJtFgSRlrKViiRUAzBUXX8nRxKDNoLU7oIzZkBivGSVkgWkjZO+Ta/noka1mfFezedogfAh
	Aq9zvgeG+M5qyWOaTivYLpkxgL0fFrYP9bAVomh1sS5su0QE7G3Xl0oIka+UTB91YBwHnzcM8sz
	dD70Ut8pVmBuzeb+lcMv9kKRRXqnF4AfQ9VY/d95ibhUluNnNE4spVm8Rq0XW8Q644XOwR/Zd30
	lELtmXMw/hbw/glO1VLPOOoUIzTjGj+f0WVBx/U0KZB9v1L+2hQ+LDU3XnH71GMfaensJtRQ6mi
	IUUJK3Fb0GxOtHDlCn50/EPbuq+06kExhYy092OEQJ6HLIdHbnAa9taXenbSkAkwItLv6x2TJg=
	=
X-Received: by 2002:a5d:6f0b:0:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-48e3eb8e5f6mr6646358f8f.56.1792918005553;
        Sun, 25 Oct 2026 01:46:45 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm8616707f8f.23.2026.10.25.01.46.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:46:45 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: pwm: Add the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 09:46:42 +0100
Message-ID: <20261025084643.93167-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025084643.93167-1-olivier@mgcrea.io>
References: <20261025084643.93167-1-olivier@mgcrea.io>
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
2.54.0

