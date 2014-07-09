Received: from mailapp01.imgtec.com ([195.59.15.196]:30999 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6859944AbaGILsilnxZh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Jul 2014 13:48:38 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 46F54B3D72789
        for <linux-mips@linux-mips.org>; Wed,  9 Jul 2014 12:48:29 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/5] {pm,smp}-cps fixes
Date: Wed, 9 Jul 2014 12:48:17 +0100
Message-ID: <1404906502-10702-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140709114817.DT7oWUOMaNAHfj1md1UVIxDXDqPoqDHEB1iukHKUlRw@z>

This series fixes a few minor build issues with the pm-cps & smp-cps
code, and one caching issue which could lead to boot failures.

Paul Burton (5):
  MIPS: pm-cps: prevent use of mips_cps_* without CPS SMP
  MIPS: pm-cps: select CONFIG_MIPS_CPC
  MIPS: fix potential build failures using cpu_vpe_id on non-MT
  MIPS: {pm,smp}-cps: use cpu_vpe_id macro
  MIPS: smp-cps: fix entry code cache flush for systems with coherent
    I/O

 arch/mips/Kconfig                |  1 +
 arch/mips/include/asm/cpu-info.h |  2 +-
 arch/mips/include/asm/smp-cps.h  | 12 ++++++++++--
 arch/mips/kernel/pm-cps.c        | 10 +++++++++-
 arch/mips/kernel/smp-cps.c       | 12 ++++++++----
 5 files changed, 29 insertions(+), 8 deletions(-)

-- 
2.0.1
