Received: from msx.realtek.com.tw (unverified [172.20.1.77]) by mf2.realtek.com.tw
 (Content Technologies SMTPRS 4.3.14) with ESMTP id <T6cc4c6aee3dc803816a20@mf2.realtek.com.tw> for <linux-mips@linux-mips.org>;
 Wed, 20 Oct 2004 22:03:43 +0800
Message-ID: <001301c4b6ad$70ce4420$8b1a13ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
Subject: Strange! Cannot use JFFS2 as root
Date: Wed, 20 Oct 2004 22:02:26 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041020140226.WytVZDZ5YXue30e8xBfrdLAK4yTAj3N6_M-TB6JNPo4@z>


Hi all,
I had booted up Linux with nfs root, and write a JFFS2 image to /dev/mtd1.
Here is my cmdline for Kernel:
     go 0x80305018 root=/dev/nfs rw nfsroot=172.19.26.145:/nfs/rootfs
ip=172.19.27.193::172.19.27.254:255.255.254.0:::
mtdparts=maltaflash:1536k(ldr),2048k(root)

After writing the JFFS2 image to /dev/mtd1, I can mount /dev/mtdblcok1 to
some directory.
    mount -t jffs2 /dev/mtdblock1 /mnt

Next, I hope to boot up Linux with JFFS2 root, and try to give this cmdline
to Kernel:
    go 0x80305018 rootfstype=jffs2
mtdparts=maltaflash:1536k(ldr),2048k(root) root=/dev/mtdblock1

and the Kernel would complain me about no root:
    VFS: Unable to mount root fs via NFS, trying floppy.
    Kernel panic: VFS: Unable to mount root fs on unknown-block(2,0)

I traced the code and found that when passing "/dev/mtdblock1" to
name_to_dev_t() in do_mounts.c, it would return 0 at every try_name(),
 which will fail at open() with the path "/sys/block/%s/dev".

What's the problem? Could anyone tell me?

Thanks and regards,
Colin
