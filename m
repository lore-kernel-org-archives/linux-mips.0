Message-ID: <016801c1a39a$7b2ca8e0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <m3elkoa5dw.fsf@myware.mynet>	<20020118101908.C23887@lucon.org>	<01b801c1a081$3f6518e0$0deca8c0@Ulysses>	<20020119162415.B31028@dea.linux-mips.net>	<m3d703thl6.fsf@myware.mynet>	<01be01c1a2d7$6ec299c0$0deca8c0@Ulysses>	<15437.14361.918255.115877@gladsmuir.algor.co.uk>	<002001c1a33e$d9936560$0deca8c0@Ulysses>	<20020122102128.A11455@nevyn.them.org> <15437.35062.770932.705864@gladsmuir.algor.co.uk> <3C4DDD24.4A0F24DE@eicon.com> <013a01c1a38f$41f96a00$0deca8c0@Ulysses>
Subject: Re: thread-ready ABIs
Date: Wed, 23 Jan 2002 00:13:56 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Kevin D. Kissell" <kevink@mips.com>, "Tommy S. Christensen" <tommy.christensen@eicon.com>, Dominic Sweetman <dom@algor.co.uk>
Cc: Daniel Jacobowitz <dan@debian.org>, Ralf Baechle <ralf@oss.sgi.com>, Ulrich Drepper <drepper@redhat.com>, Mike Uhler <uhler@mips.com>, "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>, "H . J . Lu" <hjl@lucon.org>
Message-ID: <20020122231356.pdMJEYVa7-zG8sfv-xWR_4h2wF4K5V12nudEEeWImo0@z>

> > Well, why not use the stack?
> >
> > I am not quite familiar with the requirements on this "thread register",
> > but couldn't something like this be made to work:
> >   #define TID *((sp & ~(STACK_SIZE-1)) + STACK_SIZE - TID_OFFSET)
> >
> > It assumes a fixed maximum stack size (and alignment), which it should
> > be possible to meet (virtual memory is cheap). The STACK_SIZE could
> > probably even be a (process global!) variable if it is not desirable
> > to limit this at compile time.
>
> Thanks for writing this up.  I had the same thought over dinner,
> but I'm throughly discredited today, and it's better that it came
> from someone else.   ;-)

That having been said, I don't think this scheme
will really work. Programs do build themselves
temporary stacks in the heap from time to time.
Signal stacks come to mind.

            Regards,

            Kevin K.
