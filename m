Received: from WSSTEVELAPTOP ([192.168.1.60]) by nt_server.stellartec.com
          (Post.Office MTA v3.1.2 release (PO205-101c)
          ID# 568-43562U100L2S100) with SMTP id AAA455
          for <linux-mips@linux-mips.org>; Wed, 16 Jul 2003 07:01:43 -0700
Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: mmap broken on cvs update 2_4
Date: Wed, 16 Jul 2003 07:01:33 -0700
Message-ID: <004c01c34ba2$c499ba20$4383a8c0@WSSTEVELAPTOP>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20030716014340.GA12436@nevyn.them.org>
Return-Path: <sseeger@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030716140133.MhOcZugxksJXXIT0143kpomqOUcK53YeP4UG5nEnGnU@z>

The signal defined 1 problem is really a Bus error. uClibc is broken for
signals and got them from the x86 asm/signal.h file to build its default
string messages.

I'm using mmap. It maps successfully and has the proper ranges in
/proc/pid/maps.

When I try to access the memory I get a bus error. This did not happen
before I did a cvs update. I had even rebuilt a kernel prior to the cvs
update that didn't do that.

If someone can tell me where to look I'd appreciate it.

Steve
