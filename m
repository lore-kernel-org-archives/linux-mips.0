Received: from mailapp01.imgtec.com ([195.59.15.196]:52921 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991964AbcKGOdT06pYw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 15:33:19 +0100
Date: Mon, 7 Nov 2016 14:33:03 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 03/10] MIPS: End asm function prologue macros with
 .insn
In-Reply-To: <20161107111417.11486-4-paul.burton@imgtec.com>
Message-ID: <alpine.DEB.2.20.17.1611071400340.10580@tp.orcam.me.uk>
References: <20161107111417.11486-1-paul.burton@imgtec.com> <20161107111417.11486-4-paul.burton@imgtec.com>
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20161107143303.W2fABmsczOg-adRFvdMZIHQ_WMG1hIn_52TT87c-Y6g@z>

On Mon, 7 Nov 2016, Paul Burton wrote:

> When building a kernel targeting a microMIPS ISA, recent GNU linkers
> will fail the link if they cannot determine that the target of a branch
> or jump is microMIPS code, with errors such as the following:
> 
>     mips-img-linux-gnu-ld: arch/mips/built-in.o: .text+0x542c:
>     Unsupported jump between ISA modes; consider recompiling with
>     interlinking enabled.
>     mips-img-linux-gnu-ld: final link failed: Bad value
> 
> or:
> 
>     ./arch/mips/include/asm/uaccess.h:1017: warning: JALX to a
>     non-word-aligned address

 For the record: branch checks have been tightened as we plan to make use 
of branches to external symbols in generated code, making them more common 
than they have been so far.  The checks ensure an accidental attempt to 
assemble or link (as applicable) a branch between a function compiled for 
the regular ISA and one built for a compressed ISA will trigger at the 
build time rather than making the program go astray at the run time, which 
would be harder, perhaps much harder to debug.

> Placing anything other than an instruction at the start of a function
> written in assembly appears to trigger such errors. In order to prepare
> for allowing us to follow function prologue macros with an EXPORT_SYMBOL
> invocation, end the prologue macros (LEAD, NESTED & FEXPORT) with a
> .insn directive. This ensures that the start of the function is marked
> as code, which always makes sense for functions & safely prevents us
> from hitting the link errors described above.

 GAS has a known and accepted deficiency of being unable to see through a 
section switch.  So even though there is indeed a real instruction that 
follows a given code label once the section has been restored, the switch 
makes the assembler lose it from the view and the symbol produced by the 
label does not get the expected function type and consequently the ISA 
mode annotation.  Using an explicit `.insn' annotation sets the symbol 
type correctly along with the ISA mode.

 The `.insn' pseudo-op itself has been there since the beginning of
MIPS16 support in the toolchain, and has also been noted in the microMIPS 
architecture specification as required for code labels placed at 
non-instructions.

 As these macros can be used at such places too I think it makes sense to 
imply `.insn' with the macro itself so that it's semantically consistent 
rather than requiring people to explicitly place the pseudo-op at macro 
expansion sites as required.  I'm not sure if I indeed like the idea of 
placing EXPORT_SYMBOL in the middle of a code block, as I find it 
inconsistent with C usage where, by convention, it only comes at the end 
of a function's body.  That is a separate matter though, so for this 
change only:

Reviewed-by: Maciej W. Rozycki <macro@imgtec.com>

 Thank you for your work in this area!

  Maciej
