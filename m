Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199708122021.NAA23445@oz.engr.sgi.com>
Subject: Re: Precompiled kernel available ?
Date: Tue, 12 Aug 1997 13:21:54 -0700 (PDT)
In-Reply-To: <199708122005.WAA01791@informatik.uni-koblenz.de> from "Ralf Baechle" at Aug 12, 97 10:05:41 pm
Reply-To: ariel@sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Cc: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970812202154.dTOwSxAY62kKlUT_5X19gYNvwGcAbhw7gLTYjnPWqg4@z>

:
:> -Wstrict-prototypes -O2 -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic
:> -mcpu=r4600 -mips2 -pipe  -c -o system.o system.c
:> system.c:17: #error "... You're fearless, aren't you?"
:> make[1]: *** [system.o] Error 1
:> make[1]: Leaving directory `/usr/src/adevries/linux/arch/mips/sgi/kernel'
:> make: *** [linuxsubdirs] Error 2
:> 
:> Heh.  I don't think anyone's called me fearless before.
:
:That's a shopstopper that I added on Ariel's request.  I don't think we
:need it anymore.  Ariel?
:
:  Ralf
:
Ah the early days when a build would likely not even run since you
didn't yet have a test machine over there...

Sure, if you think it is not needed (and people can actually build
something that would run on an Indy) then by all means delete it.

;-)

-- 
Peace, Ariel
