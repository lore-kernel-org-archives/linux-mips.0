From: "Hiroo Hayashi" <hiroo.hayashi@toshiba.co.jp>
Subject: bus error by write transaction (RE: [patch] linux 2.4.5: Make __dbe_table available to modules)
Date: Thu, 23 Aug 2001 15:11:33 -0500
Message-ID: <FFEHJOJAGEIJIPPEKDNGOEJGCDAA.hiroo.hayashi@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.GSO.3.96.1010823172522.21718E-100000@delta.ds2.pg.gda.pl>
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, "Gleb O. Raiko" <raiko@niisi.msk.ru>
Cc: linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20010823201133.AFqMvaViFRaNXw4OSlOeM6bhNqJv944rSK5ZfKQXuK4@z>

Hi,

> > I consider external signaling of write failures may be useful for kernel
> > debugging purposes. I agree it's hard (or even impossible) to achieve
> > proper behaviour on write failures for user space. There is a small
> > chance to kill another process, for example, write transactions may
> > delay due to write buffer. So, the kernel may only print something.
> 
>  Or, more severly and importantly, a write-back cache.  We provide such
> diagnostics but it's dubious for writes.  You are right, it might be
> useful for debugging in some cases, though.

Yes, most MIPS CPU except very old one use writeback cache.

Note that most MIPS documents use word 'load' and 'store' for instruction,
and 'read' and 'write' for bus transaction.  You have to distinguish them.

On a system with writeback cache, a write bus transaction is issued when
a modified cache line is replaced by a cache miss for either load
instruction or store instruction.

(Here I'm ignoring I/O access to make the point clear.)

The data on a write bus transaction may be a data modified by a store
instruction which was issued some years ago :-)  What the OS can do?

Hiro
