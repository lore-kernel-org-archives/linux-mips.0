Date: Fri, 20 Apr 2001 15:53:10 -0400 (EDT)
From: George Gensure <werkt@csh.rit.edu>
Subject: Re: glibc build
In-Reply-To: <3AE08630.FF25517A@ayrnetworks.com>
Message-ID: <Pine.SOL.4.31.0104201549180.3449-100000@fury.csh.rit.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Bryan Chua <chua@ayrnetworks.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010420195310.wNi3wYYK-Q8Fj5VHoF4bC8F7epvuy3qLOEPZLjNxx-U@z>

I added the following entry to the environment variable CFLAGS and to the
CFLAGS entry in glibcbug - -D__PIC__ ... got the same error.

George
werkt@csh.rit.edu

On Fri, 20 Apr 2001, Bryan Chua wrote:

> I ran into this at some point and tracked it down to adding -D__PIC__ to
> CFLAGS.  I don't think it is necessary on newer (unreleased) compilers.
>
> -- bryan
>
> "George Gensure,,," wrote:
>
> > I get the following error while trying to cross-build glibc for mips on
> > an i686.  Can anyone give any insight?
> >
> > ../sysdeps/mips/setjmp.S: Assembler messages:
> > ../sysdeps/mips/setjmp.S:43: Error: Can not represent
> > BFD_RELOC_16_PCREL_S2 relocation in this object file format
> > make[2]: *** [/usr/local/crossbuild/glibc-build/setjmp/setjmp.o] Error 1
> > make[2]: Leaving directory `/usr/local/crossbuild/glibc-2.2/setjmp'
> > make[1]: *** [setjmp/subdir_lib] Error 2
> > make[1]: Leaving directory `/usr/local/crossbuild/glibc-2.2'
> > make: *** [install] Error 2
> >
> > George
> > werkt@csh.rit.edu
>
