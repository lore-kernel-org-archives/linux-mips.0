Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385655;
	b=3e6QKrXVvHS0wuYaTf9en9tND7FIIjHiKXD5jwKuu+CbNyH75iKHGJOPrJ0vtMM3nB3t
	 aoct60MWiKOS4eafWED9nRzkAqFImxwa55Y9FKYalXRry1rTvb5y53aTkz1A56BpKUY9g
	 yWiRRay3GjCey+gs/lYyOWxVnTxodjq/akDut89jqAwk9dl7Nbbo8eyeUKFU2qM89dLF/
	 Ub0rTNJCuDeEY7qi7GC5i2U+uLlfwTI+LxraqXsz2OuV4tMUNg5OJYJP7aJzTC/dirlAN
	 VHUwXBJNaGhfo45a2qSrMKyCRgWcqs3oK2yEzBAKxQCxMNXB/EX63mel/j3UGiXWazg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385655;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=S/s28zKC6xcxr0kfKxjeMoI3STbQfIuzp4nZ9RWzGuk=;
	b=CUlYLP7ZXQFP3jp8rJw6+S75R0//3AP31DFZbjbLoHwJpc7RGVRa8gUxmyvO1JYwVmAG
	 IR/LwHs5MTHXVPTkmWyC3dGgmnAMyKnbepJjTxouvKN4874rQ4pdU/gu27YEsJy2oXVrt
	 KyUDz3GJ7M1iSi/gqK7erR4zwY5NGzGO6j3asOCOgfMeBnCQGA+jsOKn8OrG4KeAzdoay
	 J6Vc2CSJKKxKG32vvNd9oV1afqMO8GfJk8bETFoziiQXErHOIwjTX1gkeSR8myryjJs+/
	 Tc5d5BhCj4keNKOBWEEBIxsm2epXR22CCwuqvwoOrAAl7/TEaU7wsAJHQrq62W6ETiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CLpwvzm+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF2760A2601;
	Wed, 11 Nov 2026 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CLpwvzm+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794385654;
	b=KqXvtsnq2CQF5yp03TYqw+JM24iFUh0yuYlYeMdtU9QV4MKbEr0WRJ+e9RElOhqDTWzt
	 SFCCGtSm2OGrBloLamv7zv1Uh/d0sAZTLP5Qd1zkKQlSxD0wWgZiw8IR2IJ/7QToTNXuI
	 v3bF4RO7cUbufiheVy9piXOIl1+5aDqYxTV3it+n8OWtiSwMnALS/Xn9xK0lhjRDYYH7/
	 jNiXsQ5jiEyVxEVcY4nVpwtbobBX9inrMb7Z2Od3BWHaPpY9Kih+HvWYfjfE8twBSvBYm
	 E4ZgShKUttG0DGRC92ZQSbSJx57gtR3BqnlxXss2rnsIT8ZsgVSHy14186g2J8BOKEg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794385654;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=S/s28zKC6xcxr0kfKxjeMoI3STbQfIuzp4nZ9RWzGuk=;
	b=EVuMMuFuBIi1a5vRKxSGAd1oSzZZ+xDG0VStT2oYRZ8+HYoc8hvGFtdoBZ0zFlD0Sp7Y
	 d9+4KbWiF1F2RDvOn89d9cuzr1N2KvZL9nXmzUPr6M1GqEaoh50ZLJZNW+I9KOuLsbWur
	 U863UO23FPGwMRE+USr22ntja00hefFQdrdt5pBvsw2is9OqKuDtWASm40MMznFKOhhqA
	 VRrLkjJiFl0v7UiBq6I4kzehLb268T9TykXC++OfiqRChWQsVmFV5aO3Aqj6iZqeXru2e
	 tpRbupBpWum1qbW0VBYK6OaDgQeFnF//Q9gSFxdfdeIVH3GAZELP7I5dLTSU5S4twYw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F2C01F00A09;
	Wed, 11 Nov 2026 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385654;
	bh=S/s28zKC6xcxr0kfKxjeMoI3STbQfIuzp4nZ9RWzGuk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CLpwvzm+HtYRmUT1NgGzwlYkGJFn+dbBciEz8i2nQLutGRlIO2jDaTi01S3h9G06C
	 g4ra4r7B0lXYl6PJ9rH49ZJd5oFkMKqAGEyIsdewwBA2ZwvKMm9nKwLyo5DuHs66E2
	 fL4mw3lGY+bU+UMYlrHyn0CshHitCNzjdZ2asJS7/pnyf6TczTutCVx48kuxZv5wgm
	 4vEFDIbItijgS+KLVXgBhTJ04RIsfZa35II9aky79BGbl+FQP+6aylHu0v7R94TZLf
	 BD0oYtmqxLde8bTB8hHkYjPc0Eeer/GcOfpsXcJPYH4sbrWHSpfSyYs+j6gInrwsUY
	 dA07uXqiL82qg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F0A0B48E9F;
	Wed, 11 Nov 2026 08:27:32 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 11 Nov 2026 03:27:15 -0500
Subject: [PATCH v2 1/4] dt-bindings: mips: Add Siflower SF19A2890 based
 boards
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
Message-Id: <20261111-sf19a2890-mips-v2-1-36730fa4f5a6@telaak.dev>
References: <20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev>
In-Reply-To: <20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794385652; l=1790;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=OJIfjvntJEidxFP5868AVEMpXF93c+J2djXrcnoJSGI=;
 b=DqSD4UneyGa3ETBdesCJcKE3tvHGtKtPGwRZiCznN7pDZy87/hlF3OSBY73UvMrBp2a0fQIlo
 uJI2xm1oyDTBA8q0y+sFGsGFf2Pe/tbPrJH3gT7Ta1B7dWBgP0hyUPv
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The SF19A2890 is a MIPS interAptiv SoC from Siflower (two cores, two
VPEs each) for home routers. Document its compatible and the first
board using it, the GL.iNet GL-SFT1200 ("Opal") travel router.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../devicetree/bindings/mips/siflower.yaml         | 26 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/siflower.yaml b/Documentation/devicetree/bindings/mips/siflower.yaml
new file mode 100644
index 000000000000..33110f742cb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/siflower.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/siflower.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower MIPS SoCs
+
+maintainers:
+  - Joseph Telaak <joseph@telaak.dev>
+
+properties:
+  $nodename:
+    const: '/'
+
+  compatible:
+    oneOf:
+      - description: Boards with the Siflower SF19A2890 SoC
+        items:
+          - enum:
+              - glinet,gl-sft1200
+          - const: siflower,sf19a2890
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..7fb18c2d6959 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25698,6 +25698,13 @@ N:	sifive
 K:	fu[57]40
 K:	[^@]sifive
 
+SIFLOWER SF19A2890 SOC SUPPORT
+M:	Joseph Telaak <joseph@telaak.dev>
+L:	linux-mips@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mips/siflower.yaml
+N:	sf19a2890
+
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org

-- 
Git-155)


