Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0wzheO-0005FiC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: boot linux - wish
Date: Sat, 16 Aug 1997 13:08:12 +0100 (BST)
In-Reply-To: <199708160105.VAA26202@neon.ingenia.ca> from "Mike Shaver" at Aug 15, 97 09:05:34 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: miguel@nuclecu.unam.mx, ariel@sgi.com, linux@cthulhu.engr.sgi.com
Message-ID: <19970816120812.d1Fh_Sz0xD8eenbmLzcE_YQg2bB5wyjmEnT0EpSZKnI@z>

> If I stick all the RH stuff in an initrd and then they do FTP install,
> then they should be able to use it via boot /vmlinux or boot -f
> bootp()..., no?

2.1.4x blows up with an initrd - hopefully fixed in 2.1.50/soon but that
means the SGI one will corrupt and explode atm
