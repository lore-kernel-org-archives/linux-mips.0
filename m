Subject: Re: errno assignment in _syscall macros and glibc
Date: Mon, 3 Jul 2000 14:45:58 +0100 (BST)
In-Reply-To: <073a01bfe29c$00995e90$0a00000a@decoy> from "Jay Carlson" at Jun 30, 2000 10:03:41 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E1396Xy-0004hz-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Jay Carlson <nop@nop.com>
Cc: Ralf Baechle <ralf@oss.sgi.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Andreas Jaeger <aj@suse.de>, Mike Klar <mfklar@ponymail.com>, linux-mips@oss.sgi.com, linux-mips@fnet.fr, linux-mips@vger.rutgers.edu
Message-ID: <20000703134558.LeQ5NMSvvKxd33ZTYNfSbO8eFcYPrO-PEkxxzYtZRNE@z>

> Does newlib work under Linux?  I thought it was missing (for example) t=
> he
> syscalls, and generally needed work to be ported to Linux.  I'm interes=

You would need to add the syscalls yes. Also the Cygnus^WRed Hat folks tell
me that the eCos libc is built from and replaces newlib.

> *BSD libc has been suggested by a few people.

Good idea - how does it compare ?

> Jay
> 
> 
