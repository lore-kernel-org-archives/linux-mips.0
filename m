Received: from mailapp01.imgtec.com ([195.59.15.196]:57115 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009953AbcBCDRYwKkZ0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 04:17:24 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 04/15] MIPS: CPC: Add start, stop and running CM3 CPC registers
Date: Wed, 3 Feb 2016 03:15:24 +0000
Message-ID: <1454469335-14778-5-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454469335-14778-1-git-send-email-paul.burton@imgtec.com>
References: <1454469335-14778-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org
Message-ID: <20160203031524.ZKCApNjKPMSn40lSRnvs5qTsD2H_0gI9iiE8eJ7HWG4@z>

From: Markos Chandras <markos.chandras@imgtec.com>

Add the new CM3 registers for controlling bringing up and powering down
VPs on MIPSR6 cores.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/asm/mips-cpc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/include/asm/mips-cpc.h b/arch/mips/include/asm/mips-cpc.h
index e090352..8c519f9 100644
--- a/arch/mips/include/asm/mips-cpc.h
+++ b/arch/mips/include/asm/mips-cpc.h
@@ -106,6 +106,9 @@ BUILD_CPC_R_(revision,		MIPS_CPC_GCB_OFS + 0x20)
 BUILD_CPC_Cx_RW(cmd,		0x00)
 BUILD_CPC_Cx_RW(stat_conf,	0x08)
 BUILD_CPC_Cx_RW(other,		0x10)
+BUILD_CPC_Cx_RW(vp_stop,	0x20)
+BUILD_CPC_Cx_RW(vp_run,		0x28)
+BUILD_CPC_Cx_RW(vp_running,	0x30)
 
 /* CPC_Cx_CMD register fields */
 #define CPC_Cx_CMD_SHF				0
-- 
2.7.0
