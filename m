Received: from mailapp01.imgtec.com ([195.59.15.196]:59255 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992155AbdC3SiROmLWr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 30 Mar 2017 20:38:17 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/2] MIPS: module: Fixup error path & refactor
Date: Thu, 30 Mar 2017 11:37:43 -0700
Message-ID: <20170330183746.25339-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170330183743.jM0af6SPLg6gEPqHcOQy3CzBdK5OfHO3SJvCPCJTfVU@z>

This short series fixes a memory leak in the error path of
apply_relocate(), and refactors the REL & RELA style reloc handling to
allow for the sharing of code between the two & the removal of a fair
amount of duplication.

Applies atop v4.11-rc4.


Paul Burton (2):
  MIPS: module: Ensure we always clean up r_mips_hi16_list
  MIPS: module: Unify rel & rela reloc handling

 arch/mips/include/asm/module.h |   8 +-
 arch/mips/kernel/Makefile      |   1 -
 arch/mips/kernel/module-rela.c | 202 -------------------------------------
 arch/mips/kernel/module.c      | 221 ++++++++++++++++++++++++++++++-----------
 4 files changed, 169 insertions(+), 263 deletions(-)
 delete mode 100644 arch/mips/kernel/module-rela.c

-- 
2.12.1
