Date: Wed, 8 Aug 2001 08:59:15 -0400 (EDT)
From: Ian <ian@WPI.EDU>
Subject: Re: HELP can't boot
In-Reply-To: <20010808104536.A21775@gandalf.physik.uni-konstanz.de>
Message-ID: <Pine.OSF.4.33.0108080857440.32160-100000@grover.WPI.EDU>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Guido Guenther <guido.guenther@gmx.net>
Cc: Soeren Laursen <soeren.laursen@scrooge.dk>, linux-mips@oss.sgi.com
Message-ID: <20010808125915.TG_u1gQf5YiiJzEs1BUaAPazkAlbu6LN_ltNX9jJm-0@z>

I was in the middle of a HardHat install, and fdisk was able to partition
the disks.  The problem is that I deleted all of the partitions on the
original disk, including sda9 and sda11, which store the SGI sash
bootloader and associated files.  Without the bootloader, the system is
inoperable.  I did not realize that those partitions contained it at that
time.

On Wed, 8 Aug 2001, Guido Guenther wrote:

> On Wed, Aug 08, 2001 at 10:25:44AM +0200, Soeren Laursen wrote:
> > You need (as I know) to use irix to prepare the disk.
> No need for Irix. Linux fdisk can handle sgi disklkabels since quiet
> some time now.
>  -- Guido
>

--
Ian Cooper
ian@wpi.edu
