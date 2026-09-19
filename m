Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71850376A03;
	Sat, 19 Sep 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830879; cv=none; b=C+BChLkZ0umYm6fdHXbG9FmK0JadXr/V5uyH4H/U0DQ9wNvEUbjV+UXJvtR692Jryqg0GbWjXX7bpClcZFexXgWY6UwvmoeKSOFNUVYNt5TomjYED85Xl4E2NDbLfq91iUMmS0JIcbHR7chu7uXrE+/Ct9+B5EB/EPL6spdKkdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830879; c=relaxed/simple;
	bh=18KcrXtpUDr5GkkTUyeTfrPBhjZmcpr9uvNXWDN1nqM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fUFBYQcam91Amaec/jcq1w9O2DDQR35bXFEwTSL/Pb9PxkQqZp29xf4g++Q/g7wLRU5UqX5Z9txkGL3WBWOz9iR/g8lAgDO1rc/Maw5NjCOpmzxR4eeJFekQACLKIHEngqWIVl72LEgNzSnljq/qSZU/H0AjxDK6MO0wg+LsoPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 19E1792009C; Sat, 19 Sep 2026 17:14:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 188D092009B;
	Sat, 19 Sep 2026 16:14:36 +0100 (BST)
Date: Sat, 19 Sep 2026 16:14:36 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] MIPS: decstation_64_defconfig: Regenerate for 7.x
In-Reply-To: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2609191544520.27665@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: WangYuli <wangyuli@uniontech.com>

Due to long-term changes in kernel build configurations, run 'make 
savedefconfig' to update the build configuration dependencies.

This commit does not affect the actual .config file content, in 
preparation for future modifications to decstation_64_defconfig.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
Changes from v2 (5/6),
<https://lore.kernel.org/r/566F2D64350C960C+20250422102253.137944-5-wangyuli@uniontech.com/>:

- Regenerate for 7.2.0.
---
 arch/mips/configs/decstation_64_defconfig |   39 ++++++++++--------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

linux-wangyuli-mips-dec-config64.diff
Index: linux-macro/arch/mips/configs/decstation_64_defconfig
===================================================================
--- linux-macro.orig/arch/mips/configs/decstation_64_defconfig
+++ linux-macro/arch/mips/configs/decstation_64_defconfig
@@ -1,27 +1,26 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=15
 CONFIG_EXPERT=y
 # CONFIG_SGETMASK_SYSCALL is not set
-# CONFIG_SYSFS_SYSCALL is not set
-CONFIG_BPF_SYSCALL=y
-# CONFIG_COMPAT_BRK is not set
 CONFIG_MACH_DECSTATION=y
 CONFIG_64BIT=y
-CONFIG_PAGE_SIZE_16KB=y
 CONFIG_TC=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 # CONFIG_SUSPEND is not set
+CONFIG_PAGE_SIZE_16KB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_OSF_PARTITION=y
 # CONFIG_EFI_PARTITION is not set
+# CONFIG_COMPAT_BRK is not set
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
@@ -49,7 +48,6 @@ CONFIG_NETWORK_SECMARK=y
 CONFIG_IP_SCTP=m
 CONFIG_VLAN_8021Q=m
 # CONFIG_WIRELESS is not set
-# CONFIG_UEVENT_HELPER is not set
 # CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
 CONFIG_MTD=m
@@ -83,9 +81,9 @@ CONFIG_DECLANCE=y
 # CONFIG_NET_VENDOR_MICREL is not set
 # CONFIG_NET_VENDOR_MICROCHIP is not set
 # CONFIG_NET_VENDOR_MICROSEMI is not set
+# CONFIG_NET_VENDOR_NI is not set
 # CONFIG_NET_VENDOR_NATSEMI is not set
 # CONFIG_NET_VENDOR_NETRONOME is not set
-# CONFIG_NET_VENDOR_NI is not set
 # CONFIG_NET_VENDOR_QUALCOMM is not set
 # CONFIG_NET_VENDOR_RENESAS is not set
 # CONFIG_NET_VENDOR_ROCKER is not set
@@ -114,13 +112,11 @@ CONFIG_FB_TGA=y
 CONFIG_FB_PMAG_AA=y
 CONFIG_FB_PMAG_BA=y
 CONFIG_FB_PMAGB_B=y
-# CONFIG_VGA_CONSOLE is not set
 CONFIG_DUMMY_CONSOLE_COLUMNS=160
 CONFIG_DUMMY_CONSOLE_ROWS=64
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
 CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_LOGO_LINUX_CLUT224 is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
@@ -168,31 +164,24 @@ CONFIG_NLS_ISO8859_14=m
 CONFIG_NLS_ISO8859_15=m
 CONFIG_NLS_UTF8=m
 CONFIG_CRYPTO_RSA=m
-CONFIG_CRYPTO_CCM=m
-CONFIG_CRYPTO_GCM=m
-CONFIG_CRYPTO_CHACHA20POLY1305=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_CAMELLIA=m
+CONFIG_CRYPTO_CAST5=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_XTS=m
+CONFIG_CRYPTO_CHACHA20POLY1305=m
+CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CMAC=m
-CONFIG_CRYPTO_XCBC=m
-CONFIG_CRYPTO_CRC32=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
-CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
-CONFIG_CRYPTO_CAST5=m
-CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_KHAZAD=m
-CONFIG_CRYPTO_SEED=m
-CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
-CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_XCBC=m
+CONFIG_CRYPTO_CRC32=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_842=m
 CONFIG_CRYPTO_LZ4=m
