From: "Jay Carlson" <nop@nop.com>
Subject: RE: questions on the cross-compiler
Date: Fri, 5 Jan 2001 20:46:43 -0500
Message-ID: <KEEOIBGCMINLAHMMNDJNGEFGCAAA.nop@nop.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <006c01c07765$fdd26440$0deca8c0@Ulysses>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: "Kevin D. Kissell" <kevink@mips.com>, "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Lisa.Hsu@taec.toshiba.com
Cc: linux-mips@oss.sgi.com
Message-ID: <20010106014643.rTHAYDpB1TGfd5pTaKlRk24mOra02xSQeuZ6SSsF_c0@z>

Kevin D. Kissell writes:

> Lisa's underlying problem may be that there isn't a Config
> option for the R39xx CPUs, and she's ended up getting an
> R4000 (or whatever) configuration by default.
>
> At some point specific support for the R3900 features
> (MIPS II ISA, seperate hardware interrupt vector, etc.)
> should go into the kernel,
[...]

http://cvs.sourceforge.net/cgi-bin/cvsweb.cgi/linux/arch/mips/r39xx/?cvsroot
=linux-vr

The TX3912 is supported by the Linux VR kernel tree.  I'm not sure it's been
tested in a while, but kernel sources from a few months ago run nice on my
VTech Helio.

Jay
