Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@Julia.DE>
Message-ID: <199706140004.CAA08235@kernel.panic.julia.de>
Subject: Re: Userland loader / run time loader
Date: Sat, 14 Jun 1997 02:04:03 +0200 (MET DST)
In-Reply-To: <Pine.LNX.3.95.970613194626.15021G-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Jun 13, 97 07:51:37 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: ralf@Julia.DE, lm@neteng.engr.sgi.com, ralf@mailhost.uni-koblenz.de, shaver@neon.ingenia.ca, linux@cthulhu.engr.sgi.com
Message-ID: <19970614000403.-wd29cv7NINeOBpjaVZ7wvtAydDL2MAYT4jyGdwQaoc@z>

> > {\grin[evil] Because I've got four types of MIPS boxes running Linux at
> > home and to two more I've got access.}
> 
> To address the needs of us lowly folk who have fewer than 2 MIPS boxes[1],
> which endian are we going to be supporting first?  It would be _very_
> pleasant to be able to run all these binaries that Ralf has prepared. 

The dependencies from the byteorder are very low.  As long as we do
not have a kernel with the capability to execute binaries of both byteorder
at the same time byteorder is almost a non-issue for development.  Just
recompiling, that's it.

> Also, exactly how difficult is it to alternate the kernel between big and
> little endian? 

Well, depends on what you mean.  The simple solution is just recompiling
everything.  Works for kernel and user apps.  The more complex solution
is to make the kernel capable of running user apps of both byteorder at
the same time.  Among other things this requires that we go through all
the kernel source and fix the user space access routines.  A bit more of
an effort ;-)  Mips already did that once for RISC/os.

> This is getting cooler by the minute...
> 
> [1] In my case, 0, but access network access to 1.

Slower than 10mbit/s doesn't count :-)

  Ralf
