Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199708072137.RAA00275@neon.ingenia.ca>
Subject: usema stat() magic
Date: Thu, 7 Aug 1997 17:37:53 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970807213753.XaRQVRmJrUNz2RPKaOawPQgNz7BzeaQOgAcYO3_GR88@z>

I'm starting to work on the /dev/usema{,clone} drivers, and it looks
pretty conceptually straightforward.

It looks like libc uses some data hidden in the stat structure (dunno
what yet, but I'm sure Miguel will need it to be accurate =) ).  What
I can't figure out is how that data's hidden in the stat structure.  I
could _completely_ understand an IOCTL on the clone fd to get data,
but it doesn't seem to do that.  It does an fstat() on the fd it gets
back...

I tried looking at the stat data, but I can't see anything in there
that leaps out at me.  If it's just for diagnostics, I'm not _too_
worried about it, certainly not in the short term, but I have the
sinking feeling that there's more to it than that.

It's quite handy that the zero-contention cases are all handled in
user-space, BTW, except that my test cases have to get that much more
complex because of it. =)

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>                 Ignore the man behind the curtain.                  
#>                                                                     
#> "And then I realized that it never should have worked in the first  
#>  place.  Thus, it would not work again until rewritten." --- Anon.  
