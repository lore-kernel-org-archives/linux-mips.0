Received: from dlep91.itg.ti.com ([157.170.152.55])
	by go4.ext.ti.com (8.13.1/8.13.1) with ESMTP id j119aXNs028229
	for <linux-mips@linux-mips.org>; Tue, 1 Feb 2005 03:36:34 -0600 (CST)
Received: from dbde2k01.ent.ti.com (localhost [127.0.0.1])
	by dlep91.itg.ti.com (8.12.11/8.12.11) with ESMTP id j119aTK6022461
	for <linux-mips@linux-mips.org>; Tue, 1 Feb 2005 03:36:32 -0600 (CST)
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Dealing with RAM not starting at 0x00000000
Date: Tue, 1 Feb 2005 15:06:29 +0530
Message-ID: <F6B01C6242515443BB6E5DDD63AE935F04682B@dbde2k01.itg.ti.com>
From: "Nori, Soma Sekhar" <nsekhar@ti.com>
Return-Path: <nsekhar@ti.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050201093629.SWfx7D2FJo4-PSK4gcuSrAMjt36V0DbOktbJlAaEarY@z>

Hi All,

I am working towards porting 2.6.10 kernel on a mips 4kec based board
which has physical memory starting at 0x14000000.
What is the best way to overcome the "hole" from 0x00000000 to
0x14000000 without incuring a huge memory overhead.
(For exception handling there is 4k of RAM kept at 0x00000000 also - but
I guess linux paging need need not be aware of this small RAM)

Any suggestions/pointers are greatly appreciated. 

Thanks,
Sekhar
