Received: from mailapp01.imgtec.com ([195.59.15.196]:28264 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007132AbcDVJje5Yenz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Apr 2016 11:39:34 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/5] MIPS: KVM: A few misc fixes
Date: Fri, 22 Apr 2016 10:38:44 +0100
Message-ID: <1461317929-4991-1-git-send-email-james.hogan@imgtec.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, kvm@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20160422093844.v-lMZvrp0mb99wziFjdtL9UGioIv_ZVKG94qz7Xvno8@z>

Here are a few misc fixes for KVM on MIPS, including 2 guest timer race
fixes, 2 preemption fixes, and missing hazard barriers after disabling
FPU.

James Hogan (5):
  MIPS: KVM: Fix timer IRQ race when freezing timer
  MIPS: KVM: Fix timer IRQ race when writing CP0_Compare
  MIPS: KVM: Fix preemptable kvm_mips_get_*_asid() calls
  MIPS: KVM: Fix preemption warning reading FPU capability
  MIPS: KVM: Add missing disable FPU hazard barriers

 arch/mips/include/asm/kvm_host.h |  2 +-
 arch/mips/kvm/emulate.c          | 89 ++++++++++++++++++++++------------------
 arch/mips/kvm/mips.c             |  8 +++-
 arch/mips/kvm/tlb.c              | 32 ++++++++++-----
 arch/mips/kvm/trap_emul.c        |  2 +-
 5 files changed, 79 insertions(+), 54 deletions(-)

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Cc: <stable@vger.kernel.org>
-- 
2.4.10
