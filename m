Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199704101453.KAA21432@neon.ingenia.ca>
Subject: Re: all in the family
In-Reply-To: <199704100718.CAA22863@athena.nuclecu.unam.mx> from Miguel de Icaza at "Apr 10, 97 02:18:59 am"
Date: Thu, 10 Apr 1997 10:53:19 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Miguel de Icaza <miguel@nuclecu.unam.mx>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970410145319.kqJAum5X_qWklu5akSt2dcWIuo6CV3PPVT_IpxGMMqw@z>

Thus spake Miguel de Icaza:
> > Anyone know if the emulation is up to hosting the Linux/Indy
> > cross-compiler?
> 
> Why do you need the emulation for on Linux/SPARC?   You just need to
> run configure on Linux/SPARC with the proper --target option and you
> will get your native cross-compiler in a second.

I was under the impression that building GCC for the Linux/SGI target
was non-trivial.  Ralf made mention of some patches, and since there
are binaries available for Solaris...

If GCC can support it with a --target choice, that'll be great.

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>              Commando Developer - Whatever It Takes
#>                                                                     
#> "See, you not only have to be a good coder to create a system like
#>    Linux, you have to be a sneaky bastard too." - Linus Torvalds
