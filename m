Received: from wssseeger ([192.168.1.53]) by nt_server.stellartec.com
          (Post.Office MTA v3.1.2 release (PO205-101c)
          ID# 568-43562U100L2S100) with SMTP id AAA486
          for <linux-mips@linux-mips.org>; Mon, 14 Apr 2003 11:07:04 -0700
Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: uclibc printf and floats
Date: Mon, 14 Apr 2003 11:12:43 -0700
Message-ID: <04d001c302b1$7203e270$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.GSO.3.96.1030414192822.24742P-100000@delta.ds2.pg.gda.pl>
Return-Path: <sseeger@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030414181243.YgzaMy9utmZO_toP82fq0Ppj6jheJ8kBtwpi_dmqHuI@z>

I switched over to uclibc a while ago and am running the release (also tried
the snapshot) of 0.1.19 or whatever it is. I notice that printf crashes with
floats. This was a problem found with uclibc on other archs back almost 2
years ago. If anyone can help me with some advice I'd appreciate it. I much
prefer to continue using uclibc on this VR4181 instead of glibc.

Thanks!

Steve
