Received: from mailapp01.imgtec.com ([195.59.15.196]:4464 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025444AbcCaJGS067dq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 31 Mar 2016 11:06:18 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2 03/11] MIPS: Reserve space for relocation table
Date: Thu, 31 Mar 2016 10:05:34 +0100
Message-ID: <1459415142-3412-4-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1459415142-3412-1-git-send-email-matt.redfearn@imgtec.com>
References: <1459415142-3412-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, kernel-hardening@lists.openwall.com, Matt Redfearn <matt.redfearn@imgtec.com>, Aaro Koskinen <aaro.koskinen@nokia.com>, linux-kernel@vger.kernel.org, David Daney <ddaney@caviumnetworks.com>, Jonas Gorski <jogo@openwrt.org>
Message-ID: <20160331090534.pBLjNUpZi3lOKCDZN1DrKLujgIXGSncAzYzvHT6O9oE@z>

When CONFIG_RELOCATABLE is enabled, add a new section in the memory map
to be filled with relocation data.

CONFIG_RELOCATION_TABLE_SIZE allows the amount of space reserved to be
adjusted if necessary.

The relocs tool will populate this reserved space with relocation
information. The space is reserved within the elf by filling it with
0's, and an invalid entry is left at the start of the space such that
kernel relocation will be aborted if the table is empty.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

Changes in v2: None

 arch/mips/Kconfig              | 16 ++++++++++++++++
 arch/mips/kernel/vmlinux.lds.S | 21 +++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d3da79dda629..6f55e1a5d645 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2478,6 +2478,22 @@ config NUMA
 config SYS_SUPPORTS_NUMA
 	bool
 
+config RELOCATION_TABLE_SIZE
+	hex "Relocation table size"
+	depends on RELOCATABLE
+	range 0x0 0x01000000
+	default "0x00100000"
+	---help---
+	  A table of relocation data will be appended to the kernel binary
+	  and parsed at boot to fix up the relocated kernel.
+
+	  This option allows the amount of space reserved for the table to be
+	  adjusted, although the default of 1Mb should be ok in most cases.
+
+	  The build will fail and a valid size suggested if this is too small.
+
+	  If unsure, leave at the default value.
+
 config NODES_SHIFT
 	int
 	default "6"
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 0a93e83cd014..ce3330fb92ce 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -135,6 +135,27 @@ SECTIONS
 #ifdef CONFIG_SMP
 	PERCPU_SECTION(1 << CONFIG_MIPS_L1_CACHE_SHIFT)
 #endif
+
+#ifdef CONFIG_RELOCATABLE
+	. = ALIGN(4);
+
+	.data.reloc : {
+		_relocation_start = .;
+		/*
+		 * Space for relocation table
+		 * This needs to be filled so that the
+		 * relocs tool can overwrite the content.
+		 * An invalid value is left at the start of the
+		 * section to abort relocation if the table
+		 * has not been filled in.
+		 */
+		LONG(0xFFFFFFFF);
+		FILL(0);
+		. += CONFIG_RELOCATION_TABLE_SIZE - 4;
+		_relocation_end = .;
+	}
+#endif
+
 #ifdef CONFIG_MIPS_RAW_APPENDED_DTB
 	__appended_dtb = .;
 	/* leave space for appended DTB */
-- 
2.5.0
