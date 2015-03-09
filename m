Received: from mailapp01.imgtec.com ([195.59.15.196]:38389 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007660AbbCIOzCXjqxh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 9 Mar 2015 15:55:02 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 3ADDB4113DFA8
        for <linux-mips@linux-mips.org>; Mon,  9 Mar 2015 14:54:54 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH v2 0/4] EVA fixes
Date: Mon, 9 Mar 2015 14:54:48 +0000
Message-ID: <1425912892-23133-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150309145448.2qmtITzNhVffIt05ns1eu3MH7izogNSEUKWk7sB0A88@z>

Hi,

These four patches fix unaligned accesses when EVA is enabled. The fixes
CC stable as well, because they need to be applied all the way back to
the 3.15 kernels where EVA was originally introduced.

Markos Chandras (4):
  MIPS: asm: asm-eva: Introduce kernel load/store variants
  MIPS: unaligned: Prevent EVA instructions on kernel unaligned accesses
  MIPS: unaligned: Surround load/store macros in do {} while statements
  MIPS: unaligned: Fix regular load/store instruction emulation for EVA

 arch/mips/include/asm/asm-eva.h | 137 ++++++++++------
 arch/mips/kernel/unaligned.c    | 340 +++++++++++++++++++++++++++-------------
 2 files changed, 324 insertions(+), 153 deletions(-)

-- 
2.3.1
