Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708092112.XAA01472@informatik.uni-koblenz.de>
Subject: Re: your mail
Date: Sat, 9 Aug 1997 23:11:56 +0200 (MET DST)
In-Reply-To: <Pine.LNX.3.95.970809214814.29239A-100000@odin.waw.com> from "Vincent Renardias" at Aug 9, 97 10:05:02 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Vincent Renardias <vincent@waw.com>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970809211156.JfVlYDx6VV-20lpL-znB_vvDq0jiG50FwmaZyOlqX8c@z>

> % mips-linux-gcc  -o pwgen pwgen.o -lm
> /usr/local/mips-linux/lib/libc.a: could not read symbols: Archive has no
> index; run ranlib to add one
> 
> running mips-linux-ranlib on the given file does not change anything.
> (ie: still getting the same message)
> 
> Did I do anything wrong, or is this a problem in the Linux/SGI glibc?

No.  Looks as if your lib still isn't correctly installed.  If ranlib
doesn't help, then your libc.a is probably corrupted into a zero lenght
file.

  Ralf
