Received: from wssseeger ([192.168.1.53]) by nt_server.stellartec.com
          (Post.Office MTA v3.1.2 release (PO205-101c)
          ID# 568-43562U100L2S100) with SMTP id AAA493
          for <linux-mips@linux-mips.org>; Mon, 28 Apr 2003 10:10:16 -0700
Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: wait on vr4181 part 2
Date: Mon, 28 Apr 2003 10:16:18 -0700
Message-ID: <089f01c30da9$e237d5d0$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200304281825.09697.wom@tateyama.hu>
Return-Path: <sseeger@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030428171618.YYkw_mXQCz0DSWc1T64mLXUBZbRcBCj6mcosJrlc70s@z>

If there is no wait, then what's that in arch/mips/vr4181/osprey/reset.c ?
void nec_osprey_halt(void)
{
	printk("KERN_NOTICE "\n** You can safely turn off the power.\n");
	while(1)
		__asm__(".set\tmips3\n\t"
			"wait\n\t"
			".set\tmips0");
}

Steve
