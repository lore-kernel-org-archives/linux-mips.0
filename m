Received: from multi.imgtec.com ([194.200.65.239]:31731 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6828766Ab3LFLBfLaAEn (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 6 Dec 2013 12:01:35 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH 2/4] sead3: remove chosen node
Date: Fri, 6 Dec 2013 11:00:43 +0000
Message-ID: <1386327645-17571-3-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1386327645-17571-1-git-send-email-qais.yousef@imgtec.com>
References: <1386327645-17571-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Qais.Yousef@imgtec.com>
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
Cc: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20131206110043.ps6GLac77juELBIK0JYePCOPKwQMsKppb7bvbUgrAtE@z>

The defaults are not always applicable and it makes it hard for the bootloader
to override them. By removing it we give the bootloader full control over what
command line parameters to pass.

Without this change we will need to modify the built-in dtb to add bootloader
cmd line parameters or do some work to append them after we unflatten the device
tree.

Sead3 is a development board, that's why we want to be able to change boot
parameters on the fly from the bootloader.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Reviewed-by: James Hogan <james.hogan@imgtec.com>
---
 arch/mips/mti-sead3/sead3.dts |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mti-sead3/sead3.dts b/arch/mips/mti-sead3/sead3.dts
index 658f437..e4b317d 100644
--- a/arch/mips/mti-sead3/sead3.dts
+++ b/arch/mips/mti-sead3/sead3.dts
@@ -15,10 +15,6 @@
 		};
 	};
 
-	chosen {
-		bootargs = "console=ttyS1,38400 rootdelay=10 root=/dev/sda3";
-	};
-
 	memory {
 		device_type = "memory";
 		reg = <0x0 0x08000000>;
-- 
1.7.1
