Received: from mailapp01.imgtec.com ([195.59.15.196]:64847 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6842383AbaGXLKPK8q8N (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 24 Jul 2014 13:10:15 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 59A0FAE900E49
        for <linux-mips@linux-mips.org>; Thu, 24 Jul 2014 12:10:05 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/2] MIPS64/O32 seccomp fixes
Date: Thu, 24 Jul 2014 12:10:00 +0100
Message-ID: <1406200202-10104-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140724111000.9B7ZNlS1IZaw-5qs4nFrDZscImi2f_mVuKbeOOkWltQ@z>

Hi,

A few seccomp fixes related to O32 processes on MIPS64 cores.

It's based on v3.16-rc6

Markos Chandras (2):
  MIPS: syscall: Fix AUDIT value for O32 processes on MIPS64
  MIPS: scall64-o32: Fix indirect syscall detection

 arch/mips/include/asm/syscall.h |  8 +++++---
 arch/mips/kernel/scall64-o32.S  | 12 ++++++++----
 2 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.0.2
