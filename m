Received: from mailapp01.imgtec.com ([195.59.15.196]:65080 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006514AbcEQObadGkgo (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 May 2016 16:31:30 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/3] External Interrupt Controller (EIC) fixes
Date: Tue, 17 May 2016 15:31:03 +0100
Message-ID: <1463495466-29689-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Guenter Roeck <linux@roeck-us.net>, Qais Yousef <qais.yousef@imgtec.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Joe Perches <joe@perches.com>, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <20160517143103.7CxccPx3WiCZLzVA7aZIvmr_U5ImOw4feNQsG0_2ZJ8@z>

This series fixes a few small issues with support for External Interrupt
Controllers (cpu_has_veic), ensuring that it is configured to service
all interrupts by default & that when a GIC is present it's enabled when
expected.

Applies atop v4.6.

Paul Burton (3):
  MIPS: Clear Status IPL field when using EIC
  MIPS: smp-cps: Clear Status IPL field when using EIC
  irqchip: mips-gic: Setup EIC mode on each CPU if it's in use

 arch/mips/kernel/irq.c         |  3 +++
 arch/mips/kernel/smp-cps.c     |  8 ++++++--
 drivers/irqchip/irq-mips-gic.c | 10 +++++++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.8.2
