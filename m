Received: from mansoor ([192.168.0.140])
	by pub.isofttechindia.com (8.11.0/8.11.0) with SMTP id iA9D18f31189
	for <linux-mips@linux-mips.org>; Tue, 9 Nov 2004 18:31:08 +0530
Message-ID: <04e601c4c65c$2fdc15a0$8c00a8c0@mansoor>
From: "mansoor" <mansoor@isofttech.com>
Subject: Disabling lwc0 instruction
Date: Tue, 9 Nov 2004 18:31:11 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <mansoor@isofttech.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041109130111.Nfb0MJBO0co8U38cgGHZ9yTxM9k1srnnaqq1VyBsYKo@z>

Hi all,

Iam working on lx4189. This core doesnt support 
"lwc0" instruction but my tool chain generates
this instruction.

So when I run some applications it throws 
"unknown instruction" exception.

How can solve this issue ?

I have few solutions but I dont know
whether its correct.


1) Re-build the toolchain with this instruction
    disbaled. But how to do this ?.
2) Write an exception handler to handle this 
    instruction. The exact replacement would be
    "mfc0". how to do this ?


Thanx in advance
Mansoor Ahamed Basheer
