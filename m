Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@cobaltmicro.com>
Message-ID: <199710242302.QAA00534@dull.cobaltmicro.com>
Subject: Re: Look what I found in a big cardboard box
Date: Fri, 24 Oct 1997 16:02:08 -0700 (PDT)
In-Reply-To: <m0xOrfv-0005G0C@lightning.swansea.linux.org.uk> from "Alan Cox" at Oct 24, 97 10:53:47 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19971024230208.j4i-rgCu0x72lPNIYebFZy5hB1uxmJZdmR1YXjBQo04@z>

Hi,

> And there was light (actually there was heavy..)

*grin*  And there was big - the box didn't fit into my car ...

> My SGI arrived today. Anyway after the required prelimiaries (Batallion,
> making stupid indycam movies) I had a hack at the ext2fs utils and libs -
> fixed them to compile and run properly under the Indy native cc. I can
> successfully make and then fsck an ext2 partition.

I'll work on a set of standalone utilities for the Indy's ARC (pronounce
arggghh ...) firmware.  That will bring us closer to get the thing
independant from IRIX.  In theory it should be pretty easy, but the
various ARC implementations I saw so far were beyond just completly broken,
at least the old onces which should be supported, too.

> What Im going to do next is chase the work from the Mac68K installer and
> see if I can use that with the ext2fs lib to get the same arrangement working
> (that is an application level toolset for installing tars and the like) from
> Irix. 
> 
> To that goal I'm going to be working on the tool stuff until I've successfully
> bootstrapped Linux that way.

Cool.

  Ralf
