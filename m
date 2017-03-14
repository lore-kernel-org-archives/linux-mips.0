Received: from mailapp01.imgtec.com ([195.59.15.196]:41084 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994912AbdCNK0DcsVaH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Mar 2017 11:26:03 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 3/8] KVM: MIPS/TLB: Handle virtually tagged icaches
Date: Tue, 14 Mar 2017 10:25:46 +0000
Message-ID: <72c8f0fd8ab01b77e65b34c7b213543043e0ef14.1489486985.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.79b3feae3a98cb166c2d40a7bd4e854a5faedc89.1489486985.git-series.james.hogan@imgtec.com>
References: <cover.79b3feae3a98cb166c2d40a7bd4e854a5faedc89.1489486985.git-series.james.hogan@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
To: linux-mips@linux-mips.org, kvm@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Message-ID: <20170314102546.ePwQHzrDSIZwcyNomtl2Vk7IK9YeLag0wOx6Pp5ik94@z>

When TLB entries are invalidated in the presence of a virtually tagged
icache, such as that found on Octeon CPUs, flush the icache so that we
don't get a reserved instruction exception even though the TLB mapping
is removed.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <david.daney@cavium.com>
Cc: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/tlb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/mips/kvm/tlb.c b/arch/mips/kvm/tlb.c
index c215470fdcb0..fbab2f747721 100644
--- a/arch/mips/kvm/tlb.c
+++ b/arch/mips/kvm/tlb.c
@@ -185,6 +185,13 @@ int kvm_mips_host_tlb_inv(struct kvm_vcpu *vcpu, unsigned long va,
 
 	local_irq_restore(flags);
 
+	/*
+	 * We don't want to get reserved instruction exceptions for missing tlb
+	 * entries.
+	 */
+	if (cpu_has_vtag_icache)
+		flush_icache_all();
+
 	if (user && idx_user >= 0)
 		kvm_debug("%s: Invalidated guest user entryhi %#lx @ idx %d\n",
 			  __func__, (va & VPN2_MASK) |
@@ -260,6 +267,13 @@ int kvm_vz_host_tlb_inv(struct kvm_vcpu *vcpu, unsigned long va)
 	htw_start();
 	local_irq_restore(flags);
 
+	/*
+	 * We don't want to get reserved instruction exceptions for missing tlb
+	 * entries.
+	 */
+	if (cpu_has_vtag_icache)
+		flush_icache_all();
+
 	if (idx > 0)
 		kvm_debug("%s: Invalidated root entryhi %#lx @ idx %d\n",
 			  __func__, (va & VPN2_MASK) |
-- 
git-series 0.8.10
