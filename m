Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199708092253.SAA17511@neon.ingenia.ca>
Subject: Re: your mail
In-Reply-To: <Pine.LNX.3.95.970809214814.29239A-100000@odin.waw.com> from Vincent Renardias at "Aug 9, 97 10:05:02 pm"
Date: Sat, 9 Aug 1997 18:53:58 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Vincent Renardias <vincent@waw.com>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970809225358.TR8ixc2rVeBDY3u99_77hwhBcEV2VchGLgqYOATF8lo@z>

Thus spake Vincent Renardias:
> % mips-linux-gcc  -o pwgen pwgen.o -lm
> /usr/local/mips-linux/lib/libc.a: could not read symbols: Archive has no
> index; run ranlib to add one
> 
> running mips-linux-ranlib on the given file does not change anything.
> (ie: still getting the same message)

Did you use mips-linux-ar to create the archive?
Many packages, I've discovered, don't listen to $AR in the
environment, and I used to get that error all the time.

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>            Chief System Architect and Herder of Bits                
#>                                                                     
#> "Yoda say, `Just slap a little public key crypto into it' does not  
#>      a secure system make." -- Marcus J. Ranum (mjr@clark.net)      
