Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708162033.WAA20565@informatik.uni-koblenz.de>
Subject: Re: boot linux - wish
Date: Sat, 16 Aug 1997 22:33:17 +0200 (MET DST)
In-Reply-To: <m0wzheO-0005FiC@lightning.swansea.linux.org.uk> from "Alan Cox" at Aug 16, 97 01:08:12 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: shaver@neon.ingenia.ca, miguel@nuclecu.unam.mx, ariel@sgi.com, linux@cthulhu.engr.sgi.com
Message-ID: <19970816203317.FVeqy7ojvXHBqsEORjFZEXfMTUlhVMjCvgOZ1sQ2ISo@z>

> > If I stick all the RH stuff in an initrd and then they do FTP install,
> > then they should be able to use it via boot /vmlinux or boot -f
> > bootp()..., no?
> 
> 2.1.4x blows up with an initrd - hopefully fixed in 2.1.50/soon but that
> means the SGI one will corrupt and explode atm

There are also additional MIPS bugs in the RAMdisk / initrd stuff.
Shame on me, I have not used (-> debugged) it since the new style
ramdisk code was merged ...

  Ralf
