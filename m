Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199710231757.TAA25739@informatik.uni-koblenz.de>
Subject: Re: Magnum 4000 caches
Date: Thu, 23 Oct 1997 19:56:06 +0200 (MEST)
In-Reply-To: <199710231721.KAA10794@fir.engr.sgi.com> from "William J. Earl" at Oct 23, 97 10:21:41 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.engr.sgi.com>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19971023175606.-HC36U1NQOGLPYIbvDG6QE5TWw1FfsUxT-SGOAOUdZ0@z>

>      It turned out that, at least for some workloads, the 4000PC
> worked better that way.  (If I remember correctly, a 32-byte linesize
> is better for the icache, since a 4-instruction basic block is
> unusual.)  However, not all boxes use the same linesize values,
> because there were hardware bugs with at least some of the memory
> controllers which were affected by the choice of linesize.  I don't
> remember the details anymore, although I might find them in my mail
> archivies.  I have a 4000PC system (32-byte I, 16-byte D, MCT version 3)
> and two 4000SC systems (16-byte I, D, and S, MCT version 2) still online.
> I think that MCT version 2 would not support a 32-byte line.

So as the easy solution, as I understand things we should be safe by
just leaving the linesize as the firmware chooses them for us Magnums?  
I actually intended to experiment with the linesize on R4k but as
things look now this isn't a good thing.

Btw, seems we'll get an interesting new target for Linux.  It's currently
ftp.uni-erlangen.de and one of the admins who might do the job, a Linux/68k
hacker told me it's a 3 x R6000 box with 256mb of RAM currently running
ES/IX something like that ...

  Ralf
