Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385589;
	b=ObgTbygm4HUingcPyjXf1imCEOuTkjIY4LNZPRhLZdIANXTQilNi8eIERLlDNIdyU0cU
	 PQ4jeMxjLzRFXhKFoycIpjzSMssmJeWW5TocC66m6QhVDlXXZMWZUYH+lkGzGYIYWbK3P
	 Xo0pmjbuWxkakJMLwS3NRsmEl3oyzTXZGHOZ5Tp7xtBkRZNPWrjv3K2XKUEDJX3/i0/dk
	 wZ90MjWxmlDluMRPSihne58CpvALrGeLvIbZ7e+mEXRMWr7DBCrRob/HethBymAX84+mE
	 jUG63onPIngTiYqWW6xun9rbfG0P1JlmEygf1Dil6akRwpPT/bSQ4jiJvggK92/Honw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385589;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=hD0P8YXXxdvtIjmhK8x/tbWxpC2Iq/MwQl2yqUlO1Hs=;
	b=zxaKq9Npeft9kfRvpZ79jJ6TAQh83Wqi6BG1mCIref4ZElaSPopr7VL6CuiuFzGdceNn
	 hTrfK3E3RGGtjFPh/X7eQVRfCBbTFuJKm17DBmpjdqVRimgW5QKxbUEijaIVw9Vw2v9TZ
	 nZ9AJUH/32lkcA4Vg68FLPqGzJbAz5PDElPV/PS4TxCTVKyGEzlAtV/K41ADZiYIY0PXS
	 VvPuquwhcW1nPX9+vlyGa5Jv4f9sOomLEVpN13+mWFc/ltkMX7yGVy83MoMUXW9WzPlVD
	 R1gw0DTnyaNAob1m7McIBN1kCfi/OZMh/FOCO3niS1jnpB75lSNI8yHFdkabtFkyWoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0lM+jDN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F32606A31C;
	Wed, 11 Nov 2026 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0lM+jDN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794385588;
	b=gRLIiqEJRNhnSoTsh6Qpv5NQSYH1hMRE5Wbym52Va2egnMmIMegnU3ZlHgyZ1i4VN11M
	 BgzzJ/jq98zs/p8Pu8FEeIgtcgkYm+e07bruTUSlZ+WmbKmveV5mc6BdiWcTmNMF2FEVm
	 7sm9JH9wiBClzMQyL2QmpDaETjxliK2uDJcgfit3aLP3CIKJaSEpuGI0nlF3+4hNApRFl
	 VRRE3M2AvJgE1cAMuZzWifNKcm8/7sHWHa+tAfED7A137+Y6C910rnDvIjNzoFaksdpUw
	 0eqP3zERmWhinCdjlr5Xl1P/zXAJpYcjLM3tu/XA/V77BJddnPYKoC/W9dJvxV8aJyw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794385588;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hD0P8YXXxdvtIjmhK8x/tbWxpC2Iq/MwQl2yqUlO1Hs=;
	b=duzokdYPGZtCrtN05fr93dA+PYPGKYyOktDuE20RaT/V+hrJhAK3+wEUKBIxKSSPE2H+
	 QzmbGE450XAamq8rUHMrtDZkJ4nPKS1gUK5ygD9uG7AFbXik6OPIOS16ugtRE+/gK3ngt
	 /aM0aACKaHSMz98mVnXv79cKl7mM6eaV2tJGJVbYulVTmAHPTy66p2KeqFbaRL5CjJYjv
	 6xmqdgakg6jaavwLXKTiNRAFmsesVLehOUBeOLO+clXMKQ+VYTIgxnLZSlqp9v7hUi7vI
	 8Zyw/45ezStwhTzsRuwE9OT0MaxTUyGw3ODNQBv6RqcZilhrnS3nEOFiS34/dY5+mNg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06B051F00A07;
	Wed, 11 Nov 2026 08:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385588;
	bh=hD0P8YXXxdvtIjmhK8x/tbWxpC2Iq/MwQl2yqUlO1Hs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W0lM+jDN9VA35pmw17wf46MwLies/1Lduuc5F+eCnu4kCSMvK8xx+rNk4JPqu5fpx
	 SJ7v5VxFnUJoVvhHGvB///ABL8K21uQZYLgrRA99Fr6XJ9KF5HXgcEmqrxcwiufVbR
	 b2WI7+oVk9BTzddhcLu7QbGMjlgnK+/bQI2WmVrrnjyRKdSp+CBxGFe+E/tL7Vx2ln
	 KwFtmkUWvMtZuhzJRKlC1ptCcjlEBIje1zSPE3bUbGFmgjC8MJnKYZFnDykhTV/uK6
	 pfm3kjK/8gypJolFVCmuF2HqgBZUNI9ubAOCvvLvfImWUAT9u7g01IuW+KOoftfuGc
	 AA+eNRmoEVUoQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7BFAE48E93;
	Wed, 11 Nov 2026 08:26:27 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 11 Nov 2026 03:26:02 -0500
Subject: [PATCH v2 2/3] usb: dwc2: Add Siflower SF19A2890 support
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
Message-Id: <20261111-sf19a2890-dwc2-v2-2-cba9dd4a4256@telaak.dev>
References: <20261111-sf19a2890-dwc2-v2-0-cba9dd4a4256@telaak.dev>
In-Reply-To: <20261111-sf19a2890-dwc2-v2-0-cba9dd4a4256@telaak.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794385586; l=1619;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=nQKb53x4kS6TUNVquwYjce7H9GBsH2tS7RH2pY4HKw8=;
 b=a8hF7jD8+wGLj45IBtGTJ6U3mPI2ivMNDb9cwpRa6nTl63O35D19TalR4isiXM9W34IRBFU4s
 iUlgq61tyEXBbnDCcFABnU7zAuxunQJbFyQg0cG8Yk3QCNztzuMPWJX
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


