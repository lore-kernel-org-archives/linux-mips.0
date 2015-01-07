Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:2763 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010447AbbAGLVcZhhm4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:32 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 10/17] MIPS: Netlogic: nlm_core_id for xlp9xx
Date: Wed, 7 Jan 2015 16:58:31 +0530
Message-ID: <1420630118-17198-11-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
References: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <jchandra@broadcom.com>
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
Cc: Jayachandran C <jchandra@broadcom.com>, ralf@linux-mips.org
Message-ID: <20150107112831.9nXB_NCt8VxrVOUqXRXvXrx0Few2wDDM6ZR9Dmsw3No@z>

XLP9XX has 5 bits that specify the core in the EBASE register. XLP5XX
case added as well for completeness.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/include/asm/netlogic/mips-extns.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/netlogic/mips-extns.h b/arch/mips/include/asm/netlogic/mips-extns.h
index 06f1f75..788baf3 100644
--- a/arch/mips/include/asm/netlogic/mips-extns.h
+++ b/arch/mips/include/asm/netlogic/mips-extns.h
@@ -157,7 +157,13 @@ static inline int nlm_nodeid(void)
 
 static inline unsigned int nlm_core_id(void)
 {
-	return (read_c0_ebase() & 0x1c) >> 2;
+	uint32_t prid = read_c0_prid() & PRID_IMP_MASK;
+
+	if ((prid == PRID_IMP_NETLOGIC_XLP9XX) ||
+			(prid == PRID_IMP_NETLOGIC_XLP5XX))
+		return (read_c0_ebase() & 0x7c) >> 2;
+	else
+		return (read_c0_ebase() & 0x1c) >> 2;
 }
 
 static inline unsigned int nlm_thread_id(void)
-- 
1.9.1
