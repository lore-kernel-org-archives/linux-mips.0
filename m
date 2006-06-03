Received: from localhost.localdomain ([127.0.0.1]:19423 "EHLO bacchus.dhis.org")
	by ftp.linux-mips.org with ESMTP id S8133892AbWFCW65 (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sun, 4 Jun 2006 00:58:57 +0200
Date: Sat, 3 Jun 2006 23:58:55 +0100
From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] EHCI on non-Au1200 build fix
Message-ID: <20060603225855.GA2234@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Return-Path: <ralf@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: gregkh@suse.de, linux-usb-devel@lists.sourceforge.net, dbrownell@users.sourceforge.netlinux-usb-devel@lists.sourceforge.net, linux-mips@linux-mips.org
Message-ID: <20060603225855.EphH0BOg5TSv1PA1_mhaB_pI2ALgp3MrwsMqCG05J4k@z>

Including ehci-au1xxx.c on a non-Au1200 Alchemy only to have it throw
an error is stupid.

diff --git a/drivers/usb/host/ehci-au1xxx.c b/drivers/usb/host/ehci-au1xxx.c
index 63eadee..9315898 100644
--- a/drivers/usb/host/ehci-au1xxx.c
+++ b/drivers/usb/host/ehci-au1xxx.c
@@ -16,10 +16,6 @@
 #include <linux/platform_device.h>
 #include <asm/mach-au1x00/au1000.h>
 
-#ifndef CONFIG_SOC_AU1200
-#error "this Alchemy chip doesn't have EHCI"
-#else				/* Au1200 */
-
 #define USB_HOST_CONFIG   (USB_MSR_BASE + USB_MSR_MCFG)
 #define USB_MCFG_PFEN     (1<<31)
 #define USB_MCFG_RDCOMB   (1<<30)
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 79f2d8b..c77e527 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -897,7 +897,7 @@ #include "ehci-fsl.c"
 #define	EHCI_BUS_GLUED
 #endif
 
-#ifdef CONFIG_SOC_AU1X00
+#ifdef CONFIG_SOC_AU1200
 #include "ehci-au1xxx.c"
 #define	EHCI_BUS_GLUED
 #endif
