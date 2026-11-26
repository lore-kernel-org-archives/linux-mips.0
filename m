Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795720898;
	b=H3nDUcuI+6OUASzYk2y5Reios7cI+ytlmmP6sKlLkTGTD2QTd79vA9aK4FeWgQBBrFiy
	 7+d4qVGU55G+UV1ltpaps90HP8Juj1avI8rttJg5C6Yc6gioJSJzqj4c3wYS9yh8R60ky
	 epngH1r2yiLeylkQaQr1VjXL1TcYirE3gK5iEe2UOM1mGFg4r6tnJ6Fj0jBESX83bKTSO
	 KO7opSmr0gLo7yHncguuboK3wrpv04DMRG45x1DObcEFGNZjp7LUXiWwa1eAfs5M2SdNT
	 j2mecyZGrPmwWAT3oU/h8ixJQc998GXKQQe1+oZUyuaWttO4QnNjbLdD9x4soGSTyLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720898;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=GQBpv/4cJe0bKLNoM4fxaYTTw+YNJgkz+4O1RULdm+Q=;
	b=YmrUl2QxvEpftCMyzbP1Cd7T68jpTtqgjprxZZigTgVgzIRF1Rew1sGeqk4kZx8AWoKl
	 nAv4eKx8KipVFofcESVlfTGKg2r1t/2BMeQTKWnemq+BtgKDosxGXLZenNthjSOO3KXyv
	 /bNUwCk3Q7o9QYduqd2Qed3ZHMXYyVP3EMdPhg0pn3iq7d6u/kaZ29feqiIaHaRsGNldy
	 Kg9og7lcOf1NPqeBEbAP0Hiou/uhpbdZKSAxdZx34IheTiy3Zb1KLbeDEb6s1GqFXPKo/
	 aPPLfEoC/46ImnY237DUnPt3KaNPy7b5Bc5IQ/se1YBclGNS6KnF41WCa/3fNf/LcKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BklUjJVu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46B606A31C;
	Thu, 26 Nov 2026 19:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BklUjJVu
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795720897;
	b=Ez3AuxHc6z5GdJEPpGKFRijz+HZX8a8mOI8A1cc4Owbt/16b6GyL713+PvwXzZTBGB2d
	 UxtbvxUh1hZoXkeD2UXagG3qSIpxzmvnzpQSZwKWNUzVoLCZMDemBx3u/xaFxgqcjP/gb
	 lHCvFecAIzkCm3LJfxoyM2WOfcnnJqk6ExLnNn2zch/Vjr+VlPztdH6sguVhIbLOK/8MP
	 DUcNR7braa5ptQwy6IyhamC0nyD2tZNzOXFG9CdNKWp88EJVQ0hRqZWkziOYQoEJyayWh
	 oSa7MA5cM0KShRg3BrF7rDwLIIX036/KTVg0HnMJ5eDlsIXWhHEIkiBjKzAo666r6sA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795720897;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=GQBpv/4cJe0bKLNoM4fxaYTTw+YNJgkz+4O1RULdm+Q=;
	b=WBTf0jhvoddHZQJ9FooT2YWx9sYVFVf67eKEO3yAD1gEtcr11K2E8jNdA8BKixMVOVgG
	 DIhzenkURSo0rEF8aLP5NlKbvV4/PP63rco5fBeNS6TFPkPxrieJ0GTdRznXfxllLnNEH
	 CGHHHfu9kc0Y/4uHc9npbd0GhPJHHpGkhP4tLdGKhrado6rCHW2ufr6OpYKDnlvwi0L9y
	 peyNFtMOZymrTXs5XKHyn+iPOqHX2rhVuUd35dR/6efUvm4g1qfwKVUlDq8nTKP4qu/ah
	 RL6LjVt4vWiex7s2xswMFVYMQv7UHyB1pxsPr4gmFW+tpEK7M+WQA5wL4QicQwACOGg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CD271F000D1;
	Thu, 26 Nov 2026 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720897;
	bh=GQBpv/4cJe0bKLNoM4fxaYTTw+YNJgkz+4O1RULdm+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BklUjJVuFV8im7IIlQCwTY1i4H33DYOWJrNFSgUjtvWF14fFvW/zM+CQlfg07RZ67
	 njg7d7gWZ+j5J08Zt3hvpN3Yr2OBnb/UOZaKK3x7z1FO+14EW0shIWs+gANHc7VNJ/
	 QojMZSwt83ZsCX+OCl6/UPf2RSFgAqDPZEORh+gv8w2j2KnB+7fNS66LkRLkC11jhJ
	 m/ClhtEPa9Vz8NhAMsH9Tx4qCWKx6QuqgmFIzjRKpF8bTpofOn1pQi5qXVXt0+eBfa
	 JUHfSMDdoSpLHVZrqIUgWCg6a0iJX2HS+cOVCL/PCEkHtRIlamgf5G9pKC47I3qJom
	 LvbXroJyi0HIQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 193464D7BA;
	Thu, 26 Nov 2026 19:21:32 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Thu, 26 Nov 2026 14:21:31 -0500
