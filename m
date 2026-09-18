Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7E8502781;
	Fri, 18 Sep 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745323; cv=none; b=ef3XIz+FSHehul1B0BJOwCMiAbms2OoheKv8vMvxpgffK1AZgQaNFolNnTNNekzoZrZeS4e0j1MobotFWLwb30qywW1fDrx9xoL3xz52y5+b2UWfFj0AthpUQgbjzJPWwmBjvoUHYOQHLKKUSL5O3nsTSpDqFzSLFdvTnOdJzVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745323; c=relaxed/simple;
	bh=Ze4Nv8y680E6FSf/un9hYJUthpJ2COzdxd+LB34Yb2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VrjeVxe3h3MIN/jja/5fEs5r+RyLy0cPVTfSZExHISxi+URqCOdbOGX1gXHAs2OGBwAI6nCs18Fmyok2uRfJWnU4W82mPOvXQzu79MUQI3NV2sI9lua8p2woqZySgQvlSrYwmq0QEKzXKkp5HPlQuJ9CNSAYx/8QncMNgduhI0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=WztKmEVY; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="WztKmEVY"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E65B4DFFBF;
	Fri, 18 Sep 2026 17:28:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789745313; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=X5WYmjC+W1XLRGqsI2xwQZ9HsjRo/iUHSgzYnXKRgcw=;
	b=WztKmEVYhDrnw89KOdZh86bkLiB7hjvRda80wrHLjrZX4zrYIZeseLyTR+61z3slEpRzoZ
	MVL4kVABJYaZCFv6hewjlBV/fZweq+1y6qdWX7AMttTBhCZJy0QzdiQ2xRFgjdFzsBsbXM
	nz6iM/p8QG+EMo0tTPYpzjtbdQefbUBC8QFEcNEI3vXcew2jmUkhB5yNzN9ltL/rVcNhM2
	SCIy7dComebJfKKu1he60J//nFIiQJjU6cBpbyYC9F7iy0O6R3Pm1WGoadQW2pUiyBKB3J
	Bz/U/woQYm8kPA6gDtW5Kq4uovJmkyq3w1JztFkVqOroxmNFC+/CCkh9ZNuyIQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org,
	daniel.lezcano@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	naseefkm@gmail.com,
	robh@kernel.org,
	tglx@kernel.org,
	grandmaster@al2klimov.de,
	Caleb James DeLisle <cjd@cjdns.fr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 2/5] dt-bindings: timer: econet: Update EN751627 for multi-IRQ
Date: Fri, 18 Sep 2026 15:28:19 +0000
Message-Id: <20260918152822.343811-3-cjd@cjdns.fr>
In-Reply-To: <20260918152822.343811-1-cjd@cjdns.fr>
References: <20260918152822.343811-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This hardware is found in the EN751221 SoC family as well as the
EN751627. The former uses a percpu IRQ for all timers while the
latter uses an individual IRQ number per timer.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/timer/econet,en751221-timer.yaml | 31 ++++++++++++-------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
index c1e7c2b6afde..ac25785ecfdf 100644
--- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
@@ -12,24 +12,23 @@ maintainers:
 description:
   The EcoNet High Precision Timer (HPT) is a timer peripheral found in various
   EcoNet SoCs, including the EN751221 and EN751627 families. It provides per-VPE
-  count/compare registers and a per-CPU control register, with a single interrupt
-  line using a percpu-devid interrupt mechanism.
+  count/compare registers and a per-CPU control register. On EN751221 it uses a
+  single interrupt line using a percpu-devid interrupt mechanism, and on
+  EN751627 it uses an interrupt per VPE.
 
 properties:
   compatible:
-    oneOf:
-      - const: econet,en751221-timer
-      - items:
-          - const: econet,en751627-timer
-          - const: econet,en751221-timer
+    enum:
+      - econet,en751221-timer
+      - econet,en751627-timer
 
   reg:
     minItems: 1
     maxItems: 2
 
   interrupts:
-    maxItems: 1
-    description: A percpu-devid timer interrupt shared across CPUs.
+    minItems: 1
+    maxItems: 4
 
   clocks:
     maxItems: 1
@@ -52,21 +51,31 @@ allOf:
           items:
             - description: VPE timers 0 and 1
             - description: VPE timers 2 and 3
+        interrupts:
+          description: An interrupt for each timer (one per VPE)
+          minItems: 4
     else:
       properties:
         reg:
           items:
             - description: VPE timers 0 and 1
+        interrupts:
+          description: A percpu-devid timer interrupt shared across timers
+          maxItems: 1
 
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
     timer@1fbf0400 {
-        compatible = "econet,en751627-timer", "econet,en751221-timer";
+        compatible = "econet,en751627-timer";
         reg = <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
         interrupt-parent = <&intc>;
-        interrupts = <30>;
+        interrupts = <GIC_SHARED 30 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 29 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 37 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 36 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&hpt_clock>;
     };
   - |
-- 
2.39.5

