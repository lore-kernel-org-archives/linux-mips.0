Received: from mailapp01.imgtec.com ([195.59.15.196]:31137 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994790AbdCNK0BeTdIH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Mar 2017 11:26:01 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/8] KVM: MIPS: Add Cavium Octeon III support
Date: Tue, 14 Mar 2017 10:25:43 +0000
Message-ID: <cover.79b3feae3a98cb166c2d40a7bd4e854a5faedc89.1489486985.git-series.james.hogan@imgtec.com>
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
To: linux-mips@linux-mips.org, kvm@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Message-ID: <20170314102543.MV7tlzJg570VZOeAwMf2YDfYh2-NfI2pwLJKJMn7akM@z>

This series is based on my recent VZ series.
My hope is to take this series via the MIPS KVM tree for 4.12.

This series implements support for Cavium Octeon III CPUs in KVM
(primarily for VZ hardware, but trap & emulate should also work).

Patch 1 adds register accesses and definitions for the virtualization
related Cavium specific COP0 registers, which will be used by later
patches.

Patches 2-7 make various changes to allow KVM to work on Cavium Octeon
III, with Patch 5 doing the all important Cavium specific partitioning
of the TLB between root and guest and guest IRQ setup.

Finally patch 8 selects HAVE_KVM from CPU_CAVIUM_OCTEON to allow KVM to
be enabled.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <david.daney@cavium.com>
Cc: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org

James Hogan (8):
  MIPS: Add Octeon III register accessors & definitions
  KVM: MIPS/Emulate: Adapt T&E CACHE emulation for Octeon
  KVM: MIPS/TLB: Handle virtually tagged icaches
  KVM: MIPS/T&E: Report correct dcache line size
  KVM: MIPS/VZ: VZ hardware setup for Octeon III
  KVM: MIPS/VZ: Emulate hit CACHE ops for Octeon III
  KVM: MIPS/VZ: Handle Octeon III guest.PRid register
  MIPS: Allow KVM to be enabled on Octeon CPUs

 arch/mips/Kconfig                |   1 +-
 arch/mips/include/asm/mipsregs.h |  38 ++++++++-
 arch/mips/kvm/emulate.c          |  30 +++++-
 arch/mips/kvm/tlb.c              |  30 ++++++-
 arch/mips/kvm/trap_emul.c        |   8 ++-
 arch/mips/kvm/vz.c               | 150 +++++++++++++++++++++++++-------
 arch/mips/mm/cache.c             |   1 +-
 7 files changed, 225 insertions(+), 33 deletions(-)

-- 
git-series 0.8.10