Subject: [PATCH v3 3/5] MIPS: siflower: Override the kmalloc alignment
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-sf19a2890-mips-v3-3-1f808d38ab37@telaak.dev>
References: <20261126-sf19a2890-mips-v3-0-1f808d38ab37@telaak.dev>
In-Reply-To: <20261126-sf19a2890-mips-v3-0-1f808d38ab37@telaak.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795720891; l=2095;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=EVyfyjeyZ6p+fuc1LhbQN8uCXhli0ff7zLHw1TglBzM=;
 b=hLtcKgn2pI1DY0p7hYt5vMEqTSVmnsXMIdY25FHiAi5XfyztDLaCEHPZKuGyD8oryRzJZhB6M
 qkfN13CWiHFCAIpxXVL4++nZetZPEsypPo3PQcyY9OI4w29U6ASRxAP
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Chuanhong Guo <gch981213@gmail.com>

Most devices on the market with Siflower MIPS SoCs come with 64M or
less DRAM. Their InterAptiv cores have 32-byte cache lines, so add a
kmalloc.h that sets ARCH_DMA_MINALIGN to 32 instead of the generic 128,
to conserve memory.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[Joseph Telaak: split out of "MIPS: Add support for Siflower MIPS SoCs"]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 MAINTAINERS                                   | 1 +
 arch/mips/generic/Platform                    | 1 +
 arch/mips/include/asm/mach-siflower/kmalloc.h | 9 +++++++++
 3 files changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7fb18c2d6959..3aa80a8dd785 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25703,6 +25703,7 @@ M:	Joseph Telaak <joseph@telaak.dev>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/siflower.yaml
+F:	arch/mips/include/asm/mach-siflower/
 N:	sf19a2890
 
 SILEAD TOUCHSCREEN DRIVER
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index 0c03623f3897..c09a8484db9b 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -10,6 +10,7 @@
 
 # Note: order matters, keep the asm/mach-generic include last.
 cflags-$(CONFIG_MACH_INGENIC_SOC)	+= -I$(srctree)/arch/mips/include/asm/mach-ingenic
+cflags-$(CONFIG_MACH_SIFLOWER_MIPS)	+= -I$(srctree)/arch/mips/include/asm/mach-siflower
 cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
 
 load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
diff --git a/arch/mips/include/asm/mach-siflower/kmalloc.h b/arch/mips/include/asm/mach-siflower/kmalloc.h
new file mode 100644
index 000000000000..0887ae3575d7
--- /dev/null
+++ b/arch/mips/include/asm/mach-siflower/kmalloc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_MACH_SIFLOWER_KMALLOC_H
+#define __ASM_MACH_SIFLOWER_KMALLOC_H
+
+#ifdef CONFIG_DMA_NONCOHERENT
+#define ARCH_DMA_MINALIGN	32
+#endif
+
+#endif /* __ASM_MACH_SIFLOWER_KMALLOC_H */

-- 
Git-155)


