Message-ID: <200301282139.h0SLdmf29392@uhler-linux.mips.com>
Reply-To: uhler@mips.com
Subject: Re: [OT] Re: unaligned load in branch delay slot 
In-reply-to: Your message of "28 Jan 2003 16:30:09 EST."
             <1043789409.23571.12.camel@gs256.sp.cs.cmu.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Jan 2003 13:39:48 -0800
From: "Mike Uhler" <uhler@mips.com>
Return-Path: <uhler@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: justinca@cs.cmu.edu
Cc: linux-mips@linux-mips.org, uhler@mips.com
Message-ID: <20030128213948.mRIfKnpcPJyFKYdZAitELlI3VqRJUv6l6rjRPNWijzQ@z>

> On Tue, 2003-01-28 at 14:48, Mike Uhler wrote:
> 
> > If the patch assumes that one can look backward by one instruction
> > in the STATIC code to determine if the instruction is in a
> > delay slot, one can not have code that jumps directly to the
> > instruction following another branch, as this would cause the
> > code to assume that it was in the delay slot of the branch.
> 
> A while back, when working on a different architecture that also had
> branch delay slots, it took me a while to get my head around the
> branch-in-a-delay-slot case, e.g.
> 
> 
> 10:  b 100
> 20:  b 30
> 30:  foo
> ...
> 100: bar
> 
> where the actual program flow would be
> 
> 10
> 20
> 100
> 30
> 
> and instruction 100 would be considered to be in the delay slot of 20.
> 
> I was *very* happy when I first looked at MIPS to see that this was 
> specified as unpredictable, even if it was pretty cool to be able to
> make the CPU execute a single instruction in the middle of nowhere. 
> Pointless, but cool.  :)

I presume that you're talking about Sparc, where such a construct is
used to execute a single instruction out of a table.  This is, in
fact, very, very unpredictable on a MIPS implementation, ranging from
reserved instruction, to branching to one of the two branch targets,
to wandering off into hyperspace.  So please do not assume that because
a particular implementation does something that all implementations
do the same thing. In this particular case, I can guarantee you that
you won't like the answer you get.

/gmu

-- 

  =*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
  Michael Uhler, VP, Systems, Architecture, and Software Products 
  MIPS Technologies, Inc.   Email: uhler@mips.com   Pager: uhler_p@mips.com
  1225 Charleston Road      Voice:  (650)567-5025   FAX:   (650)567-5225
  Mountain View, CA 94043   Mobile: (650)868-6870   Admin: (650)567-5085
