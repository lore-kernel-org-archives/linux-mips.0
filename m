Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708151717.TAA19277@informatik.uni-koblenz.de>
Subject: Re: Local disk boot HOWTO
Date: Fri, 15 Aug 1997 19:17:56 +0200 (MET DST)
In-Reply-To: <9708150958.ZM1050@xtp.engr.sgi.com> from "Greg Chesson" at Aug 15, 97 09:58:08 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Greg Chesson <greg@xtp.engr.sgi.com>
Cc: eak@detroit.sgi.com, shaver@neon.ingenia.ca, ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970815171756.cCossKgYmIzjcexmvJ76bAA7CXSz3jygmNNz6pM0V54@z>

> 
> On Aug 15,  9:38am, Eric Kimminau wrote:
> > Subject: Re: Local disk boot HOWTO
> 
> > > Do you have a root-mountable filesystem on the second disk?
> > > If so:
> > > - put vmlinux on the IRIX /
> > > - boot into sash
> > > boot /vmlinux root=/dev/sdb1

The receipe is correct.

> seems to me you'd have to also patch vmlinux to get the device ID
> correct for the root disk.  On Irix you'd have to move /dev/root.
> I'm not sure what the equivalent might be on linux.... but I'd like
> to know what the recipe is.  I too would like to bring linux up on
> a secondary disk.

My suggestion is to attack the ext2fs disk to a Linux/i386 machine,
build the root filesystem etc. on it, then back on the Indy use it
for booting.  Linux is so smart that it handles the MSDOG partitions
on the disk created that way correctly and I store my kernel on the
IRIX / anyway.

  Ralf
