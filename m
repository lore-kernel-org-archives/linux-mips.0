Received: from mf2.realtek.com.tw ([60.248.182.6]:60676 "EHLO
	mf2.realtek.com.tw") by ftp.linux-mips.org with ESMTP
	id S20022937AbXGXHJn (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 24 Jul 2007 08:09:43 +0100
Received: from msx.realtek.com.tw (unverified [172.21.1.77]) by mf2.realtek.com.tw
 (Clearswift SMTPRS 5.1.7) with ESMTP id <T810530c5e8dc803816820@mf2.realtek.com.tw> for <linux-mips@linux-mips.org>;
 Tue, 24 Jul 2007 15:11:03 +0800
Message-ID: <014201c7cdc1$984e50c0$106215ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
Subject: Linux 2.6.12 cannot run on 24K. Please give me some clues.
Date: Tue, 24 Jul 2007 15:09:37 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20070724070937.gLyUIbmkfAHZgLhFWK8gY42gHpyWzNtym0XPfninmsw@z>


Hi all,
Could you help me on porting MIPS Linux?

Our first embedded system using 4Kec is running very well on Linux 2.6.12.
Now the second chip using 24K has problems. I found that mtf0 and mtc0 have
hazard problem and I have solved it.
static inline void unmask_mips_irq(unsigned int irq)
{
        set_c0_status(0x100 << (irq - mips_cpu_irq_base));
        irq_enable_hazard();
}

Now Linux can continue running and then it will encounter problems when
running the first application, init. I will appreciate your clues for
helping me on this probem. :D

Colin

ÿttyS0 at MMIO 0x0 (irq = 3) is a 16550A
ttyS1 at MMIO 0x0 (irq = 3) is a 16550A
io scheduler noop registered
Freeing prom memory: 0kb freed
Reclaim bootloader memory from 80010000 to 800f0000
Freeing unused kernel memory: 252k freed
CPU 0 Unable to handle kernel paging request at virtual address ffffff88,
epc == 00440f10, ra == 004000e4
Oops in arch/mips/mm/fault.c::do_page_fault, line 167[#1]:
Cpu 0
$ 0   : 00000000 10000990 00400090 00000000
$ 4   : 7fdd5ed0 7fdd5f94 00000000 7fdd5f94
$ 8   : 00000000 00000000 80001cb2 00000b3b
$12   : 7f1c0300 0001ffff 0001ffff 00000115
$16   : 801f5e04 00000000 00000000 00000000
$20   : 00000000 00000000 00000000 00000000
$24   : 00000000 00440f00
$28   : 10008c70 7fdd5e18 7fdd5e38 004000e4
Hi    : 00000000
Lo    : 00000000
epc   : 00440f10     Not tainted
ra    : 004000e4 Status: 00006802    KERNEL EXL
Cause : 0880400c
BadVA : ffffff88
PrId  : 00019378
Process init (pid: 1, threadinfo=80848000, task=80854bd8)
Stack : 00000000 00000000 10008c70 00000000 10008c70 7fdd5e38 10008c70
004276e4
        00000000 00000000 00000000 00000000 10008c70 00000000 7fdd5f9c
00000000
        00000000 00000000 00000000 00000000 00000000 00000000 00000003
00400034
        00000004 00000020 00000005 00000002 00000006 00001000 00000007
000000
