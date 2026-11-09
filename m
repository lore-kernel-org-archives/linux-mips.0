Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187083;
	b=nbzYu3cgOa3HtGncomR7qu/foJ+MZyzFy+6i8ZVwNPA95SUhfnOJGPnrO1X4NqUVDKy9
	 KRZk6LELMlI9Rd1/UaUcXcm3byZQrlycJbNEpruwGJW0cXb2rOKakff9Jz0l+lkZcTx6m
	 MmsXS1QPy2Hpjp5+bPJzSwlIeGGTM2h0lTBb2GP2DJfe12j5UFwRd2kcZ3XRtGMJvzCKD
	 67f84ilBrAteeRXh739QPO08JR+Dc4E7kfYclRAR7y2HwQAvR+4ToPS9G55/GrNETUgEn
	 +L7E7wX2RtR8sZwnYp6bY50EwDAuYi3ipWZL1/Ivd4NPQgFqo/F8sqgxYqFltAqqvpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187083;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=slZxuBR5Ylf16jTMuBMAPIg1IYxJMk2ifndH1hoqYJo=;
	b=tEalk1aO+kBoHaDuB+/EhY+gX1A1eA6s5GXpSDuMAXAzV11O54sI1/QVpLzGYJwaVkDR
	 ++XCnjVH40Ox/zGcUUvWjriLJcZ2aDdCnuOuUm1Z+GCdelKC+kbA5MjX6iZWIkOgicQJu
	 GU09r8lvucSD7E7gwWANpJ0NSgRkQd7X+W8BdTOY7SAZGyIjth9/vQj2KDcLGkTNPz59d
	 31E130waYT+vK+bncWTCe5yQqSan6ZXGacAjsXuqEfxVWEhscv0lI6Jf3tmM8NE8JCqkZ
	 WBGzD94FMt6tN4qbGrYI2Nyr3p0LOnSiFs1emrRweSb+wvExG9pfjjilyfIX+2chhBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=fKRvzmdy;
	arc=none smtp.remote-ip=62.149.156.116
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232D5606A321
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 01:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 232D5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=fKRvzmdy
Received: from [127.0.0.1] ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id QE1AxMsH06VShQE1BxPoug; Mon, 09 Nov 2026 02:17:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794187073; bh=BoLHLvKmDPgG+mZ0H4J9N9IHuLDr3SiWMohhnh53hq4=;
	h=From:Subject:Date:MIME-Version:Content-Type:To;
	b=fKRvzmdyzC8jyj6MrcjcoSoG/ufNBPIYlagoNWL/aqwH5qg2ICjP0nr0yRKqKlM0C
	 SXaJWWUhQN6I8VtdPQ8nweW8O3K2bAdrMrLKFJZ0Dwb4RHwLWM3mGWntMYuGVG7Kqm
	 9dI2UTHOpktAzWvZbCP65KXyrGshXRywOn2pxuz2ruJq6XoR7cpQ9fbAMpvIxP2aMr
	 jSFpo9z8jEkcCTx9ZIQnSayB6xWN3Z/cT0o/iP2yeFz+kVtIxyL4t/bwPhn6cEYySq
	 YwYJf6ZIwu0DSXk6RiUCKXbLVf/a3cSaK9KPoGo3s7AcW01bEDPZ/Nb27Sn2myAieI
	 5FxhDw4mF784Q==
From: Alessio Ferri <alessio.ferri@mythread.it>
Subject: [PATCH wireless-next v4 00/10] bcma-ac-rev1: support 4352/4360
 rev3 chips
Date: Mon, 09 Nov 2026 02:17:50 +0100
Message-Id: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD4f8WoC/23NQQ6CMBAF0KuQrq3ptAjUlfcwLtoySI2CaREhh
 LtbYINoMpufmfdnIB6dRU+O0UActtbbugoh3kXElKq6IrV5yIQzngCDmGrzUFQZGo6B5iqTMcQ
 8lawggTwdFrab687kbR3e0XtaYdeQy7L2L31D00yVEyitb2rXz+9bmNn/T2EY1QnLUMpcFIfk9
 Oib0qHK93Ypb/mK83TD+cylTsAIkJz9crHiAjZcBA6FRpFhBqnU33wcxw9FheEKSQEAAA==
X-Change-ID: 20261014-bcma-ac-rev1-da894142790f
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>
Cc: vit9696 <vit9696@protonmail.com>, ville+git@takio.fi, egc112@msn.com, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Alessio Ferri <alessio.ferri@mythread.it>, 
 b43-dev@lists.infradead.org
