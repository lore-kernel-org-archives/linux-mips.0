Message-ID: <005701c29b74$f1f76870$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3DEDBDFC.D87C1B84@mips.com>
Subject: Re: Latest sources from CVS.
Date: Wed, 4 Dec 2002 10:09:54 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Carsten Langgaard <carstenl@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20021204090954.kxjZE_NwQLjVuHfS0gH1veh640pJOnEBQKVKsLUQvj4@z>

> I just checked the latest sources out of cvs.
> 
> It look like you are only able to compile the kernel, if you got a
> MIPS32/MIPS64 compliant compiler.
> The mips32 and mips64 assembler directives are set in
> include/asm-mips/mipsregs.h
> 
> I guess this will make some people out there, which doesn't use a MIPS32
> compliant compiler, a little bit unhappy.
> But then again, we would like to force everybody to use the SDE
> compiler.

For those on the list who don't understand Carsten's sense
of humour, I think that was missing a smiley!  ;-)
I mean, sure, we'd like to move more people toward SDE, 
but "force" is putting it a bit strongly!  And if those directives
are really being used unconditionally, I worry that the code
being generated is likewise emitting MIPS32 instructions
that won't work on the "ghost fleet" of abandoned workstations
now running Linux on R4K/R5K CPUs.

            Kevin K.
