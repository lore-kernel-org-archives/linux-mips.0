Message-ID: <002201c0e8d7$8c9ebd80$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <200105291545.IAA13454@saturn.mikemac.com>
Subject: Re: MIPS_ATOMIC_SET again (Re: newest kernel 
Date: Wed, 30 May 2001 09:09:50 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Joe deBlaquiere <jadb@redhat.com>, Mike McDonald <mikemac@mikemac.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010530070950.OX3YwCj9hL9bjF-maY0PYIc9MG10rBoAS6_E3ZQmxpU@z>

> >>>>  Are vr41xx plain ISA I or crippled ISA II+ CPUs?
> >>>
> >>> Actually, they are crippled MIPS III+ 64-bit CPUs
> >>
> >>
> >>  Then an ll/sc and lld/scd emulation seems to be most appropriate here.
I
> >> don't think we want to add _test_and_set() to mips64*-linux.
> >
> >All the cases I've seen have been for 32-bit kernels. A 64-bit PDA kernel
seems like a wee tiny bit of overkill
>
>   I've been asked about running 64 bit binaries on a VR4121.

Being able to use all 64-bits of the registers is a huge win for
certain embedded/handheld applications, even if 64-bit addressing
is worse than useless.  It's unfortunate that the original R4000 merged
the enabling of 64-bit data types with the generation of 64-bit addresses.
The newer MIPS64 CPUs have a bit in the Status register to
enable the data types without enabling the addresses.
I don't know that NEC has implemented this for the VR41xx
family, but they really should.  And fix ll/sc while they are at it.  ;-)

            Kevin K.
