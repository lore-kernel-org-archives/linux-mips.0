Received: from mailapp01.imgtec.com ([195.89.28.114]:5134 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6843041AbaDYPUn5VoHy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 25 Apr 2014 17:20:43 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 16/21] MIPS: KVM: Make kvm_mips_comparecount_{func,wakeup} static
Date: Fri, 25 Apr 2014 16:19:59 +0100
Message-ID: <1398439204-26171-17-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Sanjay Lal <sanjayl@kymasys.com>
Message-ID: <20140425151959.qZYeZPGtekNt0nHKVIe9rsHLgDh4uVdCZMIb0uyt1tc@z>

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
index cbb3cdca2878..0cf03efe8a57 100644
--- a/arch/mips/kvm/kvm_mips.c
+++ b/arch/mips/kvm/kvm_mips.c
@@ -973,7 +973,7 @@ int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 	return 0;
 }
 
-void kvm_mips_comparecount_func(unsigned long data)
+static void kvm_mips_comparecount_func(unsigned long data)
 {
 	struct kvm_vcpu *vcpu = (struct kvm_vcpu *)data;
 
@@ -988,7 +988,7 @@ void kvm_mips_comparecount_func(unsigned long data)
 /*
  * low level hrtimer wake routine.
  */
-enum hrtimer_restart kvm_mips_comparecount_wakeup(struct hrtimer *timer)
+static enum hrtimer_restart kvm_mips_comparecount_wakeup(struct hrtimer *timer)
 {
 	struct kvm_vcpu *vcpu;
 
-- 
1.8.1.2
