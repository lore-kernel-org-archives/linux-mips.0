Received: from mailapp01.imgtec.com ([195.59.15.196]:11686 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008044AbbCCStDmoUw7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Mar 2015 19:49:03 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id CD906F8C0A7EA
        for <linux-mips@linux-mips.org>; Tue,  3 Mar 2015 18:48:54 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/4] MIPS R6 fixes for 4.0
Date: Tue, 3 Mar 2015 18:48:46 +0000
Message-ID: <1425408530-21613-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150303184846.lGXVCEJd_WvDi-uAxTgP3UbluJI24ohQT9wsRIpMbyY@z>

Hi,

A few R6 fixes for 4.0.

Please consider applying them in time for Linux 4.0

Markos Chandras (4):
  MIPS: asm: r4kcache: Use correct base register for MIPS R6 cache
    flushes
  MIPS: asm: spinlock: Fix addiu instruction for R10000_LLSC_WAR case
  MIPS: kernel: entry.S: Set correct ISA level for mips_ihb
  MIPS; asm: bitops: Add missing ISA levels for MIPS R6

 arch/mips/include/asm/bitops.h   |  3 ++
 arch/mips/include/asm/r4kcache.h | 88 ++++++++++++++++++++--------------------
 arch/mips/include/asm/spinlock.h |  2 +-
 arch/mips/kernel/entry.S         |  3 +-
 4 files changed, 50 insertions(+), 46 deletions(-)

-- 
2.3.1
