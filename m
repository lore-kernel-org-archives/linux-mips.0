Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199801211809.KAA03109@oz.engr.sgi.com>
Subject: Re: Disk Space
Date: Wed, 21 Jan 1998 10:09:26 -0800 (PST)
In-Reply-To: <6e690e14.34c6079f@aol.com> from "LetherGlov" at Jan 21, 98 09:35:09 am
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: LetherGlov <LetherGlov@aol.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980121180926.hZBPquh43FR6IWWr34Eg3LncIRsJskDJCUphgQ4viKA@z>

:
:There seems to be a small problem on the root(/) drive of Linus, as it is 100%
:used. I'm not quite sure what caused this, as a few days ago it was fine, but
:I'd like to be able to pull some sources from the CVS and it woun't let me
:complaining about the space.
:
Yes the root filesystem is very small.  Please use only the /src
and /work partitions to do your work.  There are only three users
who have over 20 Mb each in their home dirs.  I guess I can
delete Larry's stuff since he hasn't logged in in a very long time
Also: anyone knows if Mark Salter is still helping? He has 43Mb...

I also cleaned some old logs /var/adm/{oOLD}* so we are down to 98% before
dealing with user dirs...

-- 
Peace, Ariel
