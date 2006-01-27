Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:59848 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S3465606AbWA0Pd0
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 27 Jan 2006 15:33:26 +0000
Message-ID: <00df01c62357$ef9a1fa0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <cda58cb80601250136p5ee350e6g@mail.gmail.com> <cda58cb80601260702wf781e70l@mail.gmail.com> <005101c6228c$6ebfb0a0$10eca8c0@grendel> <43D8F000.9010106@mips.com> <cda58cb80601260831i61167787g@mail.gmail.com> <43D8FF16.40107@mips.com> <cda58cb80601261002w6eb02249k@mail.gmail.com> <43D93025.9040800@mips.com> <cda58cb80601270103t1419117cq@mail.gmail.com> <43DA240F.5070301@mips.com> <cda58cb80601270654jf779622w@mail.gmail.com>
Subject: Re: [RFC] Optimize swab operations on mips_r2 cpu
Date: Fri, 27 Jan 2006 16:39:59 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Franck <vagabon.xyz@gmail.com>, Nigel Stephens <nigel@mips.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20060127153959.KCLeD_lnFdRP9mc6BQEb6zPcESiepRA3KiczMj3BdcU@z>


> > Not that I'm a Linux hacker, but aren't those separate things? Can't you
> > compile with -march=4ksd to get the CPU-specific compiler optimisations,
> > but then use the more generic CONFIG_CPU_MIPSR2 and/or
> > CONFIG_CPU_SMARTMIPS to select the appropriate code inside the kernel
> > source (i.e. no need for CONFIG_CPU_4KSD)?
> >
> 
> To use -march=4ksd, you need to tell to the building process that
> you're using a 4KSD cpu. The only way to do that is to define a new
> CPU_4KSD. But, if I understood mips configuration script, you cannot
> define CPU_4KSD _and_ CPU_MIPS32R2 at the same time; at least easily.

The point is not to set CPU_4KSD and CPU_MIPS32R2 at the same time,
the point is to not have to define CPU_4KSD *at all*, and use the combination
of MIPS32R2 and SMARTMIPS to drive the options, e.g.:

ifdef CONFIG_CPU_SMARTMIPS
cflags-$(CONFIG_CPU_MIPS32R1)   += \
                        $(call set_gccflags,mips32,smartmips,4kec,mips3,mips2)\
                        -Os, -Wa,--trap

cflags-$(CONFIG_CPU_MIPS32R2)   += \
                        $(call set_gccflags,4ksd,mips32r2,4kec,mips3,mips2) \
                        -Wa,--trap
else
cflags-$(CONFIG_CPU_MIPS32R1)   += \
                        $(call set_gccflags,mips32,mips32,r4600,mips3,mips2) \
                        -Wa,--trap

cflags-$(CONFIG_CPU_MIPS32R2)   += \
                        $(call set_gccflags,mips32r2,mips32r2,r4600,mips3,mips2)
 \
                        -Wa,--trap
endif


That's almost certainly not the cleanest way to do it (and I really don't know
if the values I threw in for the MIPS32R1+SmartMIPS (e.g. 4KSc) combination
would actually work.  I just want to point out that it isn't that hard to do.

            Regards,

            Kevin K.
