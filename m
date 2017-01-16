Received: from mailapp01.imgtec.com ([195.59.15.196]:37707 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993969AbdAPMt5p-Nhk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 16 Jan 2017 13:49:57 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 13/13] KVM: MIPS: Claim KVM_CAP_READONLY_MEM support
Date: Mon, 16 Jan 2017 12:49:34 +0000
Message-ID: <b69648587780233231c57e5c3c6ab8c10a4c81e8.1484570878.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.99eec1b2ac935212acbcf2effacaab95cf6cdbf1.1484570878.git-series.james.hogan@imgtec.com>
References: <cover.99eec1b2ac935212acbcf2effacaab95cf6cdbf1.1484570878.git-series.james.hogan@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org
Message-ID: <20170116124934.YETPWnXElaN09wk_XMGuF5QBP2VyoIINAKnKXb3PD1k@z>

Now that load/store faults due to read only memory regions are treated
as MMIO accesses it is safe to claim support for read only memory
regions (KVM_CAP_READONLY_MEM).

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/include/uapi/asm/kvm.h | 2 ++
 arch/mips/kvm/mips.c             | 1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/mips/include/uapi/asm/kvm.h b/arch/mips/include/uapi/asm/kvm.h
index 6985eb59b085..a8a0199bf760 100644
--- a/arch/mips/include/uapi/asm/kvm.h
+++ b/arch/mips/include/uapi/asm/kvm.h
@@ -19,6 +19,8 @@
  * Some parts derived from the x86 version of this file.
  */
 
+#define __KVM_HAVE_READONLY_MEM
+
 /*
  * for KVM_GET_REGS and KVM_SET_REGS
  *
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 425e4139742c..cf501a5a0dfe 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1222,6 +1222,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	switch (ext) {
 	case KVM_CAP_ONE_REG:
 	case KVM_CAP_ENABLE_CAP:
+	case KVM_CAP_READONLY_MEM:
 	case KVM_CAP_SYNC_MMU:
 		r = 1;
 		break;
-- 
git-series 0.8.10
