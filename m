Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:35586 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6870583AbaAJUfzfu0UI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jan 2014 21:35:55 +0100
From: Florian Fainelli <florian@openwrt.org>
Subject: [PATCH 1/3] MIPS: introduce MIPS_L1_CACHE_SHIFT_<N>
Date: Fri, 10 Jan 2014 12:35:12 -0800
Message-ID: <1389386114-31834-2-git-send-email-florian@openwrt.org>
In-Reply-To: <1389386114-31834-1-git-send-email-florian@openwrt.org>
References: <1389386114-31834-1-git-send-email-florian@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <florian@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: ralf@linux-mips.org, blogic@openwrt.org, jogo@openwrt.org, mbizon@freebox.fr, cernekee@gmail.com, dgcbueu@gmail.com, Florian Fainelli <florian@openwrt.org>
Message-ID: <20140110203512.VE6mZUH2C6yjkakIhNdDSkbfBRr1ITwnRV9eV3wNrwY@z>

In order to avoid keeping an ever growing list of chips which need to
select a specific MIPS_L1_CACHE_SHIFT value introduce multiple internal
and non-exposed Kconfig symbols for the various MIPS_L1_CACHE_SHIFT
values out there and update the relevant Kconfig symbols to select them.

Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
 arch/mips/Kconfig              | 18 ++++++++++++++++++
 arch/mips/pmcs-msp71xx/Kconfig |  1 +
 arch/mips/ralink/Kconfig       |  1 +
 3 files changed, 20 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 17cc7ff..753c5a3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -183,6 +183,7 @@ config MACH_DECSTATION
 	select SYS_SUPPORTS_128HZ
 	select SYS_SUPPORTS_256HZ
 	select SYS_SUPPORTS_1024HZ
+	select MIPS_L1_CACHE_SHIFT_4
 	help
 	  This enables support for DEC's MIPS based workstations.  For details
 	  see the Linux/MIPS FAQ on <http://www.linux-mips.org/> and the
@@ -468,6 +469,7 @@ config SGI_IP22
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
+	select MIPS_L1_CACHE_SHIFT_7
 	help
 	  This are the SGI Indy, Challenge S and Indigo2, as well as certain
 	  OEM variants like the Tandem CMN B006S. To compile a Linux kernel
@@ -488,6 +490,7 @@ config SGI_IP27
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_NUMA
 	select SYS_SUPPORTS_SMP
+	select MIPS_L1_CACHE_SHIFT_7
 	help
 	  This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
 	  workstations.  To compile a Linux kernel that runs on these, say Y
@@ -694,6 +697,7 @@ config MIKROTIK_RB532
 	select SWAP_IO_SPACE
 	select BOOT_RAW
 	select ARCH_REQUIRE_GPIOLIB
+	select MIPS_L1_CACHE_SHIFT_4
 	help
 	  Support the Mikrotik(tm) RouterBoard 532 series,
 	  based on the IDT RC32434 SoC.
@@ -1088,6 +1092,18 @@ config FW_SNIPROM
 config BOOT_ELF32
 	bool
 
+config MIPS_L1_CACHE_SHIFT_4
+	bool
+
+config MIPS_L1_CACHE_SHIFT_5
+	def_bool y
+
+config MIPS_L1_CACHE_SHIFT_6
+	bool
+
+config MIPS_L1_CACHE_SHIFT_7
+	bool
+
 config MIPS_L1_CACHE_SHIFT
 	int
 	default "4" if MACH_DECSTATION || MIKROTIK_RB532 || PMC_MSP4200_EVAL || SOC_RT288X
@@ -1372,6 +1388,7 @@ config CPU_CAVIUM_OCTEON
 	select LIBFDT
 	select USE_OF
 	select USB_EHCI_BIG_ENDIAN_MMIO
+	select MIPS_L1_CACHE_SHIFT_7
 	help
 	  The Cavium Octeon processor is a highly integrated chip containing
 	  many ethernet hardware widgets for networking tasks. The processor
@@ -1794,6 +1811,7 @@ config IP22_CPU_SCACHE
 config MIPS_CPU_SCACHE
 	bool
 	select BOARD_SCACHE
+	select MIPS_L1_CACHE_SHIFT_6
 
 config R5000_CPU_SCACHE
 	bool
diff --git a/arch/mips/pmcs-msp71xx/Kconfig b/arch/mips/pmcs-msp71xx/Kconfig
index 3482b8c..6073ca4 100644
--- a/arch/mips/pmcs-msp71xx/Kconfig
+++ b/arch/mips/pmcs-msp71xx/Kconfig
@@ -6,6 +6,7 @@ config PMC_MSP4200_EVAL
 	bool "PMC-Sierra MSP4200 Eval Board"
 	select IRQ_MSP_SLP
 	select HW_HAS_PCI
+	select MIPS_L1_CACHE_SHIFT_4
 
 config PMC_MSP4200_GW
 	bool "PMC-Sierra MSP4200 VoIP Gateway"
diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index 424f034..1bfd1c1 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -15,6 +15,7 @@ choice
 
 	config SOC_RT288X
 		bool "RT288x"
+		select MIPS_L1_CACHE_SHIFT_4
 
 	config SOC_RT305X
 		bool "RT305x"
-- 
1.8.3.2
