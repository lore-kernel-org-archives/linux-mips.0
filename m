Date: Tue, 22 May 2001 13:04:37 -0400 (EDT)
From: George Gensure <werkt@csh.rit.edu>
Subject: Re: newest kernel
In-Reply-To: <20010522143330.B9891@paradigm.rfc822.org>
Message-ID: <Pine.SOL.4.31.0105221303310.28804-100000@fury.csh.rit.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Florian Lohoff <flo@rfc822.org>
Cc: Jun Sun <jsun@mvista.com>, Pete Popov <ppopov@mvista.com>, linux-mips@oss.sgi.com
Message-ID: <20010522170437.e-uaUMuCPqcxjhWxgnzCQq7suL9S8J9u93xkPSC336Q@z>

Good call.  Thanks everyone, that did it. now if i could just get my cross compiled gcc 3.1 to realize that crti.o exists and should be linked in with libgcc...

George
werkt@csh.rit.edu

On Tue, 22 May 2001, Florian Lohoff wrote:

> On Mon, May 21, 2001 at 04:23:52PM -0700, Jun Sun wrote:
> > The patch seems to be just a fast implementation of sysmips().  Why would it
> > solve an otherwise illegal instruction problem?
> >
> > George, what was exactly the error and the faulty instruction?
>
> Wrong - Its not only a "fast" path sysmips. It solves the illegal instruction
> case as it carefully doesnt touch registers it should not touch.
>
> The sysmips illegal instruction stuff came from the early exit
> needed to skip the -EXXXX case in the scall32.S which did not
> restore the modified registers. This needed fixing and there was
> no clean way of doing this in C thus i wrote an asm sysmips/MIPS_ATOMIC_SET
> and called it "fast_sysmips" which itself would go into the old
> sysmips function when not MIPS_ATOMIC_SET.
>
> Flo
>
