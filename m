Message-ID: <001901c05b67$8c88ab60$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.LNX.4.10.10011300938100.6504-100000@mail.netunlimited.net> <00f601c05ae8$19014500$0deca8c0@Ulysses> <20001201005942.A6172@bacchus.dhis.org>
Subject: Re: Indigo2 Kernel Boots!!!
Date: Fri, 1 Dec 2000 08:22:51 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Jesse Dyson <jesse@winston-salem.com>, Klaus Naumann <spock@mgnet.de>, linux-mips@oss.sgi.com
Message-ID: <20001201072251.vuBwxliPWRuS1BAMcBdJixFntWSZFsdLEeFAYVjoLqc@z>


> > When the init process fires up, it opens /dev/console as the
> > console output device.  A default SGI workstation installation
> > file system will have /dev/console bound to the major/minor device
> > node of the graphics display console.  If you want to run with a serial
> > console, you must therefore change this to bind /dev/console
> > to the serial port.  You can do this by doing an explicit mknod,
> > or by linking to the appropriate serial port device node,
> > which is usually /dev/ttyS0.
>
> Which both are wrong.  /dev/console should be a char device major 5, minor
1.
> There is no need to change this ever except for very old kernels.  With
2.2
> or 2.4 whenever people change /dev/console's major/minor it's usually
painting
> over some bug.

Having been through the exercise a dozen or more times with
the SGI 2.2 kernel distributions for the Indy, I would be fascinated
to know what bug I was painting over, and where the correct
procedure was documented.

            Kevin K.
