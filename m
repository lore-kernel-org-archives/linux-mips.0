Received: from mailapp01.imgtec.com ([195.59.15.196]:17961 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993010AbdACRnYj0SiT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Jan 2017 18:43:24 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] KVM: MIPS: Misc fixes for 4.10
Date: Tue, 3 Jan 2017 17:42:59 +0000
Message-ID: <cover.cdddb6fe1a787c96c57358e404931f87f547e5e5.1483464823.git-series.james.hogan@imgtec.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org, stable@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20170103174259.fOL6CmxzoKTWUkhaFFRQsNEs9KHLgteFr6bGKRNGvqU@z>

This series contains a couple of 4.10 fixes.

- Patch 1 fixes when KVM is used by a 64-bit (n64) userland program,
  which can result in a kernel crash when a signal is delivered on the
  way back out from the guest.

- Patch 2 fixes flushing of the entry code from the icache to take place
  on all CPUs rather than only the local one.

Both are tagged for stable.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org

James Hogan (2):
  KVM: MIPS: Don't clobber CP0_Status.UX
  KVM: MIPS: Flush KVM entry code from icache globally

 arch/mips/kvm/entry.c | 5 ++++-
 arch/mips/kvm/mips.c  | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
git-series 0.8.10
