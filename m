Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385589;
	b=E8YB4jiUhnmbvs1sQagZUFqdzbHztAoWrIHFYuScCK/r4TiyMFTfRKr9cDhhGgsiedld
	 Dg+znZzchRDBhy5hDZfn+c30UNODpeAB5ZUJ+IHbDap9XoQJEaXnxO9bkZyIVCB0apInA
	 nMdid79bW+/4ngJGmxfTWU/KOMIEZ53eVcSDImQ2bbTiI+FjlwmT2cjW7ZEgkSpdD2EmR
	 +er6yBhpF2EW7IYmI3Nd7GMufxx5TziNz+1N4FPWWZyURj/xYJF/3dtTaihBRensaO45/
	 HLWCyHG8G/egXlvHpMR3wH1zpp5f8uxtDSDzqUqVrvvTU9nmhX2gcG0i9jzBKS/D/mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385589;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=LuBQpHIwYzQzWw8LNCNWs7nLbBLkInPOGp+aditSzdI=;
	b=V4/EQiHt/ehPOOjPghYtVFKrbOhWwnYI79Qj775/3RMCa+argQwhc0YMSKhsT3lHm5sN
	 ePafWOszxdmwpZkBUywDqaAobXhSdImxuvWvSv5/ch/E7fGYesvJ8AA/JRBxJ9Baz2ds0
	 SsLVY7NxCgDrqXp0L52EsiDfIooaORB2TCawWkQDiA6Ff33wgnDhJfmvgbvTNQPh493Mo
	 BiTnlqLTAsDsRk+dpbfi2D379uNj4EtGiG0/LnH8THB9xOYPNnwZG8MlLiY7PJ8u2Btvz
	 MHyP51mAxcStOaAo1sAY0k1sYgE0eWwB42AY+wtQJeiejMVyfgSjB8P2gPT8w4hrvNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=neYknNSW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB80606A332;
	Wed, 11 Nov 2026 08:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=neYknNSW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794385589;
	b=1A9frGhKdtDxv4AcjZtK0TZNV3zoEGBULfbjHF6WlVv9SNjT4JIrZ7aerpHpfCKhXQep
	 u3QeN2oia7q2w7etBv4SA90pBP+8ePrzi8xzQClUwV285nELZvhQ+CHnCRc9FGH7OAeFD
	 zLNsyQYTRaHdooOqmoeADpRbUuPm4emqdHXyEzkPHurMb4qGNPQY7+8XNEv7ML1ww/uoE
	 8fIhZADAduwjxdXeJguR0NTM6voR7CQGzeEvgQnfliFsXmtKVocsax3fwuacLrfQMBT3F
	 oIrKC1A52+qLD1BqJe0eDW95zwMKYhZo97HWW/thp0es/CJjFpGHTeJN69KLQIfWI4Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794385589;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=LuBQpHIwYzQzWw8LNCNWs7nLbBLkInPOGp+aditSzdI=;
	b=gY4nl7ciGNap09JnG1bdojIlEgPEW64gG1mwWVva9FU8vAhh9IP04W9p+YO/F0NDaC19
	 4+RkECNGSDm+eTU+AuEF+2WIJ++Gf3n5X1M7b+jzNKKL6ma1tvAMAbnSz2WdyH8YbUxgX
	 A+a8cVlwJ4qMfT8l5/8aq2WZv4ljcFSsrgPwauWkWI/9DZvE+Ps9KLSzzL0s7jnT2CJb+
	 /yCP9eiKdgf1hHiEg0NqhN7iQWG6iQlH/bZa4aBAG+d1XmmNJ7C7Fto8KcfxB1LahPNS2
	 N11bolBpb4CdTQfBZ7Takh4p19rJ+BSE+3T7BIODbL3AkIKIanbJ/oxtESUX+i/znFQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 143161F00A08;
	Wed, 11 Nov 2026 08:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385589;
	bh=LuBQpHIwYzQzWw8LNCNWs7nLbBLkInPOGp+aditSzdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=neYknNSWkjB88rzvLj1tDNIg3Zu5wCI5VTDExBdOkp+FzH2oCJkDVjbtAjfppSL67
	 OaGqK99xCPa9lPy2Q2XiD14itis+B/ruruRgOv179Ry+ClSOsrQEouUctZVwLV/NEj
	 8rgB1B7qQ18XFZH6qfKubJiVWIoxR1xtQ/WbYIxRTTCisopFKKCOCACP93USDf2RAL
	 9494KrOvnhcAQe7nFaaTHyXNlIm7cqEEe7B5ESYb69PYnpfB/tCxjZ2VVoC9pKX1l7
	 a8TWA3aB7EjrRo5G5+va1u0Kq0LXTyTfr9lqoujY8h3RS2xdxW5TaM5qOuLZW/GumO
	 Lik/IsptNnoNA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8EAF748E97;
	Wed, 11 Nov 2026 08:26:27 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 11 Nov 2026 03:26:03 -0500
