Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:37642 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993497AbeDCMcOBYV6w (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Apr 2018 14:32:14 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 0/5] MIPS: perf: MT fixes and improvements
Date: Tue, 3 Apr 2018 13:31:26 +0100
Message-ID: <1522758691-17003-1-git-send-email-matt.redfearn@mips.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Namhyung Kim <namhyung@kernel.org>, "Maciej W. Rozycki" <macro@mips.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
Message-ID: <20180403123126.8VredIZY7f8sHOO5vPaA5Ac_Xz1RbihQLGYxRH_NXW8@z>

This series addresses a few issues with how the MIPS performance
counters code supports the hardware multithreading MT ASE.
Firstly, implementations of the MT ASE may implement performance counters
per core or per thread(TC). MIPS Techologies & BMIPS5000 implementations
signal this via a bit in the implmentation specific CONFIG7 register.
Since this register is implementation specific, checking it should be
guarded by a PRID check. This also replaces a bit defined by a magic
number.

Secondly, the code currently uses vpe_id(), defined as
smp_processor_id(), divided by 2, to share core performance counters
between VPEs. This relies on a couple of assumptions of the hardware
implementation to function correctly (always 2 VPEs per core, and the
hardware reading only the least significant bit).

Finally, the method of sharing core performance counters between VPEs is
suboptimal since it does not allow one process running on a VPE to use
all of the performance counters available to it, because the kernel will
reserve half of the coutners for the other VPE even if it may never use
them. This reservation at counter probe is replaced with an allocation
on use strategy.

Tested on a MIPS Creator CI40 (2C2T MIPS InterAptiv with per-TC
counters, though for the purposes of testing the per-TC availability was
hardcoded to allow testing both paths).

Series applies to v4.16-rc7



Matt Redfearn (5):
  MIPS: perf: More robustly probe for the presence of per-tc counters
  MIPS: perf: Use correct VPE ID when setting up VPE tracing
  MIPS: perf: Fix perf with MT counting other threads
  MIPS: perf: Allocate per-core counters on demand
  MIPS: perf: Fold vpe_id() macro into it's one last usage

 arch/mips/include/asm/mipsregs.h     |  10 ++
 arch/mips/kernel/perf_event_mipsxx.c | 257 +++++++++++++++++++++--------------
 2 files changed, 162 insertions(+), 105 deletions(-)

-- 
2.7.4
