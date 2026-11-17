Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794875506;
	b=0f3/BHqpZs7jVP0oEszkfodrJaaklKM7N02/dX3UMZWHAsZ07jU5isl3veeyYwk6ePfY
	 KFP52CUarpEhTi7QAoX5KkXJePtvnd5GmIOZhBytIhqv9coIBlrEL1oIop+HBTbgvfPzu
	 MjqTh0KAtUvxWF2lZIsg+ro4+neAX1y3g1mVJUOIDAD/02Xs7chjs+zBMtDfcJ3QPag7/
	 qXf2k6GTT7gXaMzpKj3YBSbDRrw/doq6onAoDL1uj+dYTNLIGA6FAgZ1ZslHL9PpfkA01
	 hvCBH1qlgfOKkxvU+q1JrNCqh1KPJVDo4YwxzLGKA4eRkV3KQUBHkBgB6NrLYb3Ebkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875506;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZKT+sZzZuKvfRrL66YEHa3jO8cYi7BVLbrVOtdzv/+s=;
	b=cQP+onj/aNaBNHIOuR5CTvoHuZUpkg7/jyDVXJS/+CsUgJscV3TTgcd6Ud6CMfPeO77t
	 omcV0fCfpDExowe+IB5xxiBPOlwCrQW/sZKpkgifXz67vBXPjjMhRqZyuecRiiN5fBv6c
	 HiMGW9r2lMlvYw3/Ws/vpcrDZS8Odv5ogDVDi1vUPUxeWeEo6lfCBP3nPX7ITJTaVSQgv
	 CFITZAKnZ+e3x26Zp3qy0ZSKm0PaPrbFJUF/VJqdSTojGwT7vOJLkZ3v8mXfM1TSkAumA
	 xwMRWyHh+nEjDnPsyDNw/HrrgH1G1dMWRC7htnQyGx/0hy3VZtS8boMuUn5GaD+HsIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSuh131q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BE3606A333;
	Tue, 17 Nov 2026 00:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSuh131q
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794875505;
	b=AlVpFnaslZ1O1LIIQgjx5ZHYwCk0WYkvAW3Y872cKd5zhxNM7PCkT2jz/OPXbM8vOWAC
	 yh5POaOPSIKv8gaasfd6m6x3YQVtx6HGxKQvF6LX49/JiJzauwx7hf/9nq5Qns5AbPjTq
	 HaJtDYh7tBSuehbOYpMSu5NYB8tNix/2PKsD39daaCcDTNos2bm0V1s2oP9hO/xDYmhbC
	 zeqDLPWvahF1jIN2E5i+OaQqUfF3b5opAem7a8/dQUWLhyF0hSf5xUGA3v9u/2+ngNFqG
	 MeKj+HU+L2bKW1s+EWsLQKZxQoZDngiZ1DqNiGO5YgYc82JDqIszGg0uCUX4jQr2m7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794875505;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZKT+sZzZuKvfRrL66YEHa3jO8cYi7BVLbrVOtdzv/+s=;
	b=eeQJiRj8YUSOoa+j4g3bMsz7OqG0HZUq52nGQabmIxQPQ/eictltcXjIDf0HtfZ7qQam
	 6qbUJ0pC2EtMSRefvX2rpQ0+4+A0boPNC7pLUrPSCfUMO/iWj0kz92ZwUJsCGZjcNGU/q
	 m2ZDnL2ypCj0OqA7JKCAJOH2ivfOAoP0sJklpw9DOXyqFMk2+JhTPCtc050kedYlmIegp
	 +44M2fyjB4ODEoyB7aWzueTe+VsrYeobDiZ3CaqZSUbCr2ssV95ph4TDPBghw7xWgAHJa
	 OSCKMx0QEIhe1t310lkQDLjLNh8TD9hRK9sIl2go0nq7gMmgW3LM1TJtx5f7DV0OCtA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B7A11F000C4;
	Tue, 17 Nov 2026 00:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794875505;
	bh=ZKT+sZzZuKvfRrL66YEHa3jO8cYi7BVLbrVOtdzv/+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eSuh131q+DKzGfwToYM8ITAtf/1d3Ibn93TH2qJEiuWCBMlUjUK99Z6rPGaP0g4AR
	 B2SO7wGTo0Ard/sQY8K3aBPTvxcA93/E/YM4xzVwOosG6Sjpzp9Do+nAp/4u2pvMiW
	 Iq0I26Nc4H3C2RgnjtqgF5Z5411DFovpbutY3R3cyJOo9+BpDRpdJP18yb4vigfJsA
	 qgDH/uCDm26RTQQAkAGYjJT7s275PrBPg8FRak+igzZeuuWg5fJt50yC7QA/qLp1VP
	 rV4i0ktynYGeJI+BuuyKUsklJc2RB1RWZvDyWMUHiQEBQQio8I1wFN1cWbfDXVWCBX
	 iRWLHAYJhNITA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F0CEA4A635;
	Tue, 17 Nov 2026 00:31:43 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 16 Nov 2026 19:31:32 -0500
Subject: [PATCH v2 1/2] dt-bindings: phy: Add Siflower SF19A2890 USB 2.0
 PHY
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
Message-Id: <20261116-sf19a2890-usb-phy-v2-1-df3ce9d23f5a@telaak.dev>
References: <20261116-sf19a2890-usb-phy-v2-0-df3ce9d23f5a@telaak.dev>
In-Reply-To: <20261116-sf19a2890-usb-phy-v2-0-df3ce9d23f5a@telaak.dev>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794875503; l=2519;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=f6jkKWPEJpHvw7GQNBeKtVPZhfiBTHRuEikeBW1F/aI=;
 b=0TxT4hFwBX4ctjLhXol0oKfxcNcIOA3WJkP411dJR2TC1ExAKcf6SnHtBpX7wIYkFW2lqMbTI
 lu+kvH7q+VzAcikxQhTikykSr72v7kvhRN87bMjSXdeBLXYdLyI6Oly
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../bindings/phy/siflower,sf19a2890-usb-phy.yaml   | 58 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/siflower,sf19a2890-usb-phy.yaml b/Documentation/devicetree/bindings/phy/siflower,sf19a2890-usb-phy.yaml
new file mode 100644
index 000000000000..77b8e35d8017
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..7033d9b6152d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25698,6 +25698,12 @@ N:	sifive
 K:	fu[57]40
 K:	[^@]sifive
 
+SIFLOWER SF19A2890 USB PHY DRIVER
+M:	Joseph Telaak <joseph@telaak.dev>
+L:	linux-phy@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/siflower,sf19a2890-usb-phy.yaml
+
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org

-- 
Git-155)


