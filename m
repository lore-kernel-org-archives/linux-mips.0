Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:41228 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993852AbeFVR4Evts6O (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Jun 2018 19:56:04 +0200
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH 0/3] MIPS: Fix arch_trigger_cpumask_backtrace(), clean up output
Date: Fri, 22 Jun 2018 10:55:44 -0700
Message-ID: <20180622175547.17716-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@mips.com>
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
Cc: Huacai Chen <chenhc@lemote.com>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Message-ID: <20180622175544.MG7p3voiQmewEB1OKoE8xm3wyCUG4WOeZxhvguTP1VI@z>

This series switches MIPS to use the generic
nmi_trigger_cpumask_backtrace() infrastructure to back
arch_trigger_cpumask_backtrace(), switching from synchronous to
asynchronous IPIs in the process in order to resolve possible deadlock
conditions. With the generic infrastructure in use we start using the
__cpuidle annotation to clean up its output for idle CPUs.

Applies cleanly atop master as of 894b8c000ae6 ("Merge tag
'for_v4.18-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs").

Thanks,
    Paul

Paul Burton (3):
  MIPS: Call dump_stack() from show_regs()
  MIPS: Use async IPIs for arch_trigger_cpumask_backtrace()
  MIPS: Annotate cpu_wait implementations with __cpuidle

 arch/mips/kernel/idle.c       | 12 +++++-----
 arch/mips/kernel/process.c    | 43 +++++++++++++++++++++++------------
 arch/mips/kernel/traps.c      |  1 +
 arch/mips/vr41xx/common/pmu.c |  3 ++-
 4 files changed, 38 insertions(+), 21 deletions(-)

-- 
2.17.1
