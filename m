Message-ID: <004d01c4b710$419ffbe0$8b1a13ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
References: <001301c4b6ad$70ce4420$8b1a13ac@realtek.com.tw> <41767409.5010209@ieee.org>
Subject: Re: Strange! Cannot use JFFS2 as root
Date: Thu, 21 Oct 2004 09:49:47 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: charles.eidsness@ieee.org
Cc: linux-mips@linux-mips.org
Message-ID: <20041021014947.msJkWd1ylPLyycm1zy6ENbIOCp6Gf1bHKe_0ILhNAw4@z>


Hi Charles,
Thank you. It works by your way.
I had already tried "root=1f:01" and it didn't work, and then I spent whole
day to test it... :-(
It seems that "root=1f01" and "root=31:01" are both acceptable.

Thanks and regards,
Colin

----- Original Message ----- 
From: "Charles Eidsness" <charles.eidsness@ieee.org>
To: "colin" <colin@realtek.com.tw>
Cc: <linux-mips@linux-mips.org>
Sent: Wednesday, October 20, 2004 10:19 PM
Subject: Re: Strange! Cannot use JFFS2 as root


> Hi Colin,
>
> I had a similar problem. You're passing root=/dev/mtdblock1 which has a
> major value of 31 and a minor value of 1 but the by the looks of the
> error message the kernel thinks you want to boot from a device with a
> major number of 2 and a minor number of zero. You could try passing an
> explicitly defined root=1F01 instead (major 31, minor 1). This works for
> me. I have no idea why the kernel doesn't recognize the text based
> declaration and haven't had time to investigate. Maybe someone else has
> a better idea than I do.
>
> Hope that helps,
> Charles
>
> colin wrote:
> > Hi all,
> > I had booted up Linux with nfs root, and write a JFFS2 image to
/dev/mtd1.
> > Here is my cmdline for Kernel:
> >      go 0x80305018 root=/dev/nfs rw nfsroot=172.19.26.145:/nfs/rootfs
> > ip=172.19.27.193::172.19.27.254:255.255.254.0:::
> > mtdparts=maltaflash:1536k(ldr),2048k(root)
> >
> > After writing the JFFS2 image to /dev/mtd1, I can mount /dev/mtdblcok1
to
> > some directory.
> >     mount -t jffs2 /dev/mtdblock1 /mnt
> >
> > Next, I hope to boot up Linux with JFFS2 root, and try to give this
cmdline
> > to Kernel:
> >     go 0x80305018 rootfstype=jffs2
> > mtdparts=maltaflash:1536k(ldr),2048k(root) root=/dev/mtdblock1
> >
> > and the Kernel would complain me about no root:
> >     VFS: Unable to mount root fs via NFS, trying floppy.
> >     Kernel panic: VFS: Unable to mount root fs on unknown-block(2,0)
> >
> > I traced the code and found that when passing "/dev/mtdblock1" to
> > name_to_dev_t() in do_mounts.c, it would return 0 at every try_name(),
> >  which will fail at open() with the path "/sys/block/%s/dev".
> >
> > What's the problem? Could anyone tell me?
> >
> > Thanks and regards,
> > Colin
> >
> >
> >
> >
> >
> >
