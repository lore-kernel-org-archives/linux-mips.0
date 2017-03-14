Received: from mailapp01.imgtec.com ([195.59.15.196]:63447 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994913AbdCNK0EQerOH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Mar 2017 11:26:04 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 4/8] KVM: MIPS/T&E: Report correct dcache line size
Date: Tue, 14 Mar 2017 10:25:47 +0000
Message-ID: <8d3b879d1550f684cd780f3134e9799e026d4e85.1489486985.git-series.james.hogan@imgtec.com>
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
Message-ID: <20170314102547.Xe8-d_75W20cSiVedYSQDUwxKx1O1Z3hUF5y1bvUqvU@z>

Octeon CPUs don't report the correct dcache line size in CP0_Config1.DL,
so encode the correct value for the guest CP0_Config1.DL based on
cpu_dcache_line_size().

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <david.daney@cavium.com>
Cc: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/trap_emul.c | 8 ++++++++
 1 file changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/mips/kvm/trap_emul.c b/arch/mips/kvm/trap_emul.c
index 75ba3c4b7cd5..a563759fd142 100644
--- a/arch/mips/kvm/trap_emul.c
+++ b/arch/mips/kvm/trap_emul.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
+#include <linux/log2.h>
 #include <linux/uaccess.h>
 #include <linux/vmalloc.h>
 #include <asm/mmu_context.h>
@@ -644,6 +645,13 @@ static int kvm_trap_emul_vcpu_setup(struct kvm_vcpu *vcpu)
 	/* Read the cache characteristics from the host Config1 Register */
 	config1 = (read_c0_config1() & ~0x7f);
 
+	/* DCache line size not correctly reported in Config1 on Octeon CPUs */
+	if (cpu_dcache_line_size()) {
+		config1 &= ~MIPS_CONF1_DL;
+		config1 |= ((ilog2(cpu_dcache_line_size()) - 1) <<
+			    MIPS_CONF1_DL_SHF) & MIPS_CONF1_DL;
+	}
+
 	/* Set up MMU size */
 	config1 &= ~(0x3f << 25);
 	config1 |= ((KVM_MIPS_GUEST_TLB_SIZE - 1) << 25);
-- 
git-series 0.8.10
