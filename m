Received: from mailapp01.imgtec.com ([195.59.15.196]:51846 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822184AbaE2JREW5L0g (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 May 2014 11:17:04 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 04/23] MIPS: KVM: Use tlb_write_random
Date: Thu, 29 May 2014 10:16:26 +0100
Message-ID: <1401355005-20370-5-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1401355005-20370-1-git-send-email-james.hogan@imgtec.com>
References: <1401355005-20370-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, James Hogan <james.hogan@imgtec.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Sanjay Lal <sanjayl@kymasys.com>
Message-ID: <20140529091626.EDH7Xfug73Fm6jC70_oxzGb0SmxYLvo5HJf4N1yWK1w@z>

When MIPS KVM needs to write a TLB entry for the guest it reads the
CP0_Random register, uses it to generate the CP_Index, and writes the
TLB entry using the TLBWI instruction (tlb_write_indexed()).

However there's an instruction for that, TLBWR (tlb_write_random()) so
use that instead.

This happens to also fix an issue with Ingenic XBurst cores where the
same TLB entry is replaced each time preventing forward progress on
stores due to alternating between TLB load misses for the instruction
fetch and TLB store misses.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: kvm@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Sanjay Lal <sanjayl@kymasys.com>
---
 arch/mips/kvm/kvm_tlb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kvm/kvm_tlb.c b/arch/mips/kvm/kvm_tlb.c
index 50ab9c4d4a5d..9d371ee0a755 100644
--- a/arch/mips/kvm/kvm_tlb.c
+++ b/arch/mips/kvm/kvm_tlb.c
@@ -222,16 +222,14 @@ kvm_mips_host_tlb_write(struct kvm_vcpu *vcpu, unsigned long entryhi,
 		return -1;
 	}
 
-	if (idx < 0) {
-		idx = read_c0_random() % current_cpu_data.tlbsize;
-		write_c0_index(idx);
-		mtc0_tlbw_hazard();
-	}
 	write_c0_entrylo0(entrylo0);
 	write_c0_entrylo1(entrylo1);
 	mtc0_tlbw_hazard();
 
-	tlb_write_indexed();
+	if (idx < 0)
+		tlb_write_random();
+	else
+		tlb_write_indexed();
 	tlbw_use_hazard();
 
 #ifdef DEBUG
-- 
1.9.3
