Received: from mailapp01.imgtec.com ([195.59.15.196]:31037 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992236AbdB1PjJS1m5K (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Feb 2017 16:39:09 +0100
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 0/4] MIPS: Further microMIPS stack unwinding fixes
Date: Tue, 28 Feb 2017 15:37:54 +0000
Message-ID: <1488296279-23057-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Huacai Chen <chenhc@lemote.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Andrew Morton <akpm@linux-foundation.org>, "Maciej W. Rozycki" <macro@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170228153754.betz-8VdV1xTPnGLpEK66S3YmK_AKykbV-mAo0JRFHw@z>

4.11 includes a bunch of stack unwinding fixes for microMIPS, but some
of those fixes require additional fixup, provided by this series.
These patches have been tested on qemu M14Kc micromips and tested for
regression on ci40, Boston, Octeon III & malta.

This series is based on mips-for-linux-next

Matt Redfearn (4):
  MIPS: Handle non word sized instructions when examining frame
  MIPS: microMIPS: Fix decoding of addiusp instruction
  MIPS: Stacktrace: Fix __usermode() of uninitialised regs
  MIPS: microMIPS: Fix decoding of swsp16 instruction

 arch/mips/include/asm/stacktrace.h |  3 +++
 arch/mips/include/uapi/asm/inst.h  |  2 +-
 arch/mips/kernel/process.c         | 14 ++++++++++----
 3 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.7.4
