Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638266;
	b=F9bBbQic2cs4aYm4YiYAVnBohHg9qv2mxv7mNrKZZ9+8LYn0JyvQ+IdQUstoAR/qCdPR
	 S8od6qmVNjiJgCa42lN0CevIgKNdT7RCEb/VClQpobmXDSEG183312wF2wDCeIiXFsAUU
	 KzpvLtIscc9NR87ZkeIL+YdfUKEeu+S9Ldtst16JgEST+qCTyDLqKnV0EU3z59MduJBad
	 7cSUWG2EIl7VX9onLWGC8tgMKhNdM7SYO3Ug71cJhIeBq4xOBaEH5q+9eoJvNgDXgIfn0
	 5BTTlYMftxWVGgpBWsdNovyuCfQDahLeBJqLCMOyz1zM2+/pNZPcsMzaETUaWvtwNWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638266;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=4EZlC3lUoFILPCe2jxbw7fZ0vSOSvBXMvw6HNdMhaWk=;
	b=vNJ6f3/5dSj41FtaRtwEyp8CtfScqFlCdszN3vY5ZT0T9d4WciILva4KP57sH4c30G0U
	 VJQkToYtHOaGzILgUQ7D7cn5dNCU4VKvlOishjUTf2NkpwrlHAIGaq+AXDxl3zou7lb2o
	 fL7GKgFKF/ShJxIwWclGlOtRg4HJtCnWOoYQ7ivpyN6Cds+7PR91WmAgBBsYnF0qHN4t/
	 Poetr0SIp4wzoiNbY7piH7XDGGoDEl3WeDdu4lj/IQUPbxMb/3krx35F6ppL35iZ2/JHw
	 DXtd0KfXG0Pr9kmTrLzcwrrn4Q6SIvG3vLMpgAr0hU0H933yBWYOYKUdJC33KsFrubA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="0HP0C/Qs";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DA5606A32F;
	Mon,  2 Nov 2026 16:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34DA5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0HP0C/Qs
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DEBA6C8F44A;
	Mon,  2 Nov 2026 16:52:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5E97603D7;
	Mon,  2 Nov 2026 16:51:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 437EC103291A7;
	Mon,  2 Nov 2026 17:51:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793638262; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4EZlC3lUoFILPCe2jxbw7fZ0vSOSvBXMvw6HNdMhaWk=;
	b=0HP0C/Qsay4Wt9gfd+WJZKJma0PhAARJFyhjpv71uNsFXVsXug+dd2O/6ZbdI5a4LpTttm
	nnMARqNz5NbKeTXAgxoBobxyLA9Sx3PihDDx+BaifRXyBGeDyDTeSwk30+064hPVtYZZsN
	lqSKI967CtogJopdilYDvTu+WYT5tkVoGAUmhhSmL3rejb1TEPtPRO3E+qesAiRzIksoR7
	t+ezFC6UdW4ZveuOQSKlT3B3r0ZV01TIRXZvHfQnT0sNMCNFv0AY7dOLgftZh5kw8tYNVe
	2dG4O0lgOkZs+tH3H+pln9DoiKMnxMmPFtyFS0R7bOBT+GVP+HFOOOyRqaf6kQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 02 Nov 2026 17:50:38 +0100
Subject: [PATCH v2 1/4] dt-bindings: interrupt-controller: add Mobileye
 EyeQ5 PCIe MSI controller
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
Message-Id: <20261102-eyeq5_msi-v2-1-4aa3d3608064@bootlin.com>
References: <20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com>
In-Reply-To: <20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com>
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
 .../interrupt-controller/mobileye,eyeq5-msi.yaml   | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
new file mode 100644
index 0000000000000..b86698e4f82c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
@@ -0,0 +1,90 @@
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - msi-controller
+  - '#msi-cells'
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        msi-controller@5840000 {
+            compatible = "mobileye,eyeq5-msi";
+            reg = <0x0 0x05840000 0x0 0x10>,
+                  <0x0 0x05840040 0x0 0x20>;
+            label = "port0-msi";
+            interrupt-parent = <&gic>;
+            interrupts = <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            msi-controller;
+            #msi-cells = <0>;
+            memory-region = <&pci0_msi_reserved>;
+        };
+    };

-- 
2.53.0

