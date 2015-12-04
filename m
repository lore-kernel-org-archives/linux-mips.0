Received: from mailapp01.imgtec.com ([195.59.15.196]:35059 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007703AbbLDWZQLPMeY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Dec 2015 23:25:16 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: Minor EVA related unwind fixes
Date: Fri, 4 Dec 2015 22:25:00 +0000
Message-ID: <1449267902-28674-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, stable@vger.kernel.org
Message-ID: <20151204222500.o0lOYSWL1FJIcBqXdLMRu60sUh1gLE9fIqIDSKw_Zwg@z>

Here are a couple of minor EVA related stack unwind fixes, which
prevent the use of unwind_stack() (which unwinds using kallsyms
knowledge of where kernel functions begin and end) to unwind userland
code, particularly where the PC is a valid kernel address, which could
happen innocently with EVA due to the overlapped user/kernel address
spaces.

Note that unwind_stack() is defensive enough that it shouldn't do any
harm, so I've only tagged stable back to v3.15, when EVA was added and
it could conceivably happen under normal operation.

A rough audit shows no other uses of __kernel_text_address() in relation
to possibly user mode register contexts.


The first patch fixes unwind_stack() itself not to unwind through an
exception frame if it represents the user register context, preventing
itself being called with that context next.

The second patch fixes show_backtrace() to fall back to raw backtrace
for user mode register contexts, rather than using unwind_stack(). This
is used on certain faults which can be triggered by userland (namely
unaligned accesses when reporting is enabled in debugfs).


James Hogan (2):
  MIPS: Don't unwind to user mode with EVA
  MIPS: Avoid using unwind_stack() with usermode

 arch/mips/kernel/process.c | 2 +-
 arch/mips/kernel/traps.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org> # 3.15+
-- 
2.4.10
