From: "Jay Carlson" <nop@nop.com>
Subject: RE: kernel should not reject -mips2 ELF binaries
Date: Mon, 6 Nov 2000 22:00:02 -0500
Message-ID: <KEEOIBGCMINLAHMMNDJNIEDHCAAA.nop@nop.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20001107032802.D28567@bacchus.dhis.org>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>, Jay Carlson <nop@place.org>
Cc: linux-mips@oss.sgi.com, linux-mips@fnet.fr
Message-ID: <20001107030002.qht1psmSQTun_mbeepo5uddNQ96ZnCM4pszeXGh38xU@z>

> > 	if (__h->e_flags & EF_MIPS_ARCH)				\
> > 		__res = 0;						\

> > So what's the right way to fix this?  Three things come to mind:
> >
> > 1) rip out the EF_MIPS_ARCH check from elf_check_arch.
>
> Take 1).  The problem we have is distiguishing Linux binaries from IRIX
> binaries.  The code causing problems for you is a heuristic that no
> longer works these days so I'll have to come up with something new.

OK.  I'm going to remove the above two lines in the Linux VR CVS repository.
Thanks!

Jay
