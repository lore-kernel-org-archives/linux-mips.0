Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708122005.WAA01791@informatik.uni-koblenz.de>
Subject: Re: Precompiled kernel available ?
Date: Tue, 12 Aug 1997 22:05:41 +0200 (MET DST)
In-Reply-To: <Pine.LNX.3.95.970812151611.11852C-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Aug 12, 97 03:17:40 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: shaver@neon.ingenia.ca, jwr@icm.edu.pl, linux@cthulhu.engr.sgi.com
Message-ID: <19970812200541.zEx6FvgY0BwGjaGv_1AOu5pnBER6LBQSMzTMOORtp1g@z>

> -Wstrict-prototypes -O2 -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic
> -mcpu=r4600 -mips2 -pipe  -c -o system.o system.c
> system.c:17: #error "... You're fearless, aren't you?"
> make[1]: *** [system.o] Error 1
> make[1]: Leaving directory `/usr/src/adevries/linux/arch/mips/sgi/kernel'
> make: *** [linuxsubdirs] Error 2
> 
> Heh.  I don't think anyone's called me fearless before.

That's a shopstopper that I added on Ariel's request.  I don't think we
need it anymore.  Ariel?

  Ralf
