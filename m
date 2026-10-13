Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07CE3F65E6;
	Tue, 13 Oct 2026 09:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884822; cv=none; b=emr/DpNPBqeDfl6Wggl3C69wPlZ9tMkNAVDkaxscAOouHJnRBY4tnOz5oG0T2bgTFkqyjrdSZH6KAWYr84VY4mGuPlkMCK2Mfk1/NFZhI0pIP04F6Zrn9G9IkZtA6WB0YbV6A6fKLBxRC31KzMpcTt4kRR8vMs5ED3q1hFwZJFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884822; c=relaxed/simple;
	bh=cMUz6r5CEwVQRS0+UCG5gnz1qsCbMfGJlbhXXrvAL/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5JZCUiDXrOsyBLhba4fcvydkf8FihGojfRVAsRBhAuUiJxge+FXKkLawKARrNL+qG8J0VnVguVKV9mi3p7ebSek4VXFCxiMn9l4VgjzgtGi+LKKxJkrWlzScnX5mWk6iVTNGiunqXQAxZyWdwtSD6p1Sx6LTM71egxZypMLAz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9zyRsmH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9zyRsmH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCBB1F00893;
	Tue, 13 Oct 2026 09:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791884821;
	bh=f9WlG+V184rg1br52R6UUDSFWfVtycHMA4eC4BcVWvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P9zyRsmHpctABVRA8vAtndc5Joc2U9Dq4Tr97ZUn2pf3LK4KuOaUXRF5x2mDz5MBm
	 JFtiqSb4qsRpI8sUKoXVg++9s8JyUHI2iMcl/YsOjRjy4Kh7ypUZn9LTLV6bavBALK
	 RZYN0jJ+iYaXvHHt9i7zkqKexBxdjXbOLz2M4ITZCF0eeTxxDaqVQMM1wQXNHd5xuL
	 gIjmoC/ABitxjIR6/iOVW5ZwjHqxKcfoOnz3LHmFcwbyLhTLxKGrkhija+Xhv5E1Nx
	 KgOnBlydA8fXczxVEHrXQ1e0S+AHE+IRiCDxChK+TrNI215AELojlLmmQi39BTKU/O
	 FE4YLl45v4z7A==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] MIPS: SGI-IP30: fix the defconfig defaults for the Bridge PROM and RTC
Date: Tue, 13 Oct 2026 11:45:54 +0200
Message-ID: <20261013094554.16804-4-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013094554.16804-1-kaloz@kernel.org>
References: <20261013094554.16804-1-kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Bridge probe reads its part number from the 1-wire PROM and defers
until the SGI 1-wire master and DS250x slave are present, so without
them there is no PCI bus and no serial console.

The IP30 RTC is a DS1685-family part, but the defconfig, derived from
ip27_defconfig, has the M48T35 driver, so there is no RTC.

Enable the 1-wire drivers and select the DS1685 family.

Also drop four lines that savedefconfig removes, as CRYPTO_CAMELLIA,
CRYPTO_CTS and CRYPTO_HMAC are selected built-in and IPV6_SIT=m is the
default.

Fixes: bb2d63500b5c ("MIPS: config: Add ip30_defconfig")
Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/configs/ip30_defconfig | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/configs/ip30_defconfig b/arch/mips/configs/ip30_defconfig
index 93eb90efe06e..a8b1a492f20c 100644
--- a/arch/mips/configs/ip30_defconfig
+++ b/arch/mips/configs/ip30_defconfig
@@ -40,7 +40,6 @@ CONFIG_INET6_AH=m
 CONFIG_INET6_ESP=m
 CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_MIP6=m
-CONFIG_IPV6_SIT=m
 CONFIG_IPV6_SIT_6RD=y
 CONFIG_IPV6_TUNNEL=m
 CONFIG_IPV6_MULTIPLE_TABLES=y
@@ -129,11 +128,14 @@ CONFIG_SERIAL_8250_IOC3=y
 CONFIG_NOZOMI=m
 CONFIG_HW_RANDOM_TIMERIOMEM=m
 # CONFIG_PTP_1588_CLOCK is not set
+CONFIG_W1=y
+CONFIG_W1_MASTER_SGI=y
+CONFIG_W1_SLAVE_DS250X=y
 # CONFIG_HWMON is not set
 CONFIG_THERMAL=y
 CONFIG_SGI_MFD_IOC3=y
 CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_M48T35=y
+CONFIG_RTC_DRV_DS1685_FAMILY=y
 CONFIG_UIO=y
 CONFIG_UIO_AEC=m
 CONFIG_UIO_SERCOS3=m
@@ -162,15 +164,12 @@ CONFIG_NFS_FS=y
 CONFIG_SECURITYFS=y
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_SERPENT=m
 CONFIG_CRYPTO_TWOFISH=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
-CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_WP512=m
-- 
2.47.3

