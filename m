Received: from mail.esn.co.in ([202.125.80.34])
	by ns2.astrainfonets.net (8.12.8p1/8.12.8) with ESMTP id i6LCpGIW024659
	for <linux-mips@linux-mips.org>; Wed, 21 Jul 2004 12:51:18 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: Error :Nomatch found in TLB ?????
Date: Wed, 21 Jul 2004 18:25:05 +0530
Message-ID: <4EE0CBA31942E547B99B3D4BFAB34811067510@mail.esn.co.in>
From: "Srinivas JT." <srinivasjt@esntechnologies.co.in>
Return-Path: <srinivasjt@esntechnologies.co.in>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040721125505.RUyMjcwgwFTU4DF4vGt4pUsaSwkw_3JAmFyaefFNBUc@z>

Dear All,
I am very new to this group.
I tried to load my .serc file into my Db1500 SDB. The steps that I followed are,

1) I wrote a filein C(Linux).
2) I generated an object file using gcc.
3) By using objcopy I converted my obj file into srec file.
4) Then I tried to download my srec file into Db1500 SDB in Yamon using tftp.

then I got error as,

Error: No match in TLB for mapped address  : Address = 0x00000000

Why I am getting this error ?. Is any error there in my procedure..?

Thanks in Advance.

Regards,
Srinivas JT
