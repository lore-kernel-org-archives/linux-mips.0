Message-ID: <00c001c1a367$69c10160$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <m3elkoa5dw.fsf@myware.mynet><20020118101908.C23887@lucon.org><01b801c1a081$3f6518e0$0deca8c0@Ulysses><20020119162415.B31028@dea.linux-mips.net><m3d703thl6.fsf@myware.mynet><01be01c1a2d7$6ec299c0$0deca8c0@Ulysses> <15437.14361.918255.115877@gladsmuir.algor.co.uk> <002001c1a33e$d9936560$0deca8c0@Ulysses> <20020122102128.A11455@nevyn.them.org> <007601c1a35e$b3e3f940$0deca8c0@Ulysses> <20020122113420.A14284@nevyn.them.org>
Subject: Re: thread-ready ABIs
Date: Tue, 22 Jan 2002 18:08:12 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Daniel Jacobowitz <dan@debian.org>
Cc: Dominic Sweetman <dom@algor.co.uk>, Ralf Baechle <ralf@oss.sgi.com>, Ulrich Drepper <drepper@redhat.com>, Mike Uhler <uhler@mips.com>, "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>, "H . J . Lu" <hjl@lucon.org>
Message-ID: <20020122170812.DPkMhBEkwWxSEcoZtG9gQ-X1WIKjz6crXSUzo3HnvbA@z>

> Perhaps I'm mangling terminology.  LinuxThreads is a one-to-one mapping
> of kernel threads to user threads.  All the kernel threads, and thus
> all the user threads, share the same memory region - including the
> stack region.  Their stacks are differentiated solely by different
> values in the stack pointer register.  Thus I don't think what you're
> suggesting is possible.

I don't see how fork() semantics can be preserved unless
the stack regions are replicated (copy-on-write) on a fork().
Under ATT and BSD Unix (which is where I did most of
my kernel hacking in the old days) that was the *only*
way to get a new kernel thread, so it was "obvious"
that my proposed hack would work.  Linux does have
the clone() function as well, and if LinuxThreads are
implemented in terms of clone(foo, stakptr, CLONE_VM, arg),
you are correct, the proposed scheme would not work
without modification.

One such modification would be to have each newly
cloned thread explicitly allocate and map a 1-page
VM region that is private to the kernel thread, and bound 
to a known virtual address that is common to all threads
within the task.  That known virtual address would take the 
place of the below-the-stack storage location I described 
earlier.  The same algorithm would apply - one has a globally 
known address that maps to different storage per-thread, 
which can be used to store the address of the (globally visible) 
per-thread information.  The set-up is slightly more complicated 
and heavyweight than the fork()-based model I suggested, 
but one could in principle eliminate one level of indirection 
at on the lookups at run-time.

            Regards,

            Kevin K.
 
