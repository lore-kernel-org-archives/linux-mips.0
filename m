From: Dominic Sweetman <dom@algor.co.uk>
MIME-Version: 1.0
Message-ID: <15437.14361.918255.115877@gladsmuir.algor.co.uk>
Date: Tue, 22 Jan 2002 09:59:53 +0000
Subject: Re: thread-ready ABIs
In-Reply-To: <01be01c1a2d7$6ec299c0$0deca8c0@Ulysses>
References: <m3elkoa5dw.fsf@myware.mynet>
	<20020118101908.C23887@lucon.org>
	<01b801c1a081$3f6518e0$0deca8c0@Ulysses>
	<20020119162415.B31028@dea.linux-mips.net>
	<m3d703thl6.fsf@myware.mynet>
	<01be01c1a2d7$6ec299c0$0deca8c0@Ulysses>
Content-Type: text/plain; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Ralf Baechle <ralf@oss.sgi.com>, Ulrich Drepper <drepper@redhat.com>, Mike Uhler <uhler@mips.com>, linux-mips@oss.sgi.com, GNU libc hacker <libc-hacker@sources.redhat.com>, "H . J . Lu" <hjl@lucon.org>
Message-ID: <20020122095953.LXCEcPrxI7o_1vMWTjtazwVZwJdzji8B3zTIOTKZXig@z>


Kevin,

Since nobody seems to be prepared to essay a brief definition of a
thread register, I'll make one up from first principles and maybe the
experts will beat it into shape.

Multiple threads in a Linux process share the same address space: code
and data.  A thread has its own unique stack, but since (by
definition) it shares all its data with every other thread it has no
identity - there is no thread-unique static data.  That means it has
no handle to acquire and manage any thread-specific variables.

[Some threads purists would probably maintain that's a Good Thing:
 threads to them are like electrons to quantum physicists,
 indistinguishable by definition].

Linux is not noted for computer science purity; so an OS-maintained
"thread identity" variable which is cheap to read in user space sounds
a useful thing to have.

A patient Linux expert (if any such are reading this list) might like
to say what value is typically held (a pointer? an index?) and how
it's used (my money's on "wrapped in an impenetrable macro").

In a more baroque (synonym for "less backward"?) architecture there
are usually registers hanging about which no compiler or OS author has
previously figured out any use for, which can be bent to this purpose.
Unfortunately, MIPS original architects committed the grave error of
making all the registers useful.

I quite like the idea of putting the thread value at a known offset in
low virtual memory, but I expect the kernel keeps virtual page 0
invalid to catch null pointers and that instructions start at the
first boundary which doesn't create cache alias problems...

--
Dominic Sweetman
Algorithmics Ltd
The Fruit Farm, Ely Road, Chittering, CAMBS CB5 9PH, ENGLAND
phone: +44 1223 706200 / fax: +44 1223 706250 / home: +44 20 7226 0032
http://www.algor.co.uk
