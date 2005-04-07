Received: from localhost (localhost [127.0.0.1])
	by krt.neobee.net (8.12.7/8.12.7/SuSE Linux 0.6) with ESMTP id j37DYrZF021718
	for <linux-mips@linux-mips.org>; Thu, 7 Apr 2005 15:34:54 +0200
Received: from krt.neobee.net ([127.0.0.1])
 by localhost (krt.neobee.net [127.0.0.1]) (amavisd-new, port 10024) with LMTP
 id 20943-08 for <linux-mips@linux-mips.org>;
 Thu,  7 Apr 2005 15:34:53 +0200 (CEST)
Received: from davidovic ([192.168.0.89])
	by krt.neobee.net (8.12.7/8.12.7/SuSE Linux 0.6) with ESMTP id j37DYp1p021714
	for <linux-mips@linux-mips.org>; Thu, 7 Apr 2005 15:34:51 +0200
Message-ID: <200504071334.j37DYp1p021714@krt.neobee.net>
Reply-To: <mile.davidovic@micronasnit.com>
From: "Mile Davidovic" <mile.davidovic@micronasnit.com>
Subject: Porting new board
Date: Thu, 7 Apr 2005 15:35:08 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit
Return-Path: <mile.davidovic@micronasnit.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050407133508.51NujnjM5qQYGkkkEn9G3k8YnL20y2HRpjx7Is1Kuf8@z>

Hello all
I try to port new board (MIPS 4KEC processor) to latest version
of linux-mips kernel. I have question regarding Kconfig and adding
new board.
In arch/mips/Kconfig I add next lines:

config MIPS_VGCA_EVA
  bool "Support for VGCA-Eva board"
  select SYS_SUPPORTS_BIG_ENDIAN
  help
	  This enables support for the VGCA-EVA board.

and in arch/mips/Makefile I add next lines:
core-$(MIPS_VGCA_EVA)	+= arch/mips/vgca-eva/
cflags-$(MIPS_VGCA_EVA)   += -Iinclude/asm-mips/vgca-eva
load-$(MIPS_VGCA_EVA)	+= 0xffffffff80100000

But when I try to build kernel with:
	make menuconfig  		---> choose VGCA-Eva board
	make arch=mips V=1 CROSS_COMPILE=mips-linux- 

it stop forever. When I try to choose some other board it work nice. 
Any comment?



Thanks a lot.
Best regards Mile
