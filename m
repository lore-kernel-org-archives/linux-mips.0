Subject: Re: Nomenclature: "MIPS32", "MIPS64"
Date: Mon, 6 Dec 1999 13:35:54 +0000 (GMT)
In-Reply-To: <00a201bf3fed$df8c82f0$0ceca8c0@satanas.mips.com> from "Kevin D. Kissell" at Dec 6, 99 02:29:06 pm
Content-Type: text
Message-ID: <E11uyJ2-0006Eb-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: ralf@oss.sgi.com, linux@cthulhu.engr.sgi.com
Message-ID: <19991206133554.EwugcC_ZMvweCX4GMK7m5tYa1pE1VAGyiPj4sCcYZGk@z>

> The problems are twofold.  First, while it is of course possible to create
> a kernel that will run on both MIPS64 and pre-MIPS64 MIPS-III and
> MIPS-IV CPUs, it is also possible to create a MIPS64 kernel that
> would not necessarily run on R10000s and vice versa.  Secondly,
> we are referring to two distinct things that ought to be distinguished
> at the source and documentation level.   We need a name for something 
> that is 64-bit-MIPS but not necessarily tied up with any particular CPU 
> and a distinct name for something that is compatible with a particular 
> CPU type.  "MIPS32" and "MIPS64" are already trademarked
> by MIPS to describe the CPUs, so we need another name for the 
> generic OS infrastructure for 64-bit MIPS registers/addresses.

I would suggest that until someone from MIPS legal specifically raises an issue
you don't worry about it. With the sparc people they were quite happy with
Linux/sparc - which denotes Linux for sparc systems (they objected to 
sparclinux as that implied it was their product). In fact given the "/" is
'for' then I don't think there is even a valid trademark issue to be raised.

Its also not in MIPS interest to cause trouble. Its a product for their
system. If they started being silly then everyones lawyers would be advising
them to pull their "xyz product for mips" as a legal precaution.
