Received: from jhdew ([222.98.69.113])
	by torinet.co.kr (8.12.8/8.12.8) with ESMTP id i3N8px5i009307
	for <linux-mips@linux-mips.org>; Fri, 23 Apr 2004 17:51:59 +0900
From: =?ks_c_5601-1987?B?wOXB+Mit?= <jhdew@torinet.co.kr>
Subject: Problem with 64-bit kernel in SB1250 processor board.
Date: Fri, 23 Apr 2004 17:01:09 +0900
Message-ID: <000601c42909$236b5e20$714562de@jhdew>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 8BIT
Return-Path: <jhdew@torinet.co.kr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040423080109.lvkL1nOGuPCbDMdO8s_bfy1NXzHfOml6tY2Ji7M1GcE@z>

Hello,

I¡¯m testing SB1250 processor board with 64bits linux kernel.
I used last source(linux-2.4.21) from Broadcom sibyte site.

But, when I did ping flooding 2-3 times (back ground running) to any
host system from my board, it panics. (mainly page fault error)
With 32bit linux kernel, no panic. Any idea?
How stable SB1250 processor in 64-bit linux kernel?

I doubt paging management of SB1250 in 64-bit kernel.
Any idea?
