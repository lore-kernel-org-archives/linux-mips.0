Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@Julia.DE>
Message-ID: <199704091006.MAA06864@kernel.panic.julia.de>
Subject: Re: serial consoles, sash and other wonders
Date: Wed, 9 Apr 1997 12:06:52 +0200 (MET DST)
In-Reply-To: <199704081948.MAA14047@fir.esd.sgi.com> from "William J. Earl" at Apr 8, 97 12:48:07 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.esd.sgi.com>
Cc: shaver@neon.ingenia.ca, linux@cthulhu.engr.sgi.com
Message-ID: <19970409100652.qcoXEh2iNAa_ic1IoscLGK06c2I6QJ8uWWrNVWrOh9k@z>

Hi,

>      By the way, it is pretty easy to write a little program to convert
> a kernel ELF binary to an ECOFF binary, discarding most of the symbols and
> other stuff, assuming you have the header files for the file formats.
> (The result would not be acceptable to many of the tools, such as dbx,
> but it would be bootable.)
> 
>      For a production linux for the Indy, the most reasonable approach,
> however, would be to make silo or whatever boot program you are using be
> ECOFF, so that old PROMs are supported.

I also have to deal with ARC machines (the little endian NT stuff).  By
definiton they have to support ECOFF; everything else is optional.  This
brings in the extra issue that the loader needs to be relocatable.
MIPS-ECOFF configurations of GCC can't do that and the linker dies when
loading ELF PIC code into an ECOFF executable.  Unfortunately fixing is
nontrivial.

The {Net,Open}BSD people already have a converter tool which they use to
generate their kernel executable.  It would solve the ld problems.
I did some work on it and I should probably finish it ...

  Ralf
