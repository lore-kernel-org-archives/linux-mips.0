Received: from mailapp01.imgtec.com ([195.59.15.196]:29073 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993892AbdCBJhj6aL3t (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Mar 2017 10:37:39 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 21/32] KVM: MIPS/Emulate: Drop CACHE emulation for VZ
Date: Thu, 2 Mar 2017 09:36:48 +0000
Message-ID: <4f7b200564d7f1b417d5e9060e76725a5a20423a.1488447004.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.5cfb5298ebc2f5308f4f56aaac7fa31c39a8ab58.1488447004.git-series.james.hogan@imgtec.com>
References: <cover.5cfb5298ebc2f5308f4f56aaac7fa31c39a8ab58.1488447004.git-series.james.hogan@imgtec.com>
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
Message-ID: <20170302093648.1CdPj2MmZOkClSWxNsX-NT0VMaRiJIKCUR_qrp7wLWE@z>

Ifdef out the trap & emulate CACHE instruction emulation functions for
VZ. We will provide separate CACHE instruction emulation in vz.c, and we
need to avoid linker errors due to the use of T&E specific MMU helpers.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/emulate.c | 2 ++
 1 file changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 42424822898c..bb0449296cd6 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -1665,6 +1665,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 	return EMULATE_DO_MMIO;
 }
 
+#ifndef CONFIG_KVM_MIPS_VZ
 static enum emulation_result kvm_mips_guest_cache_op(int (*fn)(unsigned long),
 						     unsigned long curr_pc,
 						     unsigned long addr,
@@ -1872,6 +1873,7 @@ enum emulation_result kvm_mips_emulate_inst(u32 cause, u32 *opc,
 
 	return er;
 }
+#endif /* CONFIG_KVM_MIPS_VZ */
 
 /**
  * kvm_mips_guest_exception_base() - Find guest exception vector base address.
-- 
git-series 0.8.10
