Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0yo7MG-000aOnC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: 5.1 installation fun & games...
Date: Mon, 22 Jun 1998 15:14:07 +0100 (BST)
In-Reply-To: <Pine.SGI.3.96.980622145123.18802A-100000@wintermute.reading.sgi.com> from "Leon Verrall" at Jun 22, 98 02:53:21 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Leon Verrall <leon@reading.sgi.com>
Cc: alan@lxorguk.ukuu.org.uk, linux@cthulhu.engr.sgi.com
Message-ID: <19980622141407.IIO08q9FL8rl877t_83HE0wea_8HNoah79Kw6g3XjE0@z>

> Hmmm. ALl of the dev devices were major/minor 0 0 so I've put them right
> using the kernel device numbers list. If nfs is not passing device numbers
> how exactly does this work (as it apparently does) or is this an SGI
> specific NFS thing...

Linux device numbers are major<<8|minor, SGI ones are split on a 
different boundary. NFSv2 doesnt indicate the boundary - so device
2,0 on linux may appear as 0,512 on Irix.

Alan
