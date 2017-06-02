Received: from mailapp01.imgtec.com ([195.59.15.196]:26159 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993929AbdFBTbRM4Srn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Jun 2017 21:31:17 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/9] MIPS: generic/yamon-dt: Use serial* rather than uart* aliases
Date: Fri, 2 Jun 2017 12:29:53 -0700
Message-ID: <20170602192959.25435-4-paul.burton@imgtec.com>
In-Reply-To: <20170602192959.25435-1-paul.burton@imgtec.com>
References: <20170602192959.25435-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170602192953.yCExajwyywe_W_yECcoyufawKwAPpkOfmGpe3Af0EuE@z>

Name aliases in the SEAD-3 device tree serial0 & serial1, rather than
uart0 & uart1. This allows the core serial code to make use of the
aliases to ensure that the UARTs are consistently numbered as expected
rather than having the numbering depend upon probe order.

When translating YAMON-provided serial configuration to a device tree
stdout-path property adjust accordingly, such that we continue to
reference a valid alias.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/boot/dts/mti/sead3.dts | 6 +++---
 arch/mips/generic/yamon-dt.c     | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/mti/sead3.dts b/arch/mips/boot/dts/mti/sead3.dts
index b112879a5d9d..c1dbf16708bd 100644
--- a/arch/mips/boot/dts/mti/sead3.dts
+++ b/arch/mips/boot/dts/mti/sead3.dts
@@ -14,12 +14,12 @@
 	interrupt-parent = <&gic>;
 
 	chosen {
-		stdout-path = "uart1:115200";
+		stdout-path = "serial1:115200";
 	};
 
 	aliases {
-		uart0 = &uart0;
-		uart1 = &uart1;
+		serial0 = &uart0;
+		serial1 = &uart1;
 	};
 
 	cpus {
diff --git a/arch/mips/generic/yamon-dt.c b/arch/mips/generic/yamon-dt.c
index 8e36a5baaa7e..6077bca9b364 100644
--- a/arch/mips/generic/yamon-dt.c
+++ b/arch/mips/generic/yamon-dt.c
@@ -163,7 +163,7 @@ __init int yamon_dt_append_memory(void *fdt,
 __init int yamon_dt_serial_config(void *fdt)
 {
 	const char *yamontty, *mode_var;
-	char mode_var_name[9], path[18], parity;
+	char mode_var_name[9], path[20], parity;
 	unsigned int uart, baud, stop_bits;
 	bool hw_flow;
 	int chosen_off, err;
@@ -214,7 +214,7 @@ __init int yamon_dt_serial_config(void *fdt)
 	if (stop_bits != 7 && stop_bits != 8)
 		stop_bits = 8;
 
-	WARN_ON(snprintf(path, sizeof(path), "uart%u:%u%c%u%s",
+	WARN_ON(snprintf(path, sizeof(path), "serial%u:%u%c%u%s",
 			 uart, baud, parity, stop_bits,
 			 hw_flow ? "r" : "") >= sizeof(path));
 
-- 
2.13.0
