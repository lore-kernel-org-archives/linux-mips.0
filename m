Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199708081519.LAA06545@neon.ingenia.ca>
Subject: par and us*
Date: Fri, 8 Aug 1997 11:19:35 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970808151935.RY8xixSOshFejCOEbAOeMyLbS9eBwYKwCyDXt7txIqw@z>

I've got a simple lock-contention program that I'm using to see how
the usema stuff works.

When I try to run the program under par, though, it only lets me trace
one of the invocations:

1 [shaver@linus ~/work/usema]$ par -s -SS -l -o lock-p.par ./lock p
1 Creating new lock.
1 Storing lock.
1 Getting lock.
1 Waiting...

(now I start the second one)
2 [shaver@linus ~/work/usema]$ par -s -SS -l -o lock-c2.par ./lock c
2 Cannot syscall trace pid 23779:Resource busy
2 Finding existing lock.
2 Getting lock.
2 [shaver@linus ~/work/usema]$

(back to the shell!)
(release the lock on the first invocation)
1 
1 Releasing lock.
1 Exiting
1 [shaver@linus ~/work/usema]$ 

(and now I get more output from the second invocation)
2 [shaver@linus ~/work/usema]$ Waiting...
2 Releasing lock.
2 Exiting

Under normal circumstances (no par), I have to press enter on the
second one as well for it to release the lock and exit.  When par is
doing its (arguably weird, maybe broken) thing, I don't have to do
that...

Is this a known problem?

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>              Linux: because every cycle counts.
#>
#> "I don't know what you do for a living[...]" -- perry@piermont.com
#>        "I change the world." -- davem@caip.rutgers.edu
