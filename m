Received: from mailapp01.imgtec.com ([195.59.15.196]:42947 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994803AbdCNKSOsHcjU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Mar 2017 11:18:14 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 14/33] KVM: MIPS: Init timer frequency from callback
Date: Tue, 14 Mar 2017 10:15:21 +0000
Message-ID: <0d8e37a53c3a90d544aea91eed475fc217e3b45b.1489485940.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.26e10ec77a4ed0d3177ccf4fabf57bc95ea030f8.1489485940.git-series.james.hogan@imgtec.com>
References: <cover.26e10ec77a4ed0d3177ccf4fabf57bc95ea030f8.1489485940.git-series.james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170314101521.6c8m_gWboR251bkLKJCI2SSy8vIU3BaxPQwW_Wgwiqk@z>

Currently the software emulated timer is initialised to a frequency of
100MHz by kvm_mips_init_count(), but this isn't suitable for VZ where
the frequency of the guest timer matches that of the host.

Add a count_hz argument so the caller can specify the default frequency,
and move the call from kvm_arch_vcpu_create() to the implementation
specific vcpu_setup() callback, so that VZ can specify a different
frequency.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/include/asm/kvm_host.h |  2 +-
 arch/mips/kvm/emulate.c          | 13 ++++++-------
 arch/mips/kvm/mips.c             |  3 ---
 arch/mips/kvm/trap_emul.c        |  3 +++
 4 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index e8843784b784..f0227c0d2780 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -806,7 +806,7 @@ extern enum emulation_result kvm_mips_complete_mmio_load(struct kvm_vcpu *vcpu,
 u32 kvm_mips_read_count(struct kvm_vcpu *vcpu);
 void kvm_mips_write_count(struct kvm_vcpu *vcpu, u32 count);
 void kvm_mips_write_compare(struct kvm_vcpu *vcpu, u32 compare, bool ack);
-void kvm_mips_init_count(struct kvm_vcpu *vcpu);
+void kvm_mips_init_count(struct kvm_vcpu *vcpu, unsigned long count_hz);
 int kvm_mips_set_count_ctl(struct kvm_vcpu *vcpu, s64 count_ctl);
 int kvm_mips_set_count_resume(struct kvm_vcpu *vcpu, s64 count_resume);
 int kvm_mips_set_count_hz(struct kvm_vcpu *vcpu, s64 count_hz);
diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index d75ab8940e1f..f09a161926e7 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -543,16 +543,15 @@ void kvm_mips_write_count(struct kvm_vcpu *vcpu, u32 count)
 /**
  * kvm_mips_init_count() - Initialise timer.
  * @vcpu:	Virtual CPU.
+ * @count_hz:	Frequency of timer.
  *
- * Initialise the timer to a sensible frequency, namely 100MHz, zero it, and set
- * it going if it's enabled.
+ * Initialise the timer to the specified frequency, zero it, and set it going if
+ * it's enabled.
  */
-void kvm_mips_init_count(struct kvm_vcpu *vcpu)
+void kvm_mips_init_count(struct kvm_vcpu *vcpu, unsigned long count_hz)
 {
-	/* 100 MHz */
-	vcpu->arch.count_hz = 100*1000*1000;
-	vcpu->arch.count_period = div_u64((u64)NSEC_PER_SEC << 32,
-					  vcpu->arch.count_hz);
+	vcpu->arch.count_hz = count_hz;
+	vcpu->arch.count_period = div_u64((u64)NSEC_PER_SEC << 32, count_hz);
 	vcpu->arch.count_dyn_bias = 0;
 
 	/* Starting at 0 */
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 476ece99bf3b..36561df8a7a7 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -372,9 +372,6 @@ struct kvm_vcpu *kvm_arch_vcpu_create(struct kvm *kvm, unsigned int id)
 	/* Init */
 	vcpu->arch.last_sched_cpu = -1;
 
-	/* Start off the timer */
-	kvm_mips_init_count(vcpu);
-
 	return vcpu;
 
 out_free_gebase:
diff --git a/arch/mips/kvm/trap_emul.c b/arch/mips/kvm/trap_emul.c
index 3a854bb9e606..0e3d260aafcb 100644
--- a/arch/mips/kvm/trap_emul.c
+++ b/arch/mips/kvm/trap_emul.c
@@ -565,6 +565,9 @@ static int kvm_trap_emul_vcpu_setup(struct kvm_vcpu *vcpu)
 	u32 config, config1;
 	int vcpu_id = vcpu->vcpu_id;
 
+	/* Start off the timer at 100 MHz */
+	kvm_mips_init_count(vcpu, 100*1000*1000);
+
 	/*
 	 * Arch specific stuff, set up config registers properly so that the
 	 * guest will come up as expected
-- 
git-series 0.8.10
