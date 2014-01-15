Received: from multi.imgtec.com ([194.200.65.239]:9543 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827313AbaAOKMFBkyyd (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 15 Jan 2014 11:12:05 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: KVM: fixes for KVM on ProAptiv cores
Date: Wed, 15 Jan 2014 10:11:20 +0000
Message-ID: <1389780682-32638-1-git-send-email-james.hogan@imgtec.com>
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
To: John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Gleb Natapov <gleb@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>, Sanjay Lal <sanjayl@kymasys.com>
Message-ID: <20140115101120.cFwN65Okj6r5dtqDTrcK6Dn9is-jtWk8bdFSSGLy0Do@z>

ProAptiv support includes support for EHINV (TLB invalidation) and FTLB
(large fixed page size TLBs), both of which cause problems when combined
with KVM. These two patches fix those problems.

These are based on John Crispin's mips-next-3.14 branch where ProAptiv
support is applied. Please consider applying these for v3.14 too.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: Gleb Natapov <gleb@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: Sanjay Lal <sanjayl@kymasys.com>

James Hogan (2):
  MIPS: KVM: use common EHINV aware UNIQUE_ENTRYHI
  MIPS: KVM: remove shadow_tlb code

 arch/mips/include/asm/kvm_host.h |   7 --
 arch/mips/kvm/kvm_mips.c         |   1 -
 arch/mips/kvm/kvm_tlb.c          | 134 +--------------------------------------
 3 files changed, 1 insertion(+), 141 deletions(-)

-- 
1.8.1.2
