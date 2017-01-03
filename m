Received: from mailapp01.imgtec.com ([195.59.15.196]:11474 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993107AbdACRnZ6ij4T (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Jan 2017 18:43:25 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 2/2] KVM: MIPS: Flush KVM entry code from icache globally
Date: Tue, 3 Jan 2017 17:43:01 +0000
Message-ID: <c73b83202f6a1bbc6e34e6d748bf4e4921d634b9.1483464823.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.cdddb6fe1a787c96c57358e404931f87f547e5e5.1483464823.git-series.james.hogan@imgtec.com>
References: <cover.cdddb6fe1a787c96c57358e404931f87f547e5e5.1483464823.git-series.james.hogan@imgtec.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org, stable@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20170103174301.OElMvgFwtGMpDWkkkblhjbBrLfQuScQ6etw5Pftf53s@z>

Flush the KVM entry code from the icache on all CPUs, not just the one
that built the entry code.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Cc: <stable@vger.kernel.org> # 3.16.x-
---
 arch/mips/kvm/mips.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 06a60b19acfb..29ec9ab3fd55 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -360,8 +360,8 @@ struct kvm_vcpu *kvm_arch_vcpu_create(struct kvm *kvm, unsigned int id)
 	dump_handler("kvm_exit", gebase + 0x2000, vcpu->arch.vcpu_run);
 
 	/* Invalidate the icache for these ranges */
-	local_flush_icache_range((unsigned long)gebase,
-				(unsigned long)gebase + ALIGN(size, PAGE_SIZE));
+	flush_icache_range((unsigned long)gebase,
+			   (unsigned long)gebase + ALIGN(size, PAGE_SIZE));
 
 	/*
 	 * Allocate comm page for guest kernel, a TLB will be reserved for
-- 
git-series 0.8.10
