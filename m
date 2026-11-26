Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795720904;
	b=lQuyV5WOCTjFiXS4yyLDtWx89ttYS9FFHnk7zqolTK4HBul0AyteGGEqGQ5agKyRyjZL
	 8tfsmiOsi+/mLFi6C6ley+4QFB4URxIw/ue+bjZlFUmqso+OiMLRCNI+QMYs+I2KX7iV/
	 O7cXgGNWdVqAeXfK/8ZGxHNvpe8fm2sZrixiGIDjCwknvHgOs59hyCH52gu1lfZAJlq7d
	 HfK3yO7LWVjxX9raCSf/S0rMa2ZZkIlGNYA9XyPI1RUzSxcQxGE/zKw8b0Alr4jq0RIud
	 pVnzcgywpyac/d6Fx/l8qbQ6/GWcgJtTpSTMOILKW1Up0uVVrFbvGQjzObbmSTgsraQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720904;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5aqZpwmHqjqmh4GD4oUHsIJTDsgWBBatJ+JyFbwWbJg=;
	b=1kjUL7VhPlHbEKaChtFRXr6JayGwHX1CfzQGR2GJXVFsMpNRtcpo52bR69zEHQehTGff
	 MwdxLArxB7EpjW3kF034JyXw6if0e57OcFzelNgoJxVqB9fh2/aGv3yF6Dpn5J3xDp74l
	 Be0At5Cr5tXWGeFSodEjDsBSDn8eUKRUmBCCUI3iANYOZQMHXG/SSO/18auJTO10Dk7O/
	 Q5o6F71pfYktAOMWmyFguF+63BXU0N7THRUbLYhcfH/YcD8mpz35ymgtygXmXwK01q45s
	 oZNe2MkjE1I32zELsfwk4HIhCvue4jYCgKSPx6OTfAta7JQHLm/QWaGWyv5aLqeUp3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AszA9QA9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B43606A33E;
	Thu, 26 Nov 2026 19:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AszA9QA9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795720903;
	b=n0l3cyCuPDZZnmkCiZDTmHAEvV4NH6hQL4xgJ9l/L11ZL4Ih5hx4g/NGPrKbq++AXcWb
	 52ApTipCk4x8hKgdU9toQDuyjxiuLAHGqajVLZ8q4ovcRX75hsMJSUBzg0bMhLXlEPIro
	 fVUEHZC62YCyIy3YpVAjxSeFV38nfgZQ9tjci5Wq83ALl54AEEx6BTySf7E7tculWmkQM
	 +ga2p1cUW4jV+bHAb9et/a44QuT+49jItQycpm98BGQzY/s3hGJ0k4twByv7OcYNrDPsI
	 rJEwenRFUlu2xDe0zPz/Mt4T+l4pnzZF5NHnoEsMdYK3/e109W7HAPdphwaPBcfpxUQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795720903;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5aqZpwmHqjqmh4GD4oUHsIJTDsgWBBatJ+JyFbwWbJg=;
	b=f8jUpGbIEc7UNZsMe86qhlREfk4Z6ZYfazoZPC6gq1As8wCmVkpyhhO7kqTNITiOUQ2d
	 8q8XCJKkeSW5BZbCgMyi1C2jBbJp0amnzEb5Tkq6xrd9Yg2TXxG82tmooYpaWff2zwB94
	 h3XgRW7XzCiPKQ3ULYk8+J91lcMlSyqCJlfnJTZW0WL/evukQ+sd2ANDeuvcbhkqNjF+Q
	 MWwbfvDbvs9uSDH810eHs4a3vu9EZYNc388hlrY+SNqgneN5BpZv0wZFsrCq5D4KIfT41
	 P8bqMuTIwFFoaG8HjnvlDSabpm33s/s9e50bhEh9kldEO2GGsMCzGiTwBWyevmeLhqA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AD831F000D0;
	Thu, 26 Nov 2026 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720903;
	bh=5aqZpwmHqjqmh4GD4oUHsIJTDsgWBBatJ+JyFbwWbJg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AszA9QA9JMdsnygXQT0mySbaxBq/ZmIwbibs+6nZJBaAA9V6BbIIwSGF/lh/ZjqZE
	 R25CQech6vpzzb+KWl97/c+Q6lYTq4t1PV+fL/7nACzJXDGRJdmfydp1EKB0/znhjI
	 ngRohFMK984pys16wME6gqhEXC+qcLdf7oUlvW6jjIdc5YJD7lcM/CCg+toTvYMuhD
	 6t3wbAygR0sFwyDm+zC2HOd6jqntZjmdtaKulYatDqIo79Ax1IYmfPYRqSckDp6U3M
	 JYdELGGHn9ReQrMWRc0l6Wv9UZKXdFOmOHsA9EVG8raRSh+AuSfmri/oxBihaKcL6K
	 2NZuN0oqcb6LA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EB5944D7B6;
	Thu, 26 Nov 2026 19:21:31 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Thu, 26 Nov 2026 14:21:30 -0500
Subject: [PATCH v3 2/5] dt-bindings: mips: Add Siflower SF19A2890 based
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
Message-Id: <20261126-sf19a2890-mips-v3-2-1f808d38ab37@telaak.dev>
References: <20261126-sf19a2890-mips-v3-0-1f808d38ab37@telaak.dev>
In-Reply-To: <20261126-sf19a2890-mips-v3-0-1f808d38ab37@telaak.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795720891; l=1843;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=vSqKdnVtxwON9050HlOvVfLUJS9xjUrqWFC5Nb1DQMw=;
 b=VT1glnftI+AMHNawi+vpMSadmKhc9gyWqvhapBA4pcJFmQKMUbd0pKiXgIiQf+wObHa8DfviN
 xoRcn8znoUPDe+l4m+lwvXBUsm8UccXBgetVvTzspFTfK68FibmtDhl
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


