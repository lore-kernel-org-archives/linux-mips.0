Message-ID: <3D44F31D.55155E24@mips.com>
Date: Mon, 29 Jul 2002 09:47:49 +0200
From: Carsten Langgaard <carstenl@mips.com>
MIME-Version: 1.0
Subject: Re: PATCH: Update E_MIP_ARCH_XXX (Re: [patch] linux:
 RFC:elf_check_arch() rework)
References: <Pine.GSO.3.96.1020725125830.27463H-100000@delta.ds2.pg.gda.pl>
	 <3D3FFD21.8DA26337@mips.com> <20020725082610.A21614@lucon.org>
	 <mailpost.1027610779.9546@news-sj1-1> <yov54remph1v.fsf@broadcom.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: cgd@broadcom.com
Cc: hjl@lucon.org, "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, linux-mips@fnet.fr, linux-mips@oss.sgi.com, binutils@sources.redhat.com
Message-ID: <20020729074749.8tiFcM9JycNNPYiBRvVUgMi0N8nRXGCsz-8rzlAWr-0@z>

First of all I will like to thank you for all the replies, we really appreciate
it, because it helps us in our process of making a proper ABI spec.
I known it's a relative late state we are trying to provide the community with an
ABI document, but I guess it's better to be late than to never show up.
I believe we all could benefit from such a document, it's only in a internal draft
version right now, but it might be a good idea to send it out to the community for
comments, before the finally version.
But we are still in an early state and on the learning curve.

Regarding the ELF header arch values, we did try to select whose in order not to
break things for anyone.
I'm also a little surprised to see these value out in binutils, it really surprise
me, if we got a linux toolchain that can generate mips32/mips64 code.

MIPS32R2 and MIPS64R2 is a new enhanced version of MIPS32 and MIPS64 architecture,
which among other things include some new instructions.

Regarding Algorithmics, I don't know if everybody are aware of it, but we have
just acquired Algorithmics.
That among other things, is done in order to play a stronger part in the
development of the toolchain. And their work will be pushed back to the community.

Algorithmics have done a MIPS32 compiler for us, which is very close to be
released.

I hope this clarify a little bit, what our motivation are.
/Carsten


cgd@broadcom.com wrote:

> At Thu, 25 Jul 2002 15:26:19 +0000 (UTC), "H. J. Lu" wrote:
> > I'd like to fix binutils ASAP. Here is a patch.
>
> OK, so, I've seen no response so far that indicates that binutils
> should actually be changed.
>
> to recap:
>
> * Binutils has deployed these values in several releases now, and I
>   know for a fact that people are using binaries with these values.
>
> * SGI has followed binutils' lead in selecting values.
>
> * Algorithmics did something else, though it's not clear what the
>   difference between "ARCH_ALGOR_32" and "ARCH_32" really is.
>
> It seems obvious that the simplest solution that causes the least pain
> all around is to go with the numbering binutils currently uses.  This
> will probably cause a little bit of pain for Algorithmics, but, well,
> they could have sent something to binutils to indicate use of that
> number, and i'm quite sure that most of the rest of us have had to put
> temporary backward-compat hacks in our own codebases for incompatible
> changes made by others in the past.  It's not that hard and doesn't
> cause long-term pain.
>
> I could understand that MIPS or Algorithmics might like that, but I
> think there're a bunch of morals to this story: if you want to lead on
> ABI issues, get out in front of them (you can't lead from the back
> 8-); interact with the tool development and use communities about such
> issues _before_ solutions are needed and agreed upon in those
> communities; and, you're hacking open source code like binutils,
> contribute your changes back as soon as you possibly can.
>
> I'd also like to point out that saying "mips will be defining this
> ABI, so you should all change your code to work with it" without,
> AFAIK, even providing a draft of said ABI... is unlikely to produce
> positive results even _if_ there's no precedent that would go against
> the requested change.  (if somebody has a ptr, i'd be glad to be
> corrected 8-)
>
> (I wonder what other incompatibilities may exist between this new ABI
> and the current binutils MIPS ELF headers...)
>
> cgd
> --
> Chris Demetriou                                            Broadcom Corporation
> Senior Staff Design Engineer                  Broadband Processor Business Unit
>   Any opinions expressed in this message are mine, not necessarily Broadcom's.

--
_    _ ____  ___   Carsten Langgaard   Mailto:carstenl@mips.com
|\  /|||___)(___   MIPS Denmark        Direct: +45 4486 5527
| \/ |||    ____)  Lautrupvang 4B      Switch: +45 4486 5555
  TECHNOLOGIES     2750 Ballerup       Fax...: +45 4486 5556
                   Denmark             http://www.mips.com
