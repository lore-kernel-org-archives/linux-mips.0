Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xdNb1-0005FsC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Linux on the O2
Date: Wed, 3 Dec 1997 22:48:43 +0000 (GMT)
In-Reply-To: <199712032231.OAA24793@fir.engr.sgi.com> from "William J. Earl" at Dec 3, 97 02:31:33 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.engr.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19971203224843.2H2Nm_9EiUZ5wuYd0r9NRqxcHqjNiI7cVYW0vagSo50@z>

> One interesting area for development, both in the embedded space, and on
> the SGI workstations, would be in regard to realtime support, which is
> needed for digital media.  By realtime, I mean not fast interrupt response,
> but rather precisely scheduled repetitive events (such as driving the Indy
> audio ports every 1 ms. with at most 0.9 ms delay no matter what else is
> going on).  

This exists although not for the MIPS platform and not directly accessible
from user space. NMT have a RTLinux kernel that allows real time drivers
to hit targets well well under 0.1ms. 
