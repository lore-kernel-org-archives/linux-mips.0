Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199801021756.JAA36833@oz.engr.sgi.com>
Subject: Re: Please help - need a 4600 no L2 cache kernel asap
Date: Fri, 2 Jan 1998 09:56:49 -0800 (PST)
In-Reply-To: <9801021008.ZM4428@mdhill.interlog.com> from "Michael Hill" at Jan 2, 98 10:08:13 am
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Michael Hill <mike@mdhill.interlog.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980102175649.D6IZ-eu6KyBR-plryXsjfPO6X8qsZFS3gjp3oD8yk8A@z>

Important change to the SGI/Linux FTP site:

I just moved the CVS source tree hierarchy so it can be
accessed via ftp:

	ftp://ftp.linux.sgi.com/cvs/

There's also a link from the web site to this (software page)
	http://www.linux.sgi.com/software.html

This should enable anyone to compile a good kernel from scratch.

Whoever has a stable kernel that works on a L2-cache-less 4600
please share.  I'll gladly give this person ssh access to linus.


-- 
Peace, Ariel


:
:Ralf discovered and corrected this in his kernel source after several of us had
:problems with his last publicly-available Indy kernel binary (8 December).
: Since then no kernel binary or source has been posted to ftp.linux.sgi.com
:(except linux-magnum-971229.tar.gz on 29 December).  Maybe the fix is part of
:what Ralf wanted help with before Christmas.
:
:On Dec 21,  5:45pm, Ralf Baechle wrote:
:> Subject: Mergeback
:> Hi,
:>
:> can anybody else work a bit on merging things back to Linus for the
:> next couple of days?  I wont have very much time :-(
:>
:>   Ralf
:>-- End of excerpt from Ralf Baechle
:
:On Jan 2,  6:59am, Andrew O'Brien wrote:
:> Subject: Re: Please help - need a 4600 no L2 cache kernel asap
