Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199709161458.KAA01510@neon.ingenia.ca>
Subject: EFS update
Date: Tue, 16 Sep 1997 10:58:41 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970916145841.wWNno3wO7uC55By3XyyXzMLQb-EVGkD4Oo4fL7Bf6Fc@z>

OK, I've managed to merge (read: rewrite) the EFS module code into the
2.1.55 tree from linus.  I can mount my root IRIX partition, ls -l
stuff, run simple binaries and the like.  I don't handle symlinks
correctly, but that's going to be easy enough to fix.

I'm checking in my changes now, and I'll put a kernel up on ftp.linux
for people to test with.  This should make the installation process
_much_ simpler.

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>           Resident Linux bigot and kernel hacker. (OOPS!)           
#> `If you get bitten by a bug, tough luck...the one thing I won't do  
#> is feel sorry for you.  In fact, I might ask you to do it all over  
#> again, just to get more information.  I'm a heartless bastard.'     
#>                       -- Linus Torvalds (on development kernels)    
