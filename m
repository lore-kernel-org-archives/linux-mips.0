From: Dominic Sweetman <dom@algor.co.uk>
MIME-Version: 1.0
Message-ID: <15433.25352.345698.244662@gladsmuir.algor.co.uk>
Date: Sat, 19 Jan 2002 12:14:00 +0000
Subject: Re: thread-ready ABIs
In-Reply-To: <m34rlj4gb2.fsf@myware.mynet>
References: <m3elkoa5dw.fsf@myware.mynet>
	<20020118101908.C23887@lucon.org>
	<m3elkn4ikq.fsf@myware.mynet>
	<20020118110844.A25165@lucon.org>
	<m34rlj4gb2.fsf@myware.mynet>
Content-Type: text/plain; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Ulrich Drepper <drepper@redhat.com>
Cc: "H . J . Lu" <hjl@lucon.org>, GNU libc hacker <libc-hacker@sources.redhat.com>, linux-mips@oss.sgi.com
Message-ID: <20020119121400.iefSEqb0CwWO1032Wa4K5EaHg3vWdb2OI3yObusuieA@z>


Well, just about k0/k1:

So far as the hardware and instruction set is concerned, 
k0/k1 are just two of the 32 general purpose registers.  There's
nothing special about them and a program in user mode can read/write
them.

By a mere software convention, they're reserved.  But this is an
important software convention, because MIPS hardware does so little to
help out on an exception or interrupt.  Couple that to the lack of any
absolute addressing mode, and any exception handler pretty much has to
have a GP register it can write without saving, in order to be able to
point to the register-save area.

[You could, maybe, do something tricky with a negative offset
from the (constant zero) $0 register and special mapping]

OK, so that's one of them.  The second is used to reduce the length
and run-time of the tiny exception handler which is used to refill the
TLB when a page translation is not loaded.

The OS doesn't rely on user programs not corrupting these registers,
of course: it typically uses them only in non-interruptible code
sequences.  But since the OS changes them under the feet of user
programs, the convention that you don't use them is pretty strongly
enforced.

Dominic Sweetman
Algorithmics Ltd
