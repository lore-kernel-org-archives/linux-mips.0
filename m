Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: olson@anchor.engr.sgi.com (Dave Olson)
Message-ID: <199905040354.UAA16791@anchor.engr.sgi.com>
Subject: Re: building an elf64 R10k kernel
In-Reply-To: <372E6AA0.505A6071@foo.tho.org> from Charles Lepple at "May 4, 99 03:33:52 am"
Date: Mon, 3 May 1999 20:54:28 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Charles Lepple <clepple@foo.tho.org>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19990504035428.jscZnPiMq0WRoHM34yMtBp1gVJZHZZPFCDe7z0MUpYQ@z>

Charles Lepple wrote: 
|  Hey all,
|  Does anyone out there know any details on building elf64 objects? I was
|  all happy about seeing Andrew's Indigo2 patches, and decided that I
|  _had_ to try and make it work on an Indigo2 Impact 10000... Suffice it
|  to say that it isn't straightforward.

For r10k Indigo2 to work, you will need to hack the compiler,
for various reasons (the way the r10k works, plus the fact that
indigo2 doesn't have i/o cache coherency, interact in some "interesting"
ways.  I would suggest not attempting this port, unless you have a *lot*
of spare time.

Dave Olson, Silicon Graphics
http://reality.sgi.com/olson   olson@sgi.com
