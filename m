From: Nigel Stephens <nigel@algor.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <15862.15924.283825.28108@hendon.algor.co.uk>
Date: Tue, 10 Dec 2002 19:19:16 +0000
Subject: Re: GDB patch
Reply-To: nigel@mips.com
Return-Path: <nigel@hendon.algor.co.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Daniel Jacobowitz <dan@debian.org>
Cc: Carsten Langgaard <carstenl@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20021210191916.Q9O7FmNieaJB0aRgaQLTrvBjKYrGWobYF4eD2P5DdLk@z>

> On Tue, Dec 10, 2002 at 01:07:31PM +0100, Carsten Langgaard wrote:
> 
> > I've attached a patch for gdb-stub.c to make it work better with the
> > sde-gdb.
> > These changes should be backwards compatible with a standard gdb, so it
> > shouldn't break anything.
> > Ralf, could you please apply it.
> 
> 
> Strongly object.  While I didn't check the implementation, it's nice to
> see 'X' implemented.  And P.  But what the heck is this?
> 
> 
> > @@ -816,13 +839,64 @@
> >  		case 'k' :
> >  			break;		/* do nothing */
> >  
> > +		case 'R':
> > +			/* RNN[:SS],	Set the value of CPU register NN (size SS) */
> > +			/* FALL THROUGH */
> 
> 
> > -		/*
> > -		 * Reset the whole machine (FIXME: system dependent)
> > -		 */
> >  		case 'r':
> > -			break;
> > +			/* rNN[:SS]	Return the value of CPU register NN (size SS) */
> 
> 
> 
> We're not making up a protocol here, we're implementing one.  R and r
> don't have anything to do with setting registers.

Hi Dan

Actually Carsten *is* trying to implement a protocol, it's just that
it's an extension to the gdb remote debug protocol, as used in our
SDE-MIPS toolchain (viz sde-gdb).  Algorithmics (now MIPS Technologies
UK), always extended the gdb remote debug protocol to support reading
and writing of single registers, and to support variable register
sizes (to allow a 64-bit debug stub to inter-work with gdb debugging a
32-bit application).

When we first implemented these extensions we used the 'R' command to
write a single register, and 'r' to read one (they weren't then used
by gdb). Since then the remote protocol has gained the 'P' command to
write a single register, so we no longer use 'R' - and it would be
dangerous to do so since it can restart the target (so you can get rid
of the special 'R' case, Carsten).

But the standard gdb remote protocol still doesn't have the ability to
read a single register, so I believe that 'r' (or something like it)
is a useful addition, which speeds up the remote protocol
significantly when running over a serial line. And it won't break the
kernel to add support for this extension.

Regards

Nigel
-- 
                         Nigel Stephens         Mailto:nigel@mips.com
    _    _ ____  ___     MIPS Technologies (UK) Phone.: +44 1223 706200
    |\  /|||___)(___     The Fruit Farm         Direct: +44 1223 706207
    | \/ |||    ____)    Ely Road, Chittering   Fax...: +44 1223 706250
    TECHNOLOGIES (UK)    Cambridge CB5 9PH      Cell..: +44 7976 686470
 [formerly Algorithmics] England                http://www.algor.co.uk
