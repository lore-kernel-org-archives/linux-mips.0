Message-ID: <00e901c1d40d$a257a200$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20020325135834.GA1736@convergence.de>
Subject: Re: Mips16 toolchain?
Date: Mon, 25 Mar 2002 15:59:13 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Johannes Stezenbach <js@convergence.de>, linux-mips@oss.sgi.com
Message-ID: <20020325145913.trQrxgS7AzBhwDq7RSbgw1bFRkLlqdHaJqWFKUjtcmo@z>

> I saw that the algorithmics toolchain (which Dominic Sweetman
> offered to the Linux/MIPS community here a month ago) claims
> to have full support for the mips16 instruction set.
> 
> My questions:
> Does anyone here have experiences with mips16 and/or with the
> algorithmics toolchain?

Yes.  Both Algorithmics and Green Hills embedded
tool chains support it reasonably well.  GHS has no
Linux target, though.  Algorithmics has been working
on one, but I'm not sure what it's current status is.

> Is there working support for mips16 in any other gcc-version?

Cygnus (now part of Red Hat) did the very first MIPS16
support for gcc, most of which found its way into the
main development/maintence stream.  But apparently
not enough of it, based on your experience.

> How about gcc-3.x from CVS?

No data there.

> Any other comments or recommendations regarding mips16?

MIPS16 requires more than just gcc support.
One needs a binutils that can distinguish a MIPS16
binary module (or function if you want to be fancy and 
mix/match within modules)  from a MIPS32/64 module
and perform fixups so that the right selections are made
between JAL and JALX on function invocations.  
If you've got that, you should not need a seperate 
MIPS16 libc.

To correctly support MIPS16, the Linux kernel does
need to be tweaked in those cases where user-mode
instructions are decoded and interpreted, as in
arch/mips/kernel/branch.c and unaligned.c.
I believe that code has been prototyped somewhere,
but it's not yet in any commonly used repository to
the best of my knowledge.  If you avoid throwing
executing non-instructions, performing unaligned 
accesses, etc, you should be able to tiptoe around
that deficiency.

            Regards,

            Kevin K.
