Received: from mailapp01.imgtec.com ([195.59.15.196]:33661 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006936AbbBXLqfoU7Ip (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Feb 2015 12:46:35 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: KVM: Fix trace event to save PC directly
Date: Tue, 24 Feb 2015 11:46:20 +0000
Message-ID: <1424778380-28036-1-git-send-email-james.hogan@imgtec.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: James Hogan <james.hogan@imgtec.com>, Gleb Natapov <gleb@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, linux-mips@linux-mips.org, kvm@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20150224114620.KpacxPDarhTmiUHesrrv5w2PcgNaGBAwtYRQa7MiOBw@z>

Currently the guest exit trace event saves the VCPU pointer to the
structure, and the guest PC is retrieved by dereferencing it when the
event is printed rather than directly from the trace record. This isn't
safe as the printing may occur long afterwards, after the PC has changed
and potentially after the VCPU has been freed. Usually this results in
the same (wrong) PC being printed for multiple trace events. It also
isn't portable as userland has no way to access the VCPU data structure
when interpreting the trace record itself.

Lets save the actual PC in the structure so that the correct value is
accessible later.

Fixes: 669e846e6c4e ("KVM/MIPS32: MIPS arch specific APIs for KVM")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Cc: <stable@vger.kernel.org> # v3.10+
---
 arch/mips/kvm/trace.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kvm/trace.h b/arch/mips/kvm/trace.h
index c1388d40663b..bd6437f67dc0 100644
--- a/arch/mips/kvm/trace.h
+++ b/arch/mips/kvm/trace.h
@@ -24,18 +24,18 @@ TRACE_EVENT(kvm_exit,
 	    TP_PROTO(struct kvm_vcpu *vcpu, unsigned int reason),
 	    TP_ARGS(vcpu, reason),
 	    TP_STRUCT__entry(
-			__field(struct kvm_vcpu *, vcpu)
+			__field(unsigned long, pc)
 			__field(unsigned int, reason)
 	    ),
 
 	    TP_fast_assign(
-			__entry->vcpu = vcpu;
+			__entry->pc = vcpu->arch.pc;
 			__entry->reason = reason;
 	    ),
 
 	    TP_printk("[%s]PC: 0x%08lx",
 		      kvm_mips_exit_types_str[__entry->reason],
-		      __entry->vcpu->arch.pc)
+		      __entry->pc)
 );
 
 #endif /* _TRACE_KVM_H */
-- 
2.0.5
