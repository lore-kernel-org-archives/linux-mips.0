Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650483;
	b=V5m8YtSBe6nH2pbSrkAQv0Qa5Owqj9LKe7drUzEtbIVnYWx1E5QHLx1Mc4O6wrOkpbKf
	 LsE477r434p5JuvUQnyeqMy+r4RAYhSc9Sb1PnFzecbyZoQLV+zKanjGILBfrEz24bkTo
	 o4f4nMET9i6gu2nxb0F5Fs5rm0Vvtx0I7DJwT7OhYBKOP7z38qTOwp4+be75R0vl6tomp
	 yKE31RQIlDFV9NCXP5Dbx2JuSbtsVqOMLJSE1xz5zlBw27i4S8yW9YSUgpyEa+6og9KPQ
	 as+ynZZQe5W6Z3Ccj2PZ9kDKvRy3XK4HwNNRJGcSewsB38Qb3NwT80nlJIwfr+8gOrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VJpG0KekBa/NY2yha/o6EWqyLiVRn3sfx78mJkKNt7k=;
	b=g8vpyz1LlM6ZkHnm4CXnQXeWzfxeaY3tArgStTOIz+LF/G73HICwQZ7yaCf5A7X811FL
	 twMx37XwDVYpjeBMD82KufPN+fLHJEmYvqhi88gMtenIa0oRULxgAgR6aZoUvNiS4Cm8u
	 vkIJnXDbALkAD7MsKCdHQ2nmrF7HT9dCbuvqRhGjw+B/QHP0LuWPXDneY5pxrrZeBIoPJ
	 Fns3Q/yVdu716b9hySiVfYSxs5rpuNtVGOPs0HAI1fG3Er+nc4EGV8GTLCN4ZqpdZuKI/
	 IUsQHU5XgnNL2fJHBy4ZPjopnhp3ZuoBvRhqSZppoPPuEYrXkd0mSmjqOqRegVxtB2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JdfJlGfz;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88167606A337
	for <linux-mips@vger.kernel.org>; Mon,  2 Nov 2026 20:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88167606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JdfJlGfz
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so28797355e9.3
        for <linux-mips@vger.kernel.org>; Mon, 02 Nov 2026 12:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650482; x=1794255282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJpG0KekBa/NY2yha/o6EWqyLiVRn3sfx78mJkKNt7k=;
        b=JdfJlGfze7wgCvUiIjxkJp5J7LkEQXr9SCfaD7lCrcEwTnSqiV6V/Fgu59HmJ7yPs0
         LmHn1MKW+31ahNi6cQvICo99kKjjHD7tkTlbGtAyiuIRxhYyghB4bco7AjcWD4lg5O7F
         OEos0sTuRA9Xpe0Qu8B31IXVmPg4mV7SsZYGNQyZxGk7zDu7zffAcSkfy45wpJSypm+x
         mi62d4hyhN5nL6F2byc36z2JH6KJuEnBFmSvppDy/Eg9D3X1SwFQHjLfrlaXAQpQ+Uii
         RlF0Lj+LsDJc6WiBAH4tKGn340mb1qs3j8ZYC3QqGO7htcb2oUhdbtjwqUuZmSC/AsXK
         9beA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650482; x=1794255282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJpG0KekBa/NY2yha/o6EWqyLiVRn3sfx78mJkKNt7k=;
        b=lU7q8Dm1E+6OtpR/hV/6Lazo/JkYDfmsd9HCBzBVd6f3RBz2blNeKmnlnYxf43gHsh
         /ftgXPJJMY8E5m6JVj3/Rj8EV4ddf7tNoExKRbU/hhsv1jhQoZFtOCePvaebtiSeKFxH
         zXUgALii+C3zPuQIOMXyANvOHceK+KBCIlLTkdGdd/4Uo1ze5VWh8HzfhooWd1D4zrRF
         GCEmrm11PSE4qal0I1rvEnJRdRuRDvoXxLtkIr0b9Yb9X/Wi0KUQa+P/8gUA3VcdxI6P
         P2N12oSEbsG8xnh8L8w139z8nzLgAo94TUxnJIBySFsWSQ6P17PJ6rMHrlTLs1qyFtFc
         dacg==
X-Forwarded-Encrypted: i=1; AKwUvBzdc+W8GvXro1WiL1e83aT7CshFnP6oTAqbgVV1OCl4/NLHdoapnUmKOk0tMmPzu4hQyJQekG8VZ9ss@vger.kernel.org
X-Gm-Message-State: AFq9FYLZIW2Gi4q9tX98FizBXrgf7FCKAaY6KnVzkjwksK6GkGk4z+et
	V+OkfXzySWUKnbhzFXluxZwevqQWESS1hUTvqK0+NFKndnLXwNfnkDG+rZGQjzIEZKU=
X-Gm-Gg: AYBFou1Cmzewa9olVq9mk1sBvfQpvYzUXzp2wMvDfFgsHstxejNlMlrufS+7iLHoFN7
	nvC1VVfvWB4OCh7Aky9iuQYSkw+SmGjz3H9CGEKLonollPHZrz52xVESYD0mxEn+z7ZW3Kex1SC
	ZAaI1KMt8euVXgtu9BWVlWX+R0Wakfdkse2QJ4da+j17ZgVUFn+9pvfVENNYsd1kRCa04sX88SJ
	B6gdttYp1L8VXWEilnr2eD+fHN2exUeF/Mg6tr/e9K0JcIB9OlEhkANZVQ2Zg0WJu8uoZ9QIB+Q
	y1NEAPWWodosPepBWILQfRzDfc0/Jy1v508thRMk75bGnkxJ5RWETnJw9QD+fNcb57agPHo+U1e
	2/Mwi1pkajc61aoiPFAPTmGriS7u8WasDbQU99VeuUsu3q3J4M8LRehGRY8EQ2XQCeXrmF8fuG/
	4gCkNg4NcqmNhY7ih7M9PgYiHuXdSVWGITolzlhaT65gDUBZzwSvBStNRQfAcxshVtHsLC9qqk6
	QwYL/ACJ3VoWBuhcj+/w+UMltk5lTO+950TSoa/aw9ScSIIlp19Ln8jJKUrC4ZUSRUvgPWX7DTz
	mLrO9cKn+zMk0Be9wD+UHBQ3cA49oGL3whHq6AnMT25aZeaf2jkERD2+pJx8
X-Received: by 2002:a05:600c:8b46:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4ac18c73238mr261757445e9.33.1793650481932;
        Mon, 02 Nov 2026 12:14:41 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a8d60bc5sm9559305e9.8.2026.11.02.12.14.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:14:41 -0800 (PST)
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
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: pwm: Add the Ingenic X1600 PWM controller
Date: Mon,  2 Nov 2026 21:13:24 +0100
Message-ID: <20261102201325.29507-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102201325.29507-1-olivier@mgcrea.io>
References: <20261102201325.29507-1-olivier@mgcrea.io>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

