Received: from mailapp01.imgtec.com ([195.59.15.196]:57351 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6862372AbaFXRbgK8TcI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Jun 2014 19:31:36 +0200
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v3 0/9] MIPS: KVM: Bugfixes and cleanups
Date: Tue, 24 Jun 2014 10:31:01 -0700
Message-ID: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: pbonzini@redhat.com
Cc: gleb@kernel.org, kvm@vger.kernel.org, sanjayl@kymasys.com, james.hogan@imgtec.com, ralf@linux-mips.org, linux-mips@linux-mips.org, dengcheng.zhu@imgtec.com
Message-ID: <20140624173101.6HJ--W56XI5rnWFDaGqIUqpXsAYen_kqiSYL20PK14c@z>

The patches are pretty straightforward.

Changes:
v3 - v2:
o In patch #2, change the use of kvm_[err|info|debug].
o In patch #3, add err removal in kvm_arch_commit_memory_region().
o In patch #3, revert the changes to kvm_arch_vm_ioctl().
o In patch #7, drop the merge of kvm_arch_vcpu_free() and pointer nullification.
o Add patch #9.
v2 - v1:
o In patch #1, don't change the opening comment mark for kernel-doc comments.
o In patch #1, to make long lines more readable, use local variables / macros.
o In patch #1, slight format adjustments are made.
o Use -M flag to generate patches (detect renames).
o Add patch #8.

Deng-Cheng Zhu (8):
  MIPS: KVM: Reformat code and comments
  MIPS: KVM: Use KVM internal logger
  MIPS: KVM: Simplify functions by removing redundancy
  MIPS: KVM: Remove unneeded volatile
  MIPS: KVM: Rename files to remove the prefix "kvm_" and "kvm_mips_"
  MIPS: KVM: Restore correct value for WIRED at TLB uninit
  MIPS: KVM: Fix memory leak on VCPU
  MIPS: KVM: Skip memory cleaning in kvm_mips_commpage_init()

James Hogan (1):
  MIPS: KVM: Remove dead code of TLB index error in
    kvm_mips_emul_tlbwr()

 arch/mips/include/asm/kvm_host.h                  |  12 +-
 arch/mips/include/asm/r4kcache.h                  |   3 +
 arch/mips/kvm/Makefile                            |   8 +-
 arch/mips/kvm/{kvm_cb.c => callback.c}            |   0
 arch/mips/kvm/commpage.c                          |  33 ++
 arch/mips/kvm/commpage.h                          |  24 +
 arch/mips/kvm/{kvm_mips_dyntrans.c => dyntrans.c} |  40 +-
 arch/mips/kvm/{kvm_mips_emul.c => emulate.c}      | 539 +++++++++++-----------
 arch/mips/kvm/{kvm_mips_int.c => interrupt.c}     |  47 +-
 arch/mips/kvm/{kvm_mips_int.h => interrupt.h}     |  22 +-
 arch/mips/kvm/kvm_mips_comm.h                     |  23 -
 arch/mips/kvm/kvm_mips_commpage.c                 |  37 --
 arch/mips/kvm/kvm_mips_opcode.h                   |  24 -
 arch/mips/kvm/{kvm_locore.S => locore.S}          |  55 ++-
 arch/mips/kvm/{kvm_mips.c => mips.c}              | 227 +++++----
 arch/mips/kvm/opcode.h                            |  22 +
 arch/mips/kvm/{kvm_mips_stats.c => stats.c}       |  28 +-
 arch/mips/kvm/{kvm_tlb.c => tlb.c}                | 258 +++++------
 arch/mips/kvm/trace.h                             |  18 +-
 arch/mips/kvm/{kvm_trap_emul.c => trap_emul.c}    | 109 +++--
 20 files changed, 750 insertions(+), 779 deletions(-)
 rename arch/mips/kvm/{kvm_cb.c => callback.c} (100%)
 create mode 100644 arch/mips/kvm/commpage.c
 create mode 100644 arch/mips/kvm/commpage.h
 rename arch/mips/kvm/{kvm_mips_dyntrans.c => dyntrans.c} (79%)
 rename arch/mips/kvm/{kvm_mips_emul.c => emulate.c} (83%)
 rename arch/mips/kvm/{kvm_mips_int.c => interrupt.c} (85%)
 rename arch/mips/kvm/{kvm_mips_int.h => interrupt.h} (74%)
 delete mode 100644 arch/mips/kvm/kvm_mips_comm.h
 delete mode 100644 arch/mips/kvm/kvm_mips_commpage.c
 delete mode 100644 arch/mips/kvm/kvm_mips_opcode.h
 rename arch/mips/kvm/{kvm_locore.S => locore.S} (93%)
 rename arch/mips/kvm/{kvm_mips.c => mips.c} (83%)
 create mode 100644 arch/mips/kvm/opcode.h
 rename arch/mips/kvm/{kvm_mips_stats.c => stats.c} (63%)
 rename arch/mips/kvm/{kvm_tlb.c => tlb.c} (78%)
 rename arch/mips/kvm/{kvm_trap_emul.c => trap_emul.c} (83%)

-- 
1.8.5.3
