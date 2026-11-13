Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567104;
	b=o1sGbFjY2XZFrlSQNgd3C+4feUPjxisqMr7Wob5eQLrcpydPbxJRotRFAhhzSImojVeW
	 oJjPoVc3EtOmokG1qAldZvql9/pEGWDo7Dtvi62RdC7pF3IsrGEfOOGgon9WqyxsqRnj0
	 hYlmjas3+yeLbXha2Hecso0kfpro7hNDyZJSkkbDP1oRoWSBkPH9uBdRt7zKm16SD8N6d
	 TYfIC3bcckG8le5MIRGjgaEHwj4u7qFY2EENYTIX+qrxNUSPZE0uZzuUVej7sCHDij/YT
	 bPylr9yHv7GZl1C01UDR+nVc9qkIEWRZb+xw1VEldapprQiyEHXOKNtdrYzNcADjJ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567104;
	h=DMARC-Filter:DKIM-Signature:Cc:References:X-Lms-Return-Path:To:From:
	 Date:X-Original-From:Received:Subject:Mime-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:In-Reply-To:X-Mailer;
	bh=kN5lk7yu4kprln47vl3Hl9+FKo1eS5442VgRAIn6R3s=;
	b=p8ixC5lBzGKDKWhApW22L0WMXE+7jWslAcyj67Mkg52C12HUI5AN1Hy03Ops6enz16Ii
	 Lo+BwEQlEgDsWiujE494BLdBez6fNi7rpkuPWbCVTSaYRHNgAfs1K51kER0yMKe8g1ZBT
	 uzGGFJ8vIPp0wZEPe74aj9gfIz8iw05Lt3ptY90I9iaSbvQXKHxBQRZ2dgC4YNLJ59sUt
	 N2N/GwvtHNdtFK26lSXl0SfG0i1awsu1ql46Vod69JnIdeSAcTE1fBiiU1vFP9Z1oATPu
	 MOmnestS25V9ye0Um2wYjsmW2KsbtNzqSAVcMRncjOySiCC/3E7cqctT6RHLJP87RJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=SCimQal3;
	arc=none smtp.remote-ip=209.127.231.20
Received: from va-2-20.ptr.blmpb.com (va-2-20.ptr.blmpb.com [209.127.231.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCBC606BD9B
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 10:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDCBC606BD9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=SCimQal3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794567094;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=kN5lk7yu4kprln47vl3Hl9+FKo1eS5442VgRAIn6R3s=;
 b=SCimQal3/0i8vvlmlRafygqO/r0nq0tjN9oAG6DfCcDyhG4ShOV6tYMo7XHGUatz9HXhpM
 jYk9g9j2Iuezo9oUgY8Bf327L7eDnuD/kzu9R2s0+NXNNBcbEJPW3uHPrROytav9AGKZOn
 ODGp76RV//72muoDvBv6j6AUndryOYvH02EBhexqFE42/R2S1JLn7I1iCJnXynlj2PWdGT
 0V4e8i0iI1ht9mofuQhNFcXClqNo/uwuT4GJgoAfKnLX1SMYkDHXrFsLAYl0qjcQkC3Zbe
 r+SpB25Zw/gTir5tpI9IOgXD/OrtDX0mHjQX9t4nCYIWB2ZiTKIudiBLVctC2Q==
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>, 
	"Conor Dooley" <conor@kernel.org>
References: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
X-Lms-Return-Path: <lba+26af6ebb4+e289c4+vger.kernel.org+rongrong@oss.cipunited.com>
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Date: Fri, 13 Nov 2026 18:51:13 +0800
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Fri, 13 Nov 2026 18:51:31 +0800
Subject: [PATCH v2 6/8] MIPS: Loongson64: dts: ls7a-pch: Bind UART nodes to miscellaneous clock
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-mips-ls7a-wdt-v2-6-e8abd6b2f77c@oss.cipunited.com>
In-Reply-To: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
X-Mailer: b4 0.17-dev-ce4c1

The Loongson-7A's UART controllers are driven by an internal 50MHz clock
source called miscellaneous clock. The clock is nonconfigurable for
board manufacturer and software.

Therefore, the LS7A UART nodes don't need to be fixed up by
lefi_fixup_fdt_serial(), and can safely use clocks nodes rather than
clock-frequency ones.

Suggested-by: Conor Dooley <conor@kernel.org>
Link: https://msgid.link/20261111-oboe-shack-11c3e3ce0830@spud/
Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 2ef1ad10a8ec..7ba7bbb9c013 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -39,7 +39,7 @@ lpc: interrupt-controller@10002000 {
 		ls7a_uart0: serial@10080000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x10080000 0x0 0x100>;
-			clock-frequency = <50000000>;
+			clocks = <&pch_misc_clk>;
 			interrupt-parent = <&pic>;
 			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
@@ -49,7 +49,7 @@ ls7a_uart1: serial@10080100 {
 			status = "disabled";
 			compatible = "ns16550a";
 			reg = <0x0 0x10080100 0x0 0x100>;
-			clock-frequency = <50000000>;
+			clocks = <&pch_misc_clk>;
 			interrupt-parent = <&pic>;
 			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
@@ -59,7 +59,7 @@ ls7a_uart2: serial@10080200 {
 			status = "disabled";
 			compatible = "ns16550a";
 			reg = <0x0 0x10080200 0x0 0x100>;
-			clock-frequency = <50000000>;
+			clocks = <&pch_misc_clk>;
 			interrupt-parent = <&pic>;
 			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
@@ -69,7 +69,7 @@ ls7a_uart3: serial@10080300 {
 			status = "disabled";
 			compatible = "ns16550a";
 			reg = <0x0 0x10080300 0x0 0x100>;
-			clock-frequency = <50000000>;
+			clocks = <&pch_misc_clk>;
 			interrupt-parent = <&pic>;
 			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;

-- 
2.55.0
