Message-ID: <013601c599c9$1fe2ca40$6cf9a8c0@ALEC>
Reply-To: "Alexander Voropay" <alec@artcoms.ru>
From: "Alexander Voropay" <alec@artcoms.ru>
References: <01a901c599a4$2f855280$3c67a8c0@netsity.com>
Subject: Re: Ramdisk issue please help!!!
Date: Fri, 5 Aug 2005 18:22:31 +0400
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="ISO-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <alec@artcoms.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: inpreet <singh.inpreet@netsity.com>, linux-mips@linux-mips.org
Message-ID: <20050805142231.OOLIgsFs8r5cU5ndrFRjFLz8IrjlbQg34LAelU-Kn5M@z>

"inpreet" <singh.inpreet@netsity.com> wrote:

>I am trying to build ramdisk image and launch bootsplash image at boot time. 
>Steps I followed:
>1. get splash image initrd.splash using splash binary.
...
>8. results in initrd.gz
>
>Now while compiling kernel image I am embedding initrd.gz into it. Here is what I am doing

 You don't need nothing special for *embedded *, not external "MIPS initrd" on a 2.4 kernels.
It works just fine from the CVS.

1) Prepare your "ramdisk.img" with EXT2FS/other FS
2) gzip it.
3) Put this "ramdisk.gz" into the  arch/mips/ramdisk/
4) Enable in the configfile :

CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_INITRD=y

CONFIG_EMBEDDED_RAMDISK=y
CONFIG_EMBEDDED_RAMDISK_IMAGE="ramdisk.gz"

5) make . Kernel build system will find this image automagically.

6) Run this kernel (vmlinux) without a "root=" parameter.

There is example of my kernel bootlog:

...
Determined physical RAM map:
 memory: 01800000 @ 00000000 (usable)
Initial ramdisk at: 0x801b1000 (593920 bytes)
...
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
...
RAMDISK: Compressed image found at block 0
Freeing initrd memory: 580k freed
VFS: Mounted root (ext2 filesystem) readonly.
...

root FS is mouned now as /dev/ram0

--
-=AV=-