X-Mailer: b4 0.15.2
X-CMAE-Envelope: MS4xfEdioDTGY1z/u4GjVMe1mHbLmWpT+rI4H8Xls66NQln3AiF++CcMvxSaaGmsBXk3x4g8Dib6BHu6BK7TnmTEOyW7ehauJEouv8SmkiWXnR8yDAh0bB+l
 EloZ/IAJiS+pl1kaopHIob50iIHTC/gQWIgjGsi2LETExhRM+4Iw4SCq/wC0LddyDFKmHZ1+cC9a7yW1HZgGp/1yMl5U8vhOCUJNDyGRBZVhLbHUNeFzuHa5
 El4XezI2nRw/fKrMcWh6jLOdHOlPh61DGekcC/bMC7HU+xVzJxUEkJhFHncDdWUYTu9ZDKdKoVTiCfIGDOjT4RrpaXx0JVGSUZ4h5ElM/Icp1mpuzk8xrtoL
 lqrk58HMIeGgZOleaDyOXw1A8zY//V541UoWSHJa05W6otiIa2vqQ47zRVXM8GFp6e8/iRuanRLI5ji6BUU/0BWNimWWZaL78D4YfdbOLmR7Op+ESZdUK2Rx
 +AtcAd9UX0hdJ+tOJ0A1x3quhZXaT7BEcnQH7A==

Preparatory work in the bring up of AC family rev1 chips, in particular,
the bcm4352 rev3 and bcm4360 rev3. When public sources were found, the 
same gates applied for operations were ported in this code.

Initialize the PMU, the PCIe2 core and chipcommon of the BCM4352/BCM4360
family on chip based on the open source version of broadcom driver, parse 
SPROM revision 11, read the NVRAM variables set on top of the SPROM, and 
bind bcma-pci-bridge to the BCM4352. Finally, add the missing ids to b43.

Most of the series was tested by Erik Conijin and Ville Takio, both are 
cc-ed, but i don't know if i can put their tested by directly in the 
commit myself or if it is a very suspicious thing to do.

Concerning the risk of applying the series: 
- FORCEHT may change the behaviour of brcmsmac too (can i ask Arend?)
- i do not expect regression from rev11 parsing, especially since no one 
  use it yet.
- The rest of the series has code mostly gated with the same criteria 
  used by public code released by Broadcom, so i guess that it is safe. 
- b43 marks the ac part BROKEN, so there is very little to preserve.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
Changes in v4:
- Readded the missing signed off
- Added pdoffset2g40ma and pdoffset2g40mvalid to the series, work of 
  Ville Takio, mostly.
- Link to v3: https://patch.msgid.link/20261031-bcma-ac-rev1-v3-0-1fbe38e8179b@mythread.it

Changes in v3:
- regated most of the checks on the proper version/flag present
  instead of forcing everything to be rev3 only, as Vitaly suggested
- Added nvram parsing for all params found in a real northstar router
- Removed AvVmid parsing from nvram, as it doesn't seems to be useful
- Added missing pci ids for 4352/4360 variants
- Link to v2: https://patch.msgid.link/20261027-bcma-ac-rev1-v2-0-b69b61c31920@mythread.it

Changes in v2:
- gated chipcommon behaviour on its own revision instead of chip rev as
  pointed out by Vitaly
- Link to v1: https://patch.msgid.link/20261014-bcma-ac-rev1-v1-0-b608e99d3f56@mythread.it

To: Rafał Miłecki <zajec5@gmail.com>
To: Michael Buesch <m@bues.ch>
To: vit9696 <vit9696@protonmail.com>
Cc: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: b43-dev@lists.infradead.org

---
Alessio Ferri (10):
      bcma: core: clear only FORCEHT for BCMA_CLKMODE_DYNAMIC
      bcma: pmu: init PLL and resources on BCM4352/BCM4360
      bcma: pcie2: request HT on BCM4352/BCM4360
      bcma: chipcommon: enable asynchronous GPIO interrupts
      bcma: extract SPROM revision 11
      firmware: bcm47xx_sprom: read the SPROM revision 11 fields from NVRAM
      firmware: bcm47xx_sprom: read ledbh4..ledbh15 from NVRAM
      firmware: bcm47xx_sprom: read boardflags3 from NVRAM over the SPROM
      bcma: add the single-band BCM4352/BCM4360 PCI IDs
      wifi: b43: add the 2.4 GHz BCM4352/BCM4360 to the supported bands

 drivers/bcma/core.c                         |   2 +-
 drivers/bcma/driver_chipcommon.c            |   3 +
 drivers/bcma/driver_chipcommon_pmu.c        |  81 +++++++++
 drivers/bcma/driver_pcie2.c                 |   3 +
 drivers/bcma/host_pci.c                     |   8 +-
 drivers/bcma/sprom.c                        | 210 ++++++++++++++++++++++-
 drivers/firmware/broadcom/bcm47xx_sprom.c   | 257 +++++++++++++++++++++++++---
 drivers/net/wireless/broadcom/b43/main.c    |   6 +
 include/linux/bcm47xx_sprom.h               |  15 ++
 include/linux/bcma/bcma_driver_chipcommon.h |  15 ++
 include/linux/ssb/ssb.h                     |  72 ++++++++
 include/linux/ssb/ssb_regs.h                | 103 +++++++++++
 12 files changed, 747 insertions(+), 28 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261014-bcma-ac-rev1-da894142790f

Best regards,
--  
Alessio Ferri <alessio.ferri@mythread.it>

