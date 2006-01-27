Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:30664 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S3458533AbWA0MrY
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 27 Jan 2006 12:47:24 +0000
Message-ID: <001d01c62340$be267bb0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <cda58cb80601250136p5ee350e6g@mail.gmail.com> <cda58cb80601260702wf781e70l@mail.gmail.com> <005101c6228c$6ebfb0a0$10eca8c0@grendel> <43D8F000.9010106@mips.com> <cda58cb80601260831i61167787g@mail.gmail.com> <43D8FF16.40107@mips.com> <cda58cb80601261002w6eb02249k@mail.gmail.com> <43D93025.9040800@mips.com> <cda58cb80601270103t1419117cq@mail.gmail.com> <000b01c6232a$5ea81470$10eca8c0@grendel> <cda58cb80601270245g6273ce04k@mail.gmail.com>
Subject: Re: [RFC] Optimize swab operations on mips_r2 cpu
Date: Fri, 27 Jan 2006 13:53:58 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Franck <vagabon.xyz@gmail.com>
Cc: Nigel Stephens <nigel@mips.com>, linux-mips@linux-mips.org
Message-ID: <20060127125358.r2tPskMbUnNmNXjav4ps5YJLqzJNlwQ3u9hHv6jsnBE@z>

> > Configuration hacks that are specific to a single core create cruft and
> > maintenence problems.  As I said yesterday, I think we'd be much better
> > off to have a CONFIG_CPU_MIPS_SMALL or some such option
> > that could cause -Os to be used, allow branch-likelies, etc. The optimizations
> > under discussion aren't at all specific to the 4KSd,
> 
> no some are. As we said previously:
> 
>         1/ sizeof(vmlinux-mips32r2-Os) > sizeof(vmlinux-4ksd-Os)
>         2/ with -march=4ksd can do (slightly) better optimizations.

This is very possibly due to the compiler knowing about the SmartMIPS
scaled, indexed load instructions, which were added to improve virtual
machine performance, but which also save on address calculation instructions.
If -march=mips32r2 combined with -msmartmips and -Os don't produce
pretty much the same result as -march=4ksd, I'd be interested in knowing
why. Regardless, if this is what's going on, there really is no other core 
in production today that will run that code.  But that doesn't mean
that there won't be others in the future.

All I'm really trying to do here is to get away from core-specific config
cruft.  If the best result under-the-hood for 4KSd is obtained by using 
-march=4ksd, that's what people should get, but I'd rather that users
and maintainers saw that as a choice of MIPS32R2+SmartMIPS rather 
than a choice of 4KSd as a one-off.

        Regards,

        Kevin K.
