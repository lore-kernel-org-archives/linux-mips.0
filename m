Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795206688;
	b=Nh5SjBmzi/Snn9XRLhLlEdGkzXcW9mhjCx8Vg588TIYVtZtTbNRs3nd4sB/xSjqfdb1U
	 X86Pq42QYWN/3MkwW1w4KzmSNLCT7EdGwYUXeY7NiMn3FWQDcUIOlxVgrnV9AeTWldect
	 sIYHk/dnb60+o7FnphGCuAsnMyDc0YFvFVHFHBeXTowlc5OS2YMPckbFz277IXTJNeHfi
	 9rCSkf8ynnX3gpWO4m9v8Tq8GuaY9bHmmt6dxNci32iVdf9Y0adDBP5TRuB8GE3WS5aCz
	 /8X/pEOuWAqS+KnhDL8OFUhmBOAiUsvAtl903PqDFHL9UXe9bq8YmHQ0JlCc447DXhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206688;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=hD0P8YXXxdvtIjmhK8x/tbWxpC2Iq/MwQl2yqUlO1Hs=;
	b=4houfE/K3RgJePebjf9xrGUAEzV4TukuQzi/gpU0zH2LxNCc9UKekIi78bb8f1hJ2Pub
	 nGdLW1BhxaVMX4H4Hr0qvxmsQ+D8eJwZKYk32KE05nXApqB5g01Gp+bAG6qxPlXRnIm6S
	 kG8bfqkgnum30LtlJykwZCKwk0YkyXUmZp+Z//lyShj8VbAkclBt+7e2De7mg62Hkl7iq
	 MHojJpUJvrUDyg0KAJzrMigDRlmMRuM4o7HXuSgEXBDf2qsPeSwFT8tsK2q6Vh/V1CCNc
	 C6M0xZoglPY+edQA2pHKfmbU0Dxz5y0gGHiSXnoAswdd/nMYN+qy/7lCltETAi7OrOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAK1V95E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD35606A6DF;
	Fri, 20 Nov 2026 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAK1V95E
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795206688;
	b=Lf5thiW/e9egQhNF+Rxs3W0/skFHJruIvZJb32R5UtSir0hYJIz0J0Tc+GARegCItFxc
	 aGyXhK8erfMRX49EuOCe9P0e2xR7foULX4wugxi4NfcLLTP6mxfewZQHxndIpOfkMqRKQ
	 gmqhjZDVnS9jZ41Vp793PAXGWrfHUSD/9PoQxxQFvZVGwzfM8/q4JKNjaH0rHJwLPAESx
	 4LaqOXbcU+dHpae3vlcIb+cbNLRwhrUf3zOAAdsyE26cbIcO20O140/AqOglulGaQ+eHY
	 zM9uTyCoeH9/nK/+eQTsfWqyJg5vLgotSAJX6mdWOhqM3tcEOXk+JLFHDm3Z/Az7oeQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795206688;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hD0P8YXXxdvtIjmhK8x/tbWxpC2Iq/MwQl2yqUlO1Hs=;
	b=Wj8xiwPA9sp3H1mp7D022VTbBhKsvb/BClW9tlZi6W350FLJSVt2wIGawH0HeUhdJl81
	 ke0YQn7vBqWS2u1j5Jlg7s1HdTOZ5fZWbII5DG2gtdsQkDXDM8oZrcv5GswIxWbiO3jfL
	 kSQHNeiDC24b8nYh87h6nTEL3FOqdfLHYmRxzaM1USvbl7M2uHxJXsdsLAWwAS5XVu9DV
	 VrpVYizD4hcIMnmQVCjabT8/RgQUgOQpH5i1KgEeh+4pFsQKtPRYDPcm5hBGuANZLqJb0
	 L8MVhDUAcrhDA/V8Zb2EbqGg2ybLGuhwy09ZkLYDAaeNsYP0yowL2b/gj6C0KCpfWyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9244E1F000CF;
	Fri, 20 Nov 2026 20:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795206688;
	bh=hD0P8YXXxdvtIjmhK8x/tbWxpC2Iq/MwQl2yqUlO1Hs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BAK1V95EaRovdzNkau92EQC6fXsAl4L8Kdbe5tExDfH6frlcEYIYLsygoZLWvw46k
	 NH/d0dE9RjkcqsmORlx/hDEE52IIO057rgFqyQyNu/NWioWxZdrSIttVBZs/wrV+TM
	 CzoIXAL9BmBRGzlgolOuf5FFO0gLPc85rTLP2AM0GzXhh4HQAhECC69830rdNTqC3H
	 v2vfvQS0sQnyWeE36YbbGu7ua6GiRc8PlqpFVqi4NwYLEXrEl66SWa2nBxVZaLCkeZ
	 0gG8BseTDQKCMKwY8ZJFkmN23jmD9VRJg/v2XilzCgRJU+1TcFs2FMlCCNMTHVba4Z
	 eUbREOVxl2g3A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1F5034BA14;
	Fri, 20 Nov 2026 20:31:17 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Fri, 20 Nov 2026 15:31:07 -0500
Subject: [PATCH v3 2/3] usb: dwc2: Add Siflower SF19A2890 support
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
Message-Id: <20261120-sf19a2890-dwc2-v3-2-de377bd408a0@telaak.dev>
References: <20261120-sf19a2890-dwc2-v3-0-de377bd408a0@telaak.dev>
In-Reply-To: <20261120-sf19a2890-dwc2-v3-0-de377bd408a0@telaak.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795206676; l=1619;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=nQKb53x4kS6TUNVquwYjce7H9GBsH2tS7RH2pY4HKw8=;
 b=6wWdlw+jkBJooXJ9SHKzOWRpF+PWi6IoBApFPubZ4uVOWJv/5v6deOceuai7GwXotp1vICPOq
 NbjUgNDV20ZBWvtLVvuUcR5f/fRA2pGPdKTTMe4oAMubjFvvSE7QnoL
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Chuanhong Guo <gch981213@gmail.com>

The Siflower SF19A2890 has a DWC OTG 3.30a controller. Limit its
transfers to 65535 bytes and its AHB bursts to INCR4, the settings the
OpenWrt port has run it with.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[Joseph Telaak:
  - take it from OpenWrt's siflower target and rebase on v7.4-rc1
  - commit message and subject]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/usb/dwc2/params.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 091bfcfef753..b31fa1f5ad64 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -237,6 +237,14 @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
 	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
 }
 
+static void dwc2_set_sf19a2890_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->max_transfer_size = 65535;
+	p->ahbcfg = GAHBCFG_HBSTLEN_INCR4 << GAHBCFG_HBSTLEN_SHIFT;
+}
+
 static void dwc2_set_stm32f4x9_fsotg_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
@@ -334,6 +342,8 @@ const struct of_device_id dwc2_of_match_table[] = {
 	  .data = dwc2_set_amlogic_a1_params },
 	{ .compatible = "amcc,dwc-otg", .data = dwc2_set_amcc_params },
 	{ .compatible = "apm,apm82181-dwc-otg", .data = dwc2_set_amcc_params },
+	{ .compatible = "siflower,sf19a2890-usb",
+	  .data = dwc2_set_sf19a2890_params },
 	{ .compatible = "sophgo,cv1800b-usb",
 	  .data = dwc2_set_cv1800_params },
 	{ .compatible = "st,stm32f4x9-fsotg",

-- 
Git-155)


