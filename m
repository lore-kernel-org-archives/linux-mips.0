Message-ID: <00d801c1a36c$ef0719e0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <m3elkoa5dw.fsf@myware.mynet><20020118101908.C23887@lucon.org><01b801c1a081$3f6518e0$0deca8c0@Ulysses><20020119162415.B31028@dea.linux-mips.net><m3d703thl6.fsf@myware.mynet><01be01c1a2d7$6ec299c0$0deca8c0@Ulysses> <15437.14361.918255.115877@gladsmuir.algor.co.uk> <002001c1a33e$d9936560$0deca8c0@Ulysses> <20020122102128.A11455@nevyn.them.org> <007601c1a35e$b3e3f940$0deca8c0@Ulysses> <20020122113420.A14284@nevyn.them.org> <00c001c1a367$69c10160$0deca8c0@Ulysses> <20020122121330.A16110@nevyn.them.org> <00cc01c1a36b$15cbf200$0deca8c0@Ulysses> <20020122123743.A17232@nevyn.them.org>
Subject: Re: thread-ready ABIs
Date: Tue, 22 Jan 2002 18:47:55 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: Daniel Jacobowitz <dan@debian.org>
Cc: Dominic Sweetman <dom@algor.co.uk>, Ralf Baechle <ralf@oss.sgi.com>, Ulrich Drepper <drepper@redhat.com>, Mike Uhler <uhler@mips.com>, "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>, "H . J . Lu" <hjl@lucon.org>
Message-ID: <20020122174755.C7ChcKQZindVm4X1u9rpO62lp5KQsjXxNyU6KR-0PaY@z>

> > Anyway, do you see a hole or a serious performance
> > problem with my modified proposal (explicit mmap()
> > to create the necessary storage)?
>
> Same problem as with clone.  I recommend the clone manpage; it says:
>
>        CLONE_VM
>               If CLONE_VM is set, the calling process and the child
processes run in the same
>               memory space.  In particular, memory writes performed by the
calling process or
>               by the child process are also visible in the other process.
Moreover, any mem­
>               ory mapping or unmapping performed with mmap(2) or munmap(2)
by  the  child  or
>               calling process also affects the other process.
>
>               If CLONE_VM is not set, the child process runs in a separate
copy of the memory
>               space of the calling process at the time of clone.  Memory
writes or file  map­
>               pings/unmappings  performed by one of the processes do not
affect the other, as
>               with fork(2).
>
> That is, if any memory OR MAPPING is shared, they all are.

Daniel, you didn't read my message.  The per-thread memory
would be allocated *after* the clone() in pthread_create().
More specifically, pthread_create() would set it up so that
the function passed to clone for invocation was in fact a
wrapper that sets up the memory and thread data before
invoking the application function passed to pthread_create().

Now, if the idea is that the clone() system call is supposed
to cause the thread to be born, like Athena, full-grown from
the head of Zeus, with the analog to the thread register
already set up when it leaves the kernel, then I would be inclined
to concede that we need to change the ABI, the kernel, and
compilers, and I would ask just what we get for our trouble.
But if we are permitted the pthreads abstraction, there's a
lot that can be done transparently.

            Regards,

            Kevin K.
