From: Julian Scheel <jscheel@activevb.de>
Subject: Re: [patch] VR4181A and SMVR4181A
Date: Mon, 17 Feb 2003 15:10:00 +0100
References: <20030213155833.56019323.yoichi_yuasa@montavista.co.jp> <200302170850.18887.jscheel@activevb.de> <20030217173419.732b2456.yoichi_yuasa@montavista.co.jp>
In-Reply-To: <20030217173419.732b2456.yoichi_yuasa@montavista.co.jp>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Message-ID: <200302171510.00299.jscheel@activevb.de>
Return-Path: <jscheel@activevb.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Yoichi Yuasa <yoichi_yuasa@montavista.co.jp>
Cc: linux-mips@linux-mips.org
Message-ID: <20030217141000.v4A9EPcHJqcRnwBhCtiy9cn5izVWAe7Bb5hRVUdCsho@z>

Hi Yoichi,

Am Montag, 17. Februar 2003 09:34 schrieb Yoichi Yuasa:
> I am using binutils-2.12.1 .
>
> I also try binutils-2.13.90.0.16 .
> The binutils option was changed, it was able to compile as the following
> options.
>
> GCCFLAGS        += -march=vr4100 -Wa,--trap
>
> I don't know yet about the details of new options.
> We need to investigate about the details of options.

This seems to work!

> You have to add -msoft-float, if you don't use FPU Emulator.
> FPU Emulator is used by the default.

Ok.

I have some more problems with the chip at present. I managed to build a 
kernel, but booting won't work.
I use the NEC Bootloader, and load the Image over a serial-connection to the 
Ram (address 0x8010000). The bootloader set the INTERNAL_REGISTERS_BASE to 
0xab000000. If I understand the starting-process, the kernel normally 
searches it at 0xbfa00000 which is the address, before the Bootloader changes 
it. This is set in include/asm-mips/nile4.h . It gets changed to 0x0a000000 
(set it smvr4181a.h).
Now I change the address in nile4.h to 0xab000000, so that the kernel should 
use the correct address and then changes it to his 0x0a000000.

I think this is the problem, because I get absolutely no output after the 
binary-download finished and should start.
Hopefully you can follow my explanation of the problem (c:

-- 
Grüße,
Julian
