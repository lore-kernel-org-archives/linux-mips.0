Message-ID: <00ae01c4b1ef$6ca4b450$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20041014115304.3edbe141.toch@dfpost.ru> <01d901c4b1c8$996b7b30$10eca8c0@grendel> <20041014121242.GA1398@rembrandt.csv.ica.uni-stuttgart.de> <416E6E32.5080009@mips.com> <20041014123615.GB1398@rembrandt.csv.ica.uni-stuttgart.de>
Subject: Re: Strange instruction
Date: Thu, 14 Oct 2004 15:12:13 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Nigel Stephens <nigel@mips.com>, Thiemo Seufer <ica2_ts@csv.ica.uni-stuttgart.de>
Cc: linux-mips@linux-mips.org
Message-ID: <20041014131213.9D5507XZw1E4H3BDQjBS2Ty9MoN5iq-vdBCQTjgXHbk@z>

> Nigel Stephens wrote:
> > Thiemo Seufer wrote:
> > >GNU as has "move" as builtin macro which is expanded differently for
> > >32 and 64 bit mode. This simplifies the task of writing code for both
> > >models. Unfortunately the expansion was broken for a while and
> > >generated always the 64 bit version if the toolchain was 64bit
> > >_capable_. IIRC this was fixed in the early 2.14 timeframe.
> > 
> > Wouldn't it be safer, as Kevin suggests, for the "move" macro to 
> > generate "or $rd,$0,$rs", since that will work correctly in either mode?
> 
> For CPUs with two adders the instruction scheduling is a bit better.

For CPUs with two adders, only one of which can do ORs, you mean.
Isn't that a pretty small population of MIPS CPUs?

> Ther are also many other macros which are expanded in dependence of
> the 32/64 bit address/register size, a different "move" macro
> expansion won't help much if the assembler invocation was wrong.

Perhaps, but it strikes me as being only prudent to remove unnecessarily
fragile artifacts like this.  I'm sure that there are some macros that cannot
be implemented in a 32/64-bit independent manner, but it's clear that some
of them could be, but are not. And those that can be, should be, as a matter 
of software engineering principle.  Now, finding the time/money to actually 
do the work may be another story...  ;o)

            Regards,

            Kevin K. 
