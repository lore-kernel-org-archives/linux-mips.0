Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199705301113.NAA17015@informatik.uni-koblenz.de>
Subject: Re: compiling kernels
Date: Fri, 30 May 1997 13:13:52 +0200 (MET DST)
In-Reply-To: <9705291410.ZM6206@akira.tampa.sgi.com> from "Liam Irish" at May 29, 97 02:10:42 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Liam Irish <irish@akira.tampa.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970530111352.kGZpAm8ABbvc5a7_ql6SsK9kuN_ruCc6pBMLuwXJ9VM@z>

Hi,

> Where are the other importing things, such as includes for gcc, that are needed
> to compile a linux kernel for mips besides gcc and binutils, which I retrieved
> from kernel.panic.

You also need the GNU libc which is also on kernel.panic.  You should
get the libc binaries even if you want to recompile everything.
Bootstrapping just from sources is nice torture due to cyclic dependencies
and other traps.

Btw, someone at SGI is mirroring kernel.panic daily.  So you don't need to
wait for our slow pipe.

  Ralf
