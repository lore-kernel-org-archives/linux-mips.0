Received: from mailapp01.imgtec.com ([195.59.15.196]:44697 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992400AbcGGHvZ4WeD6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 7 Jul 2016 09:51:25 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 3/3] MIPS: Move CPU Hotplug config option into submenu
Date: Thu, 7 Jul 2016 08:50:40 +0100
Message-ID: <1467877840-32569-4-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1467877840-32569-1-git-send-email-matt.redfearn@imgtec.com>
References: <1467877840-32569-1-git-send-email-matt.redfearn@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20160707075040.WFX7mMplhd1w7yCmu3U9xir94TwLfyADgz1ZQzEk3ZQ@z>

The KConfig option HOTPLUG_CPU should appear in the "Kernel Type"
submenu. Relocate it to where SMP support is configured.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ac91939b9b75..fd06bccf2011 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1111,16 +1111,6 @@ config NEED_DMA_MAP_STATE
 config SYS_HAS_EARLY_PRINTK
 	bool
 
-config HOTPLUG_CPU
-	bool "Support for hot-pluggable CPUs"
-	depends on SMP && SYS_SUPPORTS_HOTPLUG_CPU
-	help
-	  Say Y here to allow turning CPUs off and on. CPUs can be
-	  controlled through /sys/devices/system/cpu.
-	  (Note: power management support will enable this option
-	    automatically on SMP systems. )
-	  Say N if you want to disable CPU hotplug.
-
 config SYS_SUPPORTS_HOTPLUG_CPU
 	bool
 
@@ -2634,6 +2624,16 @@ config SMP
 
 	  If you don't know what to do here, say N.
 
+config HOTPLUG_CPU
+	bool "Support for hot-pluggable CPUs"
+	depends on SMP && SYS_SUPPORTS_HOTPLUG_CPU
+	help
+	  Say Y here to allow turning CPUs off and on. CPUs can be
+	  controlled through /sys/devices/system/cpu.
+	  (Note: power management support will enable this option
+	    automatically on SMP systems. )
+	  Say N if you want to disable CPU hotplug.
+
 config SMP_UP
 	bool
 
-- 
2.7.4
