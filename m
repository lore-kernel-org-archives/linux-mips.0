Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199708110250.WAA25855@neon.ingenia.ca>
Subject: /dev/usema questions
Date: Sun, 10 Aug 1997 22:50:35 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970811025035.-6nHOcyWZE68_zLo8P2-IUUiWXCjANx7vAXUA5pP_a0@z>

Couple of questions I'd like some enlightenment on, as I try to get
/dev/usema{,clone} ready for Miguel's Xcellent Adventure:

- what is us_attach.us_handle for?  Is it some opaque pointer I can
send to userland and get back for all the other ioctls?  Please? =)

- do libc and IRIX really use the minor of the filehandle to identify
the usema `device' it's working with?

- from sys/usioctl.h:
#define UIOCBLOCK       (UIOC|3)        /* block, sync, intr */
#define UIOCNOIBLOCK    (UIOC|5)        /* block, sync, intr */
Should I take UIOCNOIBLOCK to really be "/* block, sync, nointr */"?

- what's the difference between sync/async blocking/unblocking?  I
thought it might be that sync would mean that schedule() happened
immediately, but then I don't think that async blocking makes much
sense.

The us* stuff is pretty cool, I must say.  Someone (<whistles
quietly>) should think about doing it for Linux...

Mike

-- 
#> Mike Shaver (shaver@ingenia.com)      Information Warfare Division  
#> Chief Tactical and Strategic Officer         "Saepe fidelis"        
#>                                                                     
#> "I like your game, but we have to change the rules." -- Anon        
#>                                                                     
