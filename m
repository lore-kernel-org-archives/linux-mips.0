Received: from jorg ([62.79.30.245])
	by smtp010.tiscali.dk (8.12.10/8.12.10) with ESMTP id j85BfYnW009084
	for <linux-mips@linux-mips.org>; Mon, 5 Sep 2005 13:41:34 +0200 (MEST)
From: =?iso-8859-1?Q?J=F8rg_Ulrich_Hansen?= <jh@hansen-telecom.dk>
Subject: Re: Howto Boot from Flash with the Alchemy AU1100
Date: Mon, 5 Sep 2005 13:41:34 +0200
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAb4ajDk58bkCNi0V1ZTQFHIKAAAAQAAAAS0TGHpU5zUWTXqf0fsiG9AEAAAAA@hansen-telecom.dk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-Path: <jh@hansen-telecom.dk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050905114134.G5Rg1Ime7wpzKNaSd6bKG9Nw5boUBw2qQBOMDduWlmU@z>


Start linux from flash at startup
The boot loader can be set up to automatically start Linux at power up.

Do the following:
To load kernel image into RAM on mb1100 type:
load

Then the image has to be copied to FLASH.
Erase block in FLASH:
erase bfd00000 2c0000

Copy image from RAM to FLASH:
copy a0100000 bfd00000 2c0000

When YAMON starts up it will process the start command, so that has to be
set up.
The kernel_entry address is not fixed so the start address has to be set up
for each new kernel
image. The start address can be read from the srec image file or it is
printed on the screen after
the load image command.

To set the start command:
set start 'copy bfd00000 a0100000 2c0000; go a032b018 \
root=/dev/mtdblock0 rootfstype=jffs2'


Start Linux with root file system mounted as jffs2
In a real world the root file system will normally be located in the FLASH
memory as a jffs2
partition. 
We will now copy a jffs2 image with the root file system to the FLASH.
