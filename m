Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Mon, 9 Jun 1997 11:42:26 -0700
Message-ID: <199706091842.LAA02169@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: Merge back of the MIPS sources
In-Reply-To: <199706061836.UAA18495@kernel.panic.julia.de>
References: <199706061807.LAA01554@piecomputer.engr.sgi.com>
	<199706061836.UAA18495@kernel.panic.julia.de>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@Julia.DE>
Cc: Bob Mende Pie <mende@piecomputer.engr.sgi.com>, ariel@sgi.com, linux@yon.engr.sgi.com
Message-ID: <19970609184226.SMxFa3fz0m1nwrt_8dWVTpBJK_D4lO1mVMesS1J0SG4@z>

Ralf Baechle writes:
 > >    Have you verified that the newest code still works on the other MIPS
 > > based systems?   Also, is it possible to have (linux) binary compatability
 > > between a mips Magnum or Millennium and an Indy?
 > 
 > By principle there is no problem to feed these machines even with IRIX
 > binaries.  Right now the port to these machines assumes that it is running
 > on the machine configured to little endian mode but porting to big endian
 > should be easy.

     Note, however, that running big-endian on the MIPS systems is a bit
of a hack.  They were originally designed to be little-endian-only (a MIPS
management aberration), so running big-endian means that, in general,
I/O DMA has to be byte-swapped by software.  RISCos would preferentially
write file systems on disks in native-endian format, which, if read on 
a different system, would appear to be byte-swapped within each doubleword.
That is, RISCos would skip the byte-swapping on non-removable media, unless
the magic number in the superblock indicated that the disk was initialized
in true big-endian format.  For all other media, RISCos would byte-swap,
but, since those were much lower data rate, the performance impact was
small.
