Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: "Greg Chesson" <greg@xtp.engr.sgi.com>
Message-ID: <9608130945.ZM7238@xtp.engr.sgi.com>
Date: Tue, 13 Aug 1996 09:45:44 -0700
In-Reply-To: nigel@aa5b (Nigel Gamble)
        "Re: Linux: the next step" (Aug 13,  8:36am)
References: <199608131536.IAA29651@aa5b.engr.sgi.com>
Subject: Re: Linux: the next step
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux@cthulhu.engr.sgi.com
To: Nigel Gamble <nigel@aa5b.engr.sgi.com>, dm@sgi.com
Cc: linux@aa5b.engr.sgi.com
Message-ID: <19960813164544.W9jcDwU_ret9k8aXJiNOJYx65kTXxBSiTV1Q837YLRg@z>

The new real-time facilities in Irix (Nawaf's scheduler) are superior to what
has been available before in any Unix-like system that I know of.  There are
two areas of shortfall, but these are probably unavoidable given the design and
its operating environment:

	1. priority-based scheduling is often a poor substitute for deadline
	   scheduling, although it is useful for many rt applications.

	2. once a process gets scheduled via the rt facility, if it does any
	   system calls you get Irix system call performance.  Sometimes this
	   will be an issue (by limiting the number of syscalls and rt apps),
	   and other times it will not be so important.

I believe that efforts to incorporate hard real-time scheduling into a
full-function OS will satisfy the large majority of customers who have
real-time applications.  These customers do not want to run on the bare iron -
they want their real-time and they want their OS also.

The Linux-based hack that Larry described is indeed elegant - I had a look at
the paper.  However, if that hack were enough to support a wide range of
real-time applications I think system hacks would have implemented it a long
time ago.

g
