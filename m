Message-ID: <006001c3fa31$74c07fa0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Law10-F123ODt9Cz93M0000b89a@hotmail.com>
Subject: Re: r3000 instruction set
Date: Mon, 23 Feb 2004 18:21:19 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Mark and Janice Juszczec <juszczec@hotmail.com>, linux-mips@linux-mips.org
Cc: uhler@mips.com, dom@mips.com, echristo@redhat.com
Message-ID: <20040223172119.9eyiXwzPEiCxpg08kIt7y1tpGACb8pc4084E_acpXxI@z>

> Someone suggested posting the message I get.  Here it is:
> 
> >./kaffe-bin FirstClass
> [kaffe-bin:6] Illgal instruction 674696a at 2abb034, ra=2adbffd0, 
> P0_STATUS=0000500
> pid 6: killed (signal 4)
> >Reading command line: Try again
> Kernel panic: Attmpted to kill int!

Let me guess.  You are running little-endian.  The instruction word
in memory would be 0x6a697406.  Do you think it's a coincidence
that 0x6a6974 spells "jit" in ASCII?  ;o)

The reported address range looks like that where kaffe builds its
JITted instruciton buffers in MIPS/Linux.  And, like I say, JIT is
somewhat broken for MIPS in Kaffe.  Which version of the kaffe sources 
are you building, and have you tried configuring with --with-engine=intrp
as I suggested?

            Regards,

            Kevin K.
