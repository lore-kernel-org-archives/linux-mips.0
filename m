Received: from nssinet2.co-nss.co.jp (localhost [127.0.0.1])
	by nssinet2.co-nss.co.jp (8.9.3/3.7W) with ESMTP id KAA06155
	for <linux-mips@linux-mips.org>; Tue, 7 Dec 2004 10:03:19 +0900 (JST)
Received: from nssnet.co-nss.co.jp (nssnet.co-nss.co.jp [150.96.64.250])
	by nssinet2.co-nss.co.jp (8.9.3/3.7W) with ESMTP id KAA06151
	for <linux-mips@linux-mips.org>; Tue, 7 Dec 2004 10:03:19 +0900 (JST)
Received: from NUNOE ([150.96.160.60])
	by nssnet.co-nss.co.jp (8.9.3+Sun/3.7W) with SMTP id JAA03088
	for <linux-mips@linux-mips.org>; Tue, 7 Dec 2004 09:54:17 +0900 (JST)
Message-ID: <001101c4dbf9$1da02270$3ca06096@NUNOE>
From: "Hdei Nunoe" <nunoe@co-nss.co.jp>
Subject: HIGHMEM
Date: Tue, 7 Dec 2004 10:07:26 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="iso-2022-jp";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <nunoe@co-nss.co.jp>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041207010726.xdJWL1ok0OTKb0awjdZ3U4pl1agkRUqX0KnYnkG2ZBs@z>

Hi there,

Has anyone succeeded the HIGHMEM with discontiguous physical memory?
I am using kernel 2.4.18 on TX4937 with two chunks of 256Mbyte memory.
There is 256Mbyte gap in between the physical memory blocks - lower 
memory is 0x00000000 to 0x10000000, upper memory is 0x20000000 to
0x30000000.  System hungs when it create INIT process.

Cheers,
-hdei
