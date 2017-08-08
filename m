Received: from mailapp01.imgtec.com ([195.59.15.196]:34453 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993122AbdHHMXAO0v5G (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Aug 2017 14:23:00 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v3 2/6] MIPS: microMIPS: Fix detection of addiusp instruction
Date: Tue, 8 Aug 2017 13:22:31 +0100
Message-ID: <1502194955-18018-3-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1502194955-18018-1-git-send-email-matt.redfearn@imgtec.com>
References: <1502194955-18018-1-git-send-email-matt.redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170808122231.8g5K48e98QF4G6357fsGNzS3I8YonkUm0Bdv3S1n5CA@z>

The addiusp instruction uses the pool16d opcode, with bit 0 of the
immediate set. The test for the addiusp opcode erroneously did a logical
and of the immediate with mm_addiusp_func, which has value 1, so this
test always passes when the immediate is non-zero.

Fix the test by replacing the logical and with a bitwise and.

Fixes: 34c2f668d0f6 ("MIPS: microMIPS: Add unaligned access support.")
Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>

---

Changes in v3:
- New patch to fix detection of addiusp instruction

Changes in v2: None

 arch/mips/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 5950ecf469e9..9d38faf01055 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -326,7 +326,7 @@ static inline int is_sp_move_ins(union mips_instruction *ip)
 	 */
 	if (mm_insn_16bit(ip->halfword[1])) {
 		return (ip->mm16_r3_format.opcode == mm_pool16d_op &&
-			ip->mm16_r3_format.simmediate && mm_addiusp_func) ||
+			ip->mm16_r3_format.simmediate & mm_addiusp_func) ||
 		       (ip->mm16_r5_format.opcode == mm_pool16d_op &&
 			ip->mm16_r5_format.rt == 29);
 	}
-- 
2.7.4
