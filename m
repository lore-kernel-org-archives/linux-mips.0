From: "embedlf" <embedlf@citiz.net>
Subject: how I mount the root fs from ramdisk??
Mime-Version: 1.0
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: 8BIT
Date: Fri, 29 Aug 2003 17:35:5 +0800
Message-ID: <20030829092829Z8225217-1272+4649@linux-mips.org>
Return-Path: <embedlf@citiz.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.orglinux-mips@linux-mips.org
Message-ID: <20030829093505.pCzMKB7m63AZOPkZDpxFVw8QgnA_5OwNtjCJ5bP31MM@z>

linux-mips:
	I use mips cpu board to design my product. I want run linux embeded in this board.
But in this process,there is not harddisk on the board.
	So I should mount the root fs on ramdisk. Do you think so? I should make a ramdisk.

dd if=/dev/zero of=/dev/ram bs=1k count=2048
mke2fs -vm0 /dev/ram 2048
mount -t ext2 /dev/ram /mnt/ram
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
After I mount it, I should copy some files to this folder.I used cross_compiler,
compiling linux on X86 PC.How do I make the file /sbin/init??where is the source??

dd if=/dev/ram bs=1k count=2048 | gzip -v9 > /tmp/ram_image.gz

	

　　　　　　　　embedlf
　　　　　　　　embedlf@citiz.net
　　　　　　　　　　2003-08-29
