Received: from mail333.us4.mandrillapp.com ([205.201.137.77]:58633 "EHLO
        mail333.us4.mandrillapp.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27008274AbcCAXylM1C3J (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 2 Mar 2016 00:54:41 +0100
Received: from pmta03.dal05.mailchimp.com (127.0.0.1) by mail333.us4.mandrillapp.com id hqols2174nol for <linux-mips@linux-mips.org>; Tue, 1 Mar 2016 23:54:36 +0000 (envelope-from <bounce-md_30481620.56d62bbc.v1-b1680d9a313d4549b67f7bf03b3ed6fd@mandrillapp.com>)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.4 156/342] MIPS: hpet: Choose a safe value for the ETIME check
Message-ID: <20160301234533.013399624@linuxfoundation.org>
In-Reply-To: <20160301234527.990448862@linuxfoundation.org>
References: <20160301234527.990448862@linuxfoundation.org>
Date: Tue, 01 Mar 2016 23:54:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-Path: <bounce-md_30481620.56d62bbc.v1-b1680d9a313d4549b67f7bf03b3ed6fd@mandrillapp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160301235436.JfiV90hhz-hK9LoAlYJk5HUD1jQN5RdXinrReUJoLos@z>

4.4-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Huacai Chen <chenhc@lemote.com>

commit 5610b1254e3689b6ef8ebe2db260709a74da06c8 upstream.

This patch is borrowed from x86 hpet driver and explaind below:

Due to the overly intelligent design of HPETs, we need to workaround
the problem that the compare value which we write is already behind
the actual counter value at the point where the value hits the real
compare register. This happens for two reasons:

1) We read out the counter, add the delta and write the result to the
   compare register. When a NMI hits between the read out and the write
   then the counter can be ahead of the event already.

2) The write to the compare register is delayed by up to two HPET
   cycles in AMD chipsets.

We can work around this by reading back the compare register to make
sure that the written value has hit the hardware. But that is bad
performance wise for the normal case where the event is far enough in
the future.

As we already know that the write can be delayed by up to two cycles
we can avoid the read back of the compare register completely if we
make the decision whether the delta has elapsed already or not based
on the following calculation:

  cmp = event - actual_count;

If cmp is less than 64 HPET clock cycles, then we decide that the event
has happened already and return -ETIME. That covers the above #1 and #2
problems which would cause a wait for HPET wraparound (~306 seconds).

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Steven J. Hill <Steven.Hill@imgtec.com>
Cc: Fuxin Zhang <zhangfx@lemote.com>
Cc: Zhangjin Wu <wuzhangjin@gmail.com>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: linux-mips@linux-mips.org
Patchwork: https://patchwork.linux-mips.org/patch/12162/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/mips/loongson64/loongson-3/hpet.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

--- a/arch/mips/loongson64/loongson-3/hpet.c
+++ b/arch/mips/loongson64/loongson-3/hpet.c
@@ -13,6 +13,9 @@
 #define SMBUS_PCI_REG64		0x64
 #define SMBUS_PCI_REGB4		0xb4
 
+#define HPET_MIN_CYCLES		64
+#define HPET_MIN_PROG_DELTA	(HPET_MIN_CYCLES + (HPET_MIN_CYCLES >> 1))
+
 static DEFINE_SPINLOCK(hpet_lock);
 DEFINE_PER_CPU(struct clock_event_device, hpet_clockevent_device);
 
@@ -161,8 +164,9 @@ static int hpet_next_event(unsigned long
 	cnt += delta;
 	hpet_write(HPET_T0_CMP, cnt);
 
-	res = ((int)(hpet_read(HPET_COUNTER) - cnt) > 0) ? -ETIME : 0;
-	return res;
+	res = (int)(cnt - hpet_read(HPET_COUNTER));
+
+	return res < HPET_MIN_CYCLES ? -ETIME : 0;
 }
 
 static irqreturn_t hpet_irq_handler(int irq, void *data)
@@ -237,7 +241,7 @@ void __init setup_hpet_timer(void)
 	cd->cpumask = cpumask_of(cpu);
 	clockevent_set_clock(cd, HPET_FREQ);
 	cd->max_delta_ns = clockevent_delta2ns(0x7fffffff, cd);
-	cd->min_delta_ns = 5000;
+	cd->min_delta_ns = clockevent_delta2ns(HPET_MIN_PROG_DELTA, cd);
 
 	clockevents_register_device(cd);
 	setup_irq(HPET_T0_IRQ, &hpet_irq);
