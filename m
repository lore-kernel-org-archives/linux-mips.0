Received: from mailapp01.imgtec.com ([195.59.15.196]:34160 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991964AbcKGPHn0vFGw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 16:07:43 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/6] MIPS: microMIPS stack unwinding fixes
Date: Mon, 7 Nov 2016 15:07:01 +0000
Message-ID: <20161107150707.5079-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161107150701.qjp-siEfhOpIfH-ECl2Ev7ZS0ZfF0fyhCu6rNvamQyY@z>

This series fixes a number of deficiencies in stack unwinding for
kernels targeting the microMIPS ISA, allowing us to actually produce
useful backtraces on such systems.

The series applies atop v4.9-rc4.


Paul Burton (6):
  MIPS: Clear ISA bit correctly in get_frame_info()
  MIPS: Prevent unaligned accesses during stack unwinding
  MIPS: Fix get_frame_info() handling of microMIPS function size
  MIPS: Fix is_jump_ins() handling of 16b microMIPS instructions
  MIPS: Calculate microMIPS ra properly when unwinding the stack
  MIPS: Handle microMIPS jumps in the same way as MIPS32/MIPS64 jumps

 arch/mips/kernel/process.c | 151 +++++++++++++++++++++++++++++----------------
 1 file changed, 98 insertions(+), 53 deletions(-)

-- 
2.10.2
