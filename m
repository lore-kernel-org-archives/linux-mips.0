Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0zMCB8-000aQzC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: challenge s boots linux
Date: Thu, 24 Sep 1998 15:15:29 +0100 (BST)
In-Reply-To: <Pine.SOL.4.02.9809240031070.6032-100000@azure.engin.umich.edu> from "Jeremy John Welling" at Sep 24, 98 00:47:07 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Jeremy John Welling <jwelling@engin.umich.edu>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980924141529.X458s9iff0iqgz2o9uHcu1jr2PbXU9Ebr37M3EH_uo0@z>

> What is the next architecture sgi/linux will be ported to?  Indigo2 r4kXZ?  
> What is the status of the newport Xserver? What is the best place to get

Im still learning about the internals of the Xserver and building an
"fb" driver layer to glue to the accelerated stuff. I've been dicing up
afb so that it generates newport_something() commands for each area
after having done its clipping. Hopefully they'll approximately match
the real newport 8)
