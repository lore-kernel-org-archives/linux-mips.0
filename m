Received: from mailapp01.imgtec.com ([195.59.15.196]:41221 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012082AbbKTRRCSAb7k (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 20 Nov 2015 18:17:02 +0100
Date: Fri, 20 Nov 2015 17:16:54 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [RFC] MIPS ABI Extension for IEEE Std 754 Non-Compliant
 Interlinking
In-Reply-To: <alpine.DEB.2.10.1511171503510.14808@digraph.polyomino.org.uk>
Message-ID: <alpine.DEB.2.00.1511201535580.6915@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1511140411050.7097@tp.orcam.me.uk> <alpine.DEB.2.10.1511171503510.14808@digraph.polyomino.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Joseph Myers <joseph@codesourcery.com>
Cc: linux-mips@linux-mips.org, libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org, Matthew Fortune <Matthew.Fortune@imgtec.com>, Daniel Sanders <Daniel.Sanders@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Message-ID: <20151120171654.p4DAHCIvXmKx6qbGRYXgmWec-TIUfx8s-0nh2Xw2sBc@z>

On Tue, 17 Nov 2015, Joseph Myers wrote:

> >  Any or all of these options may have effects beyond propagating the IEEE
> > Std 754 compliance mode down to the assembler and the linker.  In
> > particular `-mieee=strict' is expected to guarantee code generated to
> > fully comply to IEEE Std 754 rather than only as far as NaN representation
> > is concerned.
> 
> "guarantee" seems rather strong given the various known issues with (lack 
> of) Annex F support in GCC.

 Well, but aren't these current implementation shortcomings (i.e. bugs) 
rather than a design principle?  I can weaken the language here, but if 
the former is the case, then I think we don't need to factor in the 
existence of bugs into an interface specification.

> Do you have any actual configuration in mind it would affect, 
> MIPS-specific or otherwise?  For non-architecture-specific things, -std= 
> options for C standards conformance are meant to enable whatever options 
> are required (e.g. they disable the default -ffp-contract=fast), without 
> affecting things not required by the standards by default (so they don't 
> enable -frounding-math or -fsignaling-nans, for example).

 The target audience for the `-mieee=strict' option is in my idea a 
non-technical user, say a physicist, who does not necessarily know or is 
fluent with the guts of computer hardware and who has the need to build 
and reliably run their software which uses IEEE Std 754 arithmetic.  
Rather than giving such a user necessarily lengthy explanations as to the 
complexity of the situation I'd prefer to give them this single option to 
guarantee (modulo bugs, as noted above) that a piece of software built 
with this option will either produce correct (as in "standard-compliant") 
results or refuse to run.

 There is also a corresponding `--with-ieee=strict' configure-time option 
for users who want to build their own compiler system which guarantees 
such compliance by default.

 I think the `-std=' options are a little bit too broad in that they 
control more than just the IEEE Std 754 aspect of standards compliance.  
Of course the setting of `-mieee=' may in fact be a one-way dependency of 
`-std=', up to a further override.  I haven't implemented such a 
dependency in my prototype, however I think it might be a good idea to 
have it.

 What I have implemented is a dependency between `-mieee=' and the 
internal option to control the compliance mode for NaN encodings.  That 
has encountered an unexpected complication though which I was not able to 
resolve without turning the option handling machinery upside down, and I 
found that code really hard to follow.  So I decided to defer it as not 
the main scope of the matter and proceed with the rest of the feature.  
Once the option handling has been sorted out, a similar dependency can be 
introduced between `-std=' and `-mieee='.

 I'll post the details of the option handling issue with the GCC patches.

 Does this answer address your concerns?

  Maciej
