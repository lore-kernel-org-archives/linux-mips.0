Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@cobaltmicro.com>
Message-ID: <199710100127.SAA10165@dull.cobaltmicro.com>
Subject: Re: Arch specific initramdisk?
Date: Thu, 9 Oct 1997 18:27:02 -0700 (PDT)
In-Reply-To: <Pine.LNX.3.95.971009185152.20315W-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Oct 9, 97 06:57:29 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19971010012702.y1RjaBdlF2K-2eM6ywh5OGSAzFBC52FSkZnjwHwWDO8@z>

Hi,

> I'm trying to do kernel modifications so that initrd is supported, which
> will make installations easier.
> 
> I was a bit surprised that these weren't architecture neutral to begin
> with.  Why is this dependant on the arch? The code I've found for other
> archs is in arch/*/kernel/setup.c.
> 
> How safe is it for me to replicate the code from, say, the sparc port?  Is
> there anything I should be aware of?

The only difference between the architectures is where in memory the
initrd is being stored.  I haven't check how things work on a Sparc but
basically what we need should be at least very similar to for example
the i386 code - as far as setup.c is affected.

  Ralf
