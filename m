Received: from mailapp01.imgtec.com ([195.59.15.196]:19695 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993187AbcHRJXXY5aUN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Aug 2016 11:23:23 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH BACKPORT 3.10-3.15 0/4] MIPS: KVM: Fix MMU/TLB management issues
Date: Thu, 18 Aug 2016 10:22:51 +0100
Message-ID: <cover.04bc2e89e693aeb69bf6e36d1d7b18ffb591bd31.1471021142.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
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
To: stable@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20160818092251.7nlKiDsyf5uTDVPpxvcEWmgA7bw2aWwmgVkODj4zzos@z>

These patches backport fixes for several issues in the management of
MIPS KVM TLB faults to 3.15, and should apply back to 3.10 too.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Cc: <stable@vger.kernel.org>

James Hogan (4):
  MIPS: KVM: Fix mapped fault broken commpage handling
  MIPS: KVM: Add missing gfn range check
  MIPS: KVM: Fix gfn range check in kseg0 tlb faults
  MIPS: KVM: Propagate kseg0/mapped tlb fault errors

 arch/mips/kvm/kvm_mips_emul.c | 33 +++++++++++++------
 arch/mips/kvm/kvm_tlb.c       | 61 ++++++++++++++++++++++++------------
 2 files changed, 66 insertions(+), 28 deletions(-)

-- 
git-series 0.8.8
