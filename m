Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199608122118.OAA18053@refugee.engr.sgi.com>
Subject: Re: Linux: the next step 
In-reply-to: Message from renglish@ratliff of 12 Aug 1996 13:52:47 PDT
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 12 Aug 1996 14:18:18 -0700
From: Steve Alexander <sca@refugee.engr.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Bob English <renglish@ratliff.engr.sgi.com>
Cc: Larry McVoy <lm@gate1-neteng.engr.sgi.com>, Nigel Gamble <nigel@cthulhu.engr.sgi.com>, Alistair Lambie <alambie@wellington.sgi.com>, ariel@cthulhu.engr.sgi.com, linux@yon.engr.sgi.com
Message-ID: <19960812211818.y5ba-S7ZLj_PRJtUib48XQjUKFYzGPt_2JLnBHy0Q0s@z>

Bob English <renglish@ratliff> writes:
>If you look at larry's context switch and pipe benchmarks, you'll see
>that they run much faster on a single CPU than on two or more.  A lot of
>the difference is due to fine-grained locking, which causes more dirty
>cache lines to thrash than is actually necessary for the operations
>involved.  Pipe communication takes locks at the vnode and inode
>level.  Context switches take locks on threads, accounting structures,
>and queues.

If I look at those benchmarks, they'll probably run faster on Linux on an Indy
than they do on IRIX on an Indy, so I doubt the locking is the big problem we
need to be looking at.  I don't have numbers from David to quote, so maybe I'm
wrong.  I'd like to be wrong.

-- Steve
