Received: from anti.mobis.co.kr ([211.217.52.67]:55237 "HELO
        sniper.mobis.co.kr" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S1492162Ab0EHUMl convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 8 May 2010 22:12:41 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: Exception in serial_init MIPS32
Date: Sun, 9 May 2010 05:12:29 +0900
Message-ID: <5858DE952C53A441BDA3408A0524130104CCE0AA@mkegmal01>
From: =?iso-8859-1?Q?=A0Gurumurthy_G_M?= <Gurumurthy.Gowdar@gmobis.com>
Return-Path: <Gurumurthy.Gowdar@gmobis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20100508201229.Wxl8LrxzaGDuC-8q66NQuW0d__9Tf7JgfULJU4_9q08@z>


Hi All,
       I am getting a exception in board.c , at the end of serial_init function i.e. when i access to stack pointer (SP).

The return address register ra value is not correct.

I am porting U-boot-2010.03 for MIPS32 Au1350 processor.

board specs:-

CPU Frequency - 396 MHz
System Bus Frequency - 198 MHz
SDRAM (DDR2) Frequency - 198 MHz

SDRAM Base address is  - 0x80000000
SP offset is  - 0x400000

I am able to read and write DDR2 SDRAM from BDI3000, but how to check whether my DDR2 SDRAM Configuration is working or not from U-Boot.

below is the error log file:-

Au1350>bi 0xbfc195c0
Breakpoint identification is 0
Au1350>go
- TARGET: core #0 has entered debug mode
Au1350>info
    Core number       : 0
    Core state        : Debug Mode
    Debug entry cause : exception
    Current PC        : 0xbfc195c0
    Current SR        : 0x00400000
    Current LR  (r31) : 0xbfc195bc
    Current SP  (r29) : 0x803fff90
    Current EPC       : 0x18222521
Au1350>ti
    Core number       : 0
    Core state        : Debug Mode
    Debug entry cause : single step
    Current PC        : 0xbfc195c4
    Current SR        : 0x00400000
    Current LR  (r31) : 0x440c0050
    Current SP  (r29) : 0x803fff90
Au1350>ti
    Core number       : 0
    Core state        : Debug Mode
    Debug entry cause : single step
    Current PC        : 0xbfc195c8
    Current SR        : 0x00400000
    Current LR  (r31) : 0x440c0050
    Current SP  (r29) : 0x803fff90
Au1350>ti
    Core number       : 0
    Core state        : Debug Mode
    Debug entry cause : single step
    Current PC        : 0x440c0050
    Current SR        : 0x00400000
    Current LR  (r31) : 0x440c0050
    Current SP  (r29) : 0x803fffb0
Au1350>ti
    Core number       : 0
    Core state        : Debug Mode
    Debug entry cause : single step
    Current PC        : 0xbfc00200
    Current SR        : 0x00400002
    Current LR  (r31) : 0x440c0050
    Current SP  (r29) : 0x803fffb0
Au1350>

please let me know whether SDRAM DDR2 configuration is wrong or am missing something. why am not able to access SP from U-boot.

Also SDRAM initialzation in YAMON and U-boot is totally different. please let me know which one is working fine.

With Thanks and Regards,
Gurumurthy Gowdar
KPIT Cummins Infosystems Pvt Ltd
