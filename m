Received: from mailapp01.imgtec.com ([195.59.15.196]:53542 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991984AbcITMDAXuVW6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Sep 2016 14:03:00 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/4] KVM: MIPS: SMP & TLB invalidation fixes
Date: Tue, 20 Sep 2016 13:02:26 +0100
Message-ID: <cover.b4aaacd5414bd20c4eb4d53417956b268d69d1af.1474372617.git-series.james.hogan@imgtec.com>
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
To: kvm@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20160920120226.IboNxNsaWJjKtIYmfE3rYnf4AwZ9d-tTKJ0IpPOrvDw@z>

This patchset primarily fixes MIPS KVM guest TLB invalidation on SMP
hosts (patch 1, for 4.8 and stable), and optimises this code a little
(patches 2-4, for 4.9).

The main fix effectively invalidates the guest's TLB on all other CPUs
by clearing their host ASIDs for this vCPU's guest kernel (and guest
user) mode. This happens whenever a change to the guest mappings takes
place, and is in addition to the TLB invalidation on the local CPU. This
ensures that upon their next execution of this vCPU that stale mappings
aren't used.

The rest of the patches convert the local invalidation to use clearing
of ASIDs too, makes that lazy for guest user mode mappings when the
guest ASID changes, and drops a dubious optimisation around guest ASID
changes. The use of ASID clearing is faster and doesn't flush TLB
entries from other address spaces, but does result in entries for guest
KSeg0 (which don't actually change) being invalidated too.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Cc: stable@vger.kernel.org

James Hogan (4):
  KVM: MIPS: Drop other CPU ASIDs on guest MMU changes
  KVM: MIPS: Split kernel/user ASID regeneration
  KVM: MIPS: Invalidate TLB by regenerating ASIDs
  KVM: MIPS: Drop dubious EntryHi optimisation

 arch/mips/include/asm/kvm_host.h |  3 +-
 arch/mips/kvm/emulate.c          | 78 +++++++++++++++++++++++++++------
 arch/mips/kvm/mips.c             | 30 +++++++++++++-
 arch/mips/kvm/mmu.c              | 16 ++++++-
 4 files changed, 111 insertions(+), 16 deletions(-)

-- 
git-series 0.8.10
