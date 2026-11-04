Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776622;
	b=WjeBG0k6MmHQ2XCtYq0EQaLJLIbujZC/c+wyczJFj7tpjIdNnOtBSLOXrK0xPIzmQQ5R
	 2cZ456LhBCxD/phQw9E+8EnaFsx5719xBKnZuFqWLxeZohi0LrvJwN/BHUi44jox4HxrH
	 O+g8FerasOM506prkFcKPfc8uclZ78C/ALihGLRmke+UFmkc/TvqmuS9niAjexITP7KdN
	 JzoDY+lofmrDSXf7rpKaFlQ7m/K4VrEnqYOd97j5Rz2U4rRpfraGIu7xcbg/ZKvT+1SCo
	 AraKdJZYYWY6AcfYktErmB0W2E6aDYd9yM0tTBfo/7BZK6x4gHMf5rqYUo0hQA89dYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776622;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QFfDRw3gB0oRWzpmJyUiYwPaWbJCPSpJva3MZAdJW9o=;
	b=aYTNdCetWM6+g/oiWvD0rZK//8VQ4si5ZFZjpGlnCh6SDgHYd95nOinMGqVT/1cBv8iy
	 oJcc7d4RiWVUG+mdvicmj9wgAECdtrvzgwI8GDvjWL4HVQykPsFiSxKKJAwMdFaQidXeH
	 03dJUMk/GcCI6RqGZosCbj6CbadV3hZaGGgGSlpwmXSrriyAu2NACXZASLlOrka61N0yZ
	 k/Nxrailp3FAmrS/PAAtSoSgrM110X5KLqP4dzutH6USGoCqunvxlzAZCUQKr1Q90cHeK
	 3+Sa6OUwqMcr8Igg4Dn++en6UY0UcIPZQ+v+LO4CIhxgqqbLMZ/vLfcCOnuTaTL3ylQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnia9Agp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E025606A326;
	Wed,  4 Nov 2026 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnia9Agp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776622;
	b=phZaKbIESRYgoBPM+By6yskTmWpbuiCqn76PAKgyIG1J5LOnQUamNi2eAJhEPHQ0Ea4S
	 CofFJZ4KtItmGhtIvBhSd/bAEnxfMuio3z4d0yeK6sAe9wFHHyIOAsg9GaIHTrGKuIOEZ
	 JEzWZmJIQOSj4JinCPzQ94b3CcjVrchtecuta3cw2uTqLbSLArZoxjOHCUL1m8SrIC5HC
	 6HgArzaX5gXR9OGAuroN1iwG6BQmlXgg2B4/NvFZxz6GuFdZVJlTgus4QCa5uSqGHaIMz
	 ZeNvoN8Q7E3BwZegLXCICEyNQo8G1WP/1sV0flYiMjDW2J7VA7PCshQ5OM0YsfHFPVw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776622;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QFfDRw3gB0oRWzpmJyUiYwPaWbJCPSpJva3MZAdJW9o=;
	b=N7DBFp3CQYXJOFjLHqL1ydthqNrIIz7xeEk0Yl5W+JxWvo/ncIV2dBzO3rlz3Mf2M2GD
	 1H0RAGPTM4KM6iP45dtkmOmCW8U35F1F9bTAklEEbBfN1JwPnyFmr4IqnKXIcgqpomRz2
	 jkhdJ3tpfaae7lEZea0pxz5BWjse2GZtHYW2eVfmuvPMjev+ih84byPtHN/+0HAnEVnYr
	 LZI8i/fLek92/3Jjzj3E5Bi33VkGGXCrnUt09XZiROFNSXytYrdBb16CUD8zRNx9kVU80
	 N4nDg/Nkh9DC7acTxar6MhPepmrtW549ssvq2u+q3ILdZr6QVqY7OthGr5q8UA+Wkbw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83F081F00919;
	Wed,  4 Nov 2026 07:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776622;
	bh=QFfDRw3gB0oRWzpmJyUiYwPaWbJCPSpJva3MZAdJW9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bnia9AgpeIu7z6goJKoM06YnrlZP0bwnUG+scNJl9EilxTo71qQu8mOkAFcoyIY7A
	 ZbLV9ZMJIQKxw22I/ONgvedX7r+mu7yMxzS2hl3bW/8R1fQBPXYv5eszpnwIzTg1uJ
	 Pn4MEluquMwZ76HakDEeJuKmKIVvJwJLGVUqHfrjlv79MG0I39NmcZEY8YrmDSsnag
	 uO6u047gWS73/LKFnNYwG0pBcsn1J8y7nGG5TLXpXSRu93YioHygvH0ZS0gOE1UX/1
	 CCFZAJgVJPkDHhUECA3zUrHSY0ZQxmMEkR/I2UsPtjp39Y2wfVbSmpQutP4PGQLSue
	 siesGlTjVPiBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1907346CE3;
	Wed,  4 Nov 2026 07:17:01 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:16:53 -0500
Subject: [PATCH 1/4] dt-bindings: mips: Add Siflower SF19A2890 based boards
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
Message-Id: <20261104-sf19a2890-mips-v1-1-eae80820af68@telaak.dev>
References: <20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev>
In-Reply-To: <20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776620; l=1813;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=/zLPz9LJOGnGoujKr8TLBR8riYXrOQytAU9btqLp/no=;
 b=kXocI+41xx19J/VdPTUYkAiGklfF3xKIIJigxtR8zURZliE/Eh4Bq4YfxUAXf4zZjFJJ/Wzg0
 JvRiebyyR1BCydeDXrX92PRHBqLzE6arUu83aMaplv3R+54zrQJo1Sw
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
 MAINTAINERS                                        |  8 +++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/siflower.yaml b/Documentation/devicetree/bindings/mips/siflower.yaml
new file mode 100644
index 000000000..33110f742
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
index 93abbb315..2a7a083f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25698,6 +25698,14 @@ N:	sifive
 K:	fu[57]40
 K:	[^@]sifive
 
+SIFLOWER SF19A2890 SOC SUPPORT
+M:	Joseph Telaak <joseph@telaak.dev>
+L:	linux-mips@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mips/siflower.yaml
+F:	drivers/gpio/gpio-siflower.c
+N:	sf19a2890
+
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org

-- 
Git-155)


