From: "Jay Carlson" <nop@nop.com>
Subject: kernel should not reject -mips2 ELF binaries
Date: Mon, 6 Nov 2000 21:20:00 -0500
Message-ID: <KEEOIBGCMINLAHMMNDJNEEDHCAAA.nop@nop.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com, linux-mips@fnet.fr
Message-ID: <20001107022000.CP3t2FqO5zHA-PaaSabqfZoCrIeNNI8mI8wz7FaNPiM@z>

include/asm-mips/elf.h contains a macro, elf_check_arch, that decides if an
executable is plausible to run under this kernel.  It currently accepts
binaries flagged as MIPS1 ISA, and rejects all other ISAs.

#define elf_check_arch(hdr)						\
({									\
	int __res = 1;							\
	struct elfhdr *__h = (hdr);					\
									\
	if ((__h->e_machine != EM_MIPS) &&				\
	    (__h->e_machine != EM_MIPS_RS4_BE))				\
		__res = 0;						\
	if (__h->e_flags & EF_MIPS_ARCH)				\
		__res = 0;						\
									\
	__res;								\
})

I think we should make an exception for MIPS2.  Turns out that the two Linux
VR processor families benefit from some of the MIPS II features; most
notably, code density is improved by eliminating load delay slots.  If I
build executables that take advantage of this, they legitimately should be
flagged with E_MIPS_ARCH_2 (since they won't run on my decstation).

So what's the right way to fix this?  Three things come to mind:

1) rip out the EF_MIPS_ARCH check from elf_check_arch.
2) compare the value with E_MIPS_ARCH_1 and E_MIPS_ARCH_2
3) figure out what the capabilities of the current processor are and reject
E_MIPS_ARCH2 on R2/3000s.

I'd just go do #3 except it looks like a bigger pain than it's worth.  No
other linux kernel port goes to that amount of trouble, of course.

(I may do #1 or #2 in the Linux VR CVS as a stopgap.)

Jay
