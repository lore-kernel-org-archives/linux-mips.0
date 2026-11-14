Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650775;
	b=i8L3k1Z2lItnIL0M6eDMqd8y/VifqWZvWpEWmwfxiXbs4xc1Xt234NcN/hRHFgPJpVG2
	 I0Amb/T3fCzUHFCoxocb7/C/xfoe+FMiubATCFnvmixoTy0Ancq1aUaoQJLoSQ2uqWwoc
	 30FRutmKncEFcWd7CvK8B5P/bdjpHSCWb/5sjRyKst6qqI0XYpKKiOTePmzQas6Ucvedc
	 /N+9Qly0hrHQo3zuxU2t31M0lIY2GSLio2LV5sgCrWmR+INKGhiv9YRx/cqdO6Q9tdpX4
	 ohxHu6MSqxDA0yhwbey7Ii47wRKjTQaA/c6Kw4t6a5LthZVa8TGYQPqZ7L6qv3miPsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650775;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V+6iIGb6Xz2jGcS8GBEsfoNM5QVNb6M4ABjpFnFddxg=;
	b=hawRP8QSLUZv0CSYoY1219zFd5a9iPs/J7t9MV4yUcQNlWMOCHxxGYfjZLzzqlOIn9Zv
	 e4wGreYaEddHHBq3yliv9kgIZIIzhux7Cq0Aaq/QYTMtnCl7rCePMt6e7ndLBI6NVU9xf
	 yg5jXx5J68TbhaelwgrWQp1XDVEyANjseVXQoGCUUY2uUMluxLqPZMAa43gOFIkxkNO7H
	 88mbl6ZTAJdvtShGyDope6yb9VxR57Cj1qqaIGK/pd3nnOqhxD2jtdpTeevjGpl1h3xgV
	 3a9xA864tHsUoOevFIJtaQAg8Mi+zXP+xT3KJaBxkHb4xApW9IXLBgnW2NDYHrdpdjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=cWa4WdSw;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 9F77F606A329;
	Sat, 14 Nov 2026 10:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F77F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=cWa4WdSw
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 65FBBFA1B0;
	Sat, 14 Nov 2026 11:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794650772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+6iIGb6Xz2jGcS8GBEsfoNM5QVNb6M4ABjpFnFddxg=;
	b=cWa4WdSwWsT5C/SeDnE+qlLrPMgSz4dHOWdh28jrmjJvTrLRDDeAy+7FxBevFaHVCSadqE
	Dk+Wg4lmODtpSUO+/uviqPFERdKCaWk5oDgnWsFcxc64SomolASFXLqHXT49W+I6y77Dl/
	5ck3SWn0p1JhW7c1+1qnuX/IZJ6rfiT8NEcbuKmMlkRv+6yarheUrsO+Y2uHtcTmAsH7lI
	IRNkxmRmD3wqmIHpjj7mxzGZij7HDGZUBkkubJc+TceK7iNsjTNAvkb49+SWbVf03tMfdc
	Z4BQVH4qH2iRQ5+HfI4Y7EwkE9/jKJURA6S1tNEqPVfpriSB1A76M/cb3eV04g==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	John Crispin <john@phrozen.org>,
	Sebastien Decourriere <sebtx452@gmail.com>,
	Yangtao Li <frank.li@vivo.com>,
	linux-kernel@vger.kernel.org,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH 2/5] dt-bindings: mtd: Add lantiq,nor
Date: Sat, 14 Nov 2026 11:06:04 +0100
Message-ID: <20261114100608.3432120-3-sw@simonwunderlich.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114100608.3432120-1-sw@simonwunderlich.de>
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
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

The NOR flash on the External Bus Unit (EBU) of Lantiq SoCs is handled
by the lantiq-flash driver and used by danube_easy50712.dts, but its
binding was never documented.

Add a schema for it, including a new optional lantiq,ebu-swap-check
property. Some boot loaders, like the BOSS bootmonitor on the bintec
elmeg RS123 and RS353, enable the EBU's own endianness swapping for the
flash chip select (EBU_BUSCON0 bit 30), and the flash then appears at
its unswapped addresses. Whether that bit can be trusted depends on the
SoC: it only works on VR9 (xRX200) from revision 1.2 and on AR10
(xRX300), and Falcon has no such register. A board property instead of
a list of SoC revisions in the driver was requested in the review of an
earlier attempt at this. The property does not state the bit's value,
so a board keeps working with either boot loader setting.

Link: https://lists.infradead.org/pipermail/linux-mtd/2017-January/071749.html
Link: https://lists.infradead.org/pipermail/linux-mtd/2017-January/071818.html
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 .../devicetree/bindings/mtd/lantiq,nor.yaml   | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/lantiq,nor.yaml

diff --git a/Documentation/devicetree/bindings/mtd/lantiq,nor.yaml b/Documentation/devicetree/bindings/mtd/lantiq,nor.yaml
new file mode 100644
index 000000000000..e6f2be1245dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/lantiq,nor.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/lantiq,nor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq SoC NOR flash on the External Bus Unit
+
+maintainers:
+  - Simon Wunderlich <sw@simonwunderlich.de>
+
+description:
+  Parallel CFI NOR flash on chip select 0 of the External Bus Unit (EBU) of
+  Lantiq SoCs. Depending on how the EBU is configured, the address lines of
+  the flash are swapped, so the chip is not accessible as a plain
+  memory-mapped CFI flash.
+
+allOf:
+  - $ref: mtd.yaml#
+
+properties:
+  compatible:
+    const: lantiq,nor
+
+  reg:
+    maxItems: 1
+
+  bank-width:
+    description: Width (in bytes) of the flash bank.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 2
+
+  lantiq,ebu-swap-check:
+    type: boolean
+    description:
+      The EBU's own endianness swapping for chip select 0 (EBU_BUSCON0 bit
+      30) is usable on this board and may have been enabled by the boot
+      loader. When it is enabled, the flash appears at its unswapped
+      addresses. The bit only works on VR9 (xRX200) from revision 1.2 and on
+      AR10 (xRX300), so this property must only be set on boards with one of
+      these SoCs.
+
+required:
+  - compatible
+  - reg
+  - bank-width
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        flash@0 {
+            compatible = "lantiq,nor";
+            reg = <0 0x0 0x2000000>;
+            bank-width = <2>;
+            lantiq,ebu-swap-check;
+
+            partitions {
+                compatible = "fixed-partitions";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partition@0 {
+                    reg = <0x0 0x40000>;
+                    label = "boot";
+                    read-only;
+                };
+
+                partition@40000 {
+                    reg = <0x40000 0x1fc0000>;
+                    label = "firmware";
+                };
+            };
+        };
+    };
-- 
2.47.3

