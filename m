Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776920;
	b=h5zgM8BGP3QRwJM08LDhsP4zq6XVGbpApzyhxBJnSqRzSoxZBgfv8u9waTezsIBY8f8v
	 E5fpidYjPGQUzOyXmAhBpQC1q7wG3hH0nTGd0o72BtxQrHU4CjMkk841neEKlW0MNw/Jq
	 i2DvELKbB38e97XFe66QJUGFQJ3zrKB+PovJDquAh0sCB20zekFmX29W3NlH0xPFsQv8t
	 Cd6+340Li4OQpriSue0IQ/Ar76YW95wiHCDgA7VSSXYhoZ24zPgQGrxWHTwtQkhIC04t2
	 Rl7h+Ov2TT2dwedJQN02wWibKwLIaVChR529NJZ9iuQG3xRE71n8JdV3c9CeHZWMqQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776920;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=CgWUqvXqU3qwScnku9vqQ0dGajTQvySsdpdfJkRnlrM=;
	b=QqtZZu7XTKCZk3i4SDRowQZur5TPIO/bxCEBwOxkFuXE/X366nbGNcYwNXrxZAJj5scP
	 OOiiKlj2mP7jlVyCppIp8Xp8I6wx7i4I+2PGPENqW60q0d8VVczIJfj4mPmnPZoXruvrc
	 8AWRgNYvqYdokw59YWiS5Jd7X7gTUApOoRGJUShcmaBnCGOT4IG234VZFnvzNmDh3g0AR
	 atB62UQNd/XFAS2FxoB95vNbSL59vHROew4utmmpP2C+ESYhJmXx0QaBWyXXyhEy+oMyD
	 lob2PulM+Jm5ffiz/s8wHjEp1IwRgwmc/MIGFGBO+9ivv9RCVvpcov8pb5qWX+SCYXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ogw4tEqo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC0606A332;
	Wed,  4 Nov 2026 07:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ogw4tEqo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776919;
	b=MipqO603qNG9ZkEgU/F7GFaEfJpVpWQ0JiNv2AUQRn4Vred/owOTv8ZDGV55j5RI1jLh
	 bxosSP0pNjMlZkh7zoCeND4xk+DOx71HEyt17VXDJT4ACb/2mPEhM0wYzCgBfPqgy7prK
	 TL8S12cbay/t6cVsM2yNTt9IiJH+JJQhD8Wi+MQaJgF34U09qgkhMHwKJKXjH3GcaFmkO
	 yl4rTo7GF7EwSLCJjEEo64ODllDamXzgnJYLOpASaqQp/yBCavu7eommsq0C7dr2qzD1z
	 2y/54/FVtMQ0qE3nfoyqLupqSyay88qbb49gxyEubQb8Fgg2ON1z/FvPbKSE1M5pSiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776919;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=CgWUqvXqU3qwScnku9vqQ0dGajTQvySsdpdfJkRnlrM=;
	b=PC9Ex8eQChjdEAzs1R+X+SpQJw4eKW9iNEnhgzQnFrvL4la33NprxOROn92pn74Z9JYH
	 5dHC7VRDsCWOkiqQqSx4FOuF70vQzZVajDJCbRsLvU321ZaMO5pJdEvuz9ljusw/xqQdV
	 s6lSIQAMrXJYyzeszGTRE/DzVKuQp7x/+49e7la83hbuYKH4Gm/z5BZ9yqZ7vCdMIh2/8
	 HxhZF+CqRVECNVZRooFu1Zsb/M51pDeOy6iZZZWkSPqnzzZzwXnHvDgCjMEY3e/XGQgNW
	 ZXV/zoRYVz4zXc1bsiAcGrLwDBamHfFchMkAfJi+9b1x/e7fVu8mcEMO9MNtFzX8QXw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E84BB1F00919;
	Wed,  4 Nov 2026 07:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776919;
	bh=CgWUqvXqU3qwScnku9vqQ0dGajTQvySsdpdfJkRnlrM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Ogw4tEqoc222WtMn4yso9xIdJlp8yHjR8pI8ELKcNz/3YBa6RPaHle7zsX16y5hLc
	 7ARYeWdrrQeT2bOa4QE+xI4uSAeTEWOcuNGZVKbZpzmeUDUcGgZIuNjA7b5KemN96R
	 cOD87h4vqMBg/EB860+7sm8bCmc4LWH+u1oNlNAdG//x+vcV44W38I9PmdEppfkwcf
	 5eUN2ARJUY+ngy8ruwrJB85RHH4gJQT7iX3+PWwyIpAhTEgenwjryRCh6EUT/Fs1e0
	 ToB1FapnaQ72NOGbl15MvwuMOVKUKlGi57GvQmDOtNa9ll9hjPON9YUpjYptpP7844
	 K2E0p8k0dneyA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7C7F046CED;
	Wed,  4 Nov 2026 07:21:58 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH 0/2] phy: Add the Siflower SF19A2890 USB 2.0 PHY
Date: Wed, 04 Nov 2026 02:21:51 -0500
Message-Id: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAA/d6moC/y2NQQ6CMBBFr0Jm7STtBNB6FcOCwiDDArBDiYZwd
 6qyfMn772+gHIQV7tkGgVdRmcYE9pJB09fjk1HaxECGSmsNoXbW1XRzBqN6nPsPFt6Xee4cXQs
 DaTcH7uT9az6qP2v0AzfLN3QagV8xnS2ntu8HhjmPYIoAAAA=
X-Change-ID: 20261102-sf19a2890-usb-phy-5bb644992750
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776917; l=1830;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=5xOxVIa7y4Bncr1tgiFluYq3mT02k/fOAPJuTB3HPwQ=;
 b=gbBiXRjPrS1uOUFkV7WMVTIj0DPUOx577XxDCUirsdq3WthYc+Rf2RJPaWFA3qhopLlPcPJoL
 +v5VjW7c72IDoSNOW2LtIGBw0evDcvdE8A4jxMe4WcLev/7TLEGbaMM
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

The MAINTAINERS entry that covers these files comes with the MIPS series
"MIPS: Add support for the Siflower SF19A2890"; this series applies on
its own. That entry is also why checkpatch's question about updating
MAINTAINERS for the new files is left unanswered here.

Tested on a GL.iNet GL-SFT1200 with the DWC2 patches: a USB stick
enumerates at 480 Mb/s and reads at 5.6 MB/s (5.0 MB/s with the same
stick on OpenWrt's 6.18 kernel), and comes back after unplugging and
replugging it twice.

[1] https://github.com/981213/linux/commits/siflower-7.1

---
Chuanhong Guo (1):
      phy: siflower: Add SF19A2890 USB 2.0 PHY driver

Joseph Telaak (1):
      dt-bindings: phy: Add Siflower SF19A2890 USB 2.0 PHY

 .../bindings/phy/siflower,sf19a2890-usb-phy.yaml   |  58 +++++++++
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/siflower/Kconfig                       |  12 ++
 drivers/phy/siflower/Makefile                      |   2 +
 drivers/phy/siflower/phy-sf19a2890-usb.c           | 143 +++++++++++++++++++++
 6 files changed, 217 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-sf19a2890-usb-phy-5bb644992750

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


