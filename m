Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199705312257.SAA30365@neon.ingenia.ca>
Subject: Re: ah...
In-Reply-To: <199705312209.AAA13044@informatik.uni-koblenz.de> from Ralf Baechle at "Jun 1, 97 00:09:15 am"
Date: Sat, 31 May 1997 18:57:54 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970531225754.xQt4PpSu56JMvyoel5waMrlagikHRvrvElX0TH1Z5NY@z>

Thus spake Ralf Baechle:
> I checked my own source base at home; both libc and the kernel use the
> same values as IRIX 6.2 so there must be something wrong with your libc.

No, there's something wrong with my kernel.
I'm still using davem's 2.0.12 from the CVS archive, and it uses the
"standard Linux" values for SOCK_{STREAM,DGRAM}.

I'll wait to get a newer source tree, I guess.  (Wednesday?)

I think I'd prefer to keep all of the values standard across Linux
ports, but it's not really my call.  I guess as long as your libc
changes and kernel stuff propogate into the mainline trees, it's no
big deal.

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>              Linux: because every cycle counts.
#>
#> "I don't know what you do for a living[...]" -- perry@piermont.com
#>        "I change the world." -- davem@caip.rutgers.edu
