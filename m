Received: from mailapp01.imgtec.com ([195.59.15.196]:15896 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011509AbbKKOVlJM4x0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Nov 2015 15:21:41 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/3] MIPS: KVM: Misc fixes
Date: Wed, 11 Nov 2015 14:21:17 +0000
Message-ID: <1447251680-5254-1-git-send-email-james.hogan@imgtec.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Gleb Natapov <gleb@kernel.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20151111142117.YS80kTx1kZJ2m3hqBz6rkdUucy7N7W6jDdWKxtjtXmg@z>

A few misc MIPS KVM fixes for issues that have been around since the
code was merged in v3.10.

James Hogan (3):
  MIPS: KVM: Fix ASID restoration logic
  MIPS: KVM: Fix CACHE immediate offset sign extension
  MIPS: KVM: Uninit VCPU in vcpu_create error path

 arch/mips/kvm/emulate.c |  2 +-
 arch/mips/kvm/locore.S  | 16 ++++++++++------
 arch/mips/kvm/mips.c    |  5 ++++-
 3 files changed, 15 insertions(+), 8 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Cc: <stable@vger.kernel.org>
-- 
2.4.10
