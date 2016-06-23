Received: from mailapp01.imgtec.com ([195.59.15.196]:47384 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27043838AbcFWQe5scaoz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Jun 2016 18:34:57 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 00/14] MIPS: KVM: Dynamically generate exception code
Date: Thu, 23 Jun 2016 17:34:33 +0100
Message-ID: <1466699687-24791-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20160623163433.hbE6mMeiqWbdAPgZQ-ZNxu3zuj7gBY-lBym8s5Tkknw@z>

These patches change the MIPS KVM exception entry code to be dynamically
assembled by the MIPS "uasm" in-kernel assembler, directly into unmapped
memory at run time by a new entry.c. Previously this code was statically
assembled from locore.S at build time and later copied into unmapped
memory at run time.

Patches 1-5 add support for the necessary instructions to uasm.

Patches 6-8 do the minimal-change conversion of locore.S to entry.c
using uasm (I've used -M10% so the diff is shown as a file move).

Patches 9-14 make some related improvements that are possible now that
it is dynamically generated, such as avoiding messy runtime conditionals
in assembly code, making use of KScratch registers when available, and
simplifying the initial GP register save sequence & jump to common code.

Ralf: Since the uasm patches (1-5) are needed for the later patches, I
suggest these all go together via the KVM tree (on which the whole
patchset is based), so Acks are welcome if they're okay with you.

James Hogan (14):
  MIPS: uasm: Add CFC1/CTC1 instructions
  MIPS: uasm: Add CFCMSA/CTCMSA instructions
  MIPS: uasm: Add DI instruction
  MIPS: uasm: Add MTHI/MTLO instructions
  MIPS: uasm: Add r6 MUL encoding

  MIPS; KVM: Convert exception entry to uasm
  MIPS: KVM: Add dumping of generated entry code
  MIPS: KVM: Drop now unused asm offsets

  MIPS: KVM: Omit FPU handling entry code if possible
  MIPS: KVM: Check MSA presence at uasm time
  MIPS: KVM: Drop redundant restore of DDATA_LO
  MIPS: KVM: Dynamically choose scratch registers
  MIPS: KVM: Relative branch to common exit handler
  MIPS: KVM: Save k0 straight into VCPU structure

 arch/mips/include/asm/kvm_host.h    |   9 +-
 arch/mips/include/asm/uasm.h        |   7 +
 arch/mips/include/uapi/asm/inst.h   |  71 ++-
 arch/mips/kernel/asm-offsets.c      |  66 ---
 arch/mips/kvm/Kconfig               |   1 +
 arch/mips/kvm/Makefile              |   2 +-
 arch/mips/kvm/{locore.S => entry.c} | 976 +++++++++++++++++++-----------------
 arch/mips/kvm/interrupt.h           |   4 -
 arch/mips/kvm/mips.c                |  66 ++-
 arch/mips/mm/uasm-micromips.c       |  13 +-
 arch/mips/mm/uasm-mips.c            |  11 +
 arch/mips/mm/uasm.c                 |  24 +-
 12 files changed, 695 insertions(+), 555 deletions(-)
 rename arch/mips/kvm/{locore.S => entry.c} (15%)

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Radim Krčmář <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
-- 
2.4.10
