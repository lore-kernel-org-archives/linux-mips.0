Message-ID: <006a01c214b2$22e59280$0b01a8c0@w2k30g>
From: "David Christensen" <dpchrist@holgerdanske.com>
References: <20020615091631.20470.qmail@email.com>
Subject: Re: Kernel - arch support(mips)
Date: Sat, 15 Jun 2002 14:16:13 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Cc: Domcan Sami <domca_psg@email.com>
Message-ID: <20020615211613.hKkxvPAH-R8_DcKdijT14MZq_Ho3hkXcEwJ81oLFX4g@z>

linux-mips@oss.sgi.com:

> 1)I'm using is a Galileo Board EV64120A.
> 2)It is a raw embedded target & does not support Linux. I'm trying to
> print a string by compiling code with RM7000 & directing the output
> via Serial Port to a WinNT HyperTerminal.

Searching on Google, it looks like you have a EV64120A-7000 made by
Galileo Technology, Inc..  It is a PCI card that plugs into a PC, and
includes the PMON ROM monitor in flash.  Galileo appears to have been
sold to Marvell (www.marvell.com).  I don't see support or search links
on the Marvell web site.  I don't see Galileo or EV64120A on their
product page.  I suggest you send them an e-mail asking if and what
support is available.


I was going to recommend the SDE-MIPS toolkit by Algorithmics, but I
don't see your board in their Programmer's Guide.  Try asking them if
they support it:

    http://www.algor-uk.com/


To be blunt, trying to make an older, slower, and unsupported board work
is going to be difficult.  It might not be possible.  If you can, get a
current, complete, and well-supported MIPS development system -- board,
ICE/JTAG, ROM monitor/ embedded OS, development toolchain, etc..


David Christensen
dpchrist@holgerdanske.com
