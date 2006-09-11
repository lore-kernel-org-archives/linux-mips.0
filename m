Received: from wip-ec-wd.wipro.com ([203.91.193.32]:64965 "EHLO
	wip-ec-wd.wipro.com") by ftp.linux-mips.org with ESMTP
	id S20038430AbWIKNzx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 11 Sep 2006 14:55:53 +0100
Received: from wip-ec-wd.wipro.com (localhost.wipro.com [127.0.0.1])
	by localhost (Postfix) with ESMTP id 4E892205F1
	for <linux-mips@linux-mips.org>; Mon, 11 Sep 2006 19:21:33 +0530 (IST)
Received: from blr-ec-bh01.wipro.com (blr-ec-bh01.wipro.com [10.201.50.91])
	by wip-ec-wd.wipro.com (Postfix) with ESMTP id 3ACA0205DE
	for <linux-mips@linux-mips.org>; Mon, 11 Sep 2006 19:21:33 +0530 (IST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: "Uncompressing Linux at load address"
Date: Mon, 11 Sep 2006 19:25:41 +0530
Message-ID: <2156B1E923F1A147AABDF4D9FDEAB4CB1727D5@blr-m2-msg.wipro.com>
In-Reply-To: <200609111530.14447.carlos.mitidieri@sysgo.com>
From: <hemanth.venkatesh@wipro.com>
Return-Path: <hemanth.venkatesh@wipro.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: carlos.mitidieri@sysgo.com, linux-mips@linux-mips.org
Message-ID: <20060911135541.ILobct_2AKFq7BhYE_4DP9NgbTY4fbKgBJ43aQCu_LU@z>

I had faced similar issue with AU1100 based boards which also use the
zImage patch. It turned out to be board initialization issue rather that
a zImage problem, since after uncompressing the image control is
transferred to kernel_entry.

Thanks
Hemanth

-----Original Message-----
From: linux-mips-bounce@linux-mips.org
[mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Carlos Mitidieri
Sent: Monday, September 11, 2006 7:00 PM
To: linux-mips@linux-mips.org
Subject: "Uncompressing Linux at load address"

Hi,

I am trying to boot a zImage from micromonitor on a csb655 board 
(Au1550 processor).

For that matter, I patched my kernel 2.6.15 with the zImage_2_6_10.patch
from 
Popov. 

In the arch/mips/boot/compressed/au1xxx/Makefile, I have set:
	1) RAM_RUN_ADDR=0xa0300000, which is the value got  from the
umon's 
APPRAMBASE environment variable.
	2) AVAIL_RAM_START=0x80500000
            AVAIL_RAM_END=0x80900000
     	3) LOADADDR =0x80100000, which is the same value I have set in
an 
entry for this board in arch/mips/Makefile.

I can compile and link the zImage with home build gcc cross tools, based
on 
gcc-3.4.4 and glibc-2.3.4 . When the (binary) zImage is decompressed on
the 
target, I get these messages: 

zImage: size=680372 base=0xa0300000
loaded at:     A0300000 A03A4000
zimage at:     A0306180 A03A3EE1
Uncompressing Linux at load address 80100000

and then the target resets.  
This zImage is very small, so the decompressed image is not going beyond
the 
AVAIL_RAM limits. Would you have any guess on what is going on?

I have looked for this information the list through, but anyone seems to
have 
had this problem before. Thanks for any comment.

-- 
Carlos Mitidieri
SYSGO AG - Office Ulm
Lise-Meitner-Str. 15
D-89081 Ulm
