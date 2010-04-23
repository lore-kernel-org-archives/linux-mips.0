Received: from anti.mobis.co.kr ([211.217.52.67]:34087 "HELO
        sniper.mobis.co.kr" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S1491036Ab0DWFin convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 23 Apr 2010 07:38:43 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: Porting U-boot on MIPS (Au1350)
Date: Fri, 23 Apr 2010 14:38:30 +0900
Message-ID: <5858DE952C53A441BDA3408A0524130104CCE08F@mkegmal01>
From: =?iso-8859-1?Q?=A0Gurumurthy_G_M?= <Gurumurthy.Gowdar@gmobis.com>
Return-Path: <Gurumurthy.Gowdar@gmobis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20100423053830.ejBthEcJ9hmJqYPGk5zdlMkS3gXwpzYAvOT8UbIUWjg@z>



Hi All,
       we are porting U-boot 1.2.0 to MIPS32 Au1350 Processor. i am using ELDK 4.1 for MIPS32. 

Thanks wolfgang now am able to compile toolchain for mips after using ELDK for MIPS.

Now while porting U-boot to Au1350 MIPS32 we are facing following problems mentioned below. 

We have a MIPS CPU which has reset address 0xBFC00000 , this is mapped to NOR flash with XIP in place. The boot block  ( ie 0xBFC00000) is in the top block of the NOR flash and its of 16KB. U-Boot shall be put from address 0xBFC00000 in the NOR flash for CPU boot up , since it is the last block (16KB only) we cannot put complete U-Boot , some part of the U-Boot should go to lower blocks . To do this u-boot need to be divided into blocks and we shall provide a jump from the top block to other blocks of NOR flash. We have BDI3000 debugger for flashing the NOR flash and bdiGDB for MIPS.

Is there any NOR flash drivers available which can support the below chip?

NOR Flash chip : M29W160ET --> AM29BX16
NOR Flash chip size is 0x00200000 --> 2MB

MIPS CPU Clock is 660MHz
System Bus is 330MHz
SDRAM bus clock is 165MHz


please let me know if am going wrong anywhere or missing out something.

With Regards,
Gurumurthy Gowdar
KPIT Cummins Infosystems Ltd
