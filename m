Message-ID: <002c01c1a1a9$b9f0de40$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20020118101908.C23887@lucon.org><01b801c1a081$3f6518e0$0deca8c0@Ulysses><20020118201139.A847@lucon.org> <20020120193843M.machida@sm.sony.co.jp>
Subject: Re: thread-ready ABIs
Date: Sun, 20 Jan 2002 12:58:00 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: hjl@lucon.org, Machida Hiroyuki <machida@sm.sony.co.jp>
Cc: drepper@redhat.com, libc-hacker@sources.redhat.com, linux-mips@oss.sgi.com
Message-ID: <20020120115800.LcOLaNBKuj4hB8WWblT5fxM_0X19O1hvssOY_fEQxaY@z>

> > I like the read-only k0 idea. We just need to make a system call to
> > tell kernel what value to put in k0 before returning to the user space.
> > It shouldn't be too hard to implement. I will try it next week.
> > 
> > H.J.
> 
> Please don't use k1, we already use k1 to implement fast
> test-and-set method for MIPS1 machine.  We plan to mereg
> the method into main glibc and kernel tree.

I don't read Japanese, but I've worked on similar
methods for semaphores using k1, so I can guess
roughly what you've done.   We'll have to be very
careful if we want to have both a thread-register
extended ABI *and* this approach to semaphores.
The TLB miss handler must inevitably destroy one
or the other of k0/k1, though it can avoid destroying
both.  Thus the merge of thread-register+semaphore
must not require that both be preserved on an
arbitrary memory reference.  That may or may not
be possible, so it would be good if you guys at
Sony could post your code ASAP so we can see
what can and cannot be merged.

This situation also behooves us to verify that
k0/k1 are really and truly the only candidates
for a thread register in MIPS.  I haven't been
involved in any of the earlier discussions,
and am not on the libc-hacker mailing list
(and thus cannot post to it, by the way), but
was it considered to simply use one of the
static registers (say, s7/$23) in the existing
ABI?  Assuming it was set up correctly at
process startup, it would be preserved by
pre-thread library and .o modules, and could
be exploited by newly generated code.  Losing
a static register would be a hit on code generation
efficiency and performance, at least in principle.
Was this the reason why the idea was rejected,
or is there a more fundamental technical problem?

            Kevin K.
