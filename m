Received: from mailapp01.imgtec.com ([195.59.15.196]:26112 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860015AbaFWJjlD62Rf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Jun 2014 11:39:41 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 14/17] MIPS: bpf: Prevent kernel fall over for >=32bit shifts
Date: Mon, 23 Jun 2014 10:38:57 +0100
Message-ID: <1403516340-22997-15-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1403516340-22997-1-git-send-email-markos.chandras@imgtec.com>
References: <1403516340-22997-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, "David S. Miller" <davem@davemloft.net>, Daniel Borkmann <dborkman@redhat.com>, Alexei Starovoitov <ast@plumgrid.com>, netdev@vger.kernel.org
Message-ID: <20140623093857.aqt_skow6xnGugwJmLD1D7CJIidy-hbstntlbVMel7o@z>

Remove BUG_ON() if the shift immediate is >=32 to avoid
kernel crashes due to malicious user input. Since the micro-assembler
will not allow an immediate greater or equal to 32, we will use the
maximum value which is 31. This will do the correct thing on either 32-
or 64-bit cores since no 64-bit instructions are being used in JIT.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Daniel Borkmann <dborkman@redhat.com>
Cc: Alexei Starovoitov <ast@plumgrid.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/net/bpf_jit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/net/bpf_jit.c b/arch/mips/net/bpf_jit.c
index 1bcd599d9971..09ebc886c7aa 100644
--- a/arch/mips/net/bpf_jit.c
+++ b/arch/mips/net/bpf_jit.c
@@ -309,7 +309,8 @@ static inline void emit_sll(unsigned int dst, unsigned int src,
 			    unsigned int sa, struct jit_ctx *ctx)
 {
 	/* sa is 5-bits long */
-	BUG_ON(sa >= BIT(5));
+	if (sa >= BIT(5))
+		sa = BIT(5) - 1;
 	emit_instr(ctx, sll, dst, src, sa);
 }
 
@@ -323,7 +324,8 @@ static inline void emit_srl(unsigned int dst, unsigned int src,
 			    unsigned int sa, struct jit_ctx *ctx)
 {
 	/* sa is 5-bits long */
-	BUG_ON(sa >= BIT(5));
+	if (sa >= BIT(5))
+		sa =  BIT(5) - 1;
 	emit_instr(ctx, srl, dst, src, sa);
 }
 
-- 
2.0.0
