Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203149;
	b=Bhhm0my1n4cl+qqeyNrbfssRVboVYJ9avN8h/sgD4/HuJF6jBWDS6USVh6gq14sdeStS
	 e3n9jnkpULH052rutTJtKMMv5PGeRbY7X3cAN6d1hXFN8pzEkbZNHnFk5XseBGnPLO1p5
	 8mjBaTD2q+eGAzkUpcUNeQRrkJEokiVjLwj7bbDlfRD1zbI2NghzkPd+JBw2U1r0du6Td
	 fhHdUK5vPu+JV6Zusjc2PmF3TLtjHb1vnw2sBb+OTqnFhlGh9C5t82rozTlJsFsVt2KkT
	 KG8DKCJ5QyNIp74LWl4TpQ6u56ZeReKgxF9M/RYD7EctSIa5KninqjPKAwumIvSnA2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203149;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=w3pptnj/D2W5XuQibYYl6K0USDYGZp10WdNC7R5g9Rc=;
	b=1XcjM1tCjODSHy9Da5jYn+MzPiwohv0mJFHc/yUUVpPEq3yOytPu6lwpWsB/AJFHXU1W
	 trZi25tz3rAOaOfhLqc3jZtBnkHPUnmeae7b8LfHi+ThBciwOjB9LRAlULMCVbNlE8JqA
	 a4k0De7v36e3zCqbzJ+fdGZovxCZPcKjXqKP3KzycCpLYfr65OfBP42nR5XHJ/MaqbHTP
	 rbPrY5yn9ALOK/YwXiUHhuKLqZJcH1yEtLkMBk3v73Pn5Wb5Vm8dD/42uxUlddJKVm4pJ
	 bsMyr4DVVGR/GrQdzJWAV2h0jjUiWp+Vpnjtg7kebpkNt7+I08Y5eMTnVrLQ3spMzAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zsFRXLB5;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBFC606A33E;
	Wed, 28 Oct 2026 15:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BBFC606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zsFRXLB5
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B49A84E41364;
	Wed, 28 Oct 2026 15:59:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8833A60769;
	Wed, 28 Oct 2026 15:59:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA0EA10328A20;
	Wed, 28 Oct 2026 16:58:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793203139; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w3pptnj/D2W5XuQibYYl6K0USDYGZp10WdNC7R5g9Rc=;
	b=zsFRXLB5CPCSe8W72dIFjxbCWZiZJkebBa1kCk73N1ZGs/rM5vzpBqSpTG2eLyUdROg/GN
	Uo6+nOyfBRMeptXS3FiwAPmTRX5toCRPG+l8a8eqlTatwI8NvejS37IR8pU6c2XSHW+X8E
	BNYbqtzPZSVYxn1a2qklGVlxLy8mQGiB0FT1+H/uCrFVjalr7h1CEnfNZ1wdHcXG8PJYGB
	ZTPttbHuaqCXB1NG8WIe+Vs5R1fRksiN3uxTDrFr3TpD+duLT6aF6/HjN8GeS5Uv3sD0g7
	eXnsIKrmjxqPoolcG5lGao6MDdRVUAZYOvAQVnuq//Nb16XEvSD/tMlLB2yOmA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 28 Oct 2026 16:58:48 +0100
Subject: [PATCH 1/4] dt-bindings: interrupt-controller: add Mobileye EyeQ5
 PCIe MSI controller
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-eyeq5_msi-v1-1-c464752fb55f@bootlin.com>
References: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
In-Reply-To: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add binding for the Mobileye EyeQ5 PCIe MSI controller.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../interrupt-controller/mobileye,eyeq5-msi.yaml   | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
new file mode 100644
index 0000000000000..919af55fc8a60
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/mobileye,eyeq5-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mobileye EyeQ5 PCIe MSI controller
+
+maintainers:
+  - Gregory CLEMENT <gregory.clement@bootlin.com>
+
+description: |
+  The Mobileye EyeQ5 PCIe MSI controller snoops the MSI write TLPs of a
+  PCIe port. The controller signals the parent interrupt controller when a
+  vector is pending. The memory-region property gives the base address of
+  the doorbell window. A port supports a maximum of 4 MSI vectors.
+
+  This node is both an MSI parent for the PCIe port and a chained interrupt
+  controller.
+
+allOf:
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+
+properties:
+  compatible:
+    const: mobileye,eyeq5-msi
+
+  reg:
+    items:
+      - description: GCSR block of the PCIe port
+      - description: MSI vector control block
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  msi-controller: true
+
+  '#msi-cells':
+    const: 0
+
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Name of the MSI domain. If omitted, the node name is used.
+
+  memory-region:
+    maxItems: 1
+    description:
+      Reserved-memory region. The hardware uses its base address as the MSI
+      doorbell window.
+
+  num-vectors:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of MSI vectors that the port supports.
+    minimum: 1
+    maximum: 4
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - msi-controller
+  - '#msi-cells'
+  - memory-region
+  - num-vectors
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    / {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        gic: interrupt-controller {
+            compatible = "mti,cpu-interrupt-controller";
+            interrupt-controller;
+            #interrupt-cells = <3>;
+        };
+
+        reserved-memory {
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            pci0_msi_reserved: pci0-msi@806000000 {
+                reg = <0x8 0x06000000 0x0 0x100000>;
+            };
+        };
+
+        soc {
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            msi0: msi-controller@5840000 {
+                compatible = "mobileye,eyeq5-msi";
+                reg = <0x0 0x05840000 0x0 0x10>,
+                      <0x0 0x05840040 0x0 0x20>;
+                label = "port0-msi";
+                interrupt-parent = <&gic>;
+                interrupts = <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-controller;
+                #interrupt-cells = <1>;
+                msi-controller;
+                #msi-cells = <0>;
+                memory-region = <&pci0_msi_reserved>;
+                num-vectors = <4>;
+            };
+        };
+    };

-- 
2.53.0

