Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:3012 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133642AbWAZQrE
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Thu, 26 Jan 2006 16:47:04 +0000
Message-ID: <009c01c62299$075e9ea0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <cda58cb80601250136p5ee350e6g@mail.gmail.com> <43D78725.6050300@mips.com> <20060125141424.GE3454@linux-mips.org> <cda58cb80601250632r3e8f7b9en@mail.gmail.com> <20060125150404.GF3454@linux-mips.org> <cda58cb80601251003m6ba4379w@mail.gmail.com> <43D7C050.5090607@mips.com> <cda58cb80601260702wf781e70l@mail.gmail.com> <005101c6228c$6ebfb0a0$10eca8c0@grendel> <43D8F000.9010106@mips.com> <cda58cb80601260831i61167787g@mail.gmail.com>
Subject: Re: [RFC] Optimize swab operations on mips_r2 cpu
Date: Thu, 26 Jan 2006 17:53:25 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Franck <vagabon.xyz@gmail.com>, Nigel Stephens <nigel@mips.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20060126165325.gVIsy9I0yuVTz2TjnXIAirncYNqxGWPn98KDQ3vMgpk@z>

> > ...the only significant thing which -march=4ksd will do differently from
> > -march=mips32r2 is to allow the compiler to generate branch-likely
> > instructions -- they're deprecated for generic mips32 code but carry no
> > penalty on the 4K core. It will also cause the compiler's "4kc" pipeline
> > description to be used for instruction scheduling, instead of the
> > default "24kc", but that should only change the order of instructions
> 
> Do you mean that the code can be run faster when using -march=4ksd ?

Not necessarily, if it's just a question of branch-likelies.  It could be a little
faster, but it could also be a little slower.  In any case, the effect should be
minor.
 
> > and shouldn't really make a significant difference to the code size.
> 
> yes but I have :(

You report a 33K delta on the Linux kernel.  I would imagine that you're
probably building a pretty small kernel configuration, but even if you've got
it down to 1MB of text, that's still only about 3% bloat.  Undesirable, but
not catastrophic.

If we want to do something about this, however, I would argue that it should
not be strictly in the context of the 4KSd, because it's not only for that core
that people may have an interest in having the smallest possible kernel, and
it's not only that compiler option that could have an effect on the footprint.
I postulate (without proposing to actually do the work ;o) some kind of
CONFIG_<mumble>_COMPACT configuration option that would do
things like (but not limited to) forcing the use of branch-likely where appropriate,
regardless of the ISA level selected.

            Regards,

            Kevin K.
