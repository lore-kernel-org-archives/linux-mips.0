Received: from relay1.mentorg.com ([192.94.38.131]:43593 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012553AbbKQPHuMQFpP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 Nov 2015 16:07:50 +0100
Date: Tue, 17 Nov 2015 15:07:40 +0000
From: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [RFC] MIPS ABI Extension for IEEE Std 754 Non-Compliant
 Interlinking
In-Reply-To: <alpine.DEB.2.00.1511140411050.7097@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.10.1511171503510.14808@digraph.polyomino.org.uk>
References: <alpine.DEB.2.00.1511140411050.7097@tp.orcam.me.uk>
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
Message-ID: <20151117150740.TYBZkiSepxt4X3gAPkbD_bToAGmEi8MPXY5R6lKJNaU@z>

On Sat, 14 Nov 2015, Maciej W. Rozycki wrote:

>  Any or all of these options may have effects beyond propagating the IEEE
> Std 754 compliance mode down to the assembler and the linker.  In
> particular `-mieee=strict' is expected to guarantee code generated to
> fully comply to IEEE Std 754 rather than only as far as NaN representation
> is concerned.

"guarantee" seems rather strong given the various known issues with (lack 
of) Annex F support in GCC.  Do you have any actual configuration in mind 
it would affect, MIPS-specific or otherwise?  For 
non-architecture-specific things, -std= options for C standards 
conformance are meant to enable whatever options are required (e.g. they 
disable the default -ffp-contract=fast), without affecting things not 
required by the standards by default (so they don't enable -frounding-math 
or -fsignaling-nans, for example).

-- 
Joseph S. Myers
joseph@codesourcery.com
