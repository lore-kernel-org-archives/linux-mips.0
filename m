Message-ID: <199907191330.PAA06009@zaphod.et.tudelft.nl>
Subject: Re: 200mhz indy
Date: Mon, 19 Jul 1999 15:30:53 +0200 (CEST)
In-Reply-To: <37922879.C3136AE3@rigelfore.com> from "Eric Melville" at Jul 18, 99 12:18:17 pm
From: Edwin Hakkennes <E.Hakkennes@et.tudelft.nl>
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Eric Melville <m_thrope@rigelfore.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19990719133053.C_SVbvKI-KqlsTXzdCpi-fqe7YgQJPH-n1NhjR_SrNI@z>

Hi Eric,

> 
> ok, this morning i successfully booted my r4400 rev. 6.0 indy! thanks
> for the help... but now i've got a problem installing it. i'm a little
> low on disk space for the whole hardhat archive. i was thinking i could
> dump the rpms to a cd and then hook me external scsi cdrom to the indy,
> however the root fs for hardhat setup seems to be missing mount, plus i
> don't know if the redhat installer can be "tricked" like that (i have NO
> redhat experience).
> 

I didn't try this, but it should work. At least it works with
redhat-alpha.

If you can get the kernel loaded and recognising the CD, it should be
do-able. Just boot the kernel with vmlinux root=/dev/scd0 

You can't just dump the RPMS to the CD. The whole install image should
be on the CD, it should be mountable as a rootfs.

Beware that there are quite some absolute symlinks. They could pose
problems. Make sure that mkisofs picks the right contents in this case.
(e.g. sbin/init instead of /sbin/init)


BTW: I'm trying to come up with recompiled rpm for the updates relative to
HardHat. Is anyone interested in these?

Greetings and good luck,

Edwin Hakkennes
