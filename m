Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199812240056.QAA21876@oz.engr.sgi.com>
Subject: Re: Linux on O2
Date: Wed, 23 Dec 1998 16:56:36 -0800 (PST)
In-Reply-To: <01BE2E78.9742E750@REDDD2> from "Doug Redd" at Dec 23, 98 01:31:46 pm
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Doug Redd <ReddD@aurorabio.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19981224005636.wW5v5smn_Exdxd2OZ3HKUoEIIs21XKZie2npFY8W8Do@z>

:
:Can anyone tell me how far along a port to O2 is and if I can be of any
:help?  I have a couple of these that are hardly being used sitting
:around the office, and would find it interesting to try and get Linux
:working on them.
:
The main effort required to port Linux to the O2 is the drivers
for a completely new set of hardware devices:  The CRIME (graphics)
and MACE (I/O) chips in particular.

The (relativley inexpensive) hardware is not the hard part to get,
What will be needed is mostly hardware specs and I'm not sure
who has access to these and what restrictions are there on them
at this point in time.


:Any information is appreciated...
:
<personal perspective>

At the time we started with the Indy/Linux port management
considered the UMA architecture of the O2 too innovative to
be widely exposed. With SGI becoming friendlier towards Open Source
(see funding Samba, Linux International, freeware.sgi.com, etc.)
This may change.  I just haven't heard anything official about it yet.

Now consider that SGI will be announcing a new Intel based
machine (some people asked about it on this forum before) RSN
According to the public site:

	http://www.sgibreakthrough.com/

The launch is on Jan 11, 1999.

I have an O2 on my desk and I love it -- but:

I would say that since it is an Intel machine and assuming limited
resources it would make much more sense to put Linux on that one,
rather than on the O2; mainly due to a much wider availability of
precompiled and pre-configured software, much larger compatible
installed base and potential contributors, better price/perf, a real
opportinity to bring high-end 3D graphics to the masses, etc.
etc.

Of course, SGI employees cannot comment any further on this yet
unannounced product ... but it *that* one could be "opened"
it would be *really* great (my personal wish).

<end personal perspective>


-- 
Peace, Ariel
