Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199707181813.OAA20228@neon.ingenia.ca>
Subject: Re: Pointers on how to get started
In-Reply-To: <Pine.LNX.3.95.970718132141.27101H-100000@lager.engsoc.carleton.ca> from Alex deVries at "Jul 18, 97 01:32:57 pm"
Date: Fri, 18 Jul 1997 14:13:13 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970718181313.QzaqAVQoHH6M0AL7Ys0dfRcbBJtvzBr1izR7FClh2b8@z>

Thus spake Alex deVries:
> How are things on the native booting front?

I can boot bogomips off of local disk, but I'm seeing some wierdness
with users and groups that I can't explain (via NFS and ext2).  I'd
like to get strace working so I can debug it more.

There are also some moderately serious VFS bugs in 2.1.4[35] that are
blocking some stuff right now.  (Can't boot diskless with .45, for
example.)

Mike

-- 
#> Mike Shaver (shaver@ingenia.com)      Information Warfare Division  
#> Chief Tactical and Strategic Officer         "Saepe fidelis"        
#>                                                                     
#> "I like your game, but we have to change the rules." -- Anon        
#>                                                                     
