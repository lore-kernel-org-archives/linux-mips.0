Received: from mailapp01.imgtec.com ([195.59.15.196]:20436 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011381AbbBKRhjTtLX8 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Feb 2015 18:37:39 +0100
From: Daniel Sanders <Daniel.Sanders@imgtec.com>
Subject: RE: [PATCH 5/5] MIPS: LLVMLinux: Silence unicode warnings when
 preprocessing assembly.
Date: Wed, 11 Feb 2015 17:37:31 +0000
Message-ID: <E484D272A3A61B4880CDF2E712E9279F459260F9@hhmail02.hh.imgtec.org>
References: <1422970639-7922-1-git-send-email-daniel.sanders@imgtec.com>
        <1422970639-7922-6-git-send-email-daniel.sanders@imgtec.com>
        <alpine.LFD.2.11.1502041022150.22715@eddie.linux-mips.org>
        <A614194ED15B4844BC4C9FB7F21FCD9201347BAE@hhmail02.hh.imgtec.org>
        <alpine.LFD.2.11.1502051107150.22715@eddie.linux-mips.org>
 <yw1xh9v0a55p.fsf@unicorn.mansr.com>
In-Reply-To: <yw1xh9v0a55p.fsf@unicorn.mansr.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Daniel.Sanders@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>, "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Toma Tabacu <Toma.Tabacu@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <Paul.Burton@imgtec.com>, Paul Bolle <pebolle@tiscali.nl>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Manuel Lauss <manuel.lauss@gmail.com>, Jim Quinlan <jim2101024@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20150211173731.gj4QM9qfFt07qSQ0ptuu_hW_OI07tK1YzptSIWr-BMk@z>

Apologies for the slow reply.

> -----Original Message-----
> From: Måns Rullgård [mailto:mans@mansr.com]
> Sent: 05 February 2015 12:56
> To: Maciej W. Rozycki
> Cc: Toma Tabacu; Daniel Sanders; Ralf Baechle; Paul Burton; Paul Bolle;
> Steven J. Hill; Manuel Lauss; Jim Quinlan; linux-mips@linux-mips.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 5/5] MIPS: LLVMLinux: Silence unicode warnings when
> preprocessing assembly.
> 
> "Maciej W. Rozycki" <macro@linux-mips.org> writes:
> 
> > On Thu, 5 Feb 2015, Toma Tabacu wrote:
> >
> >> > 2. It considers these character pairs to be unicode escapes in the first
> >> >    place given that they do not follow the syntax required for such
> >> >    escapes, that is `\unnnn', where `n' are hex digits.
> >> >
> >>
> >> It doesn't actually treat them as unicode escapes, but it still warns
> >> the user, in case they were meant to be unicode escapes. Here's the
> >> warning message:
> >>
> >> arch/mips/include/asm/asmmacro.h:197:51: warning: \u used with no
> following hex digits; treating as '\' followed by identifier [-Wunicode]
> >>          .word  0x41000000 | (\rt << 16) | (\rd << 11) | (\u << 5) | (\sel)
> >>                                                           ^
> >> I'll add it to the summary in v2.
> >
> >  Thanks, that makes things clearer.  It always makes sense to include the
> > exact error message produced where applicable or otherwise people do not
> > necessarily know what the matter is.
> >
> >> > Of course it may be reasonable for us to work this bug around as we've
> >> > been doing for years with GCC, but has the issue been reported back to
> >> > clang maintainers?  What was their response?
> >> >
> >>
> >> It hasn't been reported, but I don't think they would agree with removing
> >> unicode escape sequences from the assembler-with-cpp mode because it is
> >> currently being used for other languages as well, not just assembly.
> >
> >  First, preprocessing rules surely have to be language specific.  The C
> > language standard does not specify what the preprocessor is meant to do
> > (if anything) for other languages.  GCC or clang -- that's no different.
> > 
> >  The assembly language has a different syntax and `\u' has a different
> > meaning in the context of assembly macro expansion than it would have in a
> > name of a symbol, where such a Unicode escape sequence might indeed be
> > interpreted as such and character encoded propagated to the symbol
> > produced.  But that's up to the assembler -- GAS for example does not
> > AFAIK support Unicode escape sequences in symbol names right now, but I
> > suppose such a feature could be added if desired.

Pre-processed assembly is somewhat unusual in that it has traditionally been
pre-processed with a pre-processor designed for the C language. It's certainly
possible to have assembly specific tweaks (GCC has a couple) but it is still a C
pre-processor at heart. It doesn't know anything about the assembly language,
it just happens to be similar enough to be usable.
