Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567088;
	b=S/WzSnn43HhJUyzmRZkhTxKi5AAby4wZJxL3LZsjbT54xN5lYR05GWze406gEZ6YqWrp
	 Nk68tlEy+DoZpNY3rLVtNNGddGrKFTPwXwuPLX/PzqM+vU915RPlYVsaafjf/Djit+5ao
	 HOiRmg802PtvDdTIkCK3Rpy8qVVr9tK7QbM2ZItiGuRmjLVdeRoeqQS2aSlgXUoMbwyF/
	 jYxkcSKjXrnK4FCBaHXk5lJupv3Xso4f9G0Dz0mxxO2Aquk2f6S6O2oW2gVKHVvIMs/zb
	 bXUZb+zLZXIm3F4yszj2pFTBlMTZbMHxA6W2ZpMn0/fKe+96Is00htQpdIVD8TJayGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567088;
	h=DMARC-Filter:DKIM-Signature:Cc:Content-Type:References:From:Subject:
	 Date:X-Mailer:Content-Transfer-Encoding:Received:To:Mime-Version:
	 Message-Id:X-Lms-Return-Path:In-Reply-To:X-Original-From;
	bh=UtQIaEnaYQpscdnv8kS89CFZoPvgwXTwxpgQLK+sMwE=;
	b=y0IrRiMeIUnN88yLFvB/DfV2Bq4ikVLFG2f1vWv93ooHXkWXKwul570y+3cUnvUR7eD6
	 tcYQukklz1j1c1/9IXERNBTzxdATxUuix7UAX+01PeU0Hg5JKDcV5wdGwiyAeb1mVzwq3
	 DcVAUN0wf82823EGEGpWko5mEcV9X++PuADdbsmka3UrHkYmZz34iyw6n6BdvE4JLOSY6
	 oGJz1OQILOH7+vNefjYEJ6zR/a+OoxjyY6wu7c+W+mf5a+PentT1y9v5uaqIOYLW/FOgE
	 Y/2Kn3v4XNnDE2KcMu9mPkyM1q4mnXhKGrUZyF3KtNz70xfGTThbmdKcPoJblE7qKKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=SxmB8GaL;
	arc=none smtp.remote-ip=209.127.231.48
Received: from va-2-48.ptr.blmpb.com (va-2-48.ptr.blmpb.com [209.127.231.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823B0606A32A
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 10:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 823B0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=SxmB8GaL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794567085;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=UtQIaEnaYQpscdnv8kS89CFZoPvgwXTwxpgQLK+sMwE=;
 b=SxmB8GaLOm/Tkb8sg8s0HyGJMzT+UmItPXgDYn11Z6ZK5LbJhPK9KKMhjDynRUd+cLsha6
 LHpTcX+5LVpNCtb+ZRE5vc1Lsg8Sr1seI4DR4t3626PKKM6dHHaHjQ6E0+cc3kWnV77pSs
 2p9/Sq5MW8J9p4yrpHS2uWAa2esumZ/2/EL1z7Y0TxgIyC2JLJ1xDdb2es69AXvfT2c4BI
 i11q1hbXF3QPjmNt+7jWx4ONWQX+DMStUM4Z4fL+bHy8hx3fNbQOfiKDRPMWSSfUTdodhm
 I5eT3odPu29PBraXiS10b3+nG5BPhN1QEtdw8JSzIgLShCav8FsY5dmCeCx/LA==
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
References: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Subject: [PATCH v2 1/8] dt-bindings: watchdog: loongson,ls1x-wdt: Add compatible for Loongson-7A
Date: Fri, 13 Nov 2026 18:51:08 +0800
X-Mailer: b4 0.17-dev-ce4c1
Content-Transfer-Encoding: 7bit
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Fri, 13 Nov 2026 18:51:18 +0800
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Message-Id: <20261113-mips-ls7a-wdt-v2-1-e8abd6b2f77c@oss.cipunited.com>
X-Lms-Return-Path: <lba+26af6eba7+92ad88+vger.kernel.org+rongrong@oss.cipunited.com>
In-Reply-To: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>

The Loongson-7A has a watchdog compatible with the one on Loongson
2K0300.

Add "loongson,ls7a-wdt" compatible.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 .../devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml     | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml b/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
index 50a9b468c4a3..dbfe9795c835 100644
--- a/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
@@ -14,10 +14,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - loongson,ls1b-wdt
-      - loongson,ls1c-wdt
-      - loongson,ls2k0300-wdt
+    oneOf:
+      - enum:
+          - loongson,ls1b-wdt
+          - loongson,ls1c-wdt
+          - loongson,ls2k0300-wdt
+      - items:
+          - enum:
+              - loongson,ls7a-wdt
+          - const: loongson,ls2k0300-wdt
 
   reg:
     maxItems: 1

-- 
2.55.0
