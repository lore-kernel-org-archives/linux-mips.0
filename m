Received: from mailapp01.imgtec.com ([195.89.28.115]:10240 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S6822090AbaEGLVUDD1rH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 May 2014 13:21:20 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id E87E8B1241509
        for <linux-mips@linux-mips.org>; Wed,  7 May 2014 12:21:10 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/5] MIPS Malta halt & power off
Date: Wed, 7 May 2014 12:20:55 +0100
Message-ID: <1399461660-17623-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140507112055.YNZxRxKDETk6vVpb-Qron4n7UmRM9GnAL_lFd3l4Mcw@z>

This series improves the behaviour of the MIPS Malta board in response
to a halt or power off command. The previous behaviour was that both of
these would trigger a reset of the board. The new behaviour with this
series applied is that halt will execute an infinite loop and power off
will power off the board via the PIIX4.

Paul Burton (5):
  MIPS: define some more PIIX4 registers & values
  MIPS: Malta: add suspend state entry code
  MIPS: Malta: let PIIX4 respond to PCI special cycles
  MIPS: Malta: hang on halt
  MIPS: Malta: support powering down

 arch/mips/Kconfig                           |  6 ++
 arch/mips/include/asm/mach-malta/malta-pm.h | 37 +++++++++++
 arch/mips/include/asm/mips-boards/piix4.h   | 12 ++++
 arch/mips/mti-malta/Makefile                |  2 +
 arch/mips/mti-malta/malta-pm.c              | 96 +++++++++++++++++++++++++++++
 arch/mips/mti-malta/malta-reset.c           | 15 +++--
 arch/mips/pci/fixup-malta.c                 |  6 ++
 7 files changed, 170 insertions(+), 4 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-malta/malta-pm.h
 create mode 100644 arch/mips/mti-malta/malta-pm.c

-- 
1.8.5.3
