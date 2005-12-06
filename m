Received: from laf31-5-82-235-130-100.fbx.proxad.net ([82.235.130.100]:35312
	"EHLO lexbox.fr") by ftp.linux-mips.org with ESMTP id S8133376AbVLFI4I convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 6 Dec 2005 08:56:08 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Au1550 SDRAM bus frequency & data corruption
Date: Tue, 6 Dec 2005 09:52:06 +0100
Message-ID: <17AB476A04B7C842887E0EB1F268111E0271C8@xpserver.intra.lexbox.org>
From: "David Sanchez" <david.sanchez@lexbox.fr>
Return-Path: <david.sanchez@lexbox.fr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, Sergei Shtylylov <sshtylyov@ru.mvista.com>
Message-ID: <20051206085206.yJt8_4GFKA80INcZo2mYA-BuoQ6cF56iHJoaMkGAYzc@z>

Hi,

I found a solution to my problem of data corruption on my AMD alchemy
Db1550: I divided the SDRAM bus frequency by 2. 
So I get the following set of freq:
	CPU core = 396 Mhz
	System bus = 198 Mhz
	SDRAM bus = 99 Mhz instead of 198 Mhz
The PCI clock is 64 Mhz.

To do this I simply use the boot monitor YAMON v2.25 provided by AMD
(downloaded from their website). And set the position of the rotary
switch to 2.

I don't really know if the SDRAM bus frequency was the root issue or if
it simply slows down the transfer and thus the problem has not enough
time to appear...but I test the copy during all the night and the test
doesn't report any error :)

Sergei, could you tell me your frequency configuration that you use on
you au1550 board, please ?

Thanks

David Sanchez
