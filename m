Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708091942.VAA22164@informatik.uni-koblenz.de>
Subject: Re: your mail
Date: Sat, 9 Aug 1997 21:42:38 +0200 (MET DST)
In-Reply-To: <Pine.LNX.3.95.970809195755.24185B-100000@odin.waw.com> from "Vincent Renardias" at Aug 9, 97 08:40:06 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Vincent Renardias <vincent@waw.com>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970809194238.tfzlUcPu7gMYSCBUgg_L9cgfSsV7lSq4yRN_15Dl0g8@z>

> > Not the right thing, but won't hurt.  I shows that your libc is
> > not installed correctly.
> 
> I just installed the binutils/gcc crossdev packages from
> ftp.linux.sgi.com. Should i also install the glibc-2.0.4-1.tar.gz package
> from /pub/mips-linux? In case it matters my native libc is glibc-2.0.4
> (i386).

Well, it doesn't matter except that I built the executables with Linux
libc and you therefore need that one.  DANGER:  When you install libs
for a crosscompiler you will have to move the libs a bit around.
Just doing tar zxf ... -C / will fry your native system.  MIPS stuff
just has too much octane to be suitable as fuel for your Intel machine ;-)

Btw, as I'm writing this I've built about 88mb of binary .rpm packages
running native.  The sole problems I currently have is that the kernel
seems to have some memory corruption problem.  That is nasty because
it usually hits the bitmaps ...  It might as well explain Miguel's
recently reported NFS problem.

  Ralf
