Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199706040041.CAA04699@informatik.uni-koblenz.de>
Subject: Re: The Plan For Userland(tm)
Date: Wed, 4 Jun 1997 02:41:14 +0200 (MET DST)
In-Reply-To: <Pine.LNX.3.95.970603180712.25914M-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Jun 3, 97 06:13:42 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: ralf@mailhost.uni-koblenz.de, shaver@neon.ingenia.ca, linux@cthulhu.engr.sgi.com
Message-ID: <19970604004114.V0RvS5su2I-LLNkeDh8wyFBFInlzhVRvAYbmJ7h7Mzo@z>

> I need to link it with libz, which I just realized is really called zlib,
> not the zlibc found on prep.ai.mit.edu.  Who knew?  I'm just getting
> problmes now with glibc's crt1.o, which I know little or nothing about.
> 
> Ralph, can you give us (Mike or I) a copy of your SSH's?  We will in turn

s/Ralph/Ralf/

> keep you up to date with our userland binaries, and hopefully we can move
> towards sharing RPMs, both source and binary. 

ssh is no big deal.  Builds out of the box.  You will just have to
tell it for which architecture you're building, ie:
./configure --prefix=/usr mips-linux

There is also a rpm source package for libz available, but for now you
can just use the libz.a and includes included with ssh.

> mips-linux-gcc, incidentally, is very impressive.

Just another GCC.

  Ralf
