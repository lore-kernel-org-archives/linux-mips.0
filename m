Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Fri, 5 Dec 1997 11:15:24 -0600
Message-ID: <199712051715.LAA07167@athena.nuclecu.unam.mx>
From: Miguel de Icaza <miguel@nuclecu.unam.mx>
In-reply-to: <19971202200147.44637@uni-koblenz.de> (ralf@uni-koblenz.de)
Subject: Re: vmalloc hacks
Sender: owner-linux@cthulhu.engr.sgi.com
To: linux-mips@fnet.fr
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19971205171524.rQJ6o02kDVa8zYzUwHQp6hyLUyuB89QpHWPHQdZP2N8@z>


Hello Ralf,

> So you'll have to make vmalloc a real function again or you'll break the
> binary compatibility with modules.  Ok, not very much an issue.

Probably sched.c just needs to include vmalloc.h, that should get rid
of this problem.

Miguel.
