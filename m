Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@informatik.uni-koblenz.de>
Message-ID: <199605010233.EAA26130@informatik.uni-koblenz.de>
Subject: Re: scope of this mailing list
Date: Wed, 1 May 1996 04:30:58 +0200 (MET DST)
In-Reply-To: <Pine.LNX.3.91.960429200526.3781C-100000@redhat.com> from "Erik Troan" at Apr 29, 96 08:06:49 pm
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Erik Troan <ewt@redhat.com>
Cc: linux@neteng.engr.sgi.com
Message-ID: <19960501023058.ylPT1slHl4_uKpfGD-sHGqSwFFfO0JB0zWPtjI3w2gM@z>

Hi,

> > to get a Linux/MIPs distribution.  Furthermore, givem that Linux/MIPs
> > will run IRIX elf binaries, we might be able to merge the Freeware and
> > Linux/MIPs efforts - they have a lot of overlap.  Something to think 
> > about.
> 
> This raises a good question - what is the relationship between the SGI port,
> a port to Digital MIPS/TurboChannel machines, and the MIPS/PC port (that
> works on MIPS machines with PCI/EISA buses)? Will they all be the same
> endian? Should binarises be comaptible? What about sources such as libc
> and the kernel syscall interface?

The main issue in achieving binary compatibility accross all Linux/MIPS
targets is the byte order.  For some machines (Mips Magnum 4000, Olivetti
M700-10, SNI RM series and others more) the byte order for the kernel is
configurable.  For other it is fixed.  This is often the case for machines
that were built with NT in mind.

The MIPS architecture offers us the nice feature of switchable byteorder
for usermode.  Thus we have a way to run software from other systems with
differing native byte order.  In other words: it's technological possible
but it's not implemented yet.

The MIPS ABI which to support is one design goal for Linux/MIPS supports
only big endian systems while current Linux/MIPS implementations are all
little endian.  This single fact shows Linux/MIPS doesn't currently
conform to the ABI but it will be relativly easy to do so in the future.

The ABI explicitly forbids direct syscalls from the usercode into the
kernel.  Instead every program is supposed to be linked with the shared
library libc.so.1 which contains the actual interface to the kernel.
Linux/MIPS currently uses the GNU libc which is far being compliant
to the ABI.

Nevertheless Linux/MIPS contains an (currently on partial implemented)
syscall interface that provides not only the syscalls known from the
Linux/i386 implementation - it also features the same syscall conventions,
numbers and more as implemented in IRIX and other MIPS UNIX systems.
Call it a kludge but it can make things easier.

   Ralf
