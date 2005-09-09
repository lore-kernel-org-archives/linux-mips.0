content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: scheduling with irqs disabled: init
Date: Fri, 9 Sep 2005 10:25:55 +0530
Message-ID: <4BF47D56A0DD2346A1B8D622C5C5902CD345ED@soc-mail.soc-soft.com>
From: <Vadivelan@soc-soft.com>
Return-Path: <Vadivelan@soc-soft.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050909045555.5s7_1_OKgl9h7WF_X9Zg8pv2sRZsuoIxxeVZnXWvsuI@z>


hi,
	I'm porting MVL4.0 kernel on to a mips board. I've been getting
a call trace as follows.

BUG: scheduling with irqs disabled: init/0x00000000/1
caller is schedule_timeout+0x84/0xe8
Call Trace:
 [<8030a0a8>] schedule_timeout+0x84/0xe8
 [<803090b8>] schedule+0x114/0x160
 [<803090b0>] schedule+0x10c/0x160
 [<8030a0a8>] schedule_timeout+0x84/0xe8
 [<80132610>] process_timeout+0x0/0x8
 [<80132c0c>] msleep_interruptible+0x4c/0x70
 [<802300a8>] gs_wait_tx_flushed+0x1fc/0x3b0
 [<8022fc44>] gs_write+0x25c/0x264
 [<802310cc>] gs_close+0x260/0x394
 [<80216364>] tty_fasync+0x8c/0x134
 [<80216b00>] release_dev+0x6f4/0xa08
 [<8021dddc>] write_chan+0x420/0x48c
 [<8012107c>] __wake_up+0x44/0x80
 [<80120f58>] default_wake_function+0x0/0x28
 [<8017a734>] get_empty_filp+0x64/0x13c
 [<80215234>] tty_ldisc_deref+0xcc/0x110
 [<80215b28>] tty_write+0x2bc/0x454
 [<80216e24>] tty_release+0x10/0x20
 [<80179988>] vfs_write+0xac/0x114
 [<8017aacc>] __fput+0x298/0x2d0
 [<8018e9b8>] getname+0x28/0xfc
 [<80178d2c>] filp_close+0x54/0xb4
 [<80178d24>] filp_close+0x4c/0xb4
 [<8010bc64>] stack_done+0x20/0x3c

I'm totally unaware of the bug. Can anyone help me fix it?

Thanking u in advance,

vadi.


The information contained in this e-mail message and in any annexure is
confidential to the  recipient and may contain privileged information. If you are not
the intended recipient, please notify the sender and delete the message along with
any annexure. You should not disclose, copy or otherwise use the information contained
in the message or any annexure. Any views expressed in this e-mail are those of the
individual sender except where the sender specifically states them to be the views of
SoCrates Software India Pvt Ltd., Bangalore.
