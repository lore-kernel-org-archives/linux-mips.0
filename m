Received: from mailapp01.imgtec.com ([195.59.15.196]:39701 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013952AbbLPXuMeHVj0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 Dec 2015 00:50:12 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 03/16] MIPS: Move definition of DC bit to mipsregs.h
Date: Wed, 16 Dec 2015 23:49:28 +0000
Message-ID: <1450309781-28030-4-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1450309781-28030-1-git-send-email-james.hogan@imgtec.com>
References: <1450309781-28030-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20151216234928.wW9ZEAXDX17QjrYBZ970cG33ydjwIMJDDjqpRlNJwpc@z>

The CAUSEB_DC and CAUSEF_DC definitions used by KVM are defined in
asm/kvm_host.h, but all the other Cause register field definitions are
found in asm/mipsregs.h.

Lets reunite the DC bit definitions with its friends in mipsregs.h.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/include/asm/kvm_host.h | 3 ---
 arch/mips/include/asm/mipsregs.h | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 17782205c5db..b14265d8d606 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -92,9 +92,6 @@
 #define KVM_INVALID_INST		0xdeadbeef
 #define KVM_INVALID_ADDR		0xdeadbeef
 
-#define CAUSEB_DC			27
-#define CAUSEF_DC			(_ULCAST_(1) << 27)
-
 extern atomic_t kvm_mips_instance;
 extern pfn_t(*kvm_mips_gfn_to_pfn) (struct kvm *kvm, gfn_t gfn);
 extern void (*kvm_mips_release_pfn_clean) (pfn_t pfn);
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index e43aca183c99..af36d2be4d0d 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -394,6 +394,8 @@
 #define CAUSEF_IV		(_ULCAST_(1)   << 23)
 #define CAUSEB_PCI		26
 #define CAUSEF_PCI		(_ULCAST_(1)   << 26)
+#define CAUSEB_DC		27
+#define CAUSEF_DC		(_ULCAST_(1)   << 27)
 #define CAUSEB_CE		28
 #define CAUSEF_CE		(_ULCAST_(3)   << 28)
 #define CAUSEB_TI		30
-- 
2.4.10
