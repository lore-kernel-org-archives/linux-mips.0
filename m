Message-ID: <01b801c1a081$3f6518e0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <m3elkoa5dw.fsf@myware.mynet> <20020118101908.C23887@lucon.org>
Subject: Re: thread-ready ABIs
Date: Sat, 19 Jan 2002 01:35:38 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "H . J . Lu" <hjl@lucon.org>, Ulrich Drepper <drepper@redhat.com>
Cc: GNU libc hacker <libc-hacker@sources.redhat.com>, linux-mips@oss.sgi.com
Message-ID: <20020119003538.XhttHLwiZW1AnFuURjSgdJ8zB9iITSNQtPhd8qHfcEk@z>

> On Thu, Jan 17, 2002 at 04:07:23PM -0800, Ulrich Drepper wrote:
> > The time is near when we (well, I) well start a drastic move toward
> > generally using thread registers.  Even in non-threaded code.
> > 
> > This means that unless all architectures get thread registers (or
> > equivalent things like Alpha's special code) we'll have a two class
> > society of platforms where all code written for the platforms without
> > thread register can be run on the other systems, but not vice versa.

[snip]

> > MIPS: Who feels responsible?  Andreas, HJ?
> 
> I don't see there are any registers we can use without breaking ABI.
> On the other hand, can we change the mips kernel to save k0 or k1 for
> user space?

Thank you for posting this to linux-mips, since I'm not sure 
that anyone at MIPS is on the GNU_libc_hacker list.

It would, in principle, be possible to save/restore k0
or k1 (but not both) if no other clever solution can be found.  
There are other VM OSes that manage to do so for MIPS, 
for other outside-the-old-ABI reasons.  It does, of course,
add some instructions and some memory traffic to the 
low-level exception handling , and we would have to look 
at whether we would want to make such a feature standard 
or specific to a "thread-ready" kernel build.

            Regards,

            Kevin K.
