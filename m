Message-ID: <02a701c34f81$4f32ca50$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1030721124445.13489A-100000@delta.ds2.pg.gda.pl>
Subject: Re: CVS Update@-mips.org: linux 
Date: Mon, 21 Jul 2003 14:12:07 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, ralf@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20030721121207.zqGnpPqYaONp8zmqJvdiqbZFUnSmgokMEoaAqmunbYU@z>

>  Any justifiable reason for getting rid of arch/mips64?

In my opinion, it should never have existed.  The vast majority
of MIPS-specific kernel code can be identical for 32-bit and 64-bit
versions of the architecture.  Creating arch/mips64 (as opposed
to arch/mips/mips64 or Ralf's arch/mips/mm-64) caused duplication 
of modules that then needed to be maintained in parallel - but which 
often were not.
