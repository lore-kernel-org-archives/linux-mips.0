Received: from anti.mobis.co.kr ([211.217.52.67]:58244 "HELO
        sniper.mobis.co.kr" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S1492218Ab0D1Tzx convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 28 Apr 2010 21:55:53 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: Facing problems U-boot Porting on MIPS32 Au1350
Date: Thu, 29 Apr 2010 04:55:39 +0900
Message-ID: <5858DE952C53A441BDA3408A0524130104CCE0A1@mkegmal01>
From: =?iso-8859-1?Q?=A0Gurumurthy_G_M?= <Gurumurthy.Gowdar@gmobis.com>
Return-Path: <Gurumurthy.Gowdar@gmobis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20100428195539.05ZBjpk6G3HEMi1-lhGVQDXkm1gZfnlir_FtK2OlrMc@z>



Hi,
   i have one doubt regarding the configuring and working on serial port. In Free scale processors I used to #define the console write to smc or scc ( mpc8280 uart ports) .

But here i don't think console write or console debug messages are configured to UART2 ( Debug Port) of Au1350. If not then how console port UART2 is taken though serial_init will initialize UART2.

my concern is how output of printf or puts or debug messages is displayed on MIPS au1350 console( uart2 is debug port).

If am right by defining configs/dbau1x00.h it will just initialize the serial port and baud rate.

need help if am missing something regarding debug console.

Regards,
Gurumurthy
