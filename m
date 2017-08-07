Received: from mailapp01.imgtec.com ([195.59.15.196]:49686 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23995127AbdHGXDwZXUII (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Aug 2017 01:03:52 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 7/7] MIPS: generic: Bump default NR_CPUS to 16
Date: Mon, 7 Aug 2017 16:01:18 -0700
Message-ID: <20170807230119.10629-8-paul.burton@imgtec.com>
In-Reply-To: <20170807230119.10629-1-paul.burton@imgtec.com>
References: <20170807230119.10629-1-paul.burton@imgtec.com>
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
Message-ID: <20170807230118.95qr8Lf00jErudWbEefwKgOzFOa7p9UhDdtdJIqSwME@z>

In generic_defconfig set CONFIG_NR_CPUS to 16 rather than 2, which is a
rather too low limit for many modern day MIPS systems.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org

---

 arch/mips/configs/generic_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/configs/generic_defconfig b/arch/mips/configs/generic_defconfig
index a638028b1425..26b1cd5ffbf5 100644
--- a/arch/mips/configs/generic_defconfig
+++ b/arch/mips/configs/generic_defconfig
@@ -3,7 +3,7 @@ CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_MIPS_CPS=y
 CONFIG_CPU_HAS_MSA=y
 CONFIG_HIGHMEM=y
-CONFIG_NR_CPUS=2
+CONFIG_NR_CPUS=16
 CONFIG_MIPS_O32_FP64_SUPPORT=y
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
-- 
2.14.0
