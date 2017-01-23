Received: from mailapp01.imgtec.com ([195.59.15.196]:2714 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992123AbdAWOIYuLV4F (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Jan 2017 15:08:24 +0100
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: Generic: Fix big endian CPUs on generic machine
Date: Mon, 23 Jan 2017 14:08:13 +0000
Message-ID: <1485180493-22949-1-git-send-email-matt.redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20170123140813.RAWDt52XVu0YdCSSISIM6oAkqdpRmCjfBi4ygxAa4QU@z>

Big endian CPUs require SWAP_IO_SPACE enabled to swap accesses to little
endian peripherals.

Without this patch, big endian kernels fail to communicate with little
endian periperals, such as PCI devices, on QEMU and FPGA based
platforms.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Fixes: eed0eabd12ef ("MIPS: generic: Introduce generic DT-based board support")

---

 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b3c5bde43d34..82dff20edaf9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -94,6 +94,7 @@ config MIPS_GENERIC
 	select PCI_DRIVERS_GENERIC
 	select PINCTRL
 	select SMP_UP if SMP
+	select SWAP_IO_SPACE
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_HAS_CPU_MIPS32_R6
-- 
2.7.4
