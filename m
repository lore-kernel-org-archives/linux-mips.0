Message-ID: <01be01c1a2d7$6ec299c0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <m3elkoa5dw.fsf@myware.mynet> <20020118101908.C23887@lucon.org><01b801c1a081$3f6518e0$0deca8c0@Ulysses><20020119162415.B31028@dea.linux-mips.net> <m3d703thl6.fsf@myware.mynet>
Subject: Re: thread-ready ABIs
Date: Tue, 22 Jan 2002 00:57:46 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>, Ulrich Drepper <drepper@redhat.com>
Cc: Mike Uhler <uhler@mips.com>, linux-mips@oss.sgi.com, GNU libc hacker <libc-hacker@sources.redhat.com>, "H . J . Lu" <hjl@lucon.org>
Message-ID: <20020121235746.k9l_0mUo_5q3zRCX9x041vd1aGLDkq2RfvStSE1kUZM@z>

Ulrich Drepper" <drepper@redhat.com> writes:
>
> Ralf Baechle <ralf@oss.sgi.com> writes:
>
> > Changing the kernel for the small number of threaded applications that
> > exists and taking a performance impact for the kernel itself and
anything
> > that's using threads is an exquisite example for a bad tradeoff.
>
> Well, it seems you haven't read what I wrote.  It's not about a small
> number of threaded applications anymore.  The thread register will be
> part of the ABI and all applications, threaded or not, will use it.

As MIPS "owns" the ABI, whether or not the thread register
becomes a part of it is not something that anyone outside
of MIPS can simply decree.   I'd very much appreciate it if
someone would explain to me just what this register is used
for, and why a register needs to be permantly allocated
for this purpose.  There may still be other ways to solve the
problem without doing violence to the kernel or to the ABI.

            Regards,

            Kevin K.
