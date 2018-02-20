Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:58509 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994673AbeBTKdPQ1k6l (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Feb 2018 11:33:15 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 0/2] MIPS: CONFIG_SMP_SINGLE_IPI
Date: Tue, 20 Feb 2018 10:32:21 +0000
Message-ID: <1519122743-4847-1-git-send-email-matt.redfearn@mips.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Ying Huang <ying.huang@intel.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@kernel.org>, Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
Message-ID: <20180220103221.TgR_965J1-dSt_q9nVaFSpPU0MenpeezWV-9Nj0E6_0@z>

This series adds a configuration option to allow MIPS kernels using
CONFIG_GENERIC_IRQ_IPI to use only a single IPI per CPU rather than the
usual 2. This allows these kernels to boot on hardware with insufficient
interrupts for the usual 2 / CPU.

It may also prove more flexible in allowing greater numbers of IPI
functions to be delivered without using up additional per CPU
interrupts. For example this mechanism may be extended to address the
potential for deadlock in arch_trigger_cpumask_backtrace recently
pointed out by Huacai Chen.


Matt Redfearn (2):
  MIPS: SMP: Group CONFIG_GENERIC_IRQ_IPI together
  MIPS: SMP: Introduce CONFIG_SMP_SINGLE_IPI

 arch/mips/Kconfig      |  11 +++++
 arch/mips/kernel/smp.c | 106 +++++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 110 insertions(+), 7 deletions(-)

-- 
2.7.4
