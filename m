Received: from mailapp01.imgtec.com ([195.59.15.196]:59519 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012464AbbBJKDYAALMN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 10 Feb 2015 11:03:24 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: Export functions used by lose_fpu(1) for KVM
Date: Tue, 10 Feb 2015 10:02:58 +0000
Message-ID: <1423562580-23254-1-git-send-email-james.hogan@imgtec.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20150210100258.vd_D3b5KThtfo3f-A8D_PixidiGDYMNJ0j50BRzKxvM@z>

These two patches export the _save_fp and _save_msa asm function used by
the lose_fpu(1) macro to GPL modules so that KVM can make use of it when
it is built as a module.

This fixes the following build errors when CONFIG_KVM=m [and
CONFIG_CPU_HAS_MSA=y] due to commit f798217dfd03 ("KVM: MIPS: Don't leak
FPU/DSP to guest"):

ERROR: "_save_fp" [arch/mips/kvm/kvm.ko] undefined!
ERROR: "_save_msa" [arch/mips/kvm/kvm.ko] undefined!

The two parts are separated because the commit they fix is marked for
stable, and _save_msa only exists since v3.15, so only the first patch
needs to be applied to stable branches v3.10..v3.14, but both will be
needed on stable branches v3.15..v3.19.

Ralf: Since the broken commit exists in the KVM tree, it probably makes
sense to be applied there, so an Ack would be appreciated.

Fixes: f798217dfd03 (KVM: MIPS: Don't leak FPU/DSP to guest)
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: kvm@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org>

James Hogan (2):
  MIPS: Export FP functions used by lose_fpu(1) for KVM
  MIPS: Export MSA functions used by lose_fpu(1) for KVM

 arch/mips/kernel/mips_ksyms.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.0.5
