Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199903300853.AAA52093@oz.engr.sgi.com>
Subject: Re: Port to R3000 Indigo
Date: Tue, 30 Mar 1999 00:53:03 -0800 (PST)
In-Reply-To: <37000EE1.6C336FD0@unidial.com> from "Alan Hoyt" at Mar 29, 99 11:38:10 pm
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alan Hoyt <neuroinc@unidial.com>
Cc: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19990330085303.Z_VeJODfYDLy32-onFo7NjUee7VNfKJKs9pJAQNAEvE@z>

:Two questions:
:
:Does this mean that you are going to be posting the hardware specifications
:for the Indigo 2, O2, etc.. (i.e. SGI's more recent systems) on your web
:server for public access, or will this information be disseminated through
:controlled channels?
:
:Also,  if you are going to post the specs - when will they be available?
:
:Just curious, since HP publicly released some detailed hardware specs for
:their systems in PDF format to assist their Linux porting project - it's very
:nice.
:
:Thanks
:
: - Alan Hoyt -
:
Alan,

I believe this was referred to by Bill Earl in an earlier post.
Clearly, this needs further explanation.

Since the interfaces with SGI proprietary hardware were never meant
to be public, the only documentation you can really rely on to be
accurate and reliable is the (working) IRIX source code.  We would really
like to avoid publishing material that's incomplete, outdated, and
turns out to be more confusing than it is worth.

Now, if it were entirely in my hands, I would have gladly published
some source code.  The problem is much more complex than that.  The
IRIX source code includes licensed code from many external commercial
sources, AT&T SVR4, Sun, Xerox, etc. each surrounded by its own complex
licensing terms, so the lawyers need to look into this lest SGI
becomes liable by just making some "innocent goodwill" happen.  

I know it sounds lame, and I as much as anyone, hate this, but
this is reality, and it isn't simple as it may appear to some.
It requires a lot of legal (inspection and clearance) + engineering
(sanitize and clean up code) time which I'm not sure we can afford
on a global scale. 

The good news is that SGI is clearly putting much more emphasis
these days on developing hardware that is much more standard
and opening more and more source code (after legal has looked into
it and approved it).  Everything we have been doing in the past
year on the Linux front makes this clear that this is where we're
going.  I would like to request a bit of patience and support...
You are preaching to the choir here.

-- 
Peace, Ariel
