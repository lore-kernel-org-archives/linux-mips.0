Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD1135B15A;
	Wed, 11 Feb 2026 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803080; cv=none; b=Gf3QBjXHiNn1etHQ2xPheDHePnQk/ot0h+SWQr/PQErXR3y1oDa2cFyLtgifT3hg8u3Yr5gMHv2Ed/fixgsSz/xUgzbi2xP4W8nuBsYEhFFzxsWhuH4jg7xoIX8nyDOvgNXqbGTj8Z7CwbqFi65FzyjhsQlqUWEQPH3bRTRnhPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803080; c=relaxed/simple;
	bh=eF44SUi5zfXz7DKjdWLusMD+wNgC82cI6OdzfwtX46E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gA7N/q4XHffj0+UApOPs6AFG8NO+QqRMD8lHBdcK/tWqIsQn4MKVD9wsvxPZt8P53Y6F8WhG6CTp3AA4LpvDopr3r/f9PUY5xdeEmuO9F06WOlDuPNe9fWnkvHPCY1iOj7Of3aDqOj+CC3hoS1LNE+eZaXLjRo6yf1u/OJY3Zig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.168])
	by APP-01 (Coremail) with SMTP id qwCowAAHsm1rT4xph_KtBw--.27918S4;
	Wed, 11 Feb 2026 17:44:17 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 2/7] dt-bindings: interrupt-controller: add LS7A PCH LPC
Date: Wed, 11 Feb 2026 17:44:03 +0800
Message-ID: <20260211094408.3463916-3-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211094408.3463916-1-zhengxingda@iscas.ac.cn>
References: <20260211094408.3463916-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAHsm1rT4xph_KtBw--.27918S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tr15XrW7Ar47Wr17Kw4rXwb_yoW8ZFyrpF
	45C3ZxWF40qF13C39Yga40kFnxZr95ArnxCws7tw47Gr9Fga45X3yakF95Xa1fGr9rXay7
	ZFyF93W0gw17JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUbH5lUUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Loongson 7A series PCH contains an LPC controller with an interrupt
controller.

Add the device tree binding for the interrupt controller.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 .../loongson,pch-lpc.yaml                     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
new file mode 100644
index 0000000000000..ff2a425b6f0b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/loongson,pch-lpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson PCH LPC Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+description:
+  This interrupt controller is found in the Loongson LS7A family of PCH for
+  accepting interrupts sent by LPC-connected peripherals and signalling PIC
+  via a single interrupt line when interrupts are available.
+
+properties:
+  compatible:
+    const: loongson,ls7a-lpc
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - interrupts
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    lpc: interrupt-controller@10002000 {
+      compatible = "loongson,ls7a-lpc";
+      reg = <0x10002000 0x400>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      interrupt-parent = <&pic>;
+      interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.52.0

