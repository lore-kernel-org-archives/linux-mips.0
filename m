From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
Subject: RE: [uClibc] Re: uclibc mips ld.so and undefined symbols withnonzerosymbol table entry st_value
Date: Tue, 11 May 2004 09:27:42 +0200
Message-ID: <JPEALJAFNGDDLOPNDIEEGEFDCIAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <JPEALJAFNGDDLOPNDIEEMEELCIAA.joakim.tjernlund@lumentis.se>
Return-Path: <joakim.tjernlund@lumentis.se>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Bradley D. LaRonde" <brad@laronde.org>, Richard Sandiford <rsandifo@redhat.com>
Cc: uclibc@uclibc.org, linux-mips@linux-mips.org
Message-ID: <20040511072742.6lEyChZCKVa2JanBrmIkuYn1Y_u0IrYzESL0qSZM0Lc@z>

> > Changing the alias for __phtread_once to
> > extern int __phtread_once(void) __attribute__ ((weak));
> > makes st_value=0 in libc, making the entry
> > look the same as in glibc.
> 
> hmm, this is not quite true. The binding in glibc is WEAK, but
> the above trick makes the binding GLOBAL in uClibc.

__phtread_once becoms WEAK if add "weak_function" to the
declaration in libc/inet/rpc/rpc_thread.c:
      extern weak_function int __pthread_once (pthread_once_t *__once_control,
			   void (*__init_routine) (void));
and remove the it compleatly from libc/misc/pthread/weaks.c
 
Now __phtread_once matches glibc, execpt for the reloc type. In glibc
you get a R_PPC_GLOB_DAT and in uClibc a R_PPC_ADDR32. Don't think that matters.

Is it desirable to match the pthread_ functions with glibc?
I havn't tried to run any code with these changes, so I have no
idea if it actually works.

 Jocke
