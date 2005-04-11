Received: from localhost (localhost [127.0.0.1])
	by krt.neobee.net (8.12.7/8.12.7/SuSE Linux 0.6) with ESMTP id j3BAEBZF023537
	for <linux-mips@linux-mips.org>; Mon, 11 Apr 2005 12:14:16 +0200
Received: from krt.neobee.net ([127.0.0.1])
 by localhost (krt.neobee.net [127.0.0.1]) (amavisd-new, port 10024) with LMTP
 id 22496-08 for <linux-mips@linux-mips.org>;
 Mon, 11 Apr 2005 12:14:11 +0200 (CEST)
Received: from davidovic ([192.168.0.89])
	by krt.neobee.net (8.12.7/8.12.7/SuSE Linux 0.6) with ESMTP id j3BADt1p023510
	for <linux-mips@linux-mips.org>; Mon, 11 Apr 2005 12:14:03 +0200
Message-ID: <200504111014.j3BADt1p023510@krt.neobee.net>
Reply-To: <mile.davidovic@micronasnit.com>
From: "Mile Davidovic" <mile.davidovic@micronasnit.com>
Subject: Toolchain question
Date: Mon, 11 Apr 2005 12:13:50 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-Path: <mile.davidovic@micronasnit.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Linux/MIPS Development' <linux-mips@linux-mips.org>
Message-ID: <20050411101350.FA-TmLHwRr00PC8itFTl5eI-2c9IRzEHTk3ErpDxaHk@z>

Hello all
I would like to port board (with MIPS 4kec) to latest linux 2.6 kernel.
Using porting guide 
from (http://www.linux-mips.org/wiki/index.php/Porting) I successfully made
console and
serial driver. But problem appears with first printk (in start_kernel) I got
exception.  

I used toolchain which uclibc buildroot script produced (gcc-3.4.2,
binutils-2.15.91.0.2),
and I am not sure is this correct combination.
