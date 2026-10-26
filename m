Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020744;
	b=2pe9eTOWqdQaPAQZtQ6lbUFz5dcijZJTQGuwccjxgTPtfTJQsxHre8YfgRiAqSLX2VsZ
	 wVedITAIWH9+5NWJsgyP03st4/tzSCkacbjr/ofPJp31hVeAtWxW6TTdVQPBKABajrdJu
	 cAe5P1HhBpOvfy9cabEH7MvLjR0INA9fPKN2ZJaZGWAJ/Cne5JGCEPLb8NW01ISxOqvfg
	 5dcOHpgmSGitgJl2rZF5Ng6+Ifd2lxXL+Mrypzc9bENByDmDkQDNx0wSYHkRywvNcbA6h
	 QvTOFiGVdKy0k2oEkcasqs16iE5v9DiCAi7OfQpHL4LqvyCEXT8dXFytn2tmoiasloQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020744;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lEBohkrJwtivDTkPat+jW1R8QHJD3SMPozCAyYOl+BA=;
	b=X0btq5XJRvAmNtwg1e7GKElSIeZnX3NHVN5OALgvITZOWfRAXwQNSomxtyyKDc8VW22l
	 ONyRk1wqEtGEGSi+6CR0fl1yfhjK2Xrjj0iHbSagHYcoFPAE7JJouThoRRTKm6nCDMam0
	 DsrDMIQlxe4MDVJcm5wyRc1LemfCFc6/ZnDKRiCEpzYuTVlXR0IKmfkffRpiRL7xbBlqG
	 BDdEFK9E30N9FGRqT2XosmYnnjNJWBqvdmyMFyk6a8vVZuomQRoLm5MIaN5m0WBnc2DNQ
	 mJ+I9OeqHZ10vp9qoH2pCXOtWdRPTBeftdbNyURZKF5J8INn2elVQOPr2YEOgLdricQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eFPqaiAI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59546606A338;
	Mon, 26 Oct 2026 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eFPqaiAI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B894B1F031E3;
	Mon, 26 Oct 2026 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793020743;
	bh=lEBohkrJwtivDTkPat+jW1R8QHJD3SMPozCAyYOl+BA=;
	h=From:To:Cc:Subject:Date;
	b=eFPqaiAIh3tLdIpTzGifvIE43KAbSevBSTuLasXX01SVwel7aoJ7t2DvNLpNYCsqa
	 +Jp5q+dY8P9+uPDDVE9ni7h6V3yJPJ/TFOIyNljazs+P4w/Vt3JqVHHC1fAEipMgp+
	 BuDvZuAZ0XtrJzznLqM0bSKTXmj6G4/2DOWiPSyOAZdozfQB4Trice0WhMWp2sHK4K
	 YoVx4yG0pjo08QxJbv4J6RyxBQRL9TD+WgGyj85D/Jpx0IjF/iyrDN5FK4uHDphw+E
	 7jO+WVKr9XKcki3WGvAu4Eo8MENMA6+5A3RYixVdTtJh2JqqppsHcFU14aauZjtvKk
	 YcBCfHoKGke4g==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: PCI: xtalk-bridge: disable byte swapping for SGI RAD1
Date: Mon, 26 Oct 2026 14:17:52 +0100
Message-ID: <20261026131752.7519-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RAD1 audio DMA engine moves big-endian sample words. With the
Bridge byte swap left on for its slot, captured samples arrive
byte-reversed and playback feeds the DACs scrambled words.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/pci/pci-xtalk-bridge.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index cf115abb54e0..1072e70bcd42 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -105,6 +105,9 @@ static void bridge_disable_swapping(struct pci_dev *dev)
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3,
 	bridge_disable_swapping);
 
+/* The RAD1 audio DMA engine transfers its sample words big-endian. */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_SGI, 0x0005, bridge_disable_swapping);
+
 
 /*
  * The Bridge ASIC supports both type 0 and type 1 access.  Type 1 is
-- 
2.47.3

