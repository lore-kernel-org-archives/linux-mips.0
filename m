Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906590;
	b=GKS1LNneSnKEP4bvzh0y+pf1wuMvatXxl+3ndTNyYtBD6GTojCwWiIJOzmRXcBF5mncr
	 W1wIZu6HFCEqExtp0ZegpGreiIQ9f/ipM3qadhByfULmmqCNPg1LorCHEHh9xiAn1mWt2
	 P2de9m3vTHK/wn0XRZ4/UPeFHPVI+j2MvHReRWZzMl94KL9rVVM9QrkgEd8Om3+8zu66r
	 7PVTdQXs7INfEFt+750Q748B5GkVOkGYmPMycdO9CrZwPdRdDMRBg3Znbbi0chrcoVe4A
	 CdZOxkw8BriqvoSyhp9qdzXqQZ5JbT6AkclEVcUEjEx3MoOMg6CLceOzZD3WpmlUomQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906590;
	h=DMARC-Filter:DKIM-Signature:X-Lms-Return-Path:Content-Type:X-Mailer:
	 Cc:Message-Id:Mime-Version:Received:From:X-Original-From:In-Reply-To:
	 References:Subject:Date:Content-Transfer-Encoding:To;
	bh=haS4pNMIbV0FeZB0f+udav1mKC4zCxBB23/t2ZQ+5w0=;
	b=ivV5+ao/iDU0ECckkzl0190W+yLzsEABKPV1U3kLUq9Mj464rhCZ/LNmb/zlL6RTQkKM
	 naCacLQwbYkCwNv4GW5nCgffEWKDuXrlqr2BKrEdOhSFcpSSqzeKcKZdN/67GBMTnaxxc
	 v7hTOJ8r9hvu/zqfJ/Vo5OPmEV2lqPVDXdUkdTVrUKRFvz0Y5DMv/XoNwb4pWpAPJhRZe
	 izt7aJZn2MaSTvpgXOBAt2i2ZPOI0EMgcE9tEDtGBusnkEaldqvwzocitNPmvZw7kO3N4
	 DggNYplItwIaRPbkrkVIrtP4g3eBgYVfySqf9Ruq+wm4E9KWc/yJBlt5Uvr3MgJ3YXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=BZeJ+4Y8;
	arc=none smtp.remote-ip=209.127.231.53
Received: from va-2-53.ptr.blmpb.com (va-2-53.ptr.blmpb.com [209.127.231.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166D5606A330
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 09:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 166D5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=BZeJ+4Y8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794906578;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=haS4pNMIbV0FeZB0f+udav1mKC4zCxBB23/t2ZQ+5w0=;
 b=BZeJ+4Y8zYlzlOUxuw8KrsQMvvRt2s7Ve29k+eK+LgEZYZibvmk7h9mewYyCIptrbGM5WV
 1iM6X74ai0am78HXO8CCT+qg94UPZyXD8jXeQZ7Div3eh3xFB7WEScSSoBYqWx17TeY84T
 7t/dkKL2wNAX8+zgEGznzM1hrluNUCUGeWRseRj+QZTytgyz4uurV0GZadLX30k6erXrm2
 x5zTpt+Xfg1eZtsjCQdjBT8Xg4LY8RznrBD4gFK19txWTwCufKpyIbZmKd1JpFhy2py4Va
 xKegI7G1Y0CsDeARParPvgTmTW/jg2E35N8g/MzUIt1Y5EoJOTPvdPfrYkJ8FQ==
X-Lms-Return-Path: <lba+26afc19d1+0dceee+vger.kernel.org+rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
X-Mailer: b4 0.17-dev-ce4c1
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
Message-Id: <20261117-mips-ls7a-wdt-v3-2-2e88f7e1d6c5@oss.cipunited.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 17:09:36 +0800
From: "Rong Zhang" <rongrong@oss.cipunited.com>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
In-Reply-To: <20261117-mips-ls7a-wdt-v3-0-2e88f7e1d6c5@oss.cipunited.com>
References: <20261117-mips-ls7a-wdt-v3-0-2e88f7e1d6c5@oss.cipunited.com>
Subject: [PATCH v3 2/7] MIPS: Loongson64: dts: ls7a-pch: Add missing #address-cells to pic node
Date: Tue, 17 Nov 2026 17:06:44 +0800
Content-Transfer-Encoding: 7bit
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>

The pic node of Loongson-7A lacks an #address-cells property, causing a
lot of dtc warnings about them falling back to 0.

Add the missing #address-cells = <0> property.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
This series will modify ls7a-pch.dtsi here and there, so I fix the
pre-existing warnings to make me more comfortable.
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index f304f99946f1..71d4c882d3f6 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -17,6 +17,7 @@ pic: interrupt-controller@10000000 {
 			interrupt-parent = <&htvec>;
 			loongson,pic-base-vec = <0>;
 			#interrupt-cells = <2>;
+			#address-cells = <0>;
 		};
 
 		lpc: interrupt-controller@10002000 {

-- 
2.55.0
