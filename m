Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@yon.engr.sgi.com (Ariel Faigon)
Message-ID: <199706141721.KAA12726@yon.engr.sgi.com>
Subject: Re: gcc for Irix.
Date: Sat, 14 Jun 1997 10:21:07 -0700 (PDT)
In-Reply-To: <9706140839.ZM21078@heaven.newport.sgi.com> from "Christopher W. Carlson" at Jun 14, 97 08:39:28 am
Reply-To: ariel@sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "Christopher W. Carlson" <carlson@heaven.newport.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970614172107.bhDGRBIVdLSsWJ7bWGPBqE5VKtIqft3gs0mI4hD7Uc8@z>

:
:Actually, it isn't a bug because there was a major version change.
:Anything can change between 5.3 and 6.2.  I know we try to maintain
:backwards compatibility but sometimes ANSI requires changes in the
:number of parameters, there's a change in the values used to pass to
:functions, etc.
:
:I believe our promise is that code compiled on 5.3 will run on 6.2,
:not that it will still compile.
:
Yes, It was mainly ANSI/POSIX1C/POSIX2/XPG4/UNIX95 (spec 1170) changes
(See /usr/include/standards.h) which caused major changes in IRIX
headers in order to be able to support all these standards without
conflicts (a pretty big undertaking).

In addition there were some enhancemnets to certain APIs, for example
supporting faster serial speeds which changed some termios.h subtle
interfaces (you may still compile with -D_OLD_TERMIOS of course, but
still a change that may break compilations on old and arguably not
cleanly written UNIX apps -- GNU less comes to mind) 

And finally there's "fix_headers" - the utility that comes with gcc
and fixes headers so they can be used with some gcc conventions
and extensions to C.  Combine this with our multi-standard headers
which I suspect the designers of "fix_headers" never thought of
and you get a pretty cool mess :-)

-- 
Peace, Ariel
