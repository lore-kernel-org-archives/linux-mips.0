Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0y36d2-0005FsC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: TLB entries > 4kb
Date: Thu, 12 Feb 1998 21:57:07 +0000 (GMT)
In-Reply-To: <E0y36YO-00042j-00@imladris.demon.co.uk> from "David Woodhouse" at Feb 12, 98 09:52:19 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: David Woodhouse <Dave@imladris.demon.co.uk>
Cc: mingo@chiara.csoma.elte.hu, alan@lxorguk.ukuu.org.uk, ralf@uni-koblenz.de, linux-kernel@vger.rutgers.edu, linux@cthulhu.engr.sgi.com
Message-ID: <19980212215707.SL360MgKxVlBbsZzw50Iql9NNFQUdxT6IO2ofOk1T8M@z>

> >  The way its done is ok normally. I guess you need to make X over
> > Linux/RT call the rtlinux kernel to handle it. Note X _has_ to do
> > those global cli/sti's to meet hardware needs
> 
> GGI (well, KGI) should be able to fix both of these, shouldn't it?

Not for Linux/RT - the kernel cant do real cli/sti pairs. The stuff
would have to become an RTLinux graphics setup call set
