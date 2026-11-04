Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776920;
	b=0D9FdgWW+vCxB43Fj5BipHvBqSbT85TySB/I+2z+AT0fUNEO6JKxmOplJj7QqdxxgkM0
	 oTEv2nz8j5qwPSKLbbiGQglK1VeagwK5xgrOyYmVYiDZFj5D0YPOqBNsvjYhWpFswpwLv
	 jAvlJbFmL2HNo1agcnPxJYi6exH6c/FItCc0xvZUTO2w3ixvD/ZZptvenppdI36O++D0m
	 GzcGzvbv94PnECJrSU9UI8J+uUl40HqmMY9XP5OdJCBS72SPM/w8Ci78T9mpbwF8MLEaI
	 KFTRIUuTp3kU3E6SQ3DYtjwH/yRSdnFn02swSCchR2lsADf9NCiNbt8iBSP9OvxKEyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776920;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kaYjtPZUoVrDj1nOWxW35I3iHngWVmtTFkKHlkBv6Io=;
	b=3e/5OB06hYdQum+eiSBkDvP0Fd8RkMlo2BS0olessUNj7Y1NdtBpk3Fj2EXt/SDuRz/H
	 jEVGwhoW4KR5G2dBHlcp7WTGPBlsHb4Xi7u9UXwgn4xxkQdGJXan1/4a+DZ7matTBWLO/
	 /xovBKmKROo+uZ61sq+8qumVSvNlvuCv5QZ1QXC7egnR1OAg7zxJ9KTskcrVXeh16OJ7E
	 2kVUpNEfIDURxYFVnx7t5EJ3xzxiODfpsIJbyband+rw+0Q2U72hjQ5kj/lW0Vy/V0jQz
	 nC/2kPpAEKKHm51QDZYFkGsOniwXowcHo8K2fx2k121yBh/hQXHkdCq3BwKRwU0KspA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I0/U8m+M";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81D0606A329;
	Wed,  4 Nov 2026 07:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0/U8m+M
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776919;
	b=Ds0T0RG9V2ZUvgggRbf5MzEyxG6R/3VBOczPZU/GHInvHkByNopzDBNAK6dK0Mxe4dMd
	 /Ac2VUqLwT/bL0ejTqDBzOU/1rbm7pIKbx75+S90CGzv7xUuD3auTrpnFyX2ZqaXlLEli
	 y8a9ZXpq4xbJ6JI0NLeIn8CI4AhxTtQbRn8J/MC3/2fAjfzUEGOJdLH3w30SQNBNUOGJp
	 u19JQ4HLKHP88lJVthbQaa24FuXtWg9n3cMm7v6pRj6g2zvhRHMsYbeeyeXRx8v0vybkD
	 wNRZvNGr0kMZi4S7vmk5PxsHahbQW+S6Cd7LRhcrCN+G/q5+tN5g0zwEcS+RUkNKg0w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776919;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kaYjtPZUoVrDj1nOWxW35I3iHngWVmtTFkKHlkBv6Io=;
	b=wMKioiWsWV0hPfkwqMdjKW+i2U4+gTkxyF4qOIgSCn6Q2ljmD4ksPPBCWj7RMULc9r8l
	 BrAenlcHpCk5iOD+aZNJnma8McUeeRJMbIV1s0OErj5vHX6rQAOXHRH6lUXTHrkWW3wlE
	 7UzG2wfZJg8kv69suE5rwuIZX+b5CQE9xW/40aS+fcogPLHNQqisrxRUo1R+VQ2BX80na
	 FeyZfSFPfJ5a0zzF9P8uxOLimIZ6SRqnnW5QcQTUgbOpAQoAjlBvKAU2UavU/Z/8WY9ZU
	 JG1R/au+UeqTQQNGrCHSrr5+dfTsM209gs13wH/5YZZ17QgeUSh1cUvOjPcfvF0WzOA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 029F71F0093A;
	Wed,  4 Nov 2026 07:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776919;
	bh=kaYjtPZUoVrDj1nOWxW35I3iHngWVmtTFkKHlkBv6Io=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=I0/U8m+MyI5fZ9gcN6v5mwQNdjJoNn6B1TE3JEToeFNW9YXaToi0QzuTgyCYXMB9E
	 p5BbQhht2p978ZbNaVhrY2vGxWS/skcJoroHymFZG848IQyXcgdTYSXJnlQtMpVCrc
	 giQY+ySZYNJIB+BYQ+uiHKGt1emwUMdv6/JySeqvLhxabkXM6mSDzgS98fR9D3RjDx
	 M5Cygf5HZXUw0qytqQ8n4q13YH2dZTCmE8NC579cRXbU9/0GGVdLky12tQwsjmrO9G
	 Sd1KQW1ZO6bEXicrxTWET90qAKFczy+88cK8820bldMNVCh77Bg3pf7WbOKPSiNamy
	 ixNc92olaX/jQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8CA2246D18;
	Wed,  4 Nov 2026 07:21:58 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:21:52 -0500
Subject: [PATCH 1/2] dt-bindings: phy: Add Siflower SF19A2890 USB 2.0 PHY
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
Message-Id: <20261104-sf19a2890-usb-phy-v1-1-db0cad937614@telaak.dev>
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
In-Reply-To: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776918; l=1906;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=L78MlUOk5gZfeSsbnMT/Q+d7GI1xujs8BnbBhuQJ4ak=;
 b=S0+qrfCc4jlcI0wF2PTmgXo3vKl2FLJ74NXUncXO4hPQN5uK0b3lEfp0yIN8I2GUR1VxfazEG
 hM7pafvztlZDtw85hEqat821BHMmMtIwsXdoIApjgwDO8UvQkw91GhT
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The USB 2.0 PHY of the Siflower SF19A2890 serves its DWC2 controller.
It takes a reference clock and two resets, power-on and PHY, from the
USB block's clock and reset manager.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../bindings/phy/siflower,sf19a2890-usb-phy.yaml   | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/siflower,sf19a2890-usb-phy.yaml b/Documentation/devicetree/bindings/phy/siflower,sf19a2890-usb-phy.yaml
new file mode 100644
index 000000000..77b8e35d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/siflower,sf19a2890-usb-phy.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/siflower,sf19a2890-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower SF19A2890 USB 2.0 PHY
+
+maintainers:
+  - Joseph Telaak <joseph@telaak.dev>
+
+description:
+  The USB 2.0 PHY of the Siflower SF19A2890, used by its DWC2 controller.
+
+properties:
+  compatible:
+    const: siflower,sf19a2890-usb-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: PHY reference clock
+
+  resets:
+    items:
+      - description: power-on reset
+      - description: PHY reset
+
+  reset-names:
+    items:
+      - const: por
+      - const: phy
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - reset-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@19e0c040 {
+        compatible = "siflower,sf19a2890-usb-phy";
+        reg = <0x19e0c040 0x60>;
+        clocks = <&usb_crm 2>;
+        resets = <&usb_crm 1>, <&usb_crm 2>;
+        reset-names = "por", "phy";
+        #phy-cells = <0>;
+    };

-- 
Git-155)


