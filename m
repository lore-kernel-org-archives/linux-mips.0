Received: from mailapp01.imgtec.com ([195.59.15.196]:63750 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994852AbdHGWiW2hTqI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Aug 2017 00:38:22 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/4] MIPS: generic: Move Boston FIT image source to its own file
Date: Mon, 7 Aug 2017 15:37:22 -0700
Message-ID: <20170807223724.19408-3-paul.burton@imgtec.com>
In-Reply-To: <20170807223724.19408-1-paul.burton@imgtec.com>
References: <20170807223724.19408-1-paul.burton@imgtec.com>
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
Message-ID: <20170807223722._3MCb60x1oTXunEie_Rs-6a2ENiHKdOIj9fpMlCfV_E@z>

Move the Boston board flattened image tree source into its own file
which is concatenated into the final image tree source used to build the
flattened image tree. Separating boards into different files will help
us to avoid conflicts as boards are added.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/generic/Platform           |  1 +
 arch/mips/generic/board-boston.its.S | 22 ++++++++++++++++++++++
 arch/mips/generic/vmlinux.its.S      | 25 -------------------------
 3 files changed, 23 insertions(+), 25 deletions(-)
 create mode 100644 arch/mips/generic/board-boston.its.S

diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index 6f7ce7b0c5e2..50c8ad58b5f1 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -14,3 +14,4 @@ load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
 all-$(CONFIG_MIPS_GENERIC)	:= vmlinux.gz.itb
 
 its-y					:= vmlinux.its.S
+its-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= board-boston.its.S
diff --git a/arch/mips/generic/board-boston.its.S b/arch/mips/generic/board-boston.its.S
new file mode 100644
index 000000000000..a7f51f97b910
--- /dev/null
+++ b/arch/mips/generic/board-boston.its.S
@@ -0,0 +1,22 @@
+/ {
+	images {
+		fdt@boston {
+			description = "img,boston Device Tree";
+			data = /incbin/("boot/dts/img/boston.dtb");
+			type = "flat_dt";
+			arch = "mips";
+			compression = "none";
+			hash@0 {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		conf@boston {
+			description = "Boston Linux kernel";
+			kernel = "kernel@0";
+			fdt = "fdt@boston";
+		};
+	};
+};
diff --git a/arch/mips/generic/vmlinux.its.S b/arch/mips/generic/vmlinux.its.S
index ffc6f37759c0..4a142e746719 100644
--- a/arch/mips/generic/vmlinux.its.S
+++ b/arch/mips/generic/vmlinux.its.S
@@ -30,31 +30,6 @@
 	};
 };
 
-#ifdef CONFIG_FIT_IMAGE_FDT_BOSTON
-/ {
-	images {
-		fdt@boston {
-			description = "img,boston Device Tree";
-			data = /incbin/("boot/dts/img/boston.dtb");
-			type = "flat_dt";
-			arch = "mips";
-			compression = "none";
-			hash@0 {
-				algo = "sha1";
-			};
-		};
-	};
-
-	configurations {
-		conf@boston {
-			description = "Boston Linux kernel";
-			kernel = "kernel@0";
-			fdt = "fdt@boston";
-		};
-	};
-};
-#endif /* CONFIG_FIT_IMAGE_FDT_BOSTON */
-
 #ifdef CONFIG_FIT_IMAGE_FDT_NI169445
 {
 	images {
-- 
2.14.0
