Message-ID: <00fa01c0bbaa$0bd7cb60$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <00a901c0bb6f$d3e77820$0deca8c0@Ulysses> <20010402151425.A8471@bacchus.dhis.org>
Subject: Re: Dumb Question on Cross-Development
Date: Mon, 2 Apr 2001 21:20:44 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>
Message-ID: <20010402192044.PWDlPXj9rlSwuE99Ly1liwhCG2T5wreBASiZmRKbzEo@z>

> > I've historically done all of my MIPS/Linux development
> > native, on Indies, P-5064's, Atlas, and Malta.  But now
> > that we seem to be in a situation where the latest,
> > greatest, and most correct compilers are x86 cross-dev
> > only.
>
> There is nothing that keeps you from building those compiler as native
> compilers also.  Usually I only crosscompile kernels and do all other
> work native.

"Let them eat cake".  My Athlon is an order of magnitude
faster than my 4Kc, and several times faster than my
Algor/R5260.  It also has much more memory and a
CD-RW unit for backup, unlike my MIPS boxes.  As
MIPS/Linux becomes more an embedded platform
and less an SGI/DEC legacy platform, people are in
general not going to put up with being forced to buy
old Indy's to do their target application work!

> > I've cut over to building kernels on my Athlon box.
> > I'd like to start building apps and benchmarks (not
> > necessarily from srpm's).  Plainly, I need a set of
> > libraries (naive attempts at cross-compilation of
> > user code with the egcs 1.1.2 compiler results in
> > complaints about the missing crt1.o), and possibly
> > some variant include files.
>
> Which looks like you don't have a glibc package installed.

That's correct.  Because I have the strong suspicion that
RH 7.0 PC rpm is too stupid to put it somewhere useful, and
is far more likely to clobber my native i686 libc unless I give
it the correct incantations.   Hence my question.  And
of course, if it ends up somewhere other than /usr/lib,
presumably I need to tweak mips-linux-gcc to know
where it is.  I'm sure that's documented somewhere,
too, but it would save me several hours if someone had
a description of how to install the full cross environment
on a Linux PC.

> > Are these packaged somewhere, and is there an FAQ/HowTo on how
> > to set them up?
>
> Guess I should occasionally roll an uptodate crosscompiler package ...

If not you, someone certainly needs to.

> > This may have been handled in Ralf's HowTo, but that seems to have
> > disappeared from the web.
>
> http://oss.sgi.com/mips/mips-howto.html.  Where are you looking?

There is no visible link to it on the oss.sgi.com/mips page - then again
there's no visible link to oss.sgi.com/mips from the oss.sgi.com page,
so at least things are consistent.  ;-)  It used to be accessible from the
FAQ that used to be at oss.sgi.com/mips/faq.html, but that document
has be deleted, leaving no forwarding address.  The pointers on Brad
LaRonde's site is even older (remember linux.sgi.com?).

> It's still
> on the web and is also being distributed as part of the LDP project.
Heck,
> the HOWTO even seems to ship with a number of Intel distributions, at
least
> Conectiva 6.0 and Redhat 6.2 seem to include it, even though fairly old
> versions.

That's great.  Now, why can't there be a pointer to it on one of the
pages accessible to someone dropping into oss.sgi.com/mips?

            Regards,

            Kevin K.
