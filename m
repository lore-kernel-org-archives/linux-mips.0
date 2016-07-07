Received: from mailapp01.imgtec.com ([195.59.15.196]:11408 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992417AbcGGHvdDT256 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 7 Jul 2016 09:51:33 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 0/3] Support for MIPSr6 CPU hotplug.
Date: Thu, 7 Jul 2016 08:50:37 +0100
Message-ID: <1467877840-32569-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, Qais Yousef <qais.yousef@imgtec.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160707075037.FVh9kplqrMW2VG-H2Pyoo2OtJHehcR4wWWTC5mhaW8w@z>

This series adds support for hotplug of MIPSr6 Virtual Processors such
as found in the I6400.

Patch 1 allows VPs other than VP0 within a MIPSr6 core to start when a
core is booted.

Patch 2 adds support for removing CPUs, allowing CPU hotpug to be used
with MIPSr6 devices.

Patch 3 is a tidy up to move the CPU hotplug config option into the
Kernel type menu within menuconfig.

Based atop 4.7-rc6


Matt Redfearn (3):
  MIPS: smp-cps: Allow booting of CPU other than VP0 within a core
  MIPS: smp-cps: Add support for CPU hotplug of MIPSr6 processors
  MIPS: Move CPU Hotplug config option into submenu

 arch/mips/Kconfig          | 20 ++++++++++----------
 arch/mips/kernel/smp-cps.c | 41 ++++++++++++++++++++++++++++++++---------
 2 files changed, 42 insertions(+), 19 deletions(-)

-- 
2.7.4
