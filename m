Received: from mailapp01.imgtec.com ([195.59.15.196]:4175 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008757AbbKPI4bwvvLV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 16 Nov 2015 09:56:31 +0100
Date: Mon, 16 Nov 2015 08:56:23 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [RFC] MIPS ABI Extension for IEEE Std 754 Non-Compliant
 Interlinking
In-Reply-To: <CAJimCsE4GcizTpOgvyGrbPu80SanG1sW3UdmEnq2U=qzCxaW=w@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1511141906350.7097@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1511140411050.7097@tp.orcam.me.uk> <CAJimCsE4GcizTpOgvyGrbPu80SanG1sW3UdmEnq2U=qzCxaW=w@mail.gmail.com>
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
To: Cary Coutant <ccoutant@gmail.com>
Cc: linux-mips@linux-mips.org, libc-alpha@sourceware.org, Binutils <binutils@sourceware.org>, GCC Development <gcc@gcc.gnu.org>, Matthew Fortune <Matthew.Fortune@imgtec.com>, Daniel Sanders <Daniel.Sanders@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Message-ID: <20151116085623.jeIQFMULicRQe8SGkiwR-8-mx-XGFA-gMt4AFAF2JDU@z>

On Sat, 14 Nov 2015, Cary Coutant wrote:

> > 3.3.2 Static Linking Object Acceptance Rules
> >
> >  The static linker shall follow the user selection as to the linking mode
> > used, either of `strict' and `relaxed'.  The selection will be made
> > according to the usual way assumed for the environment used, which may be
> > a command-line option, a property setting, etc.
> >
> >  In the `strict' linking mode both `strict' and `legacy' objects can be
> > linked together.  All shall follow the same legacy-NaN or 2008-NaN ABI, as
> > denoted by the EF_MIPS_NAN2008 flag described in Section 3.1.  The value
> > of the flag shall be the same across all the objects linked together.  The
> > output of a link involving any `strict' objects shall be marked as
> > `strict'.  No `relaxed' objects shall be allowed in the same link.
> >
> >  In the `relaxed' linking mode any `strict', `relaxed' and `legacy'
> > objects can be linked together, regardless of the value of their
> > EF_MIPS_NAN2008 flag.  If the flag has the same value across all objects
> > linked, then the value shall be propagated to the binary produced.  The
> > output shall be marked as `relaxed'.  It is recommended that the linker
> > provides a way to warn the user whenever a `relaxed' link is made of
> > `strict' and `legacy' objects only.
> 
> This paragraph first says that "If the flag has the same value across
> all objects linked, then the value shall be propagated to the binary
> produced", but then says the "output shall be marked as `relaxed'."
> Are you missing an "Otherwise" there?

 The EF_MIPS_NAN2008 flag (if the same across all the objects linked in 
the `relaxed' mode) shall be propagated to the binary produced and the 
output marked as `relaxed'.  If you think this is not clear from the 
wording used, then I can think of rewording the paragraph.  Please note 
however that nowhere across this document the term `flag' is used to refer 
to `relaxed' vs `strict' vs `legacy' annotation, so I'm not really sure 
why this should be ambiguous.

> Early on in the document, you mention "this applies regardless of
> whether it relies on the use of NaN data or IEEE Std 754 arithmetic in
> the first place," yet your solution is only two-state. Wouldn't it be
> better to have a three-state solution where objects that do not in
> fact rely on the NaN representation at all can be marked as "don't
> care"? Such objects could always be mixed with either strict or
> relaxed objects, regardless of linking mode.

 I find it interesting that you raise this point as this was actually 
considered and deferred to investigation at a later stage.

 The reason is we actually have a no-FP annotation already -- in the GNU 
attribute section (propagated these days to the `fp_abi' member of MIPS 
ABI flags by BFD) -- however the encoding is so unfortunate as to make it 
impossible in ELF binary objects to tell apart ones explicitly annotated 
as containing no FP code (typically in compiler-generated code, such as 
made by GCC invoked with the `-mno-float' command-line option) and ones 
with no annotation at all (either legacy compiler-generated code or often 
handcoded assembly sources).  This is because the no-FP annotation is also 
the default value (0) of the attribute in question and is therefore 
removed in processing by BFD rather than being recorded in ELF output.

 It is of course possible to tell corresponding sources apart, however it 
requires a rewrite of parts of attribute handling in BFD so that the 
original annotation is actually unambiguously propagated to an ELF object 
produced by the assembler.  Such a change being considerable enough on its 
own was decided to be made separately, as it can be added later on at any 
time, as an extra case in addition to the two already handled here which 
are required anyway.  This follows the principle of making one step at a 
time.

 There is also a question of a no-FP executable pulling in an FP DSO, 
either at the load time or with dlopen(3): how is such a process supposed 
to be configured -- as `strict' or `relaxed'?  No clear answer has been 
found to this question yet.

 Does this explanation address your concern?

  Maciej
