Message-ID: <007a01c31f9e$8a784ee0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1030521115345.2088D-100000@delta.ds2.pg.gda.pl>
Subject: Re: lwl-lwr
Date: Wed, 21 May 2003 15:40:25 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Ralf Baechle <ralf@linux-mips.org>
Cc: Gilad Benjamini <yaelgilad@myrealbox.com>, linux-mips@linux-mips.org
Message-ID: <20030521134025.lEc3Q5W-jilk0tbPNJy8l5mMxmoOE3Md24xeA6kme2Y@z>

>From: "Maciej W. Rozycki" macro@ds2.pg.gda.pl
>

> On Wed, 21 May 2003, Ralf Baechle wrote:
> 
> > > There's really no such thing as "disabling" lwl/lwr.  They are part 
> > > of the base MIPS instruction set.  If one wants to live without them, 
> > > one can either rig a compiler to emit multi-instruction sequences instead 
> > > of lwr/lwl to do the appropriate shifts and masks (which is slower on all 
> > > targets), or you can rig the OS to emulate them, and hope that the processors 
> > > lacking support will take clean reserved instruction traps, where the function 
> > > can be emulated (which is "free" for code running  on CPUs with lwl/lwr, 
> > > but *really* slow for the guys doing emulation).
> > 
> > Technically you're right ...  In reality lwl/lwr are covered by US patent
> > 4,814,976 which would also cover a software implementation.  So unless MIPS
> > grants a license for the purpose of emulation in the Linux kernel ...
> 
>  For practical reasons I believe it can be dealt with without patent
> infringing, but I am not that excited with doing anything at all about it. 

I agree.  I've never read the patent, but now that you mention it, I do
recall having heard that it covers software implementations.  Lets just
leave this one alone...

            Kevin K.
