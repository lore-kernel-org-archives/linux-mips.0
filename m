Received: from mailapp01.imgtec.com ([195.59.15.196]:35239 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009567AbbCWMcQVyaf- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Mar 2015 13:32:16 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/3] GIC counter fixes
Date: Mon, 23 Mar 2015 12:32:00 +0000
Message-ID: <1427113923-9840-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20150323123200.nJLiEQIogt-eJ9L4m5RzI0E-roSCZi5YgYwUTLN61NA@z>

Hi,

Here are a few patches to ensure the GIC counter is running before we attempt
to use it since the default value on a MIPS core can be '1' which means
the GIC counter will be stopped after a CPU reset. These patches are based
on 4.0-rc1.

Markos Chandras (3):
  irqchip: irq-mips-gic: Add new functions to start/stop the GIC counter
  clocksource: mips-gic-timer: Ensure GIC counter is running
  MIPS: Malta: malta-time: Ensure GIC counter is running

 arch/mips/mti-malta/malta-time.c     |  4 +++-
 drivers/clocksource/mips-gic-timer.c |  3 +++
 drivers/irqchip/irq-mips-gic.c       | 21 +++++++++++++++++++++
 include/linux/irqchip/mips-gic.h     |  2 ++
 4 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.3.3
