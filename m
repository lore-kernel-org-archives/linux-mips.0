Received: from stephen ([222.98.69.120])
	by torinet.co.kr (8.12.8/8.12.8) with ESMTP id i3G0a65i008854
	for <linux-mips@linux-mips.org>; Fri, 16 Apr 2004 09:36:07 +0900
Message-ID: <200404160036.i3G0a65i008854@torinet.co.kr>
From: "JinYoung Kim" <jykim@torinet.co.kr>
Subject: large memory support on  kernel 2.4.21 for 64bit on sb1250?
Date: Fri, 16 Apr 2004 08:47:43 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
Return-Path: <jykim@torinet.co.kr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040415234743.0Jhj8fuXxcI-McXTX19NiruX2OdPjyibOOzgyNRVtlQ@z>

Hello,
 
Is large memory support stable on kernel 2.4.21 with broadcom patch 1 and 2?
 
Would anybody test followingscenrio with BCM91250 reference board or your
own?
 
run ping fluding background to any system from the board.
run it again.
run ping fluding to the board from the system above.
 
panic (page fault) or DBE error occured immediately in my test.
 
I have 2GB main memory, but samething happend on 512MB.
32bit kernel does not have any problem.
 
Jin
 
vroom@magicn.com
 
