Received: from msx.realtek.com.tw (unverified [172.20.1.77]) by mf2.realtek.com.tw
 (Content Technologies SMTPRS 4.3.14) with ESMTP id <T6ccd6b21aadc803816a20@mf2.realtek.com.tw> for <linux-mips@linux-mips.org>;
 Fri, 22 Oct 2004 14:20:18 +0800
Message-ID: <010201c4b7ff$08bcf040$8b1a13ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
Subject: Use Cramfs as root
Date: Fri, 22 Oct 2004 14:19:01 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041022061901.7RYJfajAh3EZ7N6iDFeXs5nDs1AmTeW4QIEsCajaeGE@z>


Hi all,
I had successfully used JFFS2 as root.
Then I tried to use the same way to use Cramfs as root, and it cannot work.

Use JFFS2 as root:
    mtd/util/mkfs.jffs2 -d root root.jffs2
    go 0x802b2018 rootfstype=jffs2 root=31:01
mtdparts=maltaflash:1536k(ldr),2048k(root)

Use Cramfs as root:
    /sbin/mkfs.cramfs root root.cramfs
    go 0x802b2018 rootfstype=cramfs root=31:01
mtdparts=maltaflash:1536k(ldr),2048k(root)

Error message:
    VFS: Cannot open root device "31:01" or unknown-block(31,1)
    Please append a correct "root=" boot option
    Kernel panic: VFS: Unable to mount root fs on unknown-block(31,1)


I donot know the right way to boot up Linux with cramfs root image.
There is not much information about it.
Could anyone give me a clue?

Thanks and regards,
Colin
