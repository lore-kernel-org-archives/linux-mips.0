Received: from CAHOW (localhost [127.0.0.1])
	by witte.sonytel.be (8.12.10/8.12.10) with SMTP id i558MxXJ020080
	for <linux-mips@linux-mips.org>; Sat, 5 Jun 2004 10:23:25 +0200 (MEST)
Message-ID: <00a501c44ad6$2ffb4670$f304308a@CAHOW>
From: "VU Khac Tri \(Sony\)" <tri.vukhac@sonycom.com>
Subject: pcmcia on MIPS
Date: Sat, 5 Jun 2004 10:20:56 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <tri.vukhac@sonycom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040605082056.pv_2Zxr-tNTE-YU_Q0avwJPwT7-ti8CQ1G81dnGr5nQ@z>

Hi,
I am trying running pcmcia on mips and got some problem of memory mapping.
On mips, the memory windows start at the physical addresses that are higher
than 0x10000000. However, in the pcmcia code, i82365.c, I found that the
start address must be in the interval 0x000000-0xFFFFFF.
Does this mean that the linux pcmcia stack does not work on mips? What is
the correct sys_start value?
Kind regards,
Tri

=========
PCMCIA 3.2.7, i82365.c, i365_set_mem_map():

    if ((map > 4) || (mem->card_start > 0x3ffffff) ||
        (mem->sys_start > mem->sys_stop) || (mem->speed > 1000))
        return -EINVAL;
    if (!(s->flags & (IS_PCI|IS_CARDBUS)) &&
        ((mem->sys_start > 0xffffff) || (mem->sys_stop > 0xffffff)))
        return -EINVAL;
