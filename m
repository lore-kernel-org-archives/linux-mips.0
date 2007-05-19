Received: from ug-out-1314.google.com ([66.249.92.169]:39012 "EHLO
	ug-out-1314.google.com") by ftp.linux-mips.org with ESMTP
	id S20024043AbXESTHE (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Sat, 19 May 2007 20:07:04 +0100
Received: by ug-out-1314.google.com with SMTP id 40so620206uga
        for <linux-mips@linux-mips.org>; Sat, 19 May 2007 12:06:03 -0700 (PDT)
From: borasah@gmail.com
Subject: Au1200 and NAND Flash - K9F1G08U0A -
Date: Sat, 19 May 2007 22:13:11 +0300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-ID: <200705192213.12019.borasah@gmail.com>
Return-Path: <borasah@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org
Message-ID: <20070519191311.FFAWX-meMYY2t3JJM1eyRZ6exajW3MiO9jJHT5i5fUk@z>

Hi,

We want to use NAND flash on Alchemy Au1200 and have a custom board along with 
Db1200; so tried it both on our custom board and Db1200 without success.
(Because Db1200 has a slot we opened it and replaced the original with our 
part)

Kernel -> 2.6.20.1. Error messages:

NAND device: Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND 128MiB 3,3V 
8-bit)
Scanning device for bad blocks
Bad eraseblock 0 at 0x00000000
Bad eraseblock 1 at 0x00020000
...
Bad eraseblock 1022 at 0x07fc0000
Bad eraseblock 1023 at 0x07fe0000
Creating 2 MTD partitions on "NAND 128MiB 3,3V 8-bit":

It marks all the eraseblocks as BAD. As far as I understand 
"au1xxx_nand_command" seems doesnt work correctly. Has someone succeded to 
work with these large block parts in the Au1200/Au1550?

Thanks...

--
Bora SAHIN
