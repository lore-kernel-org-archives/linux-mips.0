Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199705312209.AAA13044@informatik.uni-koblenz.de>
Subject: Re: ah...
Date: Sun, 1 Jun 1997 00:09:15 -2200 (MET DST)
In-Reply-To: <199705302125.RAA22822@neon.ingenia.ca> from "Mike Shaver" at May 30, 97 05:25:28 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970601220915.tVCe3xrKvqZfr1dthF8Lx91CpRtW8CFUiUu0VKXyAOc@z>

Hi,

> Thus spake Ralf Baechle:
> > One of the fun things with SGI...  Long time ago checked two SGI machines
> > running different OS versions for reference.  In one of them the values
> > for SOCK_STREAM and SOCK_DGRAM are swapped compared to the other.  I wonder
> > why.  But anyway, at that time I choose to clone the constants from the
> > newer one.
> 
> Solaris is the same way...it's probably an SVR thing.
> (If you're going to use sockets, though, why not use the BSD values?)

One crappy conversion routine less.

I checked my own source base at home; both libc and the kernel use the
same values as IRIX 6.2 so there must be something wrong with your libc.

  Ralf
