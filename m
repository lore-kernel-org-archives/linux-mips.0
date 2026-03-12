Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BAD38C424;
	Thu, 12 Mar 2026 16:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333886; cv=none; b=dZ9gMc20AHmfhVX4HQLY6w6n92URp16hftB3PS/GOTv5lyuxmSTo1fLtvdT6RM0IpbwJ0inqxAtY/TKfWAEf5hkroITv9xpsjCi/nEKRVYvo1C0jsQSeypTjD2TbzKpYWSRl9KKgV40DJrAGncaAqLbO/fswtOE/VmY7lHTjtgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333886; c=relaxed/simple;
	bh=42B7XAkpeV90MrK3M3+y91kCKaxZnDDDwpE+SUerCO8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D8Ki+19n6OY24+XJjSe/QzeAukX/GrNXGitL0LMgyqt3dAUy4Nzbnv5VcqL5L020I509eSFjDtiQtRJsL1DkuFACftzp2YDQz38rcEP4rVrvXIgybjrrhfXFKLRSjUqkH4eP4gOAECkk9IoduYEDftcidYUlGS/veDGQclSz/pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=hiPkHQ9F; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="hiPkHQ9F"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74B8A2C71F7;
	Thu, 12 Mar 2026 17:44:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773333882; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=+5GeguiV+FH3mTRjunVs6nNfagcSzReqIpN01V+GjKY=;
	b=hiPkHQ9F6yu7jD8VQWt2tNeGoD63jAYByo4qmPIE+V4zvmDvD4t+VEqf8S3LxtJYK4s2ov
	a9WgPs83qBImZKh7NIEvFmWruqTQRYHdiuAVS2dDzIOxcnx2KUQ03yO8vgCKkzYNtgTws7
	jdH3RR1ZzH0EcN9wd0KBCCsYPy/ZHA+XEYX5l/dMxZ+GpNMQrPU5FJqzNWmjnPI38U0sQl
	ColWovK/PBKol8ARGAXWJorbwTd4f63AVdS3cPyoia7KWvca4f+4bTPAIVu6aICRtEtvbw
	/GUVo1El834TOvWKMbdxARa5LAYco+YCKkuKBNqruUQuHVLV5rJ7Wi8DsiaTQA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-phy@lists.infradead.org
Cc: naseefkm@gmail.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 0/2] phy: econet: Add PCIe PHY driver for EcoNet SoCs
Date: Thu, 12 Mar 2026 16:44:30 +0000
Message-Id: <20260312164432.569566-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add EcoNet EN751221 and EN7528 PCIe PHY support.

This is split from a larger PCIe patchset which crossed multiple
subsystems. I'm not labeling this a v3 because it's a new patchset, but
I'm keeping the historical record anyway.

Changes from econet-pcie v2: none relevant to this patch set
* econet-pcie v2: https://lore.kernel.org/linux-mips/20260309131818.74467-1-cjd@cjdns.fr

Changes from econet-pcie v1:
* econet,en751221-pcie-phy.yaml Refer to PHYs as "gen1" and "gen2"
* econet-pcie v1: https://lore.kernel.org/linux-mips/20260303190948.694783-1-cjd@cjdns.fr/

Caleb James DeLisle (2):
  dt-bindings: phy: Document PCIe PHY in EcoNet EN751221 and EN7528
  phy: econet: Add PCIe PHY driver for EcoNet EN751221 and EN7528 SoCs.

 .../phy/econet,en751221-pcie-phy.yaml         |  50 +++++
 MAINTAINERS                                   |   7 +
 drivers/phy/Kconfig                           |  12 ++
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-econet-pcie.c                 | 180 ++++++++++++++++++
 5 files changed, 250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
 create mode 100644 drivers/phy/phy-econet-pcie.c


base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
-- 
2.39.5

