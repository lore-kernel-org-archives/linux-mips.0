Received: from mailapp01.imgtec.com ([195.59.15.196]:13255 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6825887AbaE2JRInsbLq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 May 2014 11:17:08 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 17/23] MIPS: KVM: Make kvm_mips_comparecount_{func,wakeup} static
Date: Thu, 29 May 2014 10:16:39 +0100
Message-ID: <1401355005-20370-18-git-send-email-james.hogan@imgtec.com>
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
Message-ID: <20140529091639.JoDhDCw-GDQv3hHpQh8tp90u3MBv7MM7Cdk9QqwHWhk@z>

The kvm_mips_comparecount_func() and kvm_mips_comparecount_wakeup()
functions are only used within arch/mips/kvm/kvm_mips.c, so make them
static.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: kvm@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Sanjay Lal <sanjayl@kymasys.com>
---
 arch/mips/kvm/kvm_mips.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/kvm_mips.c b/arch/mips/kvm/kvm_mips.c
index 1472b0b3d93b..a4d6cf96261a 100644
--- a/arch/mips/kvm/kvm_mips.c
+++ b/arch/mips/kvm/kvm_mips.c
@@ -984,7 +984,7 @@ int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 	return 0;
 }
 
-void kvm_mips_comparecount_func(unsigned long data)
+static void kvm_mips_comparecount_func(unsigned long data)
 {
 	struct kvm_vcpu *vcpu = (struct kvm_vcpu *)data;
 
@@ -999,7 +999,7 @@ void kvm_mips_comparecount_func(unsigned long data)
 /*
  * low level hrtimer wake routine.
  */
-enum hrtimer_restart kvm_mips_comparecount_wakeup(struct hrtimer *timer)
+static enum hrtimer_restart kvm_mips_comparecount_wakeup(struct hrtimer *timer)
 {
 	struct kvm_vcpu *vcpu;
 
-- 
1.9.3
