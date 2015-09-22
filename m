Received: from mailapp01.imgtec.com ([195.59.15.196]:3350 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008792AbbIVS5F1kNlP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:57:05 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/3] Malta DT memory init
Date: Tue, 22 Sep 2015 11:56:35 -0700
Message-ID: <1442948198-14507-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, James Hogan <james.hogan@imgtec.com>, Pawel Moll <pawel.moll@arm.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Mark Rutland <mark.rutland@arm.com>
Message-ID: <20150922185635.jjev1P7JydU_ddUXAJWwsbATQwwsPLV1tNKvlVy-35o@z>

This series extracts some parts of my earlier Malta DT conversion
patchset which I believe should be good to merge independently from the
rest (which require further interrupt work).

Paul Burton (3):
  MIPS: malta: split obj-y entries across lines
  MIPS: malta: remove fw_memblock_t abstraction
  MIPS: malta: setup RAM regions via DT

 arch/mips/Kconfig                               |   2 +
 arch/mips/boot/dts/mti/malta.dts                |   4 +
 arch/mips/include/asm/fw/fw.h                   |  16 ---
 arch/mips/include/asm/mach-malta/malta-dtshim.h |  29 +++++
 arch/mips/mti-malta/Makefile                    |  15 ++-
 arch/mips/mti-malta/malta-dtshim.c              | 162 ++++++++++++++++++++++++
 arch/mips/mti-malta/malta-memory.c              | 131 +------------------
 arch/mips/mti-malta/malta-setup.c               |   5 +-
 8 files changed, 215 insertions(+), 149 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-malta/malta-dtshim.h
 create mode 100644 arch/mips/mti-malta/malta-dtshim.c

-- 
2.5.3
