Received: from mailapp01.imgtec.com ([195.59.15.196]:9603 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6838764AbaFXRbrnX0aQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Jun 2014 19:31:47 +0200
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v3 7/9] MIPS: KVM: Fix memory leak on VCPU
Date: Tue, 24 Jun 2014 10:31:08 -0700
Message-ID: <1403631071-6012-8-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com>
References: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: pbonzini@redhat.com
Cc: gleb@kernel.org, kvm@vger.kernel.org, sanjayl@kymasys.com, james.hogan@imgtec.com, ralf@linux-mips.org, linux-mips@linux-mips.org, dengcheng.zhu@imgtec.com
Message-ID: <20140624173108.2aGYuF2wxlynsIBfMq6yPf9cDqv5MQlmmQx2TP5H3iE@z>

From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>

kvm_arch_vcpu_free() is called in 2 code paths:

1) kvm_vm_ioctl()
       kvm_vm_ioctl_create_vcpu()
           kvm_arch_vcpu_destroy()
               kvm_arch_vcpu_free()
2) kvm_put_kvm()
       kvm_destroy_vm()
           kvm_arch_destroy_vm()
               kvm_mips_free_vcpus()
                   kvm_arch_vcpu_free()

Neither of the paths handles VCPU free. We need to do it in
kvm_arch_vcpu_free() corresponding to the memory allocation in
kvm_arch_vcpu_create().

Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
---
Changes:
v3 - v2:
o Drop the merge of kvm_arch_vcpu_free() and pointer nullification.

 arch/mips/kvm/mips.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 3d53d34..7f7fd76 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -384,6 +384,7 @@ void kvm_arch_vcpu_free(struct kvm_vcpu *vcpu)
 
 	kfree(vcpu->arch.guest_ebase);
 	kfree(vcpu->arch.kseg0_commpage);
+	kfree(vcpu);
 }
 
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
-- 
1.8.5.3
