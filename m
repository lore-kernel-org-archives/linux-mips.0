Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m10X8aD-0007TvC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Resources in X11 port
Date: Tue, 13 Apr 1999 20:10:52 +0100 (BST)
In-Reply-To: <19990413125254.A20170@mtu.edu> from "Andrew Isaacson" at Apr 13, 99 12:52:54 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Andrew Isaacson <adisaacs@mtu.edu>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19990413191052.s7vz8OIxyCbG5wdSK735sfMDmz4zZk73R18-ZQuS0C4@z>

> If you (the porters) are willing to wait until June to have publicly
> distributable code, you should develop for the 4.0 branch rather than
> the 3.3 branch.  There are a lot of useful new features in the new
> code base, and the new design is quite a bit easier to code for than
> the old.

Actually I wonder if it will be. Not having seen the code because of the silly
XFree about beta releases its hard to be sure. The X folks I talked to all
pointed me at the 8514 driver - which is very similar in many ways to the
SGI cards - both are designed for X11, both have no direct frame buffer
access and they have fairly similar concepts.

I would urge btw that anyone working on an XFree SGI driver releases it under
a license like the NPL so that the XFree people can't hide it in a locked away
beta release in future.

Alan
