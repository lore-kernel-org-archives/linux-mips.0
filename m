Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199811052053.MAA55262@oz.engr.sgi.com>
Subject: Halloween doc II
Date: Thu, 5 Nov 1998 12:53:04 -0800 (PST)
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19981105205304.nalYR_YjlSYEYFUiKD8XCD5YlkAOvMg84pmpxzJQJYE@z>

Hi,

A second "what is Linux and how to combat it" document
just came out the Microsoft leak factory:

        http://www.opensource.org/halloween2.html

It is a followup doc to the infamous "Halloween Doc"
(now renamed "Halloween I").   It was leaked by an MS
employee as a reaction to the recent publicity for
Halloween-I.  It adds the threat of Linux as a client
and gives a very positive evaluation of Linux (coming
from within MS, this is telling).

It concludes again, with the sinister suggestions to
"de-commoditize" open protocols, plus (surprise) ways
to attack Linux via litigation (if you can't beat them
on merit, there are always the nukes, Bill).

		---
There's specific interest to this community: David Miller
and Miguel de Icaza are both mentioned and their SPARC
comparison docs are linked from this document.  No doubt,
the MS guys did a great research job.

There's a lot the Linux community learn from this document.
Just read the "what's missing in Linux compared to NT"
part and make sure it is implemented. It doesn't appear
too hard.  Some points which are definitely geared towards
the non sophisticated users include:

	1) Automounting a floppy/CD when it is inserted
	   (BTW: IRIX mediad has been doing this for quite a while)

	2) Simpler installation: e.g. rather than asking 30
	   questions, provide a menu like:
		1) Express install: don't ask me anything,
		   just go ahead and fill my disk.
		2) Pick and chose: let me select
		...

	3) XFree86 installation: don't ask me what chipset I have
	   and what's the scan rates etc.  Instead have an internal
	   mapping table between well known brand names (e.g. ATI Mach64)
	   and the details of the card.  People usually know the latter
	   (what's written on the box, but rarely the former)

	4) Simpler Network config:  DHCP client installed by default
	   Again saving complex questions to the simple user

	5) Of course, a coherent consistent GUI to manage everything
	   from HW devices to access to files etc.  Those who need
	   the simplicity, will never be willing to do command line
	   stuff.

	6) Development tools like VB/VC++ :-)

Someone forward this to Red Hat / Gnome and the XFree86 teams ...

-- 
Peace, Ariel
