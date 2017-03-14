Received: from mailapp01.imgtec.com ([195.59.15.196]:37368 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993939AbdCNRAUTr52E (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Mar 2017 18:00:20 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] KVM: MIPS/Emulate: TLBWR & TLBR fixes for T&E
Date: Tue, 14 Mar 2017 17:00:06 +0000
Message-ID: <cover.57583f73c169e83d499329fbda19909b816c0024.1489510483.git-series.james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20170314170006.fjYp-JiM9weUn-UpHWUjiy_I7vGSS9dfMr20k9CGNBU@z>

These two patches fix TLBWR and TLBR instruction emulation for Trap &
Emulate guests, so that wired entries are properly preserved and so that
the entries can be read back by the guest itself.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Cc: stable@vger.kernel.org

James Hogan (2):
  KVM: MIPS/Emulate: Fix TLBWR with wired for T&E
  KVM: MIPS/Emulate: Properly implement TLBR for T&E

 arch/mips/kvm/emulate.c | 103 ++++++++++++++++++++++-------------------
 1 file changed, 56 insertions(+), 47 deletions(-)

-- 
git-series 0.8.10
