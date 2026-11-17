Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909087;
	b=UywQxBje0cvcddueHjTSwtB0exzdjWHxM/IkzZr9npZOdUCJ80ZsP/54jdptmB8HZeYz
	 +eNMEYh9OvO4K3uCFgNVVTmld4ughEzmnolsDLOFtgSSf2e438xtO2pIhKNZl0rN7pois
	 FzanX155Qy80jK1nQfOwG0/s5eQrnTHqXYjFZXm1ArNQRFV9o85Nn+k43saiC3MdWkIC2
	 mz4i8Sms6LuiRwpq6gs6aIetOpbFsvyK0QJtAh5ScAJ1VkkWnxO9LgWDNIXYVWnjn7ObM
	 kXWG0V+1f8oYJRCBArxWvvBsnyklNJfjN3g4qsISXQ7zmAEjkQABmitEEpYCQo+I4UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909087;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=X5WYmjC+W1XLRGqsI2xwQZ9HsjRo/iUHSgzYnXKRgcw=;
	b=iJ7/j3oIK4GjEsg7d2/ljddD+FOHfpmM9Bd/8g0ya17AQmtLrvPQvIjZfNTlGfz7SN2r
	 KBCQ+8hqftAVWGqXJA/Pael1PdGbuIVC2NNH6G08JeBCJH10zmQ3qIHvhkWLmHU9/3pEa
	 OfXilfFblZLgyfM0AI6/ehHADF9wZYMspMUBeou2lvbeMaCTwvEK2EWmvFsugaPxiGGUN
	 cAa1l5YAJcgaMtSfO+Edi8p9c6/ClPPXsEozP2KpLEWA9EQIQKxw2zefbGCVg7BM0bf2P
	 UjxDt5dty42YGmgi0pImCBkc18O/rattEcKmBtKnFwrCwxvfOIry8GRkXVfpgJwG6tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=BE4h6mZx;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CA6606A336;
	Tue, 17 Nov 2026 09:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82CA6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=BE4h6mZx
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDE815160AE;
	Tue, 17 Nov 2026 10:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794909084; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=X5WYmjC+W1XLRGqsI2xwQZ9HsjRo/iUHSgzYnXKRgcw=;
	b=BE4h6mZxBUQGaS1W4umNt1PDMiVNVaJ10i9Q+nW70iXoID864tmiePX/bjI8tR1G+0gMSt
	3t+m8+2vSvrg5Xkeq/KVaqQf6Ws+FfgFox+yh0+7H1qxbhew1B49afE3817Rv8Py1PLaOj
	vrWxRjTcREozaPAD0SX+kCaI7wAYHeqzIGR9/2pYn6T8HAohi10lEbMiFOJ46hOUFc3hzf
	31noWA6rkUdRjWSTjKI/75Ac6rUO5ZfZxMjryPYAzeey/hcXTen5YVObomxv+JUYpapf0S
	4AdnhdulauAem/r7TMQxU+sBF5b5umiVFFDGHXoGEx29B7ZasYbcHhwhXMZwsg==
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
Subject: [PATCH v12 1/5] dt-bindings: timer: econet: Update EN751627 for multi-IRQ
Date: Tue, 17 Nov 2026 09:51:13 +0000
Message-Id: <20261117095117.173316-2-cjd@cjdns.fr>
In-Reply-To: <20261117095117.173316-1-cjd@cjdns.fr>
References: <20261117095117.173316-1-cjd@cjdns.fr>
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

