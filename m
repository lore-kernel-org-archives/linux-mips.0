Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199705301346.JAA12694@neon.ingenia.ca>
Subject: Re: userland cometh
In-Reply-To: <199705300847.KAA25091@informatik.uni-koblenz.de> from Ralf Baechle at "May 30, 97 10:47:18 am"
Date: Fri, 30 May 1997 09:46:33 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970530134633.4w1mHDoBjx0hoizVtGNP2ETJ81LLJLAkTHspuhkbnXE@z>

Thus spake Ralf Baechle:
> Take a look at the little endian RPM packages I've published on
> kernel.panic.julia.de.  All these packages were build from the vanilla
> SRPM packages on the RedHat 4.1 package.

Yeah, yeah... =)

Once I get a natively-hosted compiler working, I'll be cranking out
RPMs[*].  In the meantime, convincing some of those packages to
cross-compile is pretty interesting.  Lots of post-./configure
Makefile munging with perl and the like.

Actually, I think it'll be my cohort Alex who'll be building most of
them.  He likes RPM in a way that's a little frightening (hi, Alex!). =)

> I'd like to keep the number of .tar packages as low as possible; the
> root.tar.gz package has proven not to be very updateable.

I can imagine.  I'm not looking to be a distribution (yet). =)

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>           Resident Linux bigot and kernel hacker. (OOPS!)           
#> `If you get bitten by a bug, tough luck...the one thing I won't do  
#> is feel sorry for you.  In fact, I might ask you to do it all over  
#> again, just to get more information.  I'm a heartless bastard.'     
#>                       -- Linus Torvalds (on development kernels)    
