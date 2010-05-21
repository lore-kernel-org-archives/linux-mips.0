Received: from sj-iport-6.cisco.com ([171.71.176.117]:11575 "EHLO
        sj-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S1491827Ab0EUS0H (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 21 May 2010 20:26:07 +0200
Date: Fri, 21 May 2010 11:25:59 -0700
From: David VomLehn <dvomlehn@cisco.com>
Subject: [PATCH] MIPS:POWERTV: Correct ASIC device register names and
        locations
Message-ID: <20100521182559.GA3401@dvomlehn-lnx2.corp.sa.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: to@dvomlehn-lnx2.corp.sa.net, "linux-mips@linux-mips.org"@cisco.comlinux-mips@linux-mips.org
Cc: ralf@linux-mips.org
Message-ID: <20100521182559.NuvorM_POW5Hz2aaWOP7YM5luHBeYerYw5nA44X3W9c@z>

Correct ASIC device register names and addresses for USB devices.

Signed-off-by: David VomLehn <dvomlehn@cisco.com>
---
 arch/mips/include/asm/mach-powertv/asic_reg_map.h |    2 +-
 arch/mips/powertv/asic/asic-calliope.c            |    2 +-
 arch/mips/powertv/asic/asic-cronus.c              |    4 ++--
 arch/mips/powertv/asic/asic-zeus.c                |    2 +-
 arch/mips/powertv/asic/asic_devices.c             |    6 +++---
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/mach-powertv/asic_reg_map.h b/arch/mips/include/asm/mach-powertv/asic_reg_map.h
index 6f26cb0..20348e8 100644
--- a/arch/mips/include/asm/mach-powertv/asic_reg_map.h
+++ b/arch/mips/include/asm/mach-powertv/asic_reg_map.h
@@ -64,7 +64,7 @@ REGISTER_MAP_ELEMENT(int_level_0_1)
 REGISTER_MAP_ELEMENT(int_level_0_0)
 REGISTER_MAP_ELEMENT(int_docsis_en)
 REGISTER_MAP_ELEMENT(mips_pll_setup)
-REGISTER_MAP_ELEMENT(usb_fs)
+REGISTER_MAP_ELEMENT(fs432x4b4_usb_ctl)
 REGISTER_MAP_ELEMENT(test_bus)
 REGISTER_MAP_ELEMENT(crt_spare)
 REGISTER_MAP_ELEMENT(usb2_ohci_int_mask)
diff --git a/arch/mips/powertv/asic/asic-calliope.c b/arch/mips/powertv/asic/asic-calliope.c
index 1ae6623..0a170e0 100644
--- a/arch/mips/powertv/asic/asic-calliope.c
+++ b/arch/mips/powertv/asic/asic-calliope.c
@@ -77,7 +77,7 @@ const struct register_map calliope_register_map __initdata = {
 	.int_docsis_en = {.phys = CALLIOPE_ADDR(0xA028F4)},
 
 	.mips_pll_setup = {.phys = CALLIOPE_ADDR(0x980000)},
-	.usb_fs = {.phys = CALLIOPE_ADDR(0x980030)},
+	.fs432x4b4_usb_ctl = {.phys = CALLIOPE_ADDR(0x980030)},
 	.test_bus = {.phys = CALLIOPE_ADDR(0x9800CC)},
 	.crt_spare = {.phys = CALLIOPE_ADDR(0x9800d4)},
 	.usb2_ohci_int_mask = {.phys = CALLIOPE_ADDR(0x9A000c)},
diff --git a/arch/mips/powertv/asic/asic-cronus.c b/arch/mips/powertv/asic/asic-cronus.c
index 5bb64bf..bbc0c12 100644
--- a/arch/mips/powertv/asic/asic-cronus.c
+++ b/arch/mips/powertv/asic/asic-cronus.c
@@ -77,13 +77,13 @@ const struct register_map cronus_register_map __initdata = {
 	.int_docsis_en = {.phys = CRONUS_ADDR(0x2A28F4)},
 
 	.mips_pll_setup = {.phys = CRONUS_ADDR(0x1C0000)},
-	.usb_fs = {.phys = CRONUS_ADDR(0x1C0018)},
+	.fs432x4b4_usb_ctl = {.phys = CRONUS_ADDR(0x1C0028)},
 	.test_bus = {.phys = CRONUS_ADDR(0x1C00CC)},
 	.crt_spare = {.phys = CRONUS_ADDR(0x1c00d4)},
 	.usb2_ohci_int_mask = {.phys = CRONUS_ADDR(0x20000C)},
 	.usb2_strap = {.phys = CRONUS_ADDR(0x200014)},
 	.ehci_hcapbase = {.phys = CRONUS_ADDR(0x21FE00)},
-	.ohci_hc_revision = {.phys = CRONUS_ADDR(0x1E0000)},
+	.ohci_hc_revision = {.phys = CRONUS_ADDR(0x21fc00)},
 	.bcm1_bs_lmi_steer = {.phys = CRONUS_ADDR(0x2E0008)},
 	.usb2_control = {.phys = CRONUS_ADDR(0x2E004C)},
 	.usb2_stbus_obc = {.phys = CRONUS_ADDR(0x21FF00)},
diff --git a/arch/mips/powertv/asic/asic-zeus.c b/arch/mips/powertv/asic/asic-zeus.c
index 095cbe1..4a05bb0 100644
--- a/arch/mips/powertv/asic/asic-zeus.c
+++ b/arch/mips/powertv/asic/asic-zeus.c
@@ -77,7 +77,7 @@ const struct register_map zeus_register_map __initdata = {
 	.int_docsis_en = {.phys = ZEUS_ADDR(0x2828F4)},
 
 	.mips_pll_setup = {.phys = ZEUS_ADDR(0x1a0000)},
-	.usb_fs = {.phys = ZEUS_ADDR(0x1a0018)},
+	.fs432x4b4_usb_ctl = {.phys = ZEUS_ADDR(0x1a0018)},
 	.test_bus = {.phys = ZEUS_ADDR(0x1a0238)},
 	.crt_spare = {.phys = ZEUS_ADDR(0x1a0090)},
 	.usb2_ohci_int_mask = {.phys = ZEUS_ADDR(0x1e000c)},
diff --git a/arch/mips/powertv/asic/asic_devices.c b/arch/mips/powertv/asic/asic_devices.c
index 37c71cc..2276c18 100644
--- a/arch/mips/powertv/asic/asic_devices.c
+++ b/arch/mips/powertv/asic/asic_devices.c
@@ -180,9 +180,9 @@ static void __init fs_update(int pe, int md, int sdiv, int disable_div_by_3)
 	val = ((sdiv << 29) | (md << 24) | (pe<<8) | (sout<<3) | (byp<<2) |
 		(nsb<<1) | (disable_div_by_3<<5));
 
-	asic_write(val, usb_fs);
-	asic_write(val | (en_prg<<4), usb_fs);
-	asic_write(val | (en_prg<<4) | pwr, usb_fs);
+	asic_write(val, fs432x4b4_usb_ctl);
+	asic_write(val | (en_prg<<4), fs432x4b4_usb_ctl);
+	asic_write(val | (en_prg<<4) | pwr, fs432x4b4_usb_ctl);
 }
 
 /*
