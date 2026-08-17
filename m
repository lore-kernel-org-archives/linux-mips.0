Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D1B3B14B7;
	Mon, 17 Aug 2026 22:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787004239; cv=none; b=ASv0CN86TlVxzm4xQlZK2GIH35w3mBIsYs1V6CXehuqmkeOoe4MrL7cSgrb2aLDZ2h7wF+znOhZ5gO/LuVkIGNrdFGc3L2MUqSpgmlZym8BOiJ7JEPBp0pbvmgZqGMyXEPqP7tyPW6xD4tZgV4US8bukg0YFtiChNqBx/xjAt4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787004239; c=relaxed/simple;
	bh=+NoLPYfBQz43H9aS6QX9pSPnvO33IWDm0zdl1hU5WTg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OLohoGKbzI90AOqxR9B3UomxWiZhLZ0TUWCrMihANJ5pxTM1pqgIebmBjZMTVCw8T9SrveoB4ZuiGyVaVqLCE6BF2KRzz0FtT9SwkWH+g3UagzHylZvSOlU7tsY3BXDuj2pDK5/EBzkAr72Cm/xsbS7s0nZ0aSWSBNUjX1k4Y4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=uecAmOHS; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="uecAmOHS"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF5BE35BA36;
	Tue, 18 Aug 2026 00:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787004234; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=/njSXmgGbmOIF2M/QSn80Hr5FDl7PkL45oNpmawAUhI=;
	b=uecAmOHS29rTqu25/OyAPct/CgGSeFZzIddpKJ+qITkfZ4ePsbpHIdN+uPFdkYOhu3GqZ8
	KDSilTHElslsK8FVY7vByilzkfR76AXuy/PTvrMHKjgmFY3rnbfbWvDdgGSWCy6OT+PA0m
	MlzfQgioRFYwO1+1qgHAtDUJEaibcRnvqQtTWEjB4EQXGtHp/t5JwNGvw4VEn5aUKr0T31
	/jAKH1apRW6T0SOAUKQH8/JfFpBLtlvrtru7bBJKHIOGKn1fkrHZEhZR0VLV7BPs2P96qz
	mfrA8TGEXt0rvIkIVFA/JCDe2TSOIePNDu+uOiyz9TB7h7Zu/wMhnIw8jFFpTw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tsbogend@alpha.franken.de,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	jonas.gorski@gmail.com,
	julianbraha@gmail.com,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2] MIPS: config: Add EcoNet EN751221 defconfig
Date: Mon, 17 Aug 2026 22:03:44 +0000
Message-Id: <20260817220344.2931634-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add config based on OpenWrt for EN751221 boards.
Of note: EcoNet bootloader has a 7.2MB kernel size limit so
ZBOOT is assumed to be needed in all cases.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
Updated to work after SERIAL_8250 and SERIAL_OF_PLATFORM removed
from Kconfig.
Link: https://lore.kernel.org/linux-mips/20260815235109.666268-1-julianbraha@gmail.com/
---
 MAINTAINERS                                 |   1 +
 arch/mips/configs/econet_en751221_defconfig | 264 ++++++++++++++++++++
 2 files changed, 265 insertions(+)
 create mode 100644 arch/mips/configs/econet_en751221_defconfig

diff --git a/MAINTAINERS b/MAINTAINERS
index 806bd2d80d15..9e2a6dc48f62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9245,6 +9245,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.y
 F:	Documentation/devicetree/bindings/mips/econet.yaml
 F:	Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
 F:	arch/mips/boot/dts/econet/
+F:	arch/mips/configs/econet_en751221_defconfig
 F:	arch/mips/econet/
 F:	drivers/clocksource/timer-econet-en751221.c
 F:	drivers/irqchip/irq-econet-en751221.c
