Message-ID: <sc998a3c.062@quicklogic.com>
Date: Thu, 21 Mar 2002 07:22:02 -0800
From: "Dan Aizenstros" <daizenstros@quicklogic.com>
Subject: Re: Re: PCI VGA Card Initilization (SIS6326 / PT80)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: dom@algor.co.uk, fxzhang@ict.ac.cn, linux-mips@oss.sgi.com, girishvg@yahoo.com
Message-ID: <20020321152202.F2OHBsnXIXZjAvz2ajkBLUw2UeOqJGbNj-pN51w0dPg@z>

Hello Dominic,

Is Algorithmics BIOS emulator not the x86emu code
that can be found in the Alpha MILO and the XFree86
code base as Alan Cox mentioned?

That code was originally under GPL but was changed
to a BSD style license when Kendall Bennett took
over the project.

The code is available at the SciTech ftp site
ftp.scitechsoft.com/devel/x86emu/x86emu-0.8.tar.gz

Dan Aizenstros
Software Project Manager
QuickLogic Canada


>>> Dominic Sweetman <dom@algor.co.uk> 03/21/02 02:39 AM >>>

Zhang Fuxin (fxzhang@ict.ac.cn) writes:

> We have tried several cards on Algor P6032 board,but only matrox
> Gxxx cards (G450 needs the latest code) can be used by linux kernel
> without vga bios executed. With a x86 emulator we are able to use
> Riva TNT2,and probably more can work. Unfortunately that emulator is
> an executable from Algor, as a kindly help. We can't get more
> control on it and finally give up...

Just a note: Zhang, if you want source code of the Algorithmics
simulator, we've no problem at all supplying it on our standard
license.  

Whether that source is useful to you is another question: the BIOS
emulator was created out of pieces of a complete x86 emulator, and
it's a fairly complicated bit of software.

One of my colleagues saw Zhang's request and said he'd consult, and
then the message got lost - sorry.

Our standard license is not GPL and it does have one restriction - if
you build our software into something you sell, we ask you to get a
further license from us before you take the money from your customers.

We can be persuaded to put software out on GPL instead (as we did with
the floting-point emulation code).  But generally some commercial
organisation - the difference only matters then, right? - has to ask
nicely...

--
Dominic Sweetman
Algorithmics Ltd
The Fruit Farm, Ely Road, Chittering, CAMBS CB5 9PH, ENGLAND
phone +44 1223 706200/fax +44 1223 706250/direct +44 1223 706205
http://www.algor.co.uk
