Message-ID: <22a801bfb10f$5d7c5b80$0a00000a@decoy>
From: "Jay Carlson" <nop@nop.com>
References: <Pine.LNX.4.21.0004241837420.1735-100000@calypso.engr.sgi.com> <3904ED75.209AFD22@mvista.com> <u8og6xi6p9.fsf@gromit.rhein-neckar.de> <20000426130603.E757@uni-koblenz.de> <228c01bfb107$fb22c2f0$0a00000a@decoy>
Subject: Re: failed to compile glibc 2.1.2 - BFD_RELOC_16_PCREL_S2 problem
Date: Fri, 28 Apr 2000 08:43:33 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Jay Carlson <nop@place.org>, Ralf Baechle <ralf@oss.sgi.com>, Andreas Jaeger <aj@suse.de>
Cc: Jun Sun <jsun@mvista.com>, Ulf Carlsson <ulfc@calypso.engr.sgi.com>, linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr
Message-ID: <20000428124333.JFjwDNsvyudvzW8B5ficcxhoQXRP7YBEFJjZ3gU3WMA@z>

I wrote:

> 2.0 may still be the better choice on very space-constrained platforms
until
> there are good options for reducing the size of 2.2.  I mean, 2.2 is not
> huge, but on devices with 2M non-volatile store *total*, it's an obvious
> target.

To which I should add: I am very grateful for the work on 2.2.  It needs to
be done.  Many people will benefit from it, including me.  Great thanks to
Andreas!

The problems with code size are not Andreas's fault... :-)

Jay
