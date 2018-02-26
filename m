Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:41190 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991025AbeBZRGUms4qO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Feb 2018 18:06:20 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 0/4] MIPS: Introduce isa-rev.h to define MIPS_ISA_REV
Date: Mon, 26 Feb 2018 17:02:41 +0000
Message-ID: <1519664565-10955-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org, "Maciej W. Rozycki" <macro@mips.com>, David Daney <david.daney@cavium.com>
Message-ID: <20180226170241.-MMpclpsEkIMd4VGbhpxoq2QTtCR3jqC3JJD7Ns2amw@z>

There are multiple instances in the kernel where we need to include or
exclude particular instructions based on the ISA revision of the target
processor. For MIPS32 / MIPS64, the compiler exports a __mips_isa_rev
define. However, when targeting MIPS I - V, this define is absent. This
leads to each use of __mips_isa_rev having to check that it is defined
first. To simplify this, this series introduces the isa-rev.h header
which always exports MIPS_ISA_REV (the name is changed so as to avoid
confusion with the compiler builtin and to avoid accidentally using the
builtin). All uses of __mips_isa_rev are then replaced with the new
define, removing the check that it is defined.

Applies on v4.16-rc1


Matt Redfearn (4):
  MIPS: Introduce isa-rev.h to define MIPS_ISA_REV
  MIPS: cpu-features.h: Replace __mips_isa_rev with MIPS_ISA_REV
  MIPS: BPF: Replace __mips_isa_rev with MIPS_ISA_REV
  MIPS: VDSO: Replace __mips_isa_rev with MIPS_ISA_REV

 arch/mips/include/asm/cpu-features.h |  5 +++--
 arch/mips/include/asm/isa-rev.h      | 24 ++++++++++++++++++++++++
 arch/mips/net/bpf_jit_asm.S          |  9 +++++----
 arch/mips/vdso/elf.S                 | 10 ++++------
 4 files changed, 36 insertions(+), 12 deletions(-)
 create mode 100644 arch/mips/include/asm/isa-rev.h

-- 
2.7.4
