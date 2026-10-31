Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793438138;
	b=xxkajKRxrNJowlQ4WCy150o9V8xJvshqJon14oB0qwF+p8dEbyhwjjpbhf6CN0J+sxi4
	 yuv+OUk1jQrlU99hiCQvhliKkXmXfQljoL4RJFJlAu9uPRHNs1vlYy6CtDqs9prICQl6r
	 f9mvhdjnKAgwmSCs9URHcnrtz/TmsOdW83k8Z7jJ688vq0Gga/JBU/3TDtralytddYgZX
	 0JZccap5vRCRxNpx/1nisadOSY3+zt4e6nM/Tzsy2daCBDErwD7QTVtGgEWKkUdl1sgFv
	 70ekZYICJz02/OgXitO8epUlO2x3iF/S/x2MG8NLhIalSXvZqEKH1Uavj/80PnZkDYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793438138;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=adFeSo6LiWLBq4ge/dKAXyxOGLioJz7noYoprivxhPQ=;
	b=XBD25Xyt3NVQCgDpCsZhFlKNc91b0Sa9L9RvsdVsrPmNO6oOhYtUSxkNnMaG670f9opM
	 KrluJynPwEPpq0MpXNm19ynsJ+9OU3l9PFp7lSDEG5872tDnC5ymQsakfeEXCP9gfa10D
	 yQsgjx0QJvce0N3BWu5Erf/Ti0yOwrGDb/BSPza1K1Wz3graFkddvvmvinvz+/x8vnvm/
	 zZWxxdXhb3iDEK/W1YSlqh4WyDufCq7PHYbwjqh+s9xFKLycmmYu291BEd23S7tNn1lWM
	 zcYA+9P6egCsJtqmMVXc8gQ+WrBcYJjB0gLqy6z7jmgc5u1GPbgQE7yj6Tt6GeClrVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=AZkLuA0r;
	arc=none smtp.remote-ip=62.149.156.86
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432A1606A326
	for <linux-mips@vger.kernel.org>; Sat, 31 Oct 2026 09:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 432A1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=AZkLuA0r
Received: from [127.0.0.1] ([79.43.52.162])
	by Aruba SMTP with ESMTPSA
	id N5BMx1hYL6q8sN5BPxVoSe; Sat, 31 Oct 2026 10:15:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1793438127; bh=HfN5B1zdByBYfML7ECe9pT8WMCncWhH5/RQHDDrcjxM=;
	h=From:Subject:Date:MIME-Version:Content-Type:To;
	b=AZkLuA0r9WxOjrHLimI+vPJqJyNjPmlZpHxgZ+mctxf+OZ2JfF8bGdBwJgQjDbaN9
	 MV7BcFLFJ8HhFzjXJRO5euGpdzi/H5a07TzwHbjLR8VbNh2OAb4bcEOsbXajmw+nSO
	 iCJe9TJwlAsoEPCfiEjbJahxlUQBtyrJoxH2Hr2mky3DjwTAq5myBOlGuF5ZQQDEDC
	 e21O/4dpxa7i+0IbRcdcKDOVDs0goO/2LGd8PRQgVBKutmE9bOcrAyc5OtQBu01qzN
	 7S+QSGcaFH9DZ774MsMFp/iZfwmFWkeCtBjQs7lJsRWkTXHldsVo62HaOQj5OL2G6r
	 ooBjR7PBYwbLg==
From: Alessio Ferri <alessio.ferri@mythread.it>
Subject: [PATCH wireless-next v3 00/10] bcma-ac-rev1: support 4352/4360
 rev3 chips
Date: Sat, 31 Oct 2026 10:15:22 +0100
Message-Id: <20261031-bcma-ac-rev1-v3-0-1fbe38e8179b@mythread.it>
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
X-B4-Tracking: v=1; b=H4sIAKqx5WoC/23NTQ6CMBAF4KuQrq1pCxbqynsYF/0ZpEbAtBUhh
 LtbykaNyWxeZr43M/LgLHh0zGbkYLDe9l0M+S5DupHdFbA1MSNGGKeEFljpVmKpcTym2MhKFLR
 gpSA1iuThoLZjqjujl3VwB+9xB2NAl23tn+oGOqyVK2isD72b0vuBJvb/UxyCFScVCGHy+sBP7
 RQaB9Ls7VY+sA/Oyh/OEheKU51Twcg3X5blDUxa3gQKAQAA
X-Change-ID: 20261014-bcma-ac-rev1-da894142790f
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>, vit9696 <vit9696@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Alessio Ferri <alessio.ferri@mythread.it>, 
 b43-dev@lists.infradead.org
X-Mailer: b4 0.15.2
X-CMAE-Envelope: MS4xfOd7s3KzrSBYunUKqXBlJDC83HYowjIiUewPkbHeW9ZVuORYU494wfI6zThqAswEdw4W9F3uYvmFFKgX6oDzXxCorpkXWuE+5kvRCyqw8UtJqpYiBXZl
 5Zla5aRRVNnGEYNMdqqoHsJcnxqrH4NZvZvzxllFK7YBntGCG3UAtBd/qb76nhvfMWgSuXrp+bGS9/cpK9r2lwxihU+ibQRkSoLhfEYtC/VE8qp61GrlLI6M
 BIlaYhpSoA1zrZkmVPpVbaJsJip9e9OFVMRtqRAE815UJlFMxDluOV+zgMKZ8zKGbx64nkrhQSgHOujtwqFClvGncJrJ9/fPfK/C/cKzmyWBnb9mV+BQQVm6
 qRcVnNDQjIS7CMIoomNQhu6W2pqcz145DmEHpc/BrJvcAOt9QVxXBJrlD3OVTKtmwTwtkWH73ruilBTQMKW5SjR3TgcQew==

Preparatory work in the bring up of AC family rev1 chips, in particular,
the bcm4352 rev3 and bcm4360 rev3. When public sources were found, the 
same gates applied for operations were ported in this code.

Initialize the PMU, the PCIe2 core and chipcommon of the BCM4352/BCM4360
family on chip based on the open source version of broadcom driver, parse 
SPROM revision 11, read the NVRAM variables set on top of the SPROM, and 
bind bcma-pci-bridge to the BCM4352.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
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
 drivers/bcma/sprom.c                        | 200 +++++++++++++++++++++-
 drivers/firmware/broadcom/bcm47xx_sprom.c   | 253 +++++++++++++++++++++++++---
 drivers/net/wireless/broadcom/b43/main.c    |   6 +
 include/linux/bcm47xx_sprom.h               |  15 ++
 include/linux/bcma/bcma_driver_chipcommon.h |  15 ++
 include/linux/ssb/ssb.h                     |  70 ++++++++
 include/linux/ssb/ssb_regs.h                |  94 +++++++++++
 12 files changed, 722 insertions(+), 28 deletions(-)
---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261014-bcma-ac-rev1-da894142790f

Best regards,
--  
Alessio Ferri <alessio.ferri@mythread.it>

