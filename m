Received: from mailapp01.imgtec.com ([195.59.15.196]:21266 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008441AbbIYQABa0sti (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 25 Sep 2015 18:00:01 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 0/3] MAAR SMP fix
Date: Fri, 25 Sep 2015 08:59:35 -0700
Message-ID: <1443196778-5528-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, Rusty Russell <rusty@rustcorp.com.au>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Bjorn Helgaas <bhelgaas@google.com>, David Hildenbrand <dahi@linux.vnet.ibm.com>, Andrew Bresticker <abrestic@chromium.org>, linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Hemmo Nieminen <hemmo.nieminen@iki.fi>, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ingo Molnar <mingo@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>
Message-ID: <20150925155935.M3LimGwpxFfO9s1KqtZrSqV60uyQ6OXXPMIO238WJkc@z>

This series improves support for Memory Accessibility Attribute
Registers (MAARs) by printing their configuration during boot and by
applying the configuration to secondary CPUs, which have their own
independent MAAR state.

Paul Burton (3):
  MIPS: mm: compile maar_init unconditionally
  MIPS: print MAAR configuration during boot
  MIPS: initialise MAARs on secondary CPUs

 arch/mips/include/asm/maar.h |   9 +++
 arch/mips/kernel/smp.c       |   2 +
 arch/mips/mm/init.c          | 177 ++++++++++++++++++++++++++++---------------
 3 files changed, 125 insertions(+), 63 deletions(-)

-- 
2.5.3
