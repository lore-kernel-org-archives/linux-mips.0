Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@yon.engr.sgi.com (Ariel Faigon)
Message-ID: <199706180034.RAA24770@yon.engr.sgi.com>
Subject: Getting X on Linux/SGI
Date: Tue, 17 Jun 1997 17:34:24 -0700 (PDT)
In-Reply-To: <9706171700.ZM11546@blammo.engr.sgi.com> from "John Wiederhirn" at Jun 17, 97 05:00:11 pm
Reply-To: ariel@sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: John Wiederhirn <jwiede@blammo.engr.sgi.com>
Cc: linux@yon.engr.sgi.com
Message-ID: <19970618003424.E2pxyQMii9KGLf9RUrU7_-6APjXuCB-QEV-Dt3csLvY@z>

[note the change in subject]

First a note to all SGI linux subscribers:
There are about 10 interested parties external to SGI
on this list.  I just say this so you're all aware of it.


:
:Given that it's unlikely we'd release the source code to our gfx drivers,
:
Well, after getting some hardware, that's our next hurdle :-)

I believe it would be a very good idea to release the Indy low-level
graphics source (even under NDA, although personally, I wouldn't
use NDAs) to XFree developers.  I'm not even talking amazing 3D or
Octane stuff here.  Let's first get basic X11 running on Indys
then worry about OpenGL / O2s etc.

Note that this means getting the basic 2D stuff running.  Heck, I can't
understand the logic of anyone being so protective about 5 year
technology, it is available on every PC with mid-range level graphics
by now.


:
:I realize this comes off as fairly negative, but I'm just trying to explain the
:issues involved once gfx gets added to the mix.  There would need to be a
:buy-in at a very high level of SGI mgmt. before we could start making the
:hardware details of our graphics subsystems available (at least the more modern
:ones, such as O2, Impact, etc.).
:
John, lest I sound negative, I don't mean to.  I hope all the
people on this list can agree on such obvious things.  I hope
that that fuzzy cloud called "upper level management" will
somehow transform into a person I can talk to.  My experience
is that once you get to the right upper level person, and
you state your case sensibly, you get what you want.

If anyone on the list knows the people to talk to to get this
happen please share.


P.S:
It is interesting to note how the SPARC port happened despite Sun
never releasing low-level stuff (as if they had anything to lose
by that) and David's reverse engineering all their stuff.  SGI
has nothing to lose and everything to gain from cooperation with
the hacker's community.  Linux is running on Alpha and SPARC
by now.  We don't want to see Linux running on HP and IBM
before it does on our iron, do we ?

-- 
Peace, Ariel
