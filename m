Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66EA21638D;
	Sat,  4 Apr 2026 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775328573; cv=none; b=n9jD1Oo7M3+ZXxMn2dRZgKg0/+CHLyD51nSsQT6Mr1IXUdiZBcjpFPKlXcBgWjBer3g8BEVUFisv0TpL1B4MlyymZ1dhsvDObd71y6yDyE8nRJz5eIjIoYBi8lRHm+zOB4A7QH+5r5pIV9FsphA+wkI4mv6kKWqS3qxlzbOc6nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775328573; c=relaxed/simple;
	bh=IPBbkO3fjU8G0NNKxLCIFQuUl4/s13MtwUDedAGC0XU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QCFsR+LJok0dX1GJ+snW8ybUCnIpbuJ7J3D1LxRPcJ15zba3ZL0CLcoYrnOn5LAchPAdT7xtN7dJRa6tkr9+o9qmsKVjgJKdjphW6JVgkReTsUfiNNxIddvknM8fS5qZnAlEJaIIIAQKZTnmE6OzUQV2H6cnRd9iw4HWeGDniok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=WHk0sXCA; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="WHk0sXCA"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02C9F18F6BB;
	Sat,  4 Apr 2026 20:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1775328569; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Lu1Z3Rm1rWWGK7Kmxsqji1TBL5EuCNVIhoEedYUd+lM=;
	b=WHk0sXCAClAoKmuPkc5zeS+xpLerVE5gqqmUaYRBnKnKoZ1m/hySdZyYkJsE5UkXnsqx5y
	MhQryGUsFeMU0Z2cPscikzHcdE4UVWsHZiIUuyamTutQCduIvOcZ8gwxXZRlFRkE0cs8RT
	CZyGB2hgX0ESrwf3ABPRaqNjm8IYhBv2t0dja409ccZ3lu+uobebC473dThkgAqIwY8Qzc
	mnXuEV6xTaadAEUXnIqsFyvRMxpb0Zpbqv+eXH9VTdj10+Ot/pmM8S0ok5pc8yHFKkzf2/
	8eBAo2hscqgwduxY4ctKZ1zAXxNdosR0cn4CtPhuO45O04veoNeUGapfovRrOw==
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
Subject: [PATCH v2 0/2] phy: econet: Add PCIe PHY driver for EcoNet SoCs
Date: Sat,  4 Apr 2026 18:49:16 +0000
Message-Id: <20260404184918.2184070-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add EcoNet EN751221 and EN7528 PCIe PHY support.

Re-sending rebased v2 because there have been no comments since March 12.

Changes from v1:
* Rebased on 2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
* v1: https://lore.kernel.org/linux-mips/20260312164432.569566-1-cjd@cjdns.fr/

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

-- 
2.39.5

