Received: from mailapp01.imgtec.com ([195.59.15.196]:33121 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993008AbcJTNwzIKBER (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Oct 2016 15:52:55 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [GIT PULL] MIPS KVM fix for v4.9-rc2
Date: Thu, 20 Oct 2016 14:52:33 +0100
Message-ID: <1476971554-1215-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20161020135233.KxTdaXKyZ0wBsfmme_21BqCV-e01xrLaOIWzzljwF1U@z>

Hi Radim, Paolo,

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/kvm-mips.git tags/kvm_mips_4.9_2

for you to fetch changes up to d852b5f35e84e60c930589eeb14a6df21ea9b1cb:

  KVM: MIPS: Add missing uaccess.h include (2016-10-19 00:37:05 +0100)

I'd already based this on v4.9-rc1 rather than the kvm next branch which
isn't up to v4.9-rc1 yet. If thats a problem I can easily rebase, or
feel free to apply the patch directly.

Cheers
James

----------------------------------------------------------------
MIPS KVM fix for v4.9-rc2

- Fix build error introduced during the 4.9 merge window when
  tracepoints are disabled.

----------------------------------------------------------------
James Hogan (1):
      KVM: MIPS: Add missing uaccess.h include

 arch/mips/kvm/mips.c | 1 +
 1 file changed, 1 insertion(+)

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
-- 
2.7.3
