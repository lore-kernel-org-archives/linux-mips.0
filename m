Received: from mailapp01.imgtec.com ([195.59.15.196]:41779 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009415AbaIVNdOctRyQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 22 Sep 2014 15:33:14 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/2] Minor MIPS ftrace fixes
Date: Mon, 22 Sep 2014 14:32:57 +0100
Message-ID: <1411392779-9554-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Message-ID: <20140922133257.E4mSI_VY5ZTbff-ec-wMDVsdBA0PeXcbrRpsP_78ep4@z>

Hi,

A few more fixes for ftrace/MIPS. The first patch fixes the
value of the MCOUNT_INSN_SIZE definition which holds the
total size of the mcount() call. The second one, fixes
the selfpc argument for the ftrace tracing function.

Markos Chandras (2):
  MIPS: ftrace.h: Fix the MCOUNT_INSN_SIZE definition
  MIPS: mcount: Fix selfpc address for static trace

 arch/mips/include/asm/ftrace.h | 2 +-
 arch/mips/kernel/ftrace.c      | 4 +++-
 arch/mips/kernel/mcount.S      | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.1.0
