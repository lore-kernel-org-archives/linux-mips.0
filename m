Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@Julia.DE>
Message-ID: <199706132329.BAA06504@kernel.panic.julia.de>
Subject: Re: Userland loader / run time loader
Date: Sat, 14 Jun 1997 01:29:47 +0200 (MET DST)
In-Reply-To: <Pine.LNX.3.95.970613192104.15021E-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Jun 13, 97 07:30:37 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: ralf@Julia.DE, lm@neteng.engr.sgi.com, ralf@mailhost.uni-koblenz.de, shaver@neon.ingenia.ca, linux@cthulhu.engr.sgi.com
Message-ID: <19970613232947.ktnXNz355Nj65gjDMYD-7Y9U8D3bc_b1Yt5djIhyUI8@z>

> To begin with, excuse my noviceness in this all. Those are LSB binaries,
> whereas the sgi-linux box that I have access to (bogomips.ingenia.com)
> will only run MSB. 
> 
> As written on this list earlier, we don't have bi-endian support.  So,
> which one is it we're going to support to begin with? How is it that Ralf
> is able to execute LSB binaries?
>
> Am I missing something big?

{\grin[evil] Because I've got four types of MIPS boxes running Linux at
home and to two more I've got access.}

I think this also explains why I'm so interested in running biendianess -
I'm running out of diskspace ...

> Also, there was talk of getting merged up with kernel 2.1.4[234].  Any
> luck so far?

Yes.  I haven't merged all the files of my home CVS archive yet into
David's CVS archive from which he sends patches to Linus but the biggest
part is now in sync.

  Ralf
