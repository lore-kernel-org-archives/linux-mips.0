Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@yon.engr.sgi.com (Ariel Faigon)
Message-ID: <199703140018.QAA20671@yon.engr.sgi.com>
Subject: Re: Hello world!
Date: Thu, 13 Mar 1997 16:18:06 -0800 (PST)
In-Reply-To: <9703141124.ZM7712@windy.wellington.sgi.com> from "Alistair Lambie" at Mar 14, 97 11:24:41 am
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: linux@yon.engr.sgi.com, David <davem@caip.rutgers.edu>
Message-ID: <19970314001806.H-N1OPsMrZrO6Ymx2XAOQ0ec6VIsKIQMJARNphFL4EM@z>

:
:On Mar 14, 10:32am, Mike Shaver wrote:
:> Subject: Hello world!
:> Looks like I'm getting an Indy when I get back to Ottawa next week, so
:> I'd like to hear from others (hello?) as to what kind of work we're
:> looking at in the short term.
:>

The goals are:
	0) Complete the merge with mainstream Linux
	   (David left at 2.0.11 or so) which I assume
	   Ralf has already done or doing.

	1) Get the Indy to boot linux from a _local_ disk
	   Ralf and Miguel were looking into SILO here.

	2) Get gcc to work native of Linux/Indy

As Alistair said, David already got the WD SCSI driver to work
and he was booting to multiuser and even running GNU emacs
on his Linux Indy.  But this was done using:

	1) Cross builds (gcc-cross was running on IRIX 6.2
	   and producing Linux ELF-32 binaries).

	2) Booting was never local. It was always using the
	   ARC prom bootp command.

	3) The target Linux/Indy filesystems were NFS mounted.

Basically we need to mkfs.ext2(8) on the local Indy (as IRIX
supports XFS and EFS both of which are proprietary, Sigh)
It would be best to have a seprate disk (rather than a
partition which may disappear in case of human error)
Get SILO to work, get the latest gcc to work native
and we can start working on userland.

Asking David some questions might be a good idea too.
I'm not sure he is currently on the list, I'll ask
him if he's interested to join.

:>
:> I understand that we're looking to get a source repository out on the
:> 'net, which would be a good start.  What are people planning to start
:> with first?  (I suppose talking to disks is a priority... =) )
:>

Larry and I are working on setting up linux.sgi.com outside the
SGI firewall. My intention is to set up tcpwrappers so that only
the developers (Ralf, Miguel, Mike) and SGI people could login
and give you complete control of the machine. At which point
you can install ssh or whatever and start sharing sources.

The "official" initial post-David merged source tree should
come from Ralf.

-- 
Peace, Ariel
