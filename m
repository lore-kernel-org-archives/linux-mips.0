Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795206686;
	b=HlvNmm2Iny7ZNvAdavRI+4q93REakOMDlxtjO+oK55VuZ5lTcMpUg5lRilbvh1/KAG3e
	 zbvaKURmuoDfBvPsIklI4yTIVaMitiefl8Gv3DcCxH6aubtYTgfnqGmQfUO4UybbKIIkj
	 CbDGwHE6T2ZvRpJCtpPaZefw9wzXO0d0a65y95ix1Ixuw7vy0lqY/IYyQXVs9P1+3o+cz
	 lVcH6FXbDkNa5i4FiMRJQacYRwDAbTNkhH6/xHXpZGCF4d7KL70+vs5QOi189iZwuveth
	 sqo/L4HA5FfCadPnCb/BCd1HaUtv9a/bYVS3IB/8cnwH9dy23iHh+0MbbVtKsa17w5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206686;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=LuBQpHIwYzQzWw8LNCNWs7nLbBLkInPOGp+aditSzdI=;
	b=nSyflzggD00QlzVbSfypVTQ9eJppkEBzgAh4ikqZvYlBVQyk1i7A8N/suqY4CtWhqBao
	 S05V6qgVLcBhbIdeiZEgQzcc9L8Z9M7vlafNHnlCfL7ouvle/VU8qqswMSw74CgRffKAT
	 m7I+zQvs5FUjoVSnWH9Qoe8FKrMgclC376JXufFgsVYQMeWY0wLe9mTRAhbQ/KlSC2oaT
	 Y48zKR8Qf+yyD3B99O6wKjf60DQHcxbcDdMB2RPDpeD+hZG+riq4aRicwvSJz8R8f1HdM
	 rew/RUkJMitbKAE8GvpNJr75dXugDolS5Lrh+rvm5ft4xlXtMtQ0a6u7tEfII05ZXLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OF71VRcS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCBF606A6E5;
	Fri, 20 Nov 2026 20:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OF71VRcS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795206685;
	b=03iS0wCMq5Gui4NzlcJrdtJyzJe5vae6uG0nuOP/wi0Dmt4n9hlomdLYxO01lqsUv76K
	 4kKCTC02JI7ZXRqJp1e9DY1zqXmNgJqE4U98tFCF41trmysXaSwJUFgdJpYFw+sszghLN
	 Gnk1ukr3RRqsZo6eIU9mnLWttH460ZO4NeOnf59DORvAqUoDExhv/yldTZkDX1lrbB9np
	 DhB485w+E6U8cI4ZnF/fq3ojnMcpbA5q2DywyR8k1sxbggSSDN6EI589v69uIZQ9AoySi
	 LW9SNsL9Kahu52MBlhd8pyXFe2YOK5D9F8GC2f9tJq2wdKcPjEsIF8c5SFQV9SepG2Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795206685;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=LuBQpHIwYzQzWw8LNCNWs7nLbBLkInPOGp+aditSzdI=;
	b=Jk9F/VALVTVcgKf8DhqtMyOuhu/64CBsSdrU+VOFs+nL4BsyitgoDrpNRZW3qFEDGxH0
	 kwlBmryn0kIiwORqkG7VmGIxvR0OGL5slixaqIj66QJERr3/PFWIYfAdYekNdeuJZKZTE
	 eeI3GbQ5yJIDY/aab3FesKGhItBHzGOlCnyAK7DKYLaWn5PJW+C0pOb/D1b3APPfmXGe5
	 yOQr+9ww2EfxREUYdlngMZ4aA66AXLmu350zGB2Zq/DKNESCOh+ppY7AoG+l1WWNBoJBq
	 ue1l0BIVXlg5Yytw6woAiT+gfv16WVemWrZ7+uOR75+aVtHds2dilVx2DaevhhN5idg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABA841F000D0;
	Fri, 20 Nov 2026 20:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795206685;
	bh=LuBQpHIwYzQzWw8LNCNWs7nLbBLkInPOGp+aditSzdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OF71VRcSuoNhqgp2da2mNkGJvDu9nnGqOodscP5RsFueh/OZ6dxtog12CchQub/2p
	 TQIZNGX5SjAzuAq3se/Qhd7xXj5UbNC41rGYQcqW2uGboXeCjEUSQVV6QefuSM5GLF
	 5c9NmoD5PIQoDJHIRI207lNqr0aSkvvmBb/HW3w/QZFPXMUJw5bFKapfMbmdgsxqeW
	 PERiJOMmdhWONcF6bSq2vVzlOD2bjiW0Yua2WHJ7g6W5Ff97YdkoF43CsUXTJOAtfY
	 LY6XicwCKOFmcfV2HUeIPzfDvxK7GUnr8uiG3LF4Hr/Gz+oETrFh3hB4hXA8EQCzmL
	 btacLQuEuiC1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 390314BA18;
	Fri, 20 Nov 2026 20:31:17 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Fri, 20 Nov 2026 15:31:08 -0500
Subject: [PATCH v3 3/3] usb: dwc2: Handle OTG interrupts that GINTSTS does
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
Message-Id: <20261120-sf19a2890-dwc2-v3-3-de377bd408a0@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795206676; l=3430;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=3UAHpfU9cll1318+mjWwjmjX3xQ60+nlO78HrMckino=;
 b=T9XQpEGNDIQO1xPiEINvsEmVk8vTDrj/SpzLuSyq3cbivv2590fZbt7Ii0TPGxw7rYsAKPLcY
 jInXym8UEzFBDnCn/ziCtj32qUMaU4y99ONFZknKgpwG9Lmu9EaVBgO
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


