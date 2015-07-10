Received: from mailapp01.imgtec.com ([195.59.15.196]:42697 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010210AbbGJPEeYNAcp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jul 2015 17:04:34 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 13/16] MIPS: advertise MIPSr6 via HWCAP when appropriate
Date: Fri, 10 Jul 2015 16:00:22 +0100
Message-ID: <1436540426-10021-14-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1436540426-10021-1-git-send-email-paul.burton@imgtec.com>
References: <1436540426-10021-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Matthew Fortune <matthew.fortune@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-kernel@vger.kernel.org, Huacai Chen <chenhc@lemote.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150710150022.yIMGFdf4PncMXC0KtagOry2LCD7CeMAPGnILnAfi0qY@z>

When running on a CPU implementing the release 6 of the MIPS32 or MIPS64
ISA, advertise that to userland via the appropriate HWCAP bit.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/cpu-probe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index e184921..168a5d3 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1489,6 +1489,9 @@ void cpu_probe(void)
 	else
 		c->srsets = 1;
 
+	if (cpu_has_mips_r6)
+		elf_hwcap |= HWCAP_MIPS_R6;
+
 	if (cpu_has_msa) {
 		c->msa_id = cpu_get_msa_id();
 		WARN(c->msa_id & MSA_IR_WRPF,
-- 
2.4.4
