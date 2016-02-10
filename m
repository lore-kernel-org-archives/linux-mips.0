Received: from mailapp01.imgtec.com ([195.59.15.196]:63198 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008721AbcBJN5IkyJ0f (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 10 Feb 2016 14:57:08 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH] MIPS: OCTEON: Update OCTEON_FEATURE_PCIE for Octeon III
Date: Wed, 10 Feb 2016 13:56:25 +0000
Message-ID: <1455112585-44058-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, david.daney@cavium.com
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, matt.redfearn@imgtec.com, Zubair.Kakakhel@imgtec.com
Message-ID: <20160210135625.PGoIyyaKYB-J_j6MmqaoXXu4hZpxScMgFxIOxaU409w@z>

Currently the driver tries to probe the pci driver and oops.

Add CN7XXX to case so that driver probes the pcie driver.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
Based on v4.5-rc3

Boot tested only on CN7130 based utm8.

It does not oops and proceeds with the rest of the kernel boot.

---
 arch/mips/include/asm/octeon/octeon-feature.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/octeon/octeon-feature.h b/arch/mips/include/asm/octeon/octeon-feature.h
index 8ebd3f57..3ed10a8 100644
--- a/arch/mips/include/asm/octeon/octeon-feature.h
+++ b/arch/mips/include/asm/octeon/octeon-feature.h
@@ -128,7 +128,8 @@ static inline int octeon_has_feature(enum octeon_feature feature)
 	case OCTEON_FEATURE_PCIE:
 		return OCTEON_IS_MODEL(OCTEON_CN56XX)
 			|| OCTEON_IS_MODEL(OCTEON_CN52XX)
-			|| OCTEON_IS_MODEL(OCTEON_CN6XXX);
+			|| OCTEON_IS_MODEL(OCTEON_CN6XXX)
+			|| OCTEON_IS_MODEL(OCTEON_CN7XXX);
 
 	case OCTEON_FEATURE_SRIO:
 		return OCTEON_IS_MODEL(OCTEON_CN63XX)
-- 
1.9.1
