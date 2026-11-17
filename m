Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794875505;
	b=xZnSn089ywRytHtQ0yfm3cYXmr6S+/tQAdb5q7sXn0EKi4ZTJPCU9HB07VPKicFuVJVy
	 1DgCLB5Rb4Npg0rPz81mRs9zx9qpinLSzKB5iAxmz/cxBoQ3DkoPg9lLTDqYV06URYvFx
	 Jz/wpUDdrB1rX6V2p2GP/zjD6RAYr88ne81wVN0dkRFiLHupjHv3pJoyjUWI/Nalh8ovB
	 HPjIAulTbK8RUdE3luRnhd/UCYIARN1/MgMSMt+EOA+AJODvsmCWegX45PEo+gK8qYc/u
	 mWdm3dL1NA9/9FIgEMsKScmpSEezHD2p9OgBmRACf7AGJ9eU/yJvIej0B9u+ymDnBfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875505;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=LkEWweRJXMzM9FVrkOv5FBKaYPCrzSWeUakLe3PsQ0o=;
	b=xoBCgWZ1V9z6kgOd7Wl+49vZyfGTSiPR6tNqoP+sNk3Sxqs/hRJX8evOtI4XvbzG2k57
	 7QAoZ/c39ar6NFXkIeKW1HoNxeZOWxwPM2VAlvS1iFk1j7J35o4fZcxtqXAJebFvDzyBX
	 71ygguMCinuphvFXZUZRnWNPDgFsMPJdvIoph44sZ6CFRRuchvW+hgbx5vOWf7EvAkuhi
	 hFsQLiIKyyfdNuocMIbHKlWZhTyjQEQ5SJcWtJ9pYF8hCjxg4+4OdBHlWIxQzxj0xbvlF
	 0y9YwwBXWPO7So6VqVqejkjG0sWaPWPIWkWy24ApENu3+JVmxZW3MnGJI7uh9DpD92g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PbOwQwyM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926BE606A31C;
	Tue, 17 Nov 2026 00:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PbOwQwyM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794875505;
	b=FJYRe2+jmTskLf6R2BIuE2T3dcuGycGp5G5eD98inJ6GsZuOxE5QUcjFXsuIxKhZfg2X
	 F9mQp1IJ+Nu/c8z8NTFutsFbkAsGHUpdf/TxS9nhq3RBIOjzyOjLaoxmNbNcsV6cOef2e
	 h1je08zF3QApIfeBi9KDeA4HdsRwy9bJk63wDV2aR5wU7xQRb2r8dd57vX74KYAkwXvPq
	 buY49aJOaGjctnqsmsXTeBEfCko3IQc2f87ZcwDLGCHMlUNuxZEqiAwxlrxU2talXz+Z0
	 c2wQn2Frs+JDYpifQfYLSp09QxpQOyKvzF+yziWiCg+AlOoktYMlqyjiW4vfa9931ig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794875505;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=LkEWweRJXMzM9FVrkOv5FBKaYPCrzSWeUakLe3PsQ0o=;
	b=l4emcLhVDNuMT3998irPjp7Svthj1qe6tkp5PZKUDroUVZiY/ofJnljH9UiZz+J/50jL
	 1HuF1NvzV7HU+vqcJY0hzefLtvcBns4cAKtLw3E7yVhjawGe6auS4kofyFUPQ5SgDPRmI
	 aEKUBSAXrWquV0c2/WYndcRqZoDXZ4KDi5EqMLgq5QYeu9AK5n/8EZgOIWXt5L1dOuMPo
	 AEHYUJ85XyFkVTmD8bXjXS1baO6VGZyCPbUfhYY1PyJVNPsweYnZkst11b5+dp8zuZjuL
	 Qsr37kPvELe8n4XRXFA/aCksCTeqbnUPWNAPRdP4zVip9L3/+Q3jLLM3ldrozvw3yJw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B83C1F000C5;
	Tue, 17 Nov 2026 00:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794875505;
	bh=LkEWweRJXMzM9FVrkOv5FBKaYPCrzSWeUakLe3PsQ0o=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=PbOwQwyMkakBXJ4jEb6H3kBUQUvw31Fh9vCQxfm+bW1cIk2NWA0wcRGyFSWycqO2Z
	 gKfanxrADwf8JM8TDzqQhxNoITUZQh+TFSJt9lFwI09zP2iF8L42adQjs5FZWrUyzQ
	 IEPls2vGwzwbcquPd2DaB2ai4eMxly3aW1vmBB5S3E6o7Zdl18YD5Q720uQtA9oyCE
	 WqoewJRHDvxnz6ceM4fCJrYjjli0sVU2MmGO7ZnWZrsXsyXisusLfFkpeF28MInJhJ
	 BfiP1bmQmeo8xxnSxNf7A9voggah+AIczjvKwUXyiVibjYTj0BoeJyC0S3qlTPtVQZ
	 Sb6y9mg8c7eOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CD4E74A649;
	Tue, 17 Nov 2026 00:31:43 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v2 0/2] phy: Add the Siflower SF19A2890 USB 2.0 PHY
