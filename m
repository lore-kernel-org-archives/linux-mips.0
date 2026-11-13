Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567090;
	b=a5R8bxj1fBrn/Op27N5EJ1bLpsOszd8xxHc9yvfCdDMAphlAKwb2TQ3dHeOvb+YCQHqE
	 T59exJ7RiyfllYHRluYbyYHZ/mZWuicCqOJEHPqOCMgtv6cm43+u/e7qTcUUiwXub3ls4
	 KHCfEC+MxbqX0lftzCBUBwxwgOKS9SgQf9CdnSIiYI4JwKoIXtLD9mcO6gIKqmRcH2ESk
	 LBs/kCzSXTZ1VarA3u+euvEjp0uecMQKbVKRbbcwIBFJodfFSp1oKjF37IlYNY+CyNPne
	 KnfRlKEL2m0P8/zUmMM3KqWXpIWbxw822GMaIJXNCjnc4P+0hLqF3iNEc/IUT0hGEMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567090;
	h=DMARC-Filter:DKIM-Signature:Subject:Mime-Version:Received:X-Mailer:
	 Content-Transfer-Encoding:Cc:Content-Type:Message-Id:Date:References:
	 To:In-Reply-To:X-Lms-Return-Path:X-Original-From:From;
	bh=VMdenQr9IZWAxshzwA9HVckJqtXVvhwVQuGES233IgU=;
	b=NwRKEeqnjzbFzbiBtawKebhDGb1WdfhWLMLYFVU98rq61GMsBF5XaVE/8HfsrjH6L+Vr
	 VwoRD7dP5MStp7rOHdDzjwwu3bMcFku6JtrPuHCNNJ6TzdQBypawajIp2A8NzijU7Ror6
	 S7kg+kim8xXoBcL/CugCmLq2pVkDBHTus5tbiE6oEor21Y8wSy7kKojDESu6Tk/WEVBr9
	 d4gxMha8vjdn+TZpKyHLtKmy2Y/R34y7YYz8i3EsFPyS7rJINpzqwJSU8MoW2mgWbuonH
	 q8YQIRVmO6isr46GcKn236c7ZhzOLtWjryC3YePIp8QqGVexveYSd9knZ/ibUc5/KIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=zLoYrFkp;
	arc=none smtp.remote-ip=209.127.231.57
Received: from va-2-57.ptr.blmpb.com (va-2-57.ptr.blmpb.com [209.127.231.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61D8606A8BF
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 10:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61D8606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=zLoYrFkp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794567084;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=VMdenQr9IZWAxshzwA9HVckJqtXVvhwVQuGES233IgU=;
 b=zLoYrFkpnd1SErGzAAmIiWAkxzmUY8uB2bN1/ooPpKjGccB1dmjKfgtxE83P2ec5BSH5zP
 zoGYAhQLMhPaHfb11dYl87ceh2ZXEmH/l5jk2/xU7MxeBxpGCmni63xx1R6wg2yfQNx0M4
 6jDi5Ho1cLKmyM/BX/vWvwruL0AqgWG4WlVFkdvy4hqXYEnEE1EStbdv97Q/OtzWnE39jd
 xDvaKlzQP3avSmTajuzrk5yz8fd59Q/Uu91rdTl5WL79qw+VEpXqU65IVXpsZnyQWfm0cE
 Hf/l+WzGt+8hUtTWIbaOxTnKfTLmmQfeuR+fJdr5w04jzkyvNavKXHCJhDnEPQ==
Subject: [PATCH v2 2/8] MIPS: Loongson64: env: Don't warn if UART has clocks node when fixing up FDT
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Fri, 13 Nov 2026 18:51:21 +0800
X-Mailer: b4 0.17-dev-ce4c1
Content-Transfer-Encoding: 7bit
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
Message-Id: <20261113-mips-ls7a-wdt-v2-2-e8abd6b2f77c@oss.cipunited.com>
Date: Fri, 13 Nov 2026 18:51:09 +0800
References: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
In-Reply-To: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
X-Lms-Return-Path: <lba+26af6ebaa+49d8fd+vger.kernel.org+rongrong@oss.cipunited.com>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>

A UART with clocks node cannot (and doesn't need to) be fixed up.

The fixup is solely for the case in which the UART use a dedicated clock
source on board (say, a crystal oscillator). IOW, when a UART has a
valid clocks node, it should use an internal clock source that is either
nonconfigurable by the board manufacturer, or retrievable by software.

When fixing up FDT using UART information from LEFI, don't warn if a
UART has a valid clocks node.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
Currently no Loongson64 platform has such UART nodes, so this is not a
fix. Later changes will convert some nodes and depends on this.
---
 arch/mips/loongson64/env.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 7abcca7ab4ed..8135d50c777e 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -73,6 +73,12 @@ static int __init lefi_fixup_fdt_serial(void *fdt, u64 uart_addr, u32 uart_clk)
 		if (!reg || len <= 8 || fdt64_ld(reg) != uart_addr)
 			continue;
 
+		if (fdt_getprop(fdt, node, "clocks", &len) && len >= 4) {
+			/* The UART cannot (and doesn't need to) be fixed up. */
+			pr_devel("UART 0x%llx has clocks property\n", uart_addr);
+			return 0;
+		}
+
 		clk = fdt_getprop_w(fdt, node, "clock-frequency", &len);
 		if (!clk) {
 			pr_warn("UART 0x%llx misses clock-frequency property\n",

-- 
2.55.0
