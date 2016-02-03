Received: from mailapp01.imgtec.com ([195.59.15.196]:33263 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007574AbcBCD1BgZdBQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 04:27:01 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/3] Imagination Technologies MIPS P6600 CPU Support
Date: Wed, 3 Feb 2016 03:26:36 +0000
Message-ID: <1454469999-17818-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Peter Zijlstra <peterz@infradead.org>, Joshua Kinard <kumba@gentoo.org>, "Maciej W. Rozycki" <macro@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Ingo Molnar <mingo@redhat.com>, Markos Chandras <markos.chandras@imgtec.com>, Petri Gynther <pgynther@google.com>
Message-ID: <20160203032636.buQkc4q6Rqf1V_tv898zlw2-2JIP7bnP4A1Ffwja5UE@z>

This series introduces support for probing the Imagination Technologies
P6600 CPU, a high end multi-core out-of-order MIPS64r6 CPU with features
such as SIMD & hardware supported virtualization.

We already have support in place for the required CM/CPS features so
this simply adds the PRID, probes for it & adds various switch cases.

Paul Burton (3):
  MIPS: Add P6600 PRID & cpu_type_enum values
  MIPS: Add P6600 cases to CPU switch statements
  MIPS: Probe the P6600 core

 arch/mips/include/asm/cpu-type.h     | 1 +
 arch/mips/include/asm/cpu.h          | 3 ++-
 arch/mips/kernel/cpu-probe.c         | 5 +++++
 arch/mips/kernel/perf_event_mipsxx.c | 6 ++++++
 arch/mips/kernel/spram.c             | 1 +
 arch/mips/kernel/traps.c             | 1 +
 arch/mips/mm/c-r4k.c                 | 1 +
 arch/mips/mm/sc-mips.c               | 1 +
 8 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.7.0
