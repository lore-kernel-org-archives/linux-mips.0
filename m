Received: from mail.windriver.com ([147.11.1.11]:45961 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S1491200Ab0IWBOU convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Sep 2010 03:14:20 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
Subject: RE: Which Linux driver (source code) is used for tty0 (console) on MALTA? 
Date: Thu, 23 Sep 2010 03:13:57 +0200
Message-ID: <52CF90264091A14888078A031D780F4306C8C0F6@ism-mail03.corp.ad.wrs.com>
In-Reply-To: <AEA634773855ED4CAD999FBB1A66D07601113E58@CORPEXCH1.na.ads.idt.com>
References: <AEA634773855ED4CAD999FBB1A66D07601113E58@CORPEXCH1.na.ads.idt.com>
From: "Chen, Tiejun" <Tiejun.Chen@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: "Ardelean, Andrei" <Andrei.Ardelean@idt.com>, linux-mips@linux-mips.org
Message-ID: <20100923011357.eX9NoUmH1RdahW4qpkSmWpcUJdB9w3ZeWO5_3WYex6U@z>

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of 
> Ardelean, Andrei
> Sent: Thursday, September 23, 2010 2:49 AM
> To: linux-mips@linux-mips.org
> Subject: Which Linux driver (source code) is used for tty0 
> (console) on MALTA? 
> 
> Hi,
> 
> I am using MALTA and my goal is to port MIPS Linux on a new platform.
> Which driver (source code) is used for tty0 (console)? I see 
> the support for "early console" but I think that this is not 
> the real Linux driver used after boot stage.

$ cat arch/mips/configs/malta_defconfig | grep SERIAL
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set

Cheers
Tiejun

> 
> More general, how to find which code source is used for an 
> embedded driver (part of the Kernel at compiling time) for 
> each h/w resource.
> MIPS Linux distribution comes with a lot of drivers but I 
> have difficulties to figure out which one is used for MALTA. 
> Is it a files where all those are registered?
> 
> Thanks,
> Andrei
>   
> 
> 
