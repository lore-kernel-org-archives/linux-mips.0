Received: from anti.mobis.co.kr ([211.217.52.67]:48951 "HELO
        sniper.mobis.co.kr" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S1491085Ab0EMGvL convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 13 May 2010 08:51:11 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: Linux on Au1350 using Yamon
Date: Thu, 13 May 2010 15:49:45 +0900
Message-ID: <5858DE952C53A441BDA3408A0524130104E05782@mkegmal01>
References: <5858DE952C53A441BDA3408A0524130104E05781@mkegmal01> <4BEB9644.8040106@windriver.com>
From: "Sanjay Kumar" <sanjay.kumar@gmobis.com>
Return-Path: <sanjay.kumar@gmobis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "tiejun.chen" <tiejun.chen@windriver.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20100513064945.L2ru6Iu-psobZ6au099hdoMJgix_IPQCCuQQJ1R8HeM@z>



Hi Tiejun,
Thanks for the inputs , I will look into this and let you know the outcome.

-Sanjay


-----Original Message-----
From: tiejun.chen [mailto:tiejun.chen@windriver.com]
Sent: Thu 5/13/2010 3:03 PM
To: Sanjay Kumar
Cc: linux-mips@linux-mips.org
Subject: Re: Linux on Au1350 using Yamon
 

Sanjay Kumar wrote:
> Hi ,
> 
> We are trying to port Linux on Au1350 Board. We are using Linux port of db1300 board. We have Yamon bootloader running on the board.
> 
> The board does not have Ethernet port ,so we are loading Linux and rootfile system thru serial port and running using "go" command from Yamon. Linux is working as expected.
> 
> We have BDI3000 debugger and was wondering if it is possible to load the kernel and rootfile system to SDRAM using the debugger and execute it using Yamon ?
> 
> 
> 
> I tried this but could not succeed . Below are the steps I tried :
> 
> 
> 
> 1. Start Yamon using BDI.
> 
> 2. Halt the CPU and dump the kernel and rootfile system to SDRAM at free memory location ( 0x80093bf8 as per Yamon prompt).
> 
> 3. We observed TLB exception while loading .
> 
>    "
> 
>    Au1350>load 0x80093bf8 vmlinux-rmi.srec srec

I'm not sure if BDI can load .srec file, unless it can parse srec syntax.

> 
>    Loading vmlinux-rmi.srec , please wait ....
> 
>    # TLB exception raised
> 
>    "
> 
>    If we reset the target using BDI reset command and then load is successful.
> 
> 
> 
> 4. After load we gave go command from BDI to start the yamon.
> 
> 5. Memory dump from Yamon shows correct download , but when I gave go command followed by load address its giving exception.
> 

You should dump memory to compare vmlinux directly, not vmlinux.srec. .srec did
wrapper on vmlinux.

> "                                                      
> 
> YAMON> go 0x80093bf8  

And this is not correct start address since the start address is not same as
load address on YAMON.

Firstly you should get the offset from entry address to load address on vmlinux.
You can refer to Makefile and System.map. Then add this offset on your real load
address to get your real entry address.

Best Regards
Tiejun


> 
>                                                                                 
> 
> * Exception (user) : TLB (load or instruction fetch) *                          
> 
>                                                                                 
> 
> CAUSE    = 0x00808008  STATUS   = 0x00000002                                    
> 
> EPC      = 0x8010201c  ERROREPC = 0xb02f52ce                                    
> 
> BADVADDR = 0x000008c2                                                           
> 
>                                                                                 
> 
> $ 0(zr):0x00000000  $ 8(t0):0x00000000  $16(s0):0x00000000  $24(t8):0x00000000  
> 
> $ 1(at):0x00000000  $ 9(t1):0x00000000  $17(s1):0x00000000  $25(t9):0x00000000  
> 
> $ 2(v0):0x00000000  $10(t2):0x00000000  $18(s2):0x00000000  $26(k0):0x00000000  
> 
> $ 3(v1):0x00000000  $11(t3):0x00000000  $19(s3):0x00000000  $27(k1):0x00000000  
> 
> $ 4(a0):0x00000001  $12(t4):0x00000000  $20(s4):0x00000000  $28(gp):0x00000000  
> 
> $ 5(a1):0x80087340  $13(t5):0x00000000  $21(s5):0x00000000  $29(sp):0x80093be8  
> 
> $ 6(a2):0x00000000  $14(t6):0x00000000  $22(s6):0x00000000  $30(s8):0x80093be8  
> 
> $ 7(a3):0x10000000  $15(t7):0x00000000  $23(s7):0x00000000  $31(ra):0x8002f608  
> 
>                                                                                 
> 
> YAMON>
> 
> "
> 
> 
> 
> Any suggestion will be highly appreciated.
> 
> 
> 
> Thanks
> 
> Sanjay
> 
> 
