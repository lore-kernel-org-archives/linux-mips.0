Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0zPnb2-000aNTC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: HAL2
Date: Sun, 4 Oct 1998 13:49:07 +0100 (BST)
In-Reply-To: <Pine.LNX.3.96.981004125525.2569A-100000@calypso.saturn> from "Ulf Carlsson" at Oct 4, 98 01:23:12 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ulf Carlsson <grim@zigzegv.ml.org>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19981004124907.OXufWdM6mKSblaiVOPsOMnisjb0OVEr-raHwy1eyZ_Q@z>

> level applications. The implementation of my HAL2 driver will exist in
> kernel space, and a user level library will provide higher level interface
> to the applications (the same interface as libaudio.a in IRIX). Do we know
> what the interface between libaudio.a and the Irix kernel looks like or am
> I free to do what I want?
> 
> The code I've written so far is based upon this idea.
> 
> Is this the Right Thing to do it?

Not IMHO, well not unless it also supports the sound ioctls that every
other Linux platform does as well. 
