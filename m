Received: from mailapp01.imgtec.com ([195.59.15.196]:19422 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992022AbcKGPJlJzpKw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 16:09:41 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 6/6] MIPS: Handle microMIPS jumps in the same way as MIPS32/MIPS64 jumps
Date: Mon, 7 Nov 2016 15:07:07 +0000
Message-ID: <20161107150707.5079-7-paul.burton@imgtec.com>
In-Reply-To: <20161107150707.5079-1-paul.burton@imgtec.com>
References: <20161107150707.5079-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Tony Wu <tung7970@gmail.com>, "# v3 . 10+" <stable@vger.kernel.org>
Message-ID: <20161107150707.TDZ5eE3Ep3WWdo3MtZBaHXjYmzN-Vsw8KagFkr48_NE@z>

is_jump_ins() checks for plain jump ("j") instructions since commit
e7438c4b893e ("MIPS: Fix sibling call handling in get_frame_info") but
that commit didn't make the same change to the microMIPS code, leaving
it inconsistent with the MIPS32/MIPS64 code. Handle the microMIPS
encoding of the jump instruction too such that it behaves consistently.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Fixes: e7438c4b893e ("MIPS: Fix sibling call handling in get_frame_info")
Cc: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Tony Wu <tung7970@gmail.com>
Cc: <stable@vger.kernel.org> # v3.10+

---

 arch/mips/kernel/process.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 39c946f..1652f36 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -293,6 +293,8 @@ static inline int is_jump_ins(union mips_instruction *ip)
 		return 0;
 	}
 
+	if (ip->j_format.opcode == mm_j32_op)
+		return 1;
 	if (ip->j_format.opcode == mm_jal32_op)
 		return 1;
 	if (ip->r_format.opcode != mm_pool32a_op ||
-- 
2.10.2
