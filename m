Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199605301817.LAA13683@refugee.engr.sgi.com>
Subject: Re: linux needs bsd networking stack 
In-reply-to: Message from alan@cymru.net of 30 May 1996 11:06:25 BST
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 30 May 1996 11:17:21 -0700
From: Steve Alexander <sca@refugee.engr.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alan Cox <alan@cymru.net>
Cc: Larry McVoy <lm@gate1-neteng.engr.sgi.com>, dm@neteng.engr.sgi.com, nn@lanta.engr.sgi.com, torvalds@cs.helsinki.fi, sparclinux-cvs@caipfs.rutgers.edu, lmlinux@neteng.engr.sgi.com
Message-ID: <19960530181721.tILw7FqKemPYZm1723_hsePwvMaiJuBI8YxuDQuGZeI@z>

Alan Cox <alan@cymru.net> writes:
>We can't steal it outright. 4.4BSD has abominable problems as is. The FreeBSD 
>people
>have the worst of them fixed but don't have stuff like Vegas and have all the 
>horrible spoofing problems caused by bad timers.

I'm not sure I understand what that means, but I'm pretty sure that Vegas is
not universally agreed to be a good idea, unless I've missed a meeting.

Just to set the record straight, there are people at SGI who don't like either
the BSD or Linux stacks ;->.

The one thing that I will say about the Linux stack is that it is evolving much
more rapidly than any of the public BSD versions are (I spent some time porting
aliases forward from one version to another for a friend, and the improvements
between versions were amazing), so at some point it will probably win on
functionality.

-- Steve
