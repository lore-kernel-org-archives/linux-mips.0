Received: from dinosaur (218-168-152-123.dynamic.hinet.net [218.168.152.123])
	by msr32.hinet.net (8.9.3/8.9.3) with SMTP id BAA19614
	for <linux-mips@linux-mips.org>; Sat, 16 Oct 2004 01:31:29 +0800 (CST)
Message-ID: <002f01c4b2dc$cd1262e0$7101a8c0@dinosaur>
From: =?big5?B?qkyr2KZ3?= <Mickey@turtle.ee.ncku.edu.tw>
Subject: Is there any means to use Cramfs and JFFS2 images as root disks?
Date: Sat, 16 Oct 2004 01:31:20 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Return-Path: <Mickey@turtle.ee.ncku.edu.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041015173120.rz0OY6MtSWy2uXowPoIgPg9OFriBmN05MPJyq0uJuVU@z>


Hello,
I had successfully booted up Linux with an NFS root.
Trying to boot up Linux with Cramfs and JFFS2 roots, I am wondering how to
pass parameters to Kernel.
I found that on some bootloaders, parameters are like these:
    rootfstype = jffs2 root=/dev/mtdblock3

But YAMON doesn't seem to support MTD BLOCK.
Therefore, how do I tell Kernel where the root image is on YAMON?

Thanks and regards,
Colin
