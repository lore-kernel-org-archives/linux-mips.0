From: "Hiroo Hayashi" <hiroo.hayashi@toshiba.co.jp>
Subject: RE: bus error by write transaction (RE: [patch] linux 2.4.5: Make __dbe_table available to modules)
Date: Mon, 27 Aug 2001 11:49:15 -0500
Message-ID: <FFEHJOJAGEIJIPPEKDNGGEJMCDAA.hiroo.hayashi@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.GSO.3.96.1010824181047.14758B-100000@delta.ds2.pg.gda.pl>
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20010827164915.5lD4RuzZmNjuu8bZ7KWo_JbI8hCwc4r9Qo9H3NjkaxU@z>

Hi,

> > Note that most MIPS documents use word 'load' and 'store' for instruction,
> > and 'read' and 'write' for bus transaction.  You have to distinguish them.
> 
>  Don't I?

I understood that (singular) you distinguish them.
I thought someone misunderstood in this thread.

> > (Here I'm ignoring I/O access to make the point clear.)
> 
>  How do you define an I/O access for MIPS?
uncached access.  Off cource there can be exception.

> > The data on a write bus transaction may be a data modified by a store
> > instruction which was issued some years ago :-)  What the OS can do?
> 
>  Report it and panic.

I agree with you.

>   The problem with bus errors on MIPS is that one
> can't distinguish between errors on reads and writes.

But I did not understand that there is MIPS CPU which cause Bus Error Exception
as a result of  a bus error for a write bus transaction or a read bus transaction
which caused by cache miss for a store instruction.  It's messy...

Hiroo
