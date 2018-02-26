Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:52097 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990656AbeBZRILmOf3O (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Feb 2018 18:08:11 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 3/4] MIPS: BPF: Replace __mips_isa_rev with MIPS_ISA_REV
Date: Mon, 26 Feb 2018 17:02:44 +0000
Message-ID: <1519664565-10955-4-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1519664565-10955-1-git-send-email-matt.redfearn@mips.com>
References: <1519664565-10955-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20180226170244.UBT519r9bOMT1hmg0cPr5IPNp0AkA3G6vHFCSVwoGfY@z>

Remove the need to check that __mips_isa_rev is defined by using the
newly added MIPS_ISA_REV.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/net/bpf_jit_asm.S | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/mips/net/bpf_jit_asm.S b/arch/mips/net/bpf_jit_asm.S
index 88a2075305d1..57154c5883b6 100644
--- a/arch/mips/net/bpf_jit_asm.S
+++ b/arch/mips/net/bpf_jit_asm.S
@@ -11,6 +11,7 @@
  */
 
 #include <asm/asm.h>
+#include <asm/isa-rev.h>
 #include <asm/regdef.h>
 #include "bpf_jit.h"
 
@@ -65,7 +66,7 @@ FEXPORT(sk_load_word_positive)
 	lw	$r_A, 0(t1)
 	.set	noreorder
 #ifdef CONFIG_CPU_LITTLE_ENDIAN
-# if defined(__mips_isa_rev) && (__mips_isa_rev >= 2)
+# if MIPS_ISA_REV >= 2
 	wsbh	t0, $r_A
 	rotr	$r_A, t0, 16
 # else
@@ -92,7 +93,7 @@ FEXPORT(sk_load_half_positive)
 	PTR_ADDU t1, $r_skb_data, offset
 	lhu	$r_A, 0(t1)
 #ifdef CONFIG_CPU_LITTLE_ENDIAN
-# if defined(__mips_isa_rev) && (__mips_isa_rev >= 2)
+# if MIPS_ISA_REV >= 2
 	wsbh	$r_A, $r_A
 # else
 	sll	t0, $r_A, 8
@@ -170,7 +171,7 @@ FEXPORT(sk_load_byte_positive)
 NESTED(bpf_slow_path_word, (6 * SZREG), $r_sp)
 	bpf_slow_path_common(4)
 #ifdef CONFIG_CPU_LITTLE_ENDIAN
-# if defined(__mips_isa_rev) && (__mips_isa_rev >= 2)
+# if MIPS_ISA_REV >= 2
 	wsbh	t0, $r_s0
 	jr	$r_ra
 	 rotr	$r_A, t0, 16
@@ -196,7 +197,7 @@ NESTED(bpf_slow_path_word, (6 * SZREG), $r_sp)
 NESTED(bpf_slow_path_half, (6 * SZREG), $r_sp)
 	bpf_slow_path_common(2)
 #ifdef CONFIG_CPU_LITTLE_ENDIAN
-# if defined(__mips_isa_rev) && (__mips_isa_rev >= 2)
+# if MIPS_ISA_REV >= 2
 	jr	$r_ra
 	 wsbh	$r_A, $r_s0
 # else
-- 
2.7.4
