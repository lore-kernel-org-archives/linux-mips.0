Message-ID: <011801c0e55f$e4d39820$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1010525130531.17652A-100000@delta.ds2.pg.gda.pl>
Subject: Re: [PATCH] incorrect asm constraints for ll/sc constructs
Date: Fri, 25 May 2001 23:15:48 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Daniel Jacobowitz <dan@debian.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010525211548.NU6MjkW6HZdM3CQNvdIzma3zizS72kEXEdIkJ7P7TdM@z>

>  The following program cannot be compiled with gcc 2.95.3, because the
> offset is out of range (I consider it a bug in gcc -- it should allocate
> and load a temporary register itself and pass it appropriately as %0,

I think gcc can be forgiven for not allocating a temporary,
given the ".set noat"...

> matching the "R" constraint; still it's better than generating bad code):
>
> int main(void)
> {
> int *p;
>
> asm volatile(".set push\n\t"
>   ".set noat\n\t"
> "lw $0,%0\n\t"
> ".set pop"
> :
> : "R" (p[0x10000]));
>
> return 0;
> }
