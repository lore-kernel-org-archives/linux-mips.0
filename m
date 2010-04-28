Received: from anti.mobis.co.kr ([211.217.52.67]:35305 "HELO
        sniper.mobis.co.kr" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S1492148Ab0D1Mrc convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 28 Apr 2010 14:47:32 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: MIPS ROM Exception Handler Error
Date: Wed, 28 Apr 2010 21:47:20 +0900
Message-ID: <5858DE952C53A441BDA3408A0524130104CCE09C@mkegmal01>
From: =?iso-8859-1?Q?=A0Gurumurthy_G_M?= <Gurumurthy.Gowdar@gmobis.com>
Return-Path: <Gurumurthy.Gowdar@gmobis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20100428124720.vVQvqw6VzwboRea8GZKS569QJFphT0JPW5XCwFbzQ28@z>



Hi all,
       I am porting U-boot-2010.03 on MIPS32 Architecture ( au1350 processor). u-boot is compiled for little endian and downloaded the u-boot.bin file to NOR Flash.After reset followed by go command , I observe that cpu hangs at 0xbfc00570 (ROM Exception Handler).

we are using BDI3000 debugger and bdiGDB for programming.

please let me know where is the problem? whether I am missing something.

Regards,
Gurumurthy
