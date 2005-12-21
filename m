Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:36505 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S3458540AbVLUJpD
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 21 Dec 2005 09:45:03 +0000
Message-ID: <002f01c60613$8b346590$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <50c9a2250512210051q85f813fx27b0533fe66165e2@mail.gmail.com> <1135155432.9009.18.camel@localhost.localdomain> <50c9a2250512210106h7bca5c7fu5714ea3aa16cde8a@mail.gmail.com>
Subject: Re: does someone succeed in making the toolchain for 2.6 kernel?
Date: Wed, 21 Dec 2005 10:47:21 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: zhuzhenhua <zzh.hust@gmail.com>, ppopov@embeddedalley.com
Cc: linux-mips@linux-mips.org
Message-ID: <20051221094721.IEzMOtX1X636wVEPbGYQkrbFbqgSr1v_xlAZhlDIDfk@z>

I've been using the 6.02 MIPS SDE for my 2.6 kernel builds.  I'm not
100% certain that it's exactly the same one that you'll find on the page at
http://www.linux-mips.org/wiki/MIPS_SDE_Installation
but it's close enough where I'd suggest at least giving it a try.

            Regards,

            Kevin K.

----- Original Message ----- 
From: "zhuzhenhua" <zzh.hust@gmail.com>
To: <ppopov@embeddedalley.com>
Cc: <linux-mips@linux-mips.org>
Sent: Wednesday, December 21, 2005 10:06 AM
Subject: Re: does someone succeed in making the toolchain for 2.6 kernel?


> i am not sure which toolchain can work for the 2.6 kernel
> can you suggest one?
> thanks
> 
> On 12/21/05, Pete Popov <ppopov@embeddedalley.com> wrote:
> > On Wed, 2005-12-21 at 16:51 +0800, zhuzhenhua wrote:
> > > i want to compile a 2.6.14 kernel for mips 4kec, does someone compile
> > > the 2.6 kernel with self-build toolchain?
> >
> > Quite a few people have, I'm sure.
> >
> > > how to select the gcc,
> > > gdb,glibc,linux head and binutils version?
> > > and where to get the guide doc?
> >
> > If you have such questions, I would suggest you start by compiling and
> > booting your kernel with a toolchain and distribution that already
> > works. Build your own toolchain, if you must, later.
> >
> > Pete
> >
> >
> 
> Best regards
> zhuzhenhua
> 
> 
