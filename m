Received: from ghgp8w6dvrof4f ([192.168.0.107])
	by pub.isofttechindia.com (8.11.0/8.11.0) with SMTP id h8B637t03755
	for <linux-mips@linux-mips.org>; Thu, 11 Sep 2003 11:33:07 +0530
From: "durai" <durai@isofttech.com>
Subject: unresolved symbol dptoli
Date: Thu, 11 Sep 2003 11:33:07 +0530
Message-ID: <BLEMJDCPNEFOILECKALMMEDICAAA.durai@isofttech.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <durai@isofttech.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030911060307.3nb3ToD20JjlqsXLIrE22hYPwMEA8LgB-R_GYrq3_Ds@z>


hi,
i compiled a wireless lan driver using the mips-linux-gcc compiler 2.95.3.
When i try to insmod the driver i got the following errors. any ideas?

insmod: unresolved symbol dptoli
insmod: unresolved symbol dpmul
insmod: unresolved symbol litodp

Note that, i havent used any of these above functions in my code. It appears
only in the .o files


Durairaj P
Senior Software Engineer
Integrated SoftTech Solutiond Pvt. Ltd
Chennai 600 018
India
Tel : +91(44)2436 4915 Ext 88
www.isofttech.com
