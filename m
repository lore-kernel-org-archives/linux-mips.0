Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0z2bIq-000aNGC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: what is this?
Date: Sat, 1 Aug 1998 14:02:26 +0100 (BST)
In-Reply-To: <19980801140032.A1004@helix.life.nthu.edu.tw> from "Francis M. J. Hsieh" at Aug 1, 98 02:00:32 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: "Francis M. J. Hsieh" <mjhsieh@helix.life.nthu.edu.tw>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980801130226.Sc5BBmsMuJ7kf9f3qJFYUCcssDAmdyK8DLSu1y2pUNY@z>

> okay, I am reporting again.
> 
> I happened to meet this before, maybe it is a rare case.
>   Socket destroy delayed (r=0 w=112)
>   Socket destroy delayed (r=0 w=256)
> 
> Any idea? Had anyone seen that before?

When a socket has buffers charged to it the socket cant be destroyed so
the kernel hangs on to it. It indicates one of several things - a socket
that has some state timeouts left to do that are longer than 10 secs 
after the close, a socket that has buffers queued up with a very constipated
driver, or a leak.

Alan
