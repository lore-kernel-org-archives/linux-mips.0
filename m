Message-ID: <228c01bfb107$fb22c2f0$0a00000a@decoy>
From: "Jay Carlson" <nop@nop.com>
References: <Pine.LNX.4.21.0004241837420.1735-100000@calypso.engr.sgi.com> <3904ED75.209AFD22@mvista.com> <u8og6xi6p9.fsf@gromit.rhein-neckar.de> <20000426130603.E757@uni-koblenz.de>
Subject: Re: failed to compile glibc 2.1.2 - BFD_RELOC_16_PCREL_S2 problem
Date: Fri, 28 Apr 2000 07:50:36 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>, Andreas Jaeger <aj@suse.de>
Cc: Jun Sun <jsun@mvista.com>, Ulf Carlsson <ulfc@calypso.engr.sgi.com>, linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr
Message-ID: <20000428115036.aKt6RFc4KuD7-nMYL-mUQqVY1_QWreICPoGOVhlFB1U@z>

Ralf Baechle writes:

> All in all I think that given the work that has been invested into making
> a solid 2.2 port 2.2 might soon be the better choice than 2.0 and
> source compatibility issues should make a port of 2.1 mostly a non-issue.

If my builds of 2.1 are any indication:

2.0 may still be the better choice on very space-constrained platforms until
there are good options for reducing the size of 2.2.  I mean, 2.2 is not
huge, but on devices with 2M non-volatile store *total*, it's an obvious
target.

I am not volunteering to work on this (yet), but I suspect that people who
care intensely about size will have to start digging around in the link
maps.  H. J. Lu has done some of the work in this direction already.

On the other hand, maybe the really tiny devices will go away.

Jay
