Date: Thu, 1 Feb 2001 23:39:47 -0500 (EST)
From: Kenneth C Barr <kbarr@MIT.EDU>
Subject: Re: netbooting indy
In-Reply-To: <Pine.LNX.4.30.0102010926190.20992-100000@springhead.px.uk.com>
Message-ID: <Pine.GSO.4.30L.0102012329020.18202-100000@biohazard-cafe.mit.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com
Message-ID: <20010202043947.pc1mHieRTR3UTcbcRIajC1Uogt-SftIvQlRPs5nLlQY@z>

On Thu, 1 Feb 2001, Dr. David Gilbert wrote:

> On Wed, 31 Jan 2001, Kenneth C Barr wrote:
>
> > I finally got bootp/tftp to answer my indy's pleas for an image, but get
> > the following behavior (with my own IP addr and server, obviously):
> >
> > >> boot bootp():/vmlinux
>
>
> I haven't seen the error you got - however one thing I do differently is
> to do
>
> bootp():/vmlinux
>
> without the initial 'boot ' - worth a go?

Unfortunately this gives the same behavior.  Here are some other things I
observed.  Maybe they'll help make the solution more obvious.

1.  Same behavior on two different indys.  So it's not a flukey hardware
problem.

2.  Similar behavior with 3 different ELF kernel images (hardhat,
vmlinux-indy-2.2.1-990226, and the 2.4.0-test9).  I get the spinning
cursor and watch TFTP packets fly by.  then, it stops (with the disk full
tftp error observable on the sniffer).  Sometimes it has even rebooted
itself.  Each kernel dies after receiving a different number of blocks
(IE, I'm not filling up some buffer to the max each time), but --
and this is the most interesting thing -- repeated attempts with a fixed
kernel die at the identical block number!

eg hardhat always dies at 2130
   2.4.0 always dies at 2960
   etc...

Is there something in the image at a particular point that could cause a
freeze-up or reboot like that?

3.  When I specify init=/bin/sh as a parameter, it freezes halfway through
the kernel download as usual, but on the sniffer, I can see the beginning
of an NFS conversation.  It looks for /dev/console and then follows
/bin/sh to bash at which point the SGI starts issuing seemingly malformed
READ requests.  The NFS server tries to ship it "bash" but the responses
seemed malformed, too.

Thanks for your help in conquering this!

Ken
