Message-ID: <01b001c12693$b4920140$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <018201c12680$8f13e680$0deca8c0@Ulysses> <20010816115349.A12153@nevyn.them.org> <3B7C1BB9.7011790E@mvista.com>
Subject: Re: FP emulator patch
Date: Thu, 16 Aug 2001 22:40:26 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>, Daniel Jacobowitz <dan@debian.org>
Cc: "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>
Message-ID: <20010816204026.XQT9NBMwwtA3WVaxktQNQPRLQSZPE0MONKuUkJbTMlo@z>

> > current->used_math should never be set to zero in this sort of
> > situation.  It's not an ownership flag!  It marks whether the FP state
> > in the thread structure is valid.
>
> Daniel, it is funny that I agree with your last statement but cannot agree
> with your first one.
>
> Under the above mentioned situation, after we make the copy of FPU state
from
> thread structure to the saved signal context, we need to set used_math bit
to
> zero.  This way when the signal handler uses FPU for the first time - if
it
> ever uses it -, the normal lazy FPU switch mechanism can kick in smoothly.

We've had a lot of messages crossing here, but please
explain yourself here why clearing used_math helps in
this case.  If, as has been proposed, the current
thread does not own the FPU, and thus CU1 is not
enabled, the FPU switch mechanism should kick in
during the signal handler regardless. The signal
handler will inherit the thread's FPU state from
the thread context, and will muck with it, but
if, as has been noted, the sigcontext has
been loaded from the thread context before
the handler is dispatched, and is restored after
the handler executes, we're fine.  The only thing
I can see that clearing used_math would achieve
would be to guarantee the signal handler a virgin
FPU context.

            Regards,

            Kevin K.
