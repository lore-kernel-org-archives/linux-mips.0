Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:33733 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990424AbeDTKXqQuZ1y (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 20 Apr 2018 12:23:46 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH v3 0/7] MIPS: perf: MT fixes and improvements
Date: Fri, 20 Apr 2018 11:23:02 +0100
Message-ID: <1524219789-31241-1-git-send-email-matt.redfearn@mips.com>
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
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Peter Zijlstra <peterz@infradead.org>, oprofile-list@lists.sf.net, Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Robert Richter <rric@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Kate Stewart <kstewart@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Maciej W. Rozycki" <macro@mips.com>, Namhyung Kim <namhyung@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
Message-ID: <20180420102302.9UI4rrI9DSYNl90HAdfoo2KpackjZBN_P-3YLoCeGRs@z>

This series addresses a few issues with how the MIPS performance
counters code supports the hardware multithreading MT ASE.

Firstly, implementations of the MT ASE may implement performance
counters
per core or per thread(TC). MIPS Techologies implementations signal this
via a bit in the implmentation specific CONFIG7 register. Since this
register is implementation specific, checking it should be guarded by a
PRID check. This also replaces a bit defined by a magic number.

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

Series applies to v4.16


Changes in v3:
New patch to detect feature presence in cpu-probe.c
Use flag in cpu_data set by cpu_probe.c to indicate feature presence.
- rebase on new feature detection

Changes in v2:
Fix mipsxx_pmu_enable_event for !#ifdef CONFIG_MIPS_MT_SMP
- Fix !#ifdef CONFIG_MIPS_PERF_SHARED_TC_COUNTERS build
- re-use cpuc variable in mipsxx_pmu_alloc_counter,
  mipsxx_pmu_free_counter rather than having sibling_ version.
Since BMIPS5000 does not implement per TC counters, we can remove the
check on cpu_has_mipsmt_pertccounters.
New patch to fix BMIPS5000 system mode perf.

Matt Redfearn (7):
  MIPS: Probe for MIPS MT perf counters per TC
  MIPS: perf: More robustly probe for the presence of per-tc counters
  MIPS: perf: Use correct VPE ID when setting up VPE tracing
  MIPS: perf: Fix perf with MT counting other threads
  MIPS: perf: Allocate per-core counters on demand
  MIPS: perf: Fold vpe_id() macro into it's one last usage
  MIPS: perf: Fix BMIPS5000 system mode counting

 arch/mips/include/asm/cpu-features.h |   7 ++
 arch/mips/include/asm/cpu.h          |   2 +
 arch/mips/include/asm/mipsregs.h     |   6 +
 arch/mips/kernel/cpu-probe.c         |  12 ++
 arch/mips/kernel/perf_event_mipsxx.c | 232 +++++++++++++++++++----------------
 arch/mips/oprofile/op_model_mipsxx.c |   2 -
 6 files changed, 150 insertions(+), 111 deletions(-)

-- 
2.7.4
