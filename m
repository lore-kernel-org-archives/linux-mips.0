Message-ID: <000d01bfad56$7541c320$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: /usr/include/asm/io.h:308: undefined reference to `mips_io_port_base'
Date: Sun, 23 Apr 2000 21:02:14 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Florian Lohoff <flo@rfc822.org>, linux@cthulhu.engr.sgi.com
Message-ID: <20000423190214.v_NmvGjYWHH7kgNNGCACw57vMPktdfCjtDQxYwDaXCU@z>

>Hi,
>i am trying to build "pileup" which is a "SoundBlaster" morse trainer.
>As it directly accesses hardware it seems to include some files which
>aehm - dont seem to work for userspace :)
>
>Does someone have an idea what goes wrong here ?

Sure.  The "IN" and "OUT" macros used to simulate x86
I/O instructions operating on ISA I/O space use
mips_io_port_base as the base address for the
memory-mapped I/O access to "non memory-mapped I/O"
(in the PC sense) addresses.  Since MIPS platforms don't
always have the same address space layout as a standard PC,
mips_io_port_base is not a constant, but a variable declared
in arch/mips/kernel/setup.c and initialized (if a non-zero value
is required) in the platform setup code.

So arguably, what you need to do to make those macros
work in user mode, is to have some kind of library module
that you can link into the application that contains a declaration
of mips_io_port_base, initialized to the correct value for
your platform.

>[...]
>make CFLAGS="-O2 -g -Wall -D_REENTRANT"
>make[1]: Entering directory `/home/builder/build/pileup-1.1'
>gcc -O2 -g -Wall -D_REENTRANT -c  AdLib.c
>gcc -O2 -g -Wall -D_REENTRANT -c pileup.c
>gcc -O2 -g -Wall -D_REENTRANT -o pileup pileup.o AdLib.o -lm -lpthread
>pileup.o: In function `stop_thread':
>/home/builder/build/pileup-1.1/pileup.c:229: undefined reference to `ioperm'
>/home/builder/build/pileup-1.1/pileup.c:230: undefined reference to `ioperm'
>pileup.o: In function `start_thread':
>/home/builder/build/pileup-1.1/pileup.c:289: undefined reference to `ioperm'
>/home/builder/build/pileup-1.1/pileup.c:290: undefined reference to `ioperm'
>pileup.o: In function `main':
>/home/builder/build/pileup-1.1/pileup.c:625: undefined reference to `ioperm'
>pileup.o:/home/builder/build/pileup-1.1/pileup.c:626: more undefined references
to `ioperm' follow
>AdLib.o: In function `wr_register':
>/usr/include/asm/io.h:308: undefined reference to `mips_io_port_base'
>/usr/include/asm/io.h:304: undefined reference to `mips_io_port_base'
>/usr/include/asm/io.h:304: undefined reference to `mips_io_port_base'
>AdLib.o: In function `AdLib_found':
>/usr/include/asm/io.h:304: undefined reference to `mips_io_port_base'
>AdLib.o: In function `ºm\*ºm\und':
>/usr/include/asm/io.h:304: undefined reference to `mips_io_port_base'
>make[1]: *** [pileup] Error 1
>make[1]: Leaving directory `/home/builder/build/pileup-1.1'
>make: *** [build] Error 2
>[...]
>
>Flo
>--
>Florian Lohoff flo@rfc822.org       +49-subject-2-change
>"Technology is a constant battle between manufacturers producing bigger and
>more idiot-proof systems and nature producing bigger and better idiots."
>
