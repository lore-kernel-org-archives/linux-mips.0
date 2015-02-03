Received: from mailapp01.imgtec.com ([195.59.15.196]:56536 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012662AbbBCNhw5lxn6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Feb 2015 14:37:52 +0100
From: Daniel Sanders <daniel.sanders@imgtec.com>
Subject: [PATCH 2/5] MIPS: LLVMLinux: Fix a 'cast to type not present in union' error.
Date: Tue, 3 Feb 2015 13:37:16 +0000
Message-ID: <1422970639-7922-3-git-send-email-daniel.sanders@imgtec.com>
In-Reply-To: <1422970639-7922-1-git-send-email-daniel.sanders@imgtec.com>
References: <1422970639-7922-1-git-send-email-daniel.sanders@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Daniel.Sanders@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Toma Tabacu <toma.tabacu@imgtec.com>, Daniel Sanders <daniel.sanders@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, David Daney <david.daney@cavium.com>, Manuel Lauss <manuel.lauss@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150203133716.C3CxLnHcuynq3eKoajPuccuVd1XfsMtXJYLRExriRvU@z>

From: Toma Tabacu <toma.tabacu@imgtec.com>

Remove a cast to the 'mips16e_instruction' union inside an if
condition and instead do an assignment to a local
'union mips16e_instruction' variable's 'full' member before the if
statement and use this variable in the if condition.

This is the error message reported by clang:
arch/mips/kernel/branch.c:38:8: error: cast to union type from type 'unsigned short' not present in union
                if (((union mips16e_instruction)inst).ri.opcode
                     ^                          ~~~~

The changed code can be compiled successfully by both gcc and clang.

Signed-off-by: Toma Tabacu <toma.tabacu@imgtec.com>
Signed-off-by: Daniel Sanders <daniel.sanders@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Cc: David Daney <david.daney@cavium.com>
Cc: Manuel Lauss <manuel.lauss@gmail.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/kernel/branch.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 4d7d99d..7110963 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -35,8 +35,10 @@ int __isa_exception_epc(struct pt_regs *regs)
 		return epc;
 	}
 	if (cpu_has_mips16) {
-		if (((union mips16e_instruction)inst).ri.opcode
-				== MIPS16e_jal_op)
+		union mips16e_instruction inst_mips16e;
+
+		inst_mips16e.full = inst;
+		if (inst_mips16e.ri.opcode == MIPS16e_jal_op)
 			epc += 4;
 		else
 			epc += 2;
-- 
2.1.4
