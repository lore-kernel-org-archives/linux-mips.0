Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4623DD510;
	Thu, 12 Mar 2026 16:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333889; cv=none; b=iiFfkMNL4H/hTD6PMk4tVRexhxySBXLn9YS2hOjPeQeoBzg80McmDSPicDm0DNiQWDdUyRW8jQMGoMwK9Gh97L5gDsnroUP802FELJl6EwziKiT1HFJ/ijHXItnd6bjLUCU2uELFRk5wWGh5W/zdyyVsoI8Q7SngK1hZaZQPadE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333889; c=relaxed/simple;
	bh=UAoFXhruskfYYT3ahUHFS27n7vA9MyWaBRf7PXqHOUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b7hMjNNTjSGDhV7FxnTxzNrNHGhqt64Rd+ETthrjYq6vrg3TYgSdIaLLulWZAUkjdM7cPEj24/3D9/6VZpSa9NUzc9buRltxQh286arpdHwCdKB8tyvdIihKRQFCttQ2Uv5aVzCtrqmqHtol6ybvW5R1jt/iO3RMAJjyk1gF3/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Kby+tHk9; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Kby+tHk9"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DF522C851A;
	Thu, 12 Mar 2026 17:44:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773333885; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=gso2J9TlFIUpfDVYlVOReC8nln0KMuVCMF3iv5VYSH4=;
	b=Kby+tHk9MQz/X3stk/VsVQU+Hf1p1z91yird07xVKs6oHFwO51ey+ySRSNrSa3Qs0BodP2
	Uzi+B2lvtiY75HAxTKotMri4F++CnDiHVOt9+Zv8VQ0FaD/TZY2d7kl0Hxxdt6RBE7KPcj
	cZLEB1xxaVoaDprD5lLXb2HFWkcVJVStoo3Y6UjdzVvVVK+Bg1g5KBx8kjyK1zB2IsOd8E
	fFkXEF5BpLdaSz+qB2IlzdTk6xwMslEySCI6Wp/fVZO82MOKBYgAAyN+3cQl87BwtZ1RVo
	HGy1arNZrFGiqrzfQ0hfl4S/DEyGU9W5g+LNZDEWMbcDEmoOpFzqp4YWgdUGpg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-phy@lists.infradead.org
Cc: naseefkm@gmail.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: phy: Document PCIe PHY in EcoNet EN751221 and EN7528
Date: Thu, 12 Mar 2026 16:44:31 +0000
Message-Id: <20260312164432.569566-2-cjd@cjdns.fr>
In-Reply-To: <20260312164432.569566-1-cjd@cjdns.fr>
References: <20260312164432.569566-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

EN751221 and EN7528 SoCs have two PCIe slots, and each one has a PHY
which behaves slightly differently because one slot is Gen1/Gen2 while
the other is Gen1 only.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../phy/econet,en751221-pcie-phy.yaml         | 50 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
new file mode 100644
index 000000000000..987d396c1c64
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/econet,en751221-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet PCI-Express PHY for EcoNet EN751221 and EN7528
+
+maintainers:
+  - Caleb James DeLisle <cjd@cjdns.fr>
+
+description:
+  The PCIe PHY supports physical layer functionality for PCIe Gen1 and
+  Gen1/Gen2 ports. On these SoCs, port 0 is a Gen1-only port while
+  port 1 is Gen1/Gen2 capable.
+
+properties:
+  compatible:
+    enum:
+      - econet,en751221-pcie-gen1
+      - econet,en751221-pcie-gen2
+      - econet,en7528-pcie-gen1
+      - econet,en7528-pcie-gen2
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      pcie-phy@1faf2000 {
+        compatible = "econet,en7528-pcie-gen1";
+        reg = <0x1faf2000 0x1000>;
+        #phy-cells = <0>;
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 14899f1de77e..557b6a47ec98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9120,6 +9120,12 @@ F:	arch/mips/econet/
 F:	drivers/clocksource/timer-econet-en751221.c
 F:	drivers/irqchip/irq-econet-en751221.c
 
+ECONET PCIE PHY DRIVER
+M:	Caleb James DeLisle <cjd@cjdns.fr>
+L:	linux-mips@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
+
 ECRYPT FILE SYSTEM
 M:	Tyler Hicks <code@tyhicks.com>
 L:	ecryptfs@vger.kernel.org
-- 
2.39.5