Date: Mon, 16 Nov 2026 19:31:31 -0500
Message-Id: <20261116-sf19a2890-usb-phy-v2-0-df3ce9d23f5a@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAGOg+2oC/22OQQ6CMBBFr2K6dkxbC1hX3sOwaOkgVQPYlkZCu
 LsFNW5cvsn//81EPDqLnhw3E3EYrbddm4BvN6RqVHtBsCYx4ZTnjFEOvmZS8YOkMHgNfTNCpnU
 uhJS8yChJvd5hbZ/r5rl8sx/0FauwDH0SDh9DkoVfrLE+dG5cP4lsuX6l4o80MqBgNK2UkfsiZ
 +IU8K7UbWcwknKe5xdhdQyo2gAAAA==
X-Change-ID: 20261102-sf19a2890-usb-phy-5bb644992750
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794875503; l=2526;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=KCD1K/RN5VnCsfZu7rP3RZx/6edB+L0TT1Z4KmlF39I=;
 b=WcdohhKHXSOvPKligVFFb1OadZvEoZIDiJQUqATxR0TTAkUhAMRhpnu+IGra/PT827BRGH/kv
 fP+pa6WRHIoDE1zcapecz2lQXoH9+Zaa9VNR0wkfFOKAEZTLL7Z4gqi
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

This series adds a binding and a driver for the USB 2.0 PHY of the
Siflower SF19A2890, a MIPS SoC for home routers. The PHY takes its
reference clock and its two resets from the USB block's clock and reset
manager, which goes to the clk tree.

The driver is Chuanhong Guo's, from his SF19A2890 branch [1], with my
changes noted.

The SoC support itself (MACH_SIFLOWER_MIPS) goes through the MIPS tree;
until then the driver builds with COMPILE_TEST. The DWC2 part goes to
the USB tree.

Tested on a GL.iNet GL-SFT1200 with the DWC2 patches. With v1 on
v7.4-rc1, a USB stick enumerates at 480 Mb/s and reads at 5.6 MB/s
(5.0 MB/s with the same stick on OpenWrt's 6.18 kernel), and comes back
after unplugging and replugging it twice. v2 takes the resets with the
bulk API, so it was run again, on OpenWrt's 6.18 kernel with the driver
backported: the stick enumerates at 480 Mb/s after a cold and a warm
boot and after reloading dwc2, which powers the PHY off and on, and
comes back after a replug.

[1] https://github.com/981213/linux/commits/siflower-7.1

---
Changes in v2:
- Write my note on Chuanhong's patch as a list.
- Add a MAINTAINERS entry for the driver and its binding, naming the
  driver's file, since drivers/phy/siflower/ will also hold the SF21
  PHY drivers.
- Get and toggle both resets with the reset_control_bulk API (Philipp).
- Word the error messages the same way, name the error labels, include
  <linux/device-id/of.h> instead of <linux/of.h>, and use GPL-2.0-only,
  not the deprecated GPL-2.0 SPDX identifier.
- Patch 1: add Conor's Ack.
- Link to v1: https://patch.msgid.link/20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev

---
Chuanhong Guo (1):
      phy: siflower: Add SF19A2890 USB 2.0 PHY driver

Joseph Telaak (1):
      dt-bindings: phy: Add Siflower SF19A2890 USB 2.0 PHY

 .../bindings/phy/siflower,sf19a2890-usb-phy.yaml   |  58 +++++++++
 MAINTAINERS                                        |   7 ++
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/siflower/Kconfig                       |  12 ++
 drivers/phy/siflower/Makefile                      |   2 +
 drivers/phy/siflower/phy-sf19a2890-usb.c           | 132 +++++++++++++++++++++
 7 files changed, 213 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-sf19a2890-usb-phy-5bb644992750

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


