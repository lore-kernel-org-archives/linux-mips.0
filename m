Message-ID: <006d01c1b606$21929c80$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3C6C6ACF.CAD2FFC@mvista.com>
Subject: Re: FPU emulator unsafe for SMP?
Date: Fri, 15 Feb 2002 09:14:52 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>, linux-mips@oss.sgi.com
Message-ID: <20020215081452.gEwRgFL9XH6XCjnwhHXU8YgDI9V9w3whMcf2VdDDsms@z>

> I have been chasing a FPU register corruption problem on a SMP box.  The
> curruption seems to be caused by FPU emulator code.  Is that code SMP
safe?
> If not, what are the volunerable spots?
>
> Just thought I'd check before I dive into it ....

While the very first prototype was grossly SMP unsafe, the
state associated with the emulated "FPU" was migrated
into the thread context area long ago.  It is just possible,
however, that some internal emulator state persists in
a global variable somewhere, which could create problems
under SMP execution.

> BTW, I think even with the latest fpu emu patch, the classic fpu/signal
> problem is still there.  I will post in a separate email later.

I submitted a series of patches a year or so ago, the
last of which really should have been a comprehensive
fix to the FPU context switch and signal problems.
The last time I looked, that patch had never made it into
the OSS repository, but neither had anyone reported
any holes in it.

            Kevin K.
