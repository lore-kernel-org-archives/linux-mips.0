Received: from mailapp01.imgtec.com ([195.59.15.196]:16113 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010430AbbGHO0MFd2mn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 8 Jul 2015 16:26:12 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH stable <3.17] MIPS: KVM: Do not sign extend on unsigned MMIO load
Date: Wed, 8 Jul 2015 15:25:07 +0100
Message-ID: <1436365507-22596-1-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <20150619191409.GA12700@kroah.com>
References: <20150619191409.GA12700@kroah.com>
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
To: Greg KH <greg@kroah.com>
Cc: Nicholas Mc Guire <hofrat@osadl.org>, Gleb Natapov <gleb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, stable@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20150708142507.UlMgjiqjYczP9CE5tUw0p2JQRQsQ-B-Cb8I5dAjZhak@z>

From: Nicholas Mc Guire <hofrat@osadl.org>

commit ed9244e6c534612d2b5ae47feab2f55a0d4b4ced upstream.

Fix possible unintended sign extension in unsigned MMIO loads by casting
to uint16_t in the case of mmio_needed != 2.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
Reviewed-by: James Hogan <james.hogan@imgtec.com>
Tested-by: James Hogan <james.hogan@imgtec.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
Patchwork: https://patchwork.linux-mips.org/patch/9985/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Cc: <stable@vger.kernel.org> # v3.10+
Signed-off-by: James Hogan <james.hogan@imgtec.com>
---
This is a trivial backport (i.e. git cherry-pick, git format-patch) for
stable branches before v3.17, due to the commit d7d5b05faf16 ("MIPS:
KVM: Rename files to remove the prefix "kvm_" and "kvm_mips_"") which
renamed a bunch of files including this one.
---
 arch/mips/kvm/kvm_mips_emul.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/kvm_mips_emul.c b/arch/mips/kvm/kvm_mips_emul.c
index e75ef8219caf..c76f297b7149 100644
--- a/arch/mips/kvm/kvm_mips_emul.c
+++ b/arch/mips/kvm/kvm_mips_emul.c
@@ -1626,7 +1626,7 @@ kvm_mips_complete_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		if (vcpu->mmio_needed == 2)
 			*gpr = *(int16_t *) run->mmio.data;
 		else
-			*gpr = *(int16_t *) run->mmio.data;
+			*gpr = *(uint16_t *)run->mmio.data;
 
 		break;
 	case 1:
-- 
2.3.6
