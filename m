Received: from mailapp01.imgtec.com ([195.89.28.114]:20354 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6834684AbaDYPUkL2O0z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 25 Apr 2014 17:20:40 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 04/21] MIPS: KVM: Fix CP0_EBASE KVM register id
Date: Fri, 25 Apr 2014 16:19:47 +0100
Message-ID: <1398439204-26171-5-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1398439204-26171-1-git-send-email-james.hogan@imgtec.com>
References: <1398439204-26171-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>, Sanjay Lal <sanjayl@kymasys.com>
Message-ID: <20140425151947.7bMfrWPI11EDXmjVDZ63-FLMMg6XN2Zyu5Xfwr-iHEQ@z>

KVM_REG_MIPS_CP0_EBASE is defined as 64bit, but is a 32bit register even
in MIPS64, so fix the definition.

Note, this definition isn't actually used yet, so it didn't cause any
problems.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: kvm@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: David Daney <david.daney@cavium.com>
Cc: Sanjay Lal <sanjayl@kymasys.com>
---
 arch/mips/kvm/kvm_mips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/kvm_mips.c b/arch/mips/kvm/kvm_mips.c
index 14511138f187..46cea0bad518 100644
--- a/arch/mips/kvm/kvm_mips.c
+++ b/arch/mips/kvm/kvm_mips.c
@@ -512,7 +512,7 @@ kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 #define KVM_REG_MIPS_CP0_COMPARE	MIPS_CP0_32(11, 0)
 #define KVM_REG_MIPS_CP0_STATUS		MIPS_CP0_32(12, 0)
 #define KVM_REG_MIPS_CP0_CAUSE		MIPS_CP0_32(13, 0)
-#define KVM_REG_MIPS_CP0_EBASE		MIPS_CP0_64(15, 1)
+#define KVM_REG_MIPS_CP0_EBASE		MIPS_CP0_32(15, 1)
 #define KVM_REG_MIPS_CP0_CONFIG		MIPS_CP0_32(16, 0)
 #define KVM_REG_MIPS_CP0_CONFIG1	MIPS_CP0_32(16, 1)
 #define KVM_REG_MIPS_CP0_CONFIG2	MIPS_CP0_32(16, 2)
-- 
1.8.1.2
