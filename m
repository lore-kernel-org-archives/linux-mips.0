Received: from miranda.se.axis.com ([193.13.178.8]:31121 "EHLO
	miranda.se.axis.com") by ftp.linux-mips.org with ESMTP
	id S20021618AbXLNJt5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 14 Dec 2007 09:49:57 +0000
Received: from exgate.se.axis.com (exgate.se.axis.com [10.0.5.55])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with SMTP id lBE9nfdo022182
	for <linux-mips@linux-mips.org>; Fri, 14 Dec 2007 10:49:41 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: GCC 3.4.5 and mftc0
Date: Fri, 14 Dec 2007 10:49:40 +0100
Message-ID: <BFECAF9E178F144FAEF2BF4CE739C6680557B0DB@exmail1.se.axis.com>
From: "Mikael Starvik" <mikael.starvik@axis.com>
Return-Path: <mikael.starvik@axis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20071214094940.tsR6syDTn2OJaDvy7mzw02JFUBL4Zi0MZDAAPP1Kaw8@z>

mftc0() is implemented as
 
 .word ...
  move %0, $1

With at least gcc 3.4.5 the move is implemented as an addu %0, $1, $0.
But in the MIPS sumulator this fails and %0 gets the value 0xffffffff.
Implementing this as a or %0, $1, $0 instead gives the expected result.

Any suggestions where the problem is and what the correct solution is?

After fixing this my next problem is that IPIs doesn't reach all TCs
correctly (it seams like the code doesn't detect IXMT status correctly,
but I am still investigating). It is likely that it is caused by
something similar to the problem above.

Regards
/Mikael
