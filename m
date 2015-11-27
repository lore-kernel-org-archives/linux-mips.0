Received: from relay1.mentorg.com ([192.94.38.131]:48480 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007861AbbK0SEFt-s9b (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 27 Nov 2015 19:04:05 +0100
Date: Fri, 27 Nov 2015 18:03:55 +0000
From: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [RFC] MIPS ABI Extension for IEEE Std 754 Non-Compliant
 Interlinking
In-Reply-To: <alpine.DEB.2.00.1511271547290.16168@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.10.1511271750590.3430@digraph.polyomino.org.uk>
References: <alpine.DEB.2.00.1511140411050.7097@tp.orcam.me.uk> <alpine.DEB.2.10.1511171503510.14808@digraph.polyomino.org.uk> <alpine.DEB.2.00.1511201535580.6915@tp.orcam.me.uk> <alpine.DEB.2.10.1511201815230.9012@digraph.polyomino.org.uk>
 <alpine.DEB.2.00.1511271547290.16168@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <joseph_myers@mentor.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: linux-mips@linux-mips.org, libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org, Matthew Fortune <Matthew.Fortune@imgtec.com>, Daniel Sanders <Daniel.Sanders@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Message-ID: <20151127180355.UcwwXohQ79q7dBPQNYqh0sFsWj5uDlcPplCBuBnRS40@z>

On Fri, 27 Nov 2015, Maciej W. Rozycki wrote:

> I find it highly unlikely though that the writers will (be able to) chase 
> individual targets and any obscure hardware-dependent options the targets 
> may provide.  And we cannot expect people compiling software to be 

What that says to me is that there should be an architecture-independent 
option (-fieee?) that, for architectures where the default configuration 
may have architecture-specific deviations from the normal defaults 
regarding conformance to IEEE 754 language bindings but there are options 
to disable those deviations, disables those deviations.  For example, on 
alpha that would imply -mieee-with-inexact.  On architectures without such 
issues (beyond bugs that should be fixed unconditionally, not conditional 
on a command-line option, or issues with the hardware ISA that are 
infeasible to fix in software), that option would do nothing (beyond any 
architecture-independent effects it might have such as implying 
-fno-fast-math).

>  As you may see in the GCC patches I have just posted the `-mieee=strict' 
> option I've implemented sets `-fno-fast-math', and `-mrelaxed-nan=none', 
> the only target-specific option so far.  So this does exactly what I 
> outlined above.

I am doubtful about the architecture-specific option setting 
architecture-independent options here.  Having it the other way round as I 
suggested above would make more sense to me.

> "Any or all of these options may have effects beyond propagating the IEEE 
> Std 754 compliance mode down to the assembler and the linker.  In 
> particular `-mieee=strict' is expected to produce strictly compliant code, 
> which in the context of this specification is defined as: following IEEE 
> Std 754 as closely as the programming language binding to the standard 
> (defined in the relevant language standard), the compiler implementation 
> and target hardware permit.  This means the use of this option may affect 
> code produced in ways beyond NaN representation only."
> 
> > >  Does this answer address your concerns?
> > 
> > No, the option concept as described seems too irremediably vague.
> 
>  Does this explanation give you a better idea of what I have in mind?  Do 
> you still have concerns about the feasibility of the idea?

It's better defined, but I think it would be better for -fieee to imply 
-mieee=strict -fno-fast-math (or whatever) rather than for -mieee=strict 
to imply architecture-independent options.  Cf. i386 and sh where 
-ffinite-math-only affects architecture-specific options.

-- 
Joseph S. Myers
joseph@codesourcery.com
