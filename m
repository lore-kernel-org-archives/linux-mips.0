Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788132;
	b=z6R0tRjf5IwgDXoICM9GUyJ2S6qRw86V7BnQI33IY6TyqUaci/ROTm3C/EttDM2M8K6h
	 w1oQfGNQPBw/VVVPrR3IjtNdqlxB7GTfcbwp3En5zKeuH8kGH57Np5vGm8vfhCgGyYFfM
	 80KyeXn0rLOvkOf3uWhOWH2zM82YnoE2X1ldV2Vd7Tgdy53X3gzdXAvNNf18FWtKWHVBE
	 /Xm8jUtPau1T17egJFvpcRU/BTq/fMJLy3RHdN8gBBJwUivODrcXH/V8V0WooGpzX4Cgb
	 wnVshi9whXMPEzUZWfpDRieSNH+HdXK+rPHsPwd+kk8ssPvfEFDSdyFmmpSve9ChLTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CltLoSVZI1vl9e5Xk8AH5ABIellf5efpdTrcem8ydxA=;
	b=F1gf5YQPJYGwDBByYRN4i+4jdcIopGjvjoYoeKRx5WUFxUaxtyU2XDzg4RswZ7CIWes5
	 lRHK3Ts1zFWT0gJDwIo1tHXC8DdQMv9zNF/thQcysTyR7UvjjlstKOFURv6GYVxVr12cW
	 jtoSEN2krA1KUQ+5eSi3Ihv3871A3gyFnfDITQnkm+nUm3kCO2hXFjZ4++q1PPzK0RNkj
	 XtYrhndCXhADeYWxIC4+62QsUpQoH1W2ZrFvrofd6SLFviO7Y1EBNN2eGla9+yul/nwx2
	 Ug48sN9bMkkI5y9wQmSbcOghgfGDAvxwxuPa/0eerwhCZYN8mvSY/6j+8psfKteX8Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oBwgfwHm;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A8A606A32E
	for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 20:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A8A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oBwgfwHm
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so797694f8f.0
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 13:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792788130; x=1793392930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CltLoSVZI1vl9e5Xk8AH5ABIellf5efpdTrcem8ydxA=;
        b=oBwgfwHmsmBxfTS5JX5faiudumKHXgvyGSxkRfoSfRdtoBdDGifQhNkwXDGZFrdbLM
         8cFvt7/panM+aqJVOdfJZE6KWSVNcByOIC/JoCTQZYTPP4uWqSRBG4PBQz75NV0Ipe9F
         wHUFc7co3li5NzRlwqZY6l3sXhtOW5hRYK3uT8jlE1HAFYYaOjOhoIum+LErH+ls1efd
         GmmpSqooWmac6Lpyas+yN0e+D5maG6px4YdIK/DL6dqJvU31vbeJwit18gc06ZkwjCk+
         GDffnYK0+S7/4E8YjhLF8buPz+z8XeTCz54JP+vYhxw/74iPIcDJKZXJP5PTVXYyitTZ
         wQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788130; x=1793392930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CltLoSVZI1vl9e5Xk8AH5ABIellf5efpdTrcem8ydxA=;
        b=Rjlc26EQrLhE/eQODuZdnKmpCD7IPkFaMn0ti6iFKPzZ2pe4r1Bs6+bzwmwjPB6EKz
         cZKq4btX/AmBmjFnU4QhavodgfupzoD1NBVfGxM/WmksLydpfN05CVMSGKAW/PQL5okC
         CDHqkVQ/gZf6b+ifVG2UyCuHeAg9bufCoxnm5LJpiPZZRwede/a0+3jidlnBlu5f6CLB
         GCDZs3HCqbg9m/9oj31c79pVgg/xNaQ82lxA8OP+YbLrcHLIq6J+15wEOwLxrl1etHj9
         LrFL1rTCePMBraUOL88PXzhQe1CTITfhA9kz+3kjJjd5dNSWNfEqoswAlGyE72I+7qk6
         cfBg==
X-Forwarded-Encrypted: i=1; AKwUvByw2sUJwZr8SUMqQw3K5wssqByyoKSWWD7NPtIw8u2Fs2b6MpqUktFxfCM/+JAq/2cEuMDmp/KVU+1v@vger.kernel.org
X-Gm-Message-State: AFq9FYIx+NiD2CNNhQgCPk5RXT2syFFx+jKNAwFqhZBoAUf/S/Pd8LUF
	bmAocKUssxfgs9IWo8IgJRuKh6Lid+ngqYaAUr49bqE5ySOMPGsfK4RdSiaIk3h4owg7T/t4kkt
	v9SQTWFA=
X-Gm-Gg: AYBFou1UFJdQplRT9iEOBq8JfKClh+xbwE5VShbj5Ld534OcZXokx50/OTwD99sS+A8
	WbrHNYbBbOFEUOHKrKiCNnKRApg8WjmsngpvcdKf7lIYTIW32dgmgTJlzqiBmDolYx1Mb/D3FM5
	BT1wKnMc/8UXn0ENQ5i1EQgMHDYfYJzND8KAlbGBKO2ylito6Y0jowcYNazigNYiDq1rWJJGitP
	JFKSXA/U0rqK4JAP7VjyakCXpTe2mxc9W94vl0l7p7JScE1ujHWR2ZxD0Ulif0L6+iHErIokywF
	/og7GpVL0S42dBeXH/mdd3mgueEQ3ZSCFvB/fJLUu/1s1mE8r/kdoXaIxyMLsOpt9gJmsEHBMmW
	mas28aBsmxw7k/coNU5YJUo2PIpjzj7uxCXO+x3W/CAX671QMBS403aACQNGPBSFez+bIzd/KKT
	48Tk59deXEc8fbShuVSLD229qRRxyhsERP6oX3ArbSeF11GDHx1iJ2axkDLlMov0nrQJoLb6xve
	OON0J42M9sCeOEBg4UpLckkS9RKt0hv8EAZZzIDj/jh2P2By/jl5GrEcxEh18j8FA08dc/MA1ig
	Yr7hmUJVXxI=
X-Received: by 2002:a05:6000:470a:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-48e3ed1ef39mr167225f8f.13.1792788130622;
        Fri, 23 Oct 2026 13:42:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm200998f8f.33.2026.10.23.13.42.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:42:10 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Fri, 23 Oct 2026 22:42:08 +0200
Message-ID: <20261023204209.48556-1-olivier@mgcrea.io>
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

The X1600's SAR ADC has four auxiliary channels and none of the
touchscreen or battery engines of the JZ47xx ADCs in
ingenic,adc.yaml, so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..7886836b10c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ingenic,x1600-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 ADC
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The SAR ADC of the Ingenic X1600 SoC, with four auxiliary input channels
+  measured against a 3.3 V reference. Its clients select a channel by index
+  through "io-channels".
+
+properties:
+  compatible:
+    const: ingenic,x1600-adc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: adc
+
+  interrupts:
+    maxItems: 1
+
+  '#io-channel-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@10070000 {
+        compatible = "ingenic,x1600-adc";
+        reg = <0x10070000 0x30>;
+
+        clocks = <&cgu 28>;
+        clock-names = "adc";
+
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+
+        #io-channel-cells = <1>;
+    };

base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.39.5

