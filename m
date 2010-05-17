Received: from anti.mobis.co.kr ([211.217.52.67]:54148 "HELO
        sniper.mobis.co.kr" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S1491901Ab0EQT2g convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 May 2010 21:28:36 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: U-boot Hangs for MIPS32 Au1350 Processor
Date: Tue, 18 May 2010 04:28:20 +0900
Message-ID: <5858DE952C53A441BDA3408A0524130104CCE0BF@mkegmal01>
From: =?iso-8859-1?Q?=A0Gurumurthy_G_M?= <Gurumurthy.Gowdar@gmobis.com>
Return-Path: <Gurumurthy.Gowdar@gmobis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: linux-mips@fnet.fr
Message-ID: <20100517192820.ELBrlAtEyfH47Q4bjYOtWpKMsYB-ReLh6Fw9OUMs9U0@z>



Hi All,
       Am able to get some messages on serial port but it is hanging after DRAM initialization i.e. during relocate_code function, below is the debug messages on serial port.

I tried configuring SDRAM (DDR2) for 256 and 128 MB, but still the problem is same.

I am facing one typical problem in u-boot i.e. whenever i power on the board I will get below debug messages on serial port after 5 to 8 seconds and hangs at stack pointer.


U-Boot 2010.03 (May 14 2010 - 16:41:46)
Linux Advanced AVN Platform
CPU: Au1350, id: 0x80, rev: 0x01
DRAM:  256 MB
Address value =90000000Top of RAM usable for U-Boot at: 90000000
Reserving 161k for U-Boot at: 8ffd4000
Reserving 192k for malloc() at: 8ffa4000
Reserving 36 Bytes for Board Info at: 8ffa3fdc
Reserving 36 Bytes for Global Data at: 8ffa3fb8
Reserving 128k for boot params() at: 8ff83fb8
Stack Pointer at: 8ff83f98


U-Boot 2010.03 (May 14 2010 - 16:49:00)
Linux Advanced AVN Platform
CPU: Au1350, id: 0x80, rev: 0x01
DRAM:  128 MB
Address value =88000000Top of RAM usable for U-Boot at: 88000000
Reserving 161k for U-Boot at: 87fd4000
Reserving 192k for malloc() at: 87fa4000
Reserving 36 Bytes for Board Info at: 87fa3fdc
Reserving 36 Bytes for Global Data at: 87fa3fb8
Reserving 128k for boot params() at: 87f83fb8
Stack Pointer at: 87f83f98


U-Boot 2010.03 (May 14 2010 - 16:53:58)
Linux Advanced AVN Platform
CPU: Au1350, id: 0x80, rev: 0x01
DRAM:  256 MB
Address value =90000000Top of RAM usable for U-Boot at: 90000000
Reserving 161k for U-Boot at: 8ffd4000
Reserving 192k for malloc() at: 8ffa4000
Reserving 36 Bytes for Board Info at: 8ffa3fdc
Reserving 36 Bytes for Global Data at: 8ffa3fb8
Reserving 128k for boot params() at: 8ff83fb8
Stack Pointer at: 8ff83f98

Can you please share me your board config file and lowlevel_init.S file which you have ported u-boot for Au1550. I need it for the reference.

I am doing DDR2 initialization in u-boot as per YAMON source code that will create any problem?

please help me out to resolve the above issues.

Thanks in Advance

Regards,
Gurumurthy Gowdar
KPIT Cummins Infosystems Pvt Ltd
