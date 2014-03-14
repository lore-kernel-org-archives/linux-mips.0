Received: from mailapp01.imgtec.com ([195.89.28.115]:60807 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6817059AbaCNNG01qqdi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 14 Mar 2014 14:06:26 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/4] MIPS: KVM: RI + RDHWR handling fixes
Date: Fri, 14 Mar 2014 13:06:06 +0000
Message-ID: <1394802370-20487-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, Gleb Natapov <gleb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Hogan <james.hogan@imgtec.com>, Sanjay Lal <sanjayl@kymasys.com>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20140314130606.UybjMgUgImdN_teUNl-JuoNcn8RJNtKPG9kwC9PwlTw@z>

Some misc KVM RI/RDHWR handling fixes.

Patch 1 prevents a reserved instruction (RI) exception from taking out
the entire guest (e.g. crashme inevitably causes lots of these). If the
hypervisor can't handle the RI, it can just emulate a guest RI exception
instead so the guest OS can handle it. I've marked this one for stable
since it allows guest userland to take out the VM.

Patch 3 fixes the RDHWR emulation to actually consult HWREna so that the
guest can catch exceptions of implemented RDHWR if it desires. I've not
marked this for stable since Linux at least enables the hardware
registers with HWREna anyway.

Patch 2 and 4 are cleanups that I noticed while writing patch 3.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sanjay Lal <sanjayl@kymasys.com>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org

James Hogan (4):
  MIPS: KVM: Pass reserved instruction exceptions to guest
  MIPS: KVM: asm/kvm_host.h: Clean up whitespace
  MIPS: KVM: Consult HWREna before emulating RDHWR
  MIPS: KVM: Remove dead code in CP0 emulation

 arch/mips/include/asm/kvm_host.h | 417 ++++++++++++++++++++-------------------
 arch/mips/kvm/kvm_mips_emul.c    |  40 ++--
 2 files changed, 229 insertions(+), 228 deletions(-)

-- 
1.8.1.2
