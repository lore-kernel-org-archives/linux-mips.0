Received: from mailapp01.imgtec.com ([195.59.15.196]:7137 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008111AbbCEA7PsSckP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 5 Mar 2015 01:59:15 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH 00/15] MIPS: Add cputime/clock/hrtick features
Date: Wed, 4 Mar 2015 16:58:42 -0800
Message-ID: <1425517137-26463-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20150305005842.4KKRQ_AcZQrM_U63r4cnM3zq1Cz4RSNdru0b1m1IOjo@z>

Some generic features are applicable to MIPS but currently missing. Some
need low-level support. This patch set is mainly for providing high
resolution cpu/task time accounting. Testing was done on Malta. Welcome
Tested-by's for other platforms.

Deng-Cheng Zhu (15):
  MIPS: Add SCHED_HRTICK support
  MIPS: Fall back to generic implementation of cmpxchg64 on 32-bit
    platforms
  MIPS: Add support for full dynticks CPU time accounting
  MIPS: Add sched_clock support
  MIPS: csrc-r4k: Implement read_sched_clock
  MIPS: csrc-bcm1480: Remove FSF mail address from GPL notice
  MIPS: csrc-bcm1480: Implement read_sched_clock
  MIPS: csrc-ioasic: Remove FSF mail address from GPL notice
  MIPS: csrc-ioasic: Implement read_sched_clock
  MIPS: sgi-ip27: Implement read_sched_clock
  MIPS: cevt-txx9: Implement read_sched_clock
  MIPS: jz4740: Implement read_sched_clock
  MIPS: csrc-sb1250: Remove FSF mail address from GPL notice
  MIPS: csrc-sb1250: Implement read_sched_clock
  MIPS: Add support for fine granularity task level IRQ time accounting

 arch/mips/Kconfig               |  6 ++++++
 arch/mips/include/asm/cmpxchg.h | 11 ++++++-----
 arch/mips/jz4740/time.c         |  8 ++++++++
 arch/mips/kernel/cevt-txx9.c    |  9 +++++++++
 arch/mips/kernel/csrc-bcm1480.c | 12 ++++++++----
 arch/mips/kernel/csrc-ioasic.c  | 13 +++++++++----
 arch/mips/kernel/csrc-r4k.c     |  8 ++++++++
 arch/mips/kernel/csrc-sb1250.c  | 12 ++++++++----
 arch/mips/sgi-ip27/ip27-timer.c |  8 ++++++++
 9 files changed, 70 insertions(+), 17 deletions(-)

-- 
1.8.5.3
