Message-ID: <000501c079d3$fefe1a60$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20010109004101.B27674@paradigm.rfc822.org>
Subject: Re: MIPS32 patches breaking DecStation
Date: Tue, 9 Jan 2001 01:34:47 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Florian Lohoff <flo@rfc822.org>, linux-mips@oss.sgi.com
Message-ID: <20010109003447.gQcRFGX1ReLVpl8ZBcA9dP4-Itflj1n1MfSfDI7x65w@z>

Florian,

Could you do me a huge favor and try a build that
uses 3 or 4 nops instead of the branch to the instruction
after the delay slot?   There was a reason that I eliminated
the branch construct from the MIPS internal Linux source
base - it's a hack that works perfectly on R4000's, but
it's pretty much a coincidence that it does so.  Yes,
the code fragment in question is R4K-specific, but
we really need to migrate towards the use of consistent
mechanisms that work across the full range of MIPS
CPUs.  Ideally, *all* CP0 hazards should some day be 
padded out with "ssnops" (sll $0,$0,1, if I recall), which 
force a 1 cycle delay per instruction even on superscalar 
MIPS CPUs.

            Kevin K.
