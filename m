From: "Y.H. Ku" <iskoo@ms45.hinet.net>
Subject: RE: BootLoader on MIPS
Date: Tue, 26 Mar 2002 18:09:13 +0800
Message-ID: <NGBBILOAMLLIJMLIOCADOENICCAA.iskoo@ms45.hinet.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
In-Reply-To: <3C9FAEB5.2070201@mvista.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: Marc Karasek <marc_karasek@ivivity.com>, linux-mips@oss.sgi.com
Message-ID: <20020326100913.V1RFopauVZW4dchSomAeM9zyRaVzPnP48HqM4oNu3x4@z>

Ya,
I have traced the PMON code (www.carmel.com/pmon/) with NEC DDB5476 board (linux package from Montavista),
(LSI Logic' Software Support Package for MIPS processors version 5.3.33)

However, though it seem clear that function "_go" of pmon/head.S transfer control to client program
by "j k0" (a exception)
BUT I do not understand what information tha PMON transfer to LINUX-MIPS KERNEL
I found the KERNEL's entry is "kernel_entry" of ~arch/mips/kernel/head.S.
But, I can not find any information just like "board information" be transferred well.
where is it!? using sp register with "j k0" command?
where is the memory setting be transferred?
What MIPS LINUX needed!?
(PPCBOOT to PPC-LINUX is clear with a board_info struct, initrd_start and initrd_end ... and work well...

REALLY thanks for help,
--Ku






-----Original Message-----
From: owner-linux-mips@oss.sgi.com
[mailto:owner-linux-mips@oss.sgi.com]On Behalf Of Jun Sun
Sent: Tuesday, March 26, 2002 7:12 AM
To: Y.H. Ku
Cc: Marc Karasek; linux-mips@oss.sgi.com
Subject: Re: BootLoader on MIPS


Y.H. Ku wrote:

> Hi everybody,
> 
> I trace PMON into mips.S, and find the entry "_go".
> the entry transfer control to client prog.
> 
> I am confused of what information PMON transfer to MIPS's BOOTLOADER
> and transfer to which entry point of BOOTLOADER.
> 
> I found the bd_t struct of PPCBOOT.h for PPCBOOT package on POWERPC platform.
> It is corresponding POWERPC-LINUX data structure bd_info in ~/include/asm/mbx.h 
> (register r3~r7)
> 
> I just can not find the entry for MIPS's one. (can not find corresponding baget.h's one)
> 
> Could anybody tell me what is the information (register inforation) PMON transfer
> to bootloader?
> 
> Or anybody can disscuss with me,
> 


NEC provides PMON for DDB5476.  You should be able to get it if it is not
already on the board.

Jun
