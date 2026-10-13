Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A5552CCFA;
	Tue, 13 Oct 2026 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897612; cv=none; b=jqSY7+E/60u24cD9+4wYJP0Axu+R4O2C7/adJFmTmzXW5eXlEmZIWHmI4UfY7BzEO39K8UAP5qw1pUg7SrldsigI1n1dxRAXC7GYv6dzgcGt6ccME1RV91lAteklUlOyOkyS9+iJ8w9VRJjhNponjP1Z941JNfFAxemNXVlc+eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897612; c=relaxed/simple;
	bh=FG5EqU3zL/zzk9tt8AaEoWrb/5C9n+zQJJDDovQswIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqAWRRJ57ZrofnfOdh52BbsEoNbThXYXmn62ANp36zhLPyijfsg/W2LviCbK1hKRnDztMlSzdBZTp1dIX9wqPDVG+EX5+0HQZ6V9YMHiON0kVMG3BNvkfO3+px+VH1/J/4xnYNfKPsgxnGBhbX7+ULS3464CRdbnv+o/6Ij8odw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mt8n4o26; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mt8n4o26"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662E31F0089A;
	Tue, 13 Oct 2026 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897611;
	bh=/amCQNVzPl10ewnKmugc10jN/fIuwsDOm0c4jkaWScM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mt8n4o261YNqcqcgF2V3sCnnf8jvJGl6GMQl8mQg1QOZJ2p34tBRYqx4y6JoCUZmV
	 oorIL65RsXZqJA99uda3FcqZFQfalLCMb8/LSIqtiGUZY13VLc4ZEQCXytFnX3iUn9
	 KCVbZeJd+J+5qlenSKee0VelokddnvfFeVo1+hpSS5iHLg3UHS9ThUVbpau0Pywxpg
	 0kvs+UDbFJGYUmwQmSmaLKNkgQmjjpv2HhixHsmmK9L+dBUwku6SCKIiYodhEzXmHh
	 Z40EoGA3pWiD25MXBH9IUfiIc9ynjFlkAwkA8K5I7TYP+HCuZveMqfPIds0Wvic99E
	 ejo4D3M79sqbw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 49/53] MIPS: ip27_defconfig: enable pata_sgiioc4 and the DVD-ROM path
Date: Tue, 13 Oct 2026 15:17:09 +0200
Message-ID: <2dc94105e0697b178e882f391e298dd9604aa68b.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set CONFIG_ATA=y and CONFIG_PATA_SGIIOC4=y. Both are built in rather
than modular, because ip27_defconfig lacks BLK_DEV_INITRD, so no module
can load before root is mounted.

The I-brick's IOC4 ATA channel carries an ATAPI DVD-ROM drive. Change
CONFIG_BLK_DEV_SR from =m to =y for the same reason, and add
CONFIG_ISO9660_FS and CONFIG_UDF_FS so the disc can be mounted.

CONFIG_SCSI=y drops out of the diff: CONFIG_ATA selects SCSI, so make
savedefconfig removes the explicit line.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/configs/ip27_defconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index 2dfa929a6553..2959615d656b 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -74,10 +74,9 @@ CONFIG_NET_ACT_SKBEDIT=m
 # CONFIG_VGA_ARB is not set
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_ATA_OVER_ETH=m
-CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_ST=y
-CONFIG_BLK_DEV_SR=m
+CONFIG_BLK_DEV_SR=y
 CONFIG_CHR_DEV_SG=m
 CONFIG_CHR_DEV_SCH=m
 CONFIG_SCSI_CONSTANTS=y
@@ -91,6 +90,8 @@ CONFIG_SCSI_DH_RDAC=m
 CONFIG_SCSI_DH_HP_SW=m
 CONFIG_SCSI_DH_EMC=m
 CONFIG_SCSI_DH_ALUA=m
+CONFIG_ATA=y
+CONFIG_PATA_SGIIOC4=y
 CONFIG_MD=y
 CONFIG_BLK_DEV_MD=y
 CONFIG_MD_LINEAR=m
@@ -150,6 +151,8 @@ CONFIG_BTRFS_FS_POSIX_ACL=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
+CONFIG_ISO9660_FS=y
+CONFIG_UDF_FS=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-- 
2.47.3

