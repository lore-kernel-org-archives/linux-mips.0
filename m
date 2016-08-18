Received: from mailapp01.imgtec.com ([195.59.15.196]:54820 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993135AbcHRJCIaA2Qd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Aug 2016 11:02:08 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH BACKPORT 4.7 0/4] MIPS: KVM: Fix MMU/TLB management issues
Date: Thu, 18 Aug 2016 10:01:25 +0100
Message-ID: <cover.d02ea4d58713b53527649c3ad5487b32fd8df3cd.1471018462.git-series.james.hogan@imgtec.com>
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
Message-ID: <20160818090125.oijrqy3JTjl2pwtYQgbC_k7tn4eCaGEDz1ms9opjvbk@z>

These patches backport fixes for several issues in the management of
MIPS KVM TLB faults to v4.7.

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

 arch/mips/kvm/emulate.c | 40 +++++++++++++++++--------
 arch/mips/kvm/tlb.c     | 66 +++++++++++++++++++++++++++---------------
 2 files changed, 71 insertions(+), 35 deletions(-)

-- 
git-series 0.8.8
