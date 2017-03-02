Received: from mailapp01.imgtec.com ([195.59.15.196]:3159 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993875AbdCBJh1Fa62t (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Mar 2017 10:37:27 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 6/32] MIPS: asm/tlb.h: Add UNIQUE_GUEST_ENTRYHI() macro
Date: Thu, 2 Mar 2017 09:36:33 +0000
Message-ID: <d2d652b734391a9eb66e9a6e0390c16075854891.1488447004.git-series.james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
Message-ID: <20170302093633.NkUqGQaoUEinAljG-AcJ-xHoVeisSB8NraNosTHq6F0@z>

Add a distinct UNIQUE_GUEST_ENTRYHI() macro for invalidation of guest
TLB entries by KVM, using addresses in KSeg1 rather than KSeg0. This
avoids conflicts with guest invalidation routines when there is no EHINV
bit to mark the whole entry as invalid, avoiding guest machine check
exceptions on Cavium Octeon III.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/include/asm/tlb.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/tlb.h b/arch/mips/include/asm/tlb.h
index dd179fd8acda..939734de4359 100644
--- a/arch/mips/include/asm/tlb.h
+++ b/arch/mips/include/asm/tlb.h
@@ -21,9 +21,11 @@
  */
 #define tlb_flush(tlb) flush_tlb_mm((tlb)->mm)
 
-#define UNIQUE_ENTRYHI(idx)						\
-		((CKSEG0 + ((idx) << (PAGE_SHIFT + 1))) |		\
+#define _UNIQUE_ENTRYHI(base, idx)					\
+		(((base) + ((idx) << (PAGE_SHIFT + 1))) |		\
 		 (cpu_has_tlbinv ? MIPS_ENTRYHI_EHINV : 0))
+#define UNIQUE_ENTRYHI(idx)		_UNIQUE_ENTRYHI(CKSEG0, idx)
+#define UNIQUE_GUEST_ENTRYHI(idx)	_UNIQUE_ENTRYHI(CKSEG1, idx)
 
 static inline unsigned int num_wired_entries(void)
 {
-- 
git-series 0.8.10
