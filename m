Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199709170141.VAA07688@neon.ingenia.ca>
Subject: Re: EFS question
In-Reply-To: <199709170133.SAA20782@fir.engr.sgi.com> from "William J. Earl" at "Sep 16, 97 06:33:19 pm"
Date: Tue, 16 Sep 1997 21:41:47 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.engr.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970917014147.7d-EIlx1WuCABwwhoTTdrdANZZKWS5970JITkYNuT9k@z>

Thus spake William J. Earl:
> When there are indirect extents,
> the offset field of the first indirect extent in the inode
> contains the number of indirect extents, not a file offset.

_Ah!_
That makes _much_ more sense, then.

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>              Commando Developer - Whatever It Takes
#>                                                                     
#> "See, you not only have to be a good coder to create a system like
#>    Linux, you have to be a sneaky bastard too." - Linus Torvalds
