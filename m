Received: from mailapp01.imgtec.com ([195.59.15.196]:8154 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025433AbcDUPkZWwrdb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 21 Apr 2016 17:40:25 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: Prevent "restoration" of MSA context in non-MSA kernels
Date: Thu, 21 Apr 2016 16:39:37 +0100
Message-ID: <1461253177-6724-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Michal Toman <michal.toman@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, "stable # v4 . 3+" <stable@vger.kernel.org>
Message-ID: <20160421153937.Jj2vsuBxWMXWi6XfJalx4PpGSuFWi-aDLvgcZuetpRg@z>

If a kernel doesn't support MSA context (ie. CONFIG_CPU_HAS_MSA=n) then
it will only keep 64 bits per FP register in thread context, and the
calls to set_fpr64 in restore_msa_extcontext will overrun the end of the
FP register context into the FCSR & MSACSR values. GCC 6.x has become
smart enough to detect this & complain like so:

    arch/mips/kernel/signal.c: In function 'protected_restore_fp_context':
    ./arch/mips/include/asm/processor.h:114:17: error: array subscript is above array bounds [-Werror=array-bounds]
      fpr->val##width[FPR_IDX(width, idx)] = val;   \
      ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
    ./arch/mips/include/asm/processor.h:118:1: note: in expansion of macro 'BUILD_FPR_ACCESS'
     BUILD_FPR_ACCESS(64)

The only way to trigger this code to run would be for a program to set
up an artificial extended MSA context structure following a sigframe &
execute sigreturn. Whilst this doesn't allow a program to write to any
state that it couldn't already, it makes little sense to allow this
"restoration" of MSA context in a system that doesn't support MSA.

Fix this by killing a program with SIGSYS if it tries something as crazy
as "restoring" fake MSA context in this way, also fixing the build error
& allowing for most of restore_msa_extcontext to be optimised out of
kernels without support for MSA.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Reported-by: Michal Toman <michal.toman@imgtec.com>
Fixes: bf82cb30c7e5 ("MIPS: Save MSA extended context around signals")
Cc: James Hogan <james.hogan@imgtec.com>
Cc: stable <stable@vger.kernel.org> # v4.3+

---

 arch/mips/kernel/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index bf792e2..a304b70 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -195,6 +195,9 @@ static int restore_msa_extcontext(void __user *buf, unsigned int size)
 	unsigned int csr;
 	int i, err;
 
+	if (!config_enabled(CONFIG_CPU_HAS_MSA))
+		return SIGSYS;
+
 	if (size != sizeof(*msa))
 		return -EINVAL;
 
-- 
2.8.0
