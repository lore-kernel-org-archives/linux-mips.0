Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199709050458.AAA16971@neon.ingenia.ca>
Subject: Kernel for local disk stuff
Date: Fri, 5 Sep 1997 00:58:04 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970905045804.daJPZ7BZG67WqChVZz9yeg-Io_Lefep1cxfOxAtQYXA@z>

ftp://ftp.linux.sgi.com/pub/test/vmlinux-950905.gz works for me for
mounting local disk as root.

Getting a local disk set up is still a minor nightmare, because
there's no simple boot image yet (though Alex is working on it), and
because heavy ethernet traffic occasionally generates bus errors that
lock up the box.  I'm going to take a look at what causes those
tomorrow, hopefully.

(I'm also going to reinstall IRIX on the primary disk.  mke2fs
can really wreck IRIX's day. =) )

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>              Linux: because every cycle counts.
#>
#> "I don't know what you do for a living[...]" -- perry@piermont.com
#>        "I change the world." -- davem@caip.rutgers.edu
