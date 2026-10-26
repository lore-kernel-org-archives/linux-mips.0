Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022420;
	b=KRZD+LfTG+j4ygR3cgEUEc3csBxV2se0U5ge1b2/r+gGaa7U/BHstb1SDoLHgKUimn4y
	 Jalv+ubA9srLc6Q3DVdcGgWUdp21aCnASH7ulYYYAlTYzFiXiDTHOvzhXGpPXwgDBrmth
	 sHJ/SLuR6PZqLe8ULIxyXRJXIf3i0XAiRn+FHPKlpxp/qVgt/O+LclHgRioEb4kOn16pk
	 lxalZtDppTzEJ9b9XH9EkrCbYILVXgz4D2nMPmNXjeNjt4ZKzN+y8i/sPKqNdnC94qvQ1
	 w/Ev7o4VYzlHQ5X9okzh1FTer1StlmWDnNniuc3fScbiJhAdfAkkXOVtWyZkYUCzrAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022420;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xtpNtxxzwczsdqYoEJnlowfF1SSH9QOn2RGAY4lCzBk=;
	b=HlvXfjVet3kTPu4BVugYe32DZ9pTKgj45kmPOEgI/4XS9ZkH+VIMC13ehBga5TF/hLwH
	 W3cNJF47h0QCMLacw87YaCqMhNQ1Xr3Kze88z4vENyTmIYGcphH3Fmp/HPZdd+jhH4YeN
	 ZO74OAFV3IwzdqMztgzQCgh7l4TdmfY5EB02LNVfqmhWo/5bl5DEDDthJ7GLiqcE8JiXf
	 ejo5najYpa5IKyZcaBRpJAHfbBFWNpvGc2x3SHGYeG4/oFpvEM7Z2AZFaIK0RasLUH5US
	 8IDaeNPkqHwNVt7WhE4yU6RwKMzB/2tyxlBiCbsSC/+aysNsFoOr9/iDJ81Rb4nNyrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KLWZhnlB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937F760A2625;
	Mon, 26 Oct 2026 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KLWZhnlB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533421F031E1;
	Mon, 26 Oct 2026 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793022420;
	bh=xtpNtxxzwczsdqYoEJnlowfF1SSH9QOn2RGAY4lCzBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KLWZhnlBwNRLzTPLMCsVaksWOSGdJF1FjqBgUgcomvVtao/3fwMVs2piDhHzjVmN8
	 eqr3KwXkGfz4rxEZJQHqmPgOW3qErtNFqLf42CqceDU+SO1o0jM4LMBwDC9ACcY/mZ
	 opzeG36hHzQ4YF35ZKHmc0KYwcKzZC6vTQVT/8LNN1taWo1ATTv2FQnb9r15NwlKqg
	 nHvjw+RTlbVdxxoQCQzY8/6i8S/5A8QlAmm4T/tPvxTR52LtMr35Fo/abv2WQKvrku
	 1RJYgPbQENgmI0Oa7FfT5EfaGMelotxCI77oD3OJok56dwstZSDAF8YbD8plPkUhDE
	 AErw4LDwLQY8Q==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] MIPS: ip30_defconfig: drop add-in drivers, enable the LED driver
Date: Mon, 26 Oct 2026 14:45:42 +0100
Message-ID: <20261026134543.27207-5-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026134543.27207-1-kaloz@kernel.org>
References: <20261026134543.27207-1-kaloz@kernel.org>
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

Drop the Fibre Channel HBA, UIO PCI card, Nozomi, Altera PS/2 and timer
I/O random number drivers and OMFS_FS, none of which has a use on an
Octane.

LEDS_IP30 was not enabled. It depends on the LED class, so enable
NEW_LEDS and LEDS_CLASS along with it.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/configs/ip30_defconfig | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/mips/configs/ip30_defconfig b/arch/mips/configs/ip30_defconfig
index a8b1a492f20c..8b5c4bf5e2b4 100644
--- a/arch/mips/configs/ip30_defconfig
+++ b/arch/mips/configs/ip30_defconfig
@@ -87,10 +87,7 @@ CONFIG_SCSI_CONSTANTS=y
 CONFIG_SCSI_LOGGING=y
 CONFIG_SCSI_SCAN_ASYNC=y
 CONFIG_SCSI_SPI_ATTRS=y
-CONFIG_SCSI_FC_ATTRS=y
-CONFIG_LIBFC=m
 CONFIG_SCSI_QLOGIC_1280=y
-CONFIG_SCSI_BFA_FC=m
 CONFIG_SCSI_DH=y
 CONFIG_SCSI_DH_RDAC=m
 CONFIG_SCSI_DH_HP_SW=m
@@ -119,14 +116,11 @@ CONFIG_INPUT_MATRIXKMAP=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_SERIO_SGI_IOC3=y
 CONFIG_SERIO_RAW=m
-CONFIG_SERIO_ALTERA_PS2=m
 # CONFIG_VT is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_IOC3=y
-CONFIG_NOZOMI=m
-CONFIG_HW_RANDOM_TIMERIOMEM=m
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_W1=y
 CONFIG_W1_MASTER_SGI=y
@@ -134,12 +128,12 @@ CONFIG_W1_SLAVE_DS250X=y
 # CONFIG_HWMON is not set
 CONFIG_THERMAL=y
 CONFIG_SGI_MFD_IOC3=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_IP30=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1685_FAMILY=y
 CONFIG_UIO=y
-CONFIG_UIO_AEC=m
-CONFIG_UIO_SERCOS3=m
-CONFIG_UIO_PCI_GENERIC=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
@@ -159,7 +153,6 @@ CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_SQUASHFS=m
-CONFIG_OMFS_FS=m
 CONFIG_NFS_FS=y
 CONFIG_SECURITYFS=y
 CONFIG_CRYPTO_CRYPTD=m
-- 
2.47.3

