Message-ID: <01ee01c0fc08$66e81e80$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3B34BE3B.B72D40F1@mvista.com>
Subject: Re: CONFIG_MIPS_UNCACHED
Date: Sat, 23 Jun 2001 19:17:28 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>, linux-mips@oss.sgi.com
Message-ID: <20010623171728.Afl2N1VqoG93TH-QcCVVb8inXPsB-fMbJjvd1QWQUSE@z>

> I looked at the code and it appears this config may not work properly.
>
> My understanding is that if CPU has been running with cache enabled, and,
> presummably, have many dirty cache entries, and if you suddenly change
config
> register to run kernel uncached, you *don't* get all the dirty cache lines
> flushed into memory.  Therefore, you will be accessing stale data in
memory.
>
> Is this right?  If so, we need a better way to run CPU uncached.
>
> In the past, I have been a private patch to do so.  It seems pretty
difficult
> to come up a generic, because we want to figure out the CPU type and
disable
> cache *before* kernel starts to modify any memory content.

Since the kernel cache attribute is never initialized before
ld_mmu_{whatever} is invoked, and since that Config field
does not have a well-defined reset state on many MIPS
CPUs, it would appear that we are in effect trusting the
bootloader to have done something reasonable like
set kseg0 to be non-cachable or write-through, either
of which would be safe for the current code.  Strictly
speaking, if we do not wish to assume that the bootloader
has corectly initialized the caches, the kernel should begin
execution in kseg1and stay there until the caches have
been initialized and the kseg0 cache attribute has been
set to something sane.  And when I say "initialized", I
don't mean the writeback-invalidates used by the
blast_dcache routines, since those assume a sane
state of the tag ram, which cannot be guaranteed
at power-up.  One should write the tags directly to
a sane value on CPUs that support it  (on the R3000,
one apparently needs to write a byte to each cache
line to invalidate it.).

I would suggest either that we be explicit about the
assumptions about what the bootloader has done
to the cache, or we go whole-hog and assume that
the kernel has been branched to directly from the
reset vector.  Tinkering with measures in between
strikes me as a waste of time.

            Regards,

            Kevin K.
