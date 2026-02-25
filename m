Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ECD3E8C54
	for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 16:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038531; cv=none; b=dnQ/SE3612btNWPtPCxkAb1S7c2RN93bsmXeI7PNVVFZ1v72fvJ2dhqlx2BWh1SGnVQk5xum9gQRBZMt1J879LuhqAsanY2hk+xq9ztv6Dmw+Hyuxw5VIyQyTggBYOStEdMgqpcTvkb4e4eZ+Te7iG6vj11mKnhskjq7b1yDVbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038531; c=relaxed/simple;
	bh=6u/f4c0UsXgCZCaSqHUA5CczQrwX5KG9MGQYKcZJiv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QazMLM9mC+tIRSkKUluzpRJDy86ZRIAUFwfb3hAh7xyDOhaeYSt/xyjDXOsm/yLt1f7mTrDXcdLSWOSt0E9GAh+VDb7bBFFJM+v3qShKHOvGWkdAIFsXLO4kVEokoUDhvebd+TZPKQXpp1O8qE3W9RoVuQS+VOgJK+LK0uBc63g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NHPrm6zk; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NHPrm6zk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 940661A1342
	for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 16:55:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6ABF15FDE6;
	Wed, 25 Feb 2026 16:55:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7912103692EC;
	Wed, 25 Feb 2026 17:55:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772038527; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oOMn5ompIPVh8yV/GbjsjGzqpMNsv2wxvWJHJoVVvec=;
	b=NHPrm6zk5W9L1XJh52F+itQ7/wEWRqYa9Pt+sFVsd1aVWPLnQIbDSBvZbZcAGgoZ0aaYZR
	UabnV+be7Tfw8F6f0U0hpklCR/LLUAm92LCr/Nm71nCm5ptXqIti05XQtLRy8dC7vZH7DB
	xHTPo5V7rXgFgGGlALna5CXJyF0Xh0t9E2AI9tGy6mmKiOmmN6dEZImAuQo/yQyMkniJq8
	Z5cRP9iCT/WRCLlA1PvTZGx467bte7nV9PU/yMc17yh95t7j3dSJ4ASMtwRE6+2xIqNcZF
	Vw2qEmpUss7D4Iy+Y5h5XK7md18WKVQzO/vrJTNq38tpQ8X3i1s0SzLMbldn8w==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 25 Feb 2026 17:55:22 +0100
Subject: [PATCH v7 1/3] dt-bindings: soc: mobileye: OLB is an Ethernet PHY
 provider on EyeQ5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260225-macb-phy-v7-1-d3c9842ec931@bootlin.com>
References: <20260225-macb-phy-v7-0-d3c9842ec931@bootlin.com>
In-Reply-To: <20260225-macb-phy-v7-0-d3c9842ec931@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

OLB on EyeQ5 ("mobileye,eyeq5-olb" compatible) is now declared as a
generic PHY provider. Under the hood, it provides Ethernet RGMII/SGMII
PHY support for both MAC instances.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml       | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
index 6d11472ba5a7..56401d76a9b5 100644
--- a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
+++ b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
@@ -51,6 +51,9 @@ properties:
   clock-names:
     const: ref
 
+  '#phy-cells':
+    const: 1
+
 patternProperties:
   '-pins?$':
     type: object
@@ -310,7 +313,7 @@ allOf:
       properties:
         '#reset-cells': false
 
-    # Only EyeQ5 has pinctrl in OLB.
+    # Only EyeQ5 has pinctrl and PHY in OLB.
   - if:
       not:
         properties:
@@ -320,6 +323,8 @@ allOf:
     then:
       patternProperties:
         '-pins?$': false
+      properties:
+        '#phy-cells': false
 
 examples:
   - |

-- 
2.53.0

