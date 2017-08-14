Received: from mailapp01.imgtec.com ([195.59.15.196]:55548 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993953AbdHNSVNVaMGp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 14 Aug 2017 20:21:13 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 8/8] MIPS: generic: Bump default NR_CPUS to 16
Date: Mon, 14 Aug 2017 11:18:19 -0700
Message-ID: <20170814181819.7376-9-paul.burton@imgtec.com>
In-Reply-To: <20170814181819.7376-1-paul.burton@imgtec.com>
References: <20170814181819.7376-1-paul.burton@imgtec.com>
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
Message-ID: <20170814181819.C9ao-hPIQdMy3CXmE1dcJHcuDCIYv9qvQK0zTwLRFO4@z>

In generic_defconfig set CONFIG_NR_CPUS to 16 rather than 2, which is a
rather too low limit for many modern day MIPS systems.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org

---

Changes in v2: None

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
