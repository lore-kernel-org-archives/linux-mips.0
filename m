Received: from mailapp01.imgtec.com ([195.59.15.196]:38969 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992143AbdBAOTjtfnkg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 1 Feb 2017 15:19:39 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/5] KVM: MIPS/T&E: Miscellaneous improvements
Date: Wed, 1 Feb 2017 14:19:22 +0000
Message-ID: <cover.7aeb0f08d03b5d18b5332cdb1b38a8f057d310ac.1485958267.git-series.james.hogan@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org
Message-ID: <20170201141922.iYQy98FVA7nsZY5PT2d2DvkWNQKqllxc2wP2eOPDOeE@z>

Note: My intention is to take this series via the MIPS KVM tree. This
series is based on the following recent series (which is itself based on
others):
[0/13] KVM: MIPS: Dirty logging, SYNC_MMU & READONLY_MEM

This series contains some miscellaneous MIPS KVM trap & emulate
improvements:

 - Patch 1 moves all Cop0 registers out of the generic mips.c one_reg
   handling into trap_emul.c, to allow for upcoming patches to implement
   them slightly differently for VZ.

 - Patches 2 & 3 implement the CP0_EBase register and default BEV state
   more accurately.

 - Patches 4 & 5 expose EntryLo0/EntryLo1/IntCtl registers via the
   one_reg API.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org

James Hogan (5):
  KVM: MIPS/T&E: Move CP0 register access into T&E
  KVM: MIPS/T&E: Implement CP0_EBase register
  KVM: MIPS/T&E: Default to reset vector
  KVM: MIPS/T&E: Expose CP0_EntryLo0/1 registers
  KVM: MIPS/T&E: Expose read-only CP0_IntCtl register

 Documentation/virtual/kvm/api.txt |  10 +-
 arch/mips/include/asm/kvm_host.h  |   7 +-
 arch/mips/kvm/emulate.c           |  75 ++++++-----
 arch/mips/kvm/interrupt.c         |   5 +-
 arch/mips/kvm/mips.c              | 198 +----------------------------
 arch/mips/kvm/trap_emul.c         | 220 ++++++++++++++++++++++++++++++-
 6 files changed, 279 insertions(+), 236 deletions(-)

-- 
git-series 0.8.10
