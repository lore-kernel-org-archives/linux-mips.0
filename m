Received: from pmc216-241-226-184.pmc-sierra.bc.ca ([216.241.226.184]:43712
	"EHLO pmxedge2.pmc-sierra.bc.ca") by ftp.linux-mips.org with ESMTP
	id S20032684AbYENS0X convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 14 May 2008 19:26:23 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: Problem with binutils 
Date: Wed, 14 May 2008 11:26:09 -0700
Message-ID: <A7DEA48C84FD0B48AAAE33F328C0201401EF0B1B@BBY1EXM11.pmc_nt.nt.pmc-sierra.bc.ca>
References: <Pine.LNX.4.64.0805131444360.15369@wrl-59.cs.helsinki.fi> <20080513232507.GA24102@linux-mips.org> <20080513180225.194f400b.akpm@linux-foundation.org> <20080514150859.GA9898@linux-mips.org> <E06E3B7BBC07864CADE892DAF1EB0FBD07CEB326@NT-SJCA-0752.brcm.ad.broadcom.com>
From: "Anoop P.A." <Anoop_P.A@pmc-sierra.com>
Return-Path: <Anoop_P.A@pmc-sierra.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: ralf@linux-mips.org
Message-ID: <20080514182609.fkU_ZX2fuVgdpe3NfIlzT3bPmZ34M7iyijyMEzcdUZ8@z>

Hi,
 
currently I am using binutils 2.15.97 . I though of upgrade binutils 2.18 version( assembler 2.15.97 doesn't have support for mip34k specific instructions used for SMTC) .package is compiling properly and I am able to compile my BSP. But while booting I am unable to detect my embedded rootfs. If you do NFS mount it is booting properly 
( I am using .incbin directive  to add my rootfile system and I am suspecting problem with incbin directive comes from 2.18 . I am able use same code properly with 2.15.97 toolchain. anybody else faced this issue?). 
 
 
One thing I am observing that vmlinux(ELF) built with 2.15.97 contains 39 section while vmlinux built using 2.18 contains 28 sections only.
I am using GCC 3.4.5 and uClibc. 
 
Somebody please help me
 
Thanks
Anoop
 
 
