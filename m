Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199705281919.PAA31653@neon.ingenia.ca>
Subject: Re: hardware independent hinv
In-Reply-To: <199705281912.MAA06609@neteng.engr.sgi.com> from Larry McVoy at "May 28, 97 12:12:22 pm"
Date: Wed, 28 May 1997 15:19:04 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Larry McVoy <lm@neteng.engr.sgi.com>
Cc: ariel@sgi.com, linux@yon.engr.sgi.com, olson@anchor.engr.sgi.com, scotth@sgi.com, swmgr@swmgr.engr.sgi.com, breyer@swmgr.engr.sgi.com
Message-ID: <19970528191904.cr9UCGsxDlqWbzxAlQxAEBlrOWepPlITAgm2AFphf9U@z>

Thus spake Larry McVoy:
> : Just forwarding since it sounds someone hopes that Linux/MIPS
> : will some day have a HW independent hinv... - Ariel
> 
> Here's my first pass at it.  It certainly isn't complete but it is a 
> start.  We could evolve Linux' /proc to fully handle this.

What about a perl (SGI::?)Hinv:: module that would get hinv data from the
appropriate source?  I've been thinking about a clean perl interface
to /proc for a while, and I assume the data's there for the taking on
the Irixen as well, if you know where to look.  (open("hinv|") is all
else fails.)

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>                 Ignore the man behind the curtain.                  
#>                                                                     
#> "And then I realized that it never should have worked in the first  
#>  place.  Thus, it would not work again until rewritten." --- Anon.  
