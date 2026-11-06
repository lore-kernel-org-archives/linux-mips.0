Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962466;
	b=wt/SpRiHy6Ft8WMyRJ2g3uBhQEOYeyg87Sp/1sOHig5wjDsqxlCL2SN1DjnXAz6gdK7q
	 WSGznkTZXzcGDg7KUeEP3KMcu4VdbS6PiS/DuNfhT/9vPPBwdOeecUA4tKCQwZiwUWxet
	 sHX+k+YWW+/S5k28vfV5r6joqO6xGueaKwNMGXxlQ8fapgJyIwkQGWKdlYdjJbBhXekbY
	 0VsBbeaLZqcCgSdUlqKo7RY7OYc/O//UFESZvTm/al8o9AeiAAHpzeBtUJxrG5PMupU3r
	 UU3Vb9Yx2iCiNpSyaGH5oZfXm3XnEEMZ147Eh776w2N11OviwUizMLKlcOGnl6d3dkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5NEqsMSr3pHjqorQElx9gtqmjSxhKtX5m0i+RDOSZyI=;
	b=wz/kLQyaj/+8t1owTpbr041b0NXsx4HhnlKg8WksFV+acR3IhqrZ/zL3RpyK4EZLQXWQ
	 5w3CVWvuQitpfANXUYpX/+fKmqiQm5Qf5jqfKHXEKIQiUGOL6u3ue7+TfmyAbYyrGOVSZ
	 mThFZ6771ZQHNLvlkwCp6HdSHeWbFih5P+1bRCVq7VEr5lOzKVJLLZRF4EEV1KmOjPcod
	 WgVdDpnDBWTkOKzh8Sb0CZKpvp3dmJL0hlnpOlAXrCX1NOLjEDJsQxhie6p5soIYw8u3q
	 A5fGOsq5rnFBhpktKnWBgsC7MdDKZghPOWBSXo+LQ44nJHHeBWW4NfXCutp2VLj865w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iD9Dttiy;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13846606A32F
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 10:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13846606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iD9Dttiy
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so6163505e9.3
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 02:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793962464; x=1794567264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NEqsMSr3pHjqorQElx9gtqmjSxhKtX5m0i+RDOSZyI=;
        b=iD9DttiyokGWik/9lX7kkjGlj6NpUKTvyqyOFRbsvGvAn3SQU7WzguD5EG9JtCHUg/
         /hNC5Ls1yAVelLYySciMLDUyIUeKEUde4sxJqCXcaSc6mNWV/ifUyug7cPQBR03EW4hQ
         SyANdz8UiuD+iTx1FYEEl64Wk+jgc/rsM5YK/dzKMtevh7f5yfZHOo6dGGXrNw0kciHe
         3q0QDYP8XfkG7rQKkfqMPUlfwy13zlF2E4qWDrgrCdsUubVnGcpe9bGw2Bh1wyM1eNol
         5djgFmvx6dEPXbOnCkTQa1C5ZoBtfr/3yCyeWapWOqcPEf6y4x6V6UK/I3T+Vfr2WDOf
         k/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962464; x=1794567264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5NEqsMSr3pHjqorQElx9gtqmjSxhKtX5m0i+RDOSZyI=;
        b=x/KZYjOlebv05FlRTBXzGodU7JYI6ZB6Subd8OKlhwU0UdGuUMuI/PplwXO93Ivphk
         UHA9BzdfSxZYvtzvxeBZE93Kpfkhb5TYuniPjahucH02UzE7fh9NJ1jofpM9rxekR/LU
         DTOpQypzODObEmHkrV1TrIZ/HKGs4H90NGrkZ+w5QdIlwUjBkSmLQSAVFDDPO4ZlYs3u
         bF4OqdP9hl7DEwh9jhjomDB0xU0KKd0DhkV+Dw7KBZ2593Nuo7KmdU2UZez0Cbadzgg7
         bm8VgvF++b9n/cW0sg3odJhT7vDqDD8S5kupFZaxYDuLCciLAzVe6vrB9WmPyYsTFdKi
         qnwg==
X-Forwarded-Encrypted: i=1; AKwUvBxVcIlDzUTnQximMSnxJzou0VnAX/Xv0UB7x63unBWlj+RKt/mea3BW/xHaVTkY8xI4xCj2Zt6zvHw9@vger.kernel.org
X-Gm-Message-State: APuU4Z+AzFibO27NvtBYKYQSRPQTe0kPoKnR7DPLpoFomZrcSe7n94JX
	mmlviJNKshAdr6VCMdBv1lk8ZDbfbbxNHs7+n9VHEeyBPVAJjVBmRlYd39uCF38vP3g=
X-Gm-Gg: AYBFou14AuzFugouLqZxFd78uFCpwE7roSoIzg2Pianr0Yejkozpcy27LTYd3aXOSva
	AMCiJNYxOt+NHXu0XIrswjSLeGWmiGcs8zL90nUk49ycKyXZ79em/ubtjT3THKEzJTWRBenLeAl
	EzjgkLetEYmSIkujTSpgdOU/sdNa9YIjfia5mhKUxqy6hifb3/LojzDwuXlVgILovcdRnt/mOPj
	+Lf1qYD1T5t1Uif0YwR0/BXU78atp0A6A0eUIlukjMrNT5HH+6O00qzm386inMGuUuie07eDqJl
	VIxh3UVyVMAC5BwKJMoSIY1HGA3stVJlfmXxKvbWMU2wkLYc6EKK6VxNeYJhy+8Sg1DCHSkF7fD
	hrvXI6hOZ/zQrOwlXkdIxBkXVJF+uSLZyQ73EIBH6IQ8jLiDAmNefudHmNevU2jnVn9IF0+xoo7
	dstS8JhTV3D5ZZbJAO1SwpyJJfT/OhURoQeUW5SAIfdYyZJ9/cPdD0ldieX/LGIJFTJlF+w5tPr
	BQ7Vf7IQpUm0prxxu/UydppOU3KvsZCoeyn3XC9j//FeOepACBtR+icxSWLADIL9gEekU4s5KJb
	979Drn3MLtwf+4aGCnq1yoD7ARkdAbw3RVl1atCQxFwwBJcodkRmx9VR3OTokeI=
X-Received: by 2002:a05:600c:4e41:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4b6dfe8f3c1mr33593735e9.26.1793962464578;
        Fri, 06 Nov 2026 02:54:24 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm125584065e9.5.2026.11.06.02.54.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 02:54:24 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Fri,  6 Nov 2026 11:53:57 +0100
Message-ID: <20261106105358.59616-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106105358.59616-1-olivier@mgcrea.io>
References: <20261106105358.59616-1-olivier@mgcrea.io>
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
touchscreen or battery engines of the JZ47xx ADCs in ingenic,adc.yaml,
so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 59 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..f5d4726fdbae
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,59 @@
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
+  measured against an external SADC_VREFP reference (typically 3.3 V).
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
+  interrupts:
+    maxItems: 1
+
+  '#io-channel-cells':
+    const: 1
+
+  vref-supply:
+    description:
+      The SADC_VREFP reference. If absent, the reference is taken as 3.3 V.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@10070000 {
+        compatible = "ingenic,x1600-adc";
+        reg = <0x10070000 0x1000>;
+
+        clocks = <&cgu 28>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+
+        vref-supply = <&vcc_3v3>;
+
+        #io-channel-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0017755f593b..4ab4ae67f788 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13176,6 +13176,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 ADC DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.39.5

