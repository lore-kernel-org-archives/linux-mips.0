Received: from mailapp01.imgtec.com ([195.89.28.115]:33916 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6820489AbaDHLrNzz4Bw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Apr 2014 13:47:13 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 3EFF7AB801DB8
        for <linux-mips@linux-mips.org>; Tue,  8 Apr 2014 12:47:02 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 00/14] Initial BPF-JIT support for MIPS
Date: Tue, 8 Apr 2014 12:47:01 +0100
Message-ID: <1396957635-27071-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140408114701.MrRQmEMqOp6mh5N3fQ_yf6_Edw6rTY3j7lf86UWuTG4@z>

Hi,

This adds support for BPF-JIT for MIPS. Tested on mips32 LE/BE and mips64 BE
with a few networking tools such as tcpdump and dhcp but not all opcodes have
been tested as far as I can tell. There are a few optimizations left to be made
(fastpath for load operations instead of calling the helper functions) but
these can be added later on. If someone has complex network setups in place and
would like to give it a try, that would be much appreciated.

This patchset is for the upstream-sfr/mips-for-linux-next tree

Markos Chandras (14):
  MIPS: uasm: Add u3u2u1 instruction builders
  MIPS: uasm: Add u2u1 instruction builders
  MIPS: uasm: Add sllv uasm instruction
  MIPS: uasm: Add srlv uasm instruction
  MIPS: uasm: Add divu uasm instruction
  MIPS: uasm: Add mfhi uasm instruction
  MIPS: uasm: Add jalr uasm instruction
  MIPS: uasm: Add sltiu uasm instruction
  MIPS: uasm: Add sltu uasm instruction
  MIPS: uasm: Add wsbh uasm instruction
  MIPS: uasm: Add lh uam instruction
  MIPS: uasm: Add mul uasm instruction
  MIPS: net: Add BPF JIT
  MIPS: Enable the BPF_JIT symbol for MIPS

 arch/mips/Kbuild                  |    1 +
 arch/mips/Kconfig                 |    1 +
 arch/mips/include/asm/uasm.h      |   16 +
 arch/mips/include/uapi/asm/inst.h |   17 +
 arch/mips/mm/uasm-micromips.c     |   10 +
 arch/mips/mm/uasm-mips.c          |   10 +
 arch/mips/mm/uasm.c               |   39 +-
 arch/mips/net/Makefile            |    3 +
 arch/mips/net/bpf_jit.c           | 1327 +++++++++++++++++++++++++++++++++++++
 arch/mips/net/bpf_jit.h           |   45 ++
 10 files changed, 1462 insertions(+), 7 deletions(-)
 create mode 100644 arch/mips/net/Makefile
 create mode 100644 arch/mips/net/bpf_jit.c
 create mode 100644 arch/mips/net/bpf_jit.h

-- 
1.9.1