Subject: [PATCH v2 3/3] usb: dwc2: Handle OTG interrupts that GINTSTS does
 not flag
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
Message-Id: <20261111-sf19a2890-dwc2-v2-3-cba9dd4a4256@telaak.dev>
References: <20261111-sf19a2890-dwc2-v2-0-cba9dd4a4256@telaak.dev>
In-Reply-To: <20261111-sf19a2890-dwc2-v2-0-cba9dd4a4256@telaak.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794385586; l=3430;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=3UAHpfU9cll1318+mjWwjmjX3xQ60+nlO78HrMckino=;
 b=SpTKA9gjirIKNpqRGZNeePe6ZW+chIAjUwzLJsJISUXD6OPgrmowd9okcUzpG8aCQs9qC92fB
 LWVOB0pkYUrAktrJhmSiINBrqrp40staPQvVh3LJY7Y+XqhwQyfBeph
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Chuanhong Guo <gch981213@gmail.com>

The DWC OTG 3.30a of the Siflower SF19A2890 has battery charger support
enabled. It raises the MultValIpChng interrupt (bit 20 of GOTGINT)
without setting OTGInt in GINTSTS, so the interrupt is never handled
and the kernel disables the USB interrupt because nobody cared.

On a GL.iNet GL-SFT1200 it shows differently: after a few replugs of a
USB stick the system stops making progress, the console repeating its
last message with the same timestamp, until a power cycle.

Add an otg_int_unflagged parameter for such cores. With it set, the
common interrupt handler also reads GOTGINT on every interrupt and
handles any OTG interrupt it finds there, as it does when OTGInt is
set. The SF19A2890 sets it; other cores are unchanged.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[Joseph Telaak:
  - handle the unflagged OTG interrupts only on cores with the new
    otg_int_unflagged parameter, which the SF19A2890 sets
  - do it in the one place that already handles flagged OTG
    interrupts, and return IRQ_HANDLED
  - describe what a GL-SFT1200 does without the patch, and the fix as
    it is now
  - subject]
Co-developed-by: Joseph Telaak <joseph@telaak.dev>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/usb/dwc2/core.h      | 6 ++++++
 drivers/usb/dwc2/core_intr.c | 5 ++++-
 drivers/usb/dwc2/params.c    | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 015a5fb7842d..288baaaf4736 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -367,6 +367,11 @@ enum dwc2_ep0_state {
  * @no_clock_gating:	Specifies whether to avoid clock gating feature.
  *			0 - No (use clock gating)
  *			1 - Yes (avoid it)
+ * @otg_int_unflagged:	Specifies whether the core raises OTG interrupts
+ *			without setting OTGINT in GINTSTS, so that GOTGINT
+ *			has to be checked on every interrupt.
+ *			0 - No
+ *			1 - Yes
  * @lpm:		Enable LPM support.
  *			0 - No
  *			1 - Yes
@@ -466,6 +471,7 @@ struct dwc2_core_params {
 #define DWC2_POWER_DOWN_PARAM_PARTIAL		1
 #define DWC2_POWER_DOWN_PARAM_HIBERNATION	2
 	bool no_clock_gating;
+	bool otg_int_unflagged;
 
 	bool lpm;
 	bool lpm_clock_gating;
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 9565e6a52725..e7bb9709c985 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -874,8 +874,11 @@ irqreturn_t dwc2_handle_common_intr(int irq, void *dev)
 
 	if (gintsts & GINTSTS_MODEMIS)
 		dwc2_handle_mode_mismatch_intr(hsotg);
-	if (gintsts & GINTSTS_OTGINT)
+	if ((gintsts & GINTSTS_OTGINT) ||
+	    (hsotg->params.otg_int_unflagged && dwc2_readl(hsotg, GOTGINT))) {
 		dwc2_handle_otg_intr(hsotg);
+		retval = IRQ_HANDLED;
+	}
 	if (gintsts & GINTSTS_CONIDSTSCHNG)
 		dwc2_handle_conn_id_status_change_intr(hsotg);
 	if (gintsts & GINTSTS_DISCONNINT)
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index b31fa1f5ad64..8e814a925dd1 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -243,6 +243,7 @@ static void dwc2_set_sf19a2890_params(struct dwc2_hsotg *hsotg)
 
 	p->max_transfer_size = 65535;
 	p->ahbcfg = GAHBCFG_HBSTLEN_INCR4 << GAHBCFG_HBSTLEN_SHIFT;
+	p->otg_int_unflagged = true;
 }
 
 static void dwc2_set_stm32f4x9_fsotg_params(struct dwc2_hsotg *hsotg)

-- 
Git-155)