diff --git a/arch/mips/configs/econet_en751221_defconfig b/arch/mips/configs/econet_en751221_defconfig
new file mode 100644
index 000000000000..b35d33fe4044
--- /dev/null
+++ b/arch/mips/configs/econet_en751221_defconfig
@@ -0,0 +1,264 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_KERNEL_XZ=y
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_BPF_JIT=y
+CONFIG_PREEMPT=y
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_RT_GROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_RDMA=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+# CONFIG_TIME_NS is not set
+CONFIG_USER_NS=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_GZIP is not set
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+# CONFIG_RD_ZSTD is not set
+# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
+CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
+CONFIG_EXPERT=y
+# CONFIG_SGETMASK_SYSCALL is not set
+# CONFIG_IO_URING is not set
+# CONFIG_RSEQ is not set
+# CONFIG_CACHESTAT_SYSCALL is not set
+CONFIG_ECONET=y
+CONFIG_CPU_MIPS32_R2=y
+CONFIG_ZBOOT_LOAD_ADDRESS=0x80020000
+CONFIG_ARCH_FORCE_MAX_ORDER=11
+# CONFIG_MIPS_FP_SUPPORT is not set
+CONFIG_NR_CPUS=2
+CONFIG_HZ_100=y
+CONFIG_MIPS_RAW_APPENDED_DTB=y
+# CONFIG_SCHED_SMT is not set
+CONFIG_JUMP_LABEL=y
+# CONFIG_STACKPROTECTOR_STRONG is not set
+# CONFIG_GCC_PLUGINS is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
+CONFIG_BLK_DEV_THROTTLING=y
+# CONFIG_BLK_DEBUG_FS is not set
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_OF_PARTITION=y
+# CONFIG_MQ_IOSCHED_DEADLINE is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_SLAB_FREELIST_RANDOM=y
+CONFIG_SLAB_FREELIST_HARDENED=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_LRU_GEN=y
+CONFIG_LRU_GEN_ENABLED=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
+CONFIG_IP_ROUTE_MULTIPATH=y
+CONFIG_IP_ROUTE_VERBOSE=y
+CONFIG_IP_MROUTE=y
+CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
+CONFIG_IP_PIMSM_V1=y
+CONFIG_IP_PIMSM_V2=y
+CONFIG_SYN_COOKIES=y
+# CONFIG_INET_DIAG is not set
+CONFIG_TCP_CONG_ADVANCED=y
+# CONFIG_TCP_CONG_BIC is not set
+# CONFIG_TCP_CONG_WESTWOOD is not set
+# CONFIG_TCP_CONG_HTCP is not set
+# CONFIG_IPV6_SIT is not set
+CONFIG_IPV6_SUBTREES=y
+CONFIG_IPV6_MROUTE=y
+CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
+CONFIG_IPV6_PIMSM_V2=y
+CONFIG_IPV6_SEG6_LWTUNNEL=y
+CONFIG_MPTCP=y
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_EGRESS is not set
+CONFIG_NF_CONNTRACK=m
+CONFIG_NF_CONNTRACK_MARK=y
+CONFIG_NF_CONNTRACK_ZONES=y
+CONFIG_NF_CONNTRACK_PROCFS=y
+CONFIG_NF_CONNTRACK_TIMEOUT=y
+# CONFIG_NF_CT_PROTO_SCTP is not set
+CONFIG_NF_TABLES=m
+CONFIG_NF_TABLES_INET=y
+CONFIG_NF_TABLES_NETDEV=y
+CONFIG_NFT_NUMGEN=m
+CONFIG_NFT_CT=m
+CONFIG_NFT_FLOW_OFFLOAD=m
+CONFIG_NFT_LOG=m
+CONFIG_NFT_LIMIT=m
+CONFIG_NFT_MASQ=m
+CONFIG_NFT_REDIR=m
+CONFIG_NFT_NAT=m
+CONFIG_NFT_QUOTA=m
+CONFIG_NFT_REJECT=m
+CONFIG_NFT_HASH=m
+CONFIG_NFT_FIB_INET=m
+CONFIG_NF_FLOW_TABLE_INET=m
+CONFIG_NF_FLOW_TABLE=m
+CONFIG_NFT_FIB_IPV4=m
+CONFIG_NF_TABLES_ARP=y
+CONFIG_NF_LOG_IPV4=m
+CONFIG_NFT_FIB_IPV6=m
+CONFIG_NF_LOG_IPV6=m
+CONFIG_NF_TABLES_BRIDGE=m
+CONFIG_BRIDGE=y
+CONFIG_BRIDGE_VLAN_FILTERING=y
+CONFIG_VLAN_8021Q=y
+CONFIG_NET_SCHED=y
+CONFIG_NET_SCH_FQ_CODEL=y
+CONFIG_NET_SCH_DEFAULT=y
+CONFIG_DEFAULT_FQ_CODEL=y
+CONFIG_NET_SWITCHDEV=y
+CONFIG_NET_L3_MASTER_DEV=y
+CONFIG_RFKILL=y
+# CONFIG_LWTUNNEL_BPF is not set
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCIEAER=y
+# CONFIG_PCIEASPM is not set
+CONFIG_PCI_MSI=y
+# CONFIG_VGA_ARB is not set
+CONFIG_PCIE_MEDIATEK=y
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_SPI_NAND=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_BEB_LIMIT=13
+CONFIG_MTD_UBI_BLOCK=y
+CONFIG_NETDEVICES=y
+# CONFIG_NET_VENDOR_ASIX is not set
+# CONFIG_NET_VENDOR_ENGLEDER is not set
+# CONFIG_NET_VENDOR_FUNGIBLE is not set
+# CONFIG_NET_VENDOR_LITEX is not set
+# CONFIG_NET_VENDOR_MICROSOFT is not set
+# CONFIG_NET_VENDOR_VERTEXCOM is not set
+# CONFIG_NET_VENDOR_WANGXUN is not set
+CONFIG_PPP=m
+CONFIG_PPP_FILTER=y
+CONFIG_PPP_MULTILINK=y
+CONFIG_PPPOE=m
+CONFIG_PPP_ASYNC=m
+# CONFIG_WLAN_VENDOR_ADMTEK is not set
+# CONFIG_WLAN_VENDOR_ATH is not set
+# CONFIG_WLAN_VENDOR_ATMEL is not set
+# CONFIG_WLAN_VENDOR_BROADCOM is not set
+# CONFIG_WLAN_VENDOR_INTEL is not set
+# CONFIG_WLAN_VENDOR_INTERSIL is not set
+# CONFIG_WLAN_VENDOR_MARVELL is not set
+# CONFIG_WLAN_VENDOR_MEDIATEK is not set
+# CONFIG_WLAN_VENDOR_MICROCHIP is not set
+# CONFIG_WLAN_VENDOR_PURELIFI is not set
+# CONFIG_WLAN_VENDOR_RALINK is not set
+# CONFIG_WLAN_VENDOR_REALTEK is not set
+# CONFIG_WLAN_VENDOR_RSI is not set
+# CONFIG_WLAN_VENDOR_SILABS is not set
+# CONFIG_WLAN_VENDOR_ST is not set
+# CONFIG_WLAN_VENDOR_TI is not set
+# CONFIG_WLAN_VENDOR_ZYDAS is not set
+# CONFIG_WLAN_VENDOR_QUANTENNA is not set
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_LEGACY_TIOCSTI is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_DEVMEM is not set
+CONFIG_SPI=y
+# CONFIG_PTP_1588_CLOCK is not set
+CONFIG_GPIOLIB=y
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_MFD_SYSCON=y
+# CONFIG_USB_PCI is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_CLASS_MULTICOLOR=y
+CONFIG_LEDS_GPIO=m
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_LEDS_TRIGGER_NETDEV=y
+CONFIG_STAGING=y
+# CONFIG_MIPS_PLATFORM_DEVICES is not set
+CONFIG_COMMON_CLK_EN7523=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_RESET_CONTROLLER=y
+CONFIG_PHY_ECONET_PCIE=y
+# CONFIG_DNOTIFY is not set
+CONFIG_FANOTIFY=y
+CONFIG_OVERLAY_FS=y
+# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_FS_XATTR=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_UBIFS_FS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_FILE_DIRECT=y
+CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI_PERCPU=y
+# CONFIG_SQUASHFS_ZLIB is not set
+CONFIG_SQUASHFS_XZ=y
+CONFIG_SQUASHFS_EMBEDDED=y
+CONFIG_KEYS=y
+CONFIG_INIT_STACK_NONE=y
+CONFIG_FORTIFY_SOURCE=y
+CONFIG_HARDENED_USERCOPY=y
+CONFIG_LIST_HARDENED=y
+CONFIG_CRYPTO_NULL=y
+CONFIG_CRYPTO_AES=y
+CONFIG_CRYPTO_CCM=y
+CONFIG_CRYPTO_GCM=y
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_XZ_DEC_X86 is not set
+# CONFIG_XZ_DEC_POWERPC is not set
+# CONFIG_XZ_DEC_ARM is not set
+# CONFIG_XZ_DEC_ARMTHUMB is not set
+# CONFIG_XZ_DEC_ARM64 is not set
+# CONFIG_XZ_DEC_SPARC is not set
+# CONFIG_XZ_DEC_RISCV is not set
+CONFIG_PRINTK_TIME=y
+# CONFIG_DEBUG_MISC is not set
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
+CONFIG_DEBUG_INFO_REDUCED=y
+CONFIG_FRAME_WARN=1024
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_MAGIC_SYSRQ_SERIAL is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_SLUB_DEBUG is not set
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_PANIC_ON_OOPS=y
+CONFIG_PANIC_TIMEOUT=1
+CONFIG_RCU_CPU_STALL_TIMEOUT=60
+# CONFIG_RCU_TRACE is not set
+# CONFIG_FTRACE is not set

base-commit: 3b7711be02612845e44b5e9ef7c0b9f203cf29b6
prerequisite-patch-id: 0f044e47a76450ebb4fe52dc60a6b2f79625bbff
prerequisite-patch-id: 6380783b9da35b966b64c237b0ef50c31c7425d6
-- 
2.39.5

