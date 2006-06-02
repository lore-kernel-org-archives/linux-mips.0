Received: from [220.76.242.187] ([220.76.242.187]:3773 "EHLO
	localhost.localdomain") by ftp.linux-mips.org with ESMTP
	id S8133383AbWFBGfQ (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 2 Jun 2006 08:35:16 +0200
Message-ID: <005b01c6860e$5e99ce00$9d0ba8c0@mrv>
From: "Roman Mashak" <mrv@corecom.co.kr>
Subject: booting 64bit kernel on RM9150
Date: Fri, 2 Jun 2006 15:32:47 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="koi8-r";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <mrv@corecom.co.kr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: Raj Palani <Rajesh_Palani@pmc-sierra.com>, Kiran_Thota@pmc-sierra.com
Message-ID: <20060602063247.eHcIOyH65HxuvB6kOgCAAiIDMHlvdj8LhGk_LJxC2QQ@z>

Hello,

I succesfully compiled 2.6.12-rc3 (patched by PMC-sierra), but failed to 
boot it on Sequoia evaluation board. Firmware version is: PMON2000 1.9 
(SEQUOIA-EB).

What I understood is PMON can't deal with 64-bit images, that's why kernel 
image should be "objcopy'd" into ELF32 (so, result is two images: 64bit 
'vmlinux' and 32bit 'vmlinux.32'). So upon booting 'vmlinux.32' - board gets 
hang up:

Loading file: tftp://192.168.11.43/vmlinux.32 (elf)
0x80100000/2088944 + 0x80300000/774278 + 0x803bd086/139162(z) + 4044 syms-


With best regards, Roman Mashak.  E-mail: mrv@corecom.co.kr 
