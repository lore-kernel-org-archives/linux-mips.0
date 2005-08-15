Received: from msx.realtek.com.tw (unverified [172.21.1.77]) by mf2.realtek.com.tw
 (Clearswift SMTPRS 5.1.4) with ESMTP id <T72c632d8addc80381610fc@mf2.realtek.com.tw> for <linux-mips@linux-mips.org>;
 Mon, 15 Aug 2005 10:58:12 +0800
Message-ID: <006c01c5a144$e12c92d0$106215ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
Subject: Pthread problem in pthread_create() in uClibc
Date: Mon, 15 Aug 2005 10:56:05 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050815025605.W3DEEAWbrH8J5HZGaLgtyFHoFRJHT_SU_PDYAHcElmA@z>


Hi there,
We have encountered a pthread problem in pthread_create().
Our system is "MIPS Linux kernel 2.6.11 with uClibc 0.9.27". We need to know
if the problem is in Linux kernel or in uClibc.

When calling pthread_create(), it will fail at the line "suspend(self);".
I found that many people have encounter the same problem, but I havn't seen
any solution.
    http://www.uclibc.org/lists/uclibc/2003-April/006031.html
    http://www.uclibc.org/lists/uclibc/2004-June/009271.html
    http://www.uclibc.org/lists/uclibc/2003-July/006570.html

Here is the error message when I use gdbserver to debug it:
    "Cannot access memory at address 0x411104"

There is no this problem in "X86 Linux kernel 2.6.11 with uClibc 0.9.27".
Therefore, we need to know if this problem is because of that the MIPS Linux
kernel has some different thread behaviors from X86 Linux Kernel?

Regards,
Colin
