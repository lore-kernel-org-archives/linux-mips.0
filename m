Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199709161552.LAA02252@neon.ingenia.ca>
Subject: EFS update II
Date: Tue, 16 Sep 1997 11:52:54 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970916155254.sLyx0KZVaWVKGln6czVGomWK6UOfaz8sh9mAEfqJxzM@z>

OK, there's more that needs fixing than the symlink handling.
I still don't handle indirect extents properly either, and I've got
something a little wrong in the directory reading that gives bogus
filenames on occasion.

I'll let you know when I have something usable.

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>              Commando Developer - Whatever It Takes
#>                                                                     
#> "See, you not only have to be a good coder to create a system like
#>    Linux, you have to be a sneaky bastard too." - Linus Torvalds
