Received: from web31501.mail.mud.yahoo.com ([68.142.198.130]:47807 "HELO
	web31501.mail.mud.yahoo.com") by ftp.linux-mips.org with SMTP
	id S8133604AbVKOUqe (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 15 Nov 2005 20:46:34 +0000
Message-ID: <20051115204828.31990.qmail@web31501.mail.mud.yahoo.com>
Date: Tue, 15 Nov 2005 12:48:28 -0800 (PST)
From: Jonathan Day <imipak@yahoo.com>
Subject: Problems with Linux kernel on Broadcom SB1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-Path: <imipak@yahoo.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20051115204828.mw5Ju42lu-fK0ikNk5XJ6Rs0rDiEXvxMofJ3aQKu04E@z>

Hi,

Trying to build the Linux kernel currently in the git
archive on a Broadcom SB1 (specifically, the 1250 dual
processor system).

I've not been able to get any of the page sizes other
than the 4K pages to work at all - it stops at boot,
no error messages, just a straight lock-up. If this is
a problem with the SB1, it might be wise to disable
the changing of the page size for that processor.

When enabling GDB support, I get the following
compile-time error:

arch/mips/sibyte/sb1250/irq.c: In function
'arch_init_irq':
arch/mips/sibyte/sb1250/irq.c:385: error: 'kgdb_flag'
undeclared (first use in this function)
arch/mips/sibyte/sb1250/irq.c:385: error: (Each
undeclared identifier is reported only once
arch/mips/sibyte/sb1250/irq.c:385: error: for each
function it appears in.)
arch/mips/sibyte/sb1250/irq.c: In function
'sb1250_kgdb_interrupt':
arch/mips/sibyte/sb1250/irq.c:423: warning: implicit
declaration of function 'set_async_breakpoint'

A quick inspection suggests copy-and-pasting lines 63
to 85 (inclusive) from arch/mips/bcm1480/irq.c to
arch/mips/sb1250/irq.c, overwriting lines 63 to 71, as
the bcm1480 lines seem to be much more up-to-date and
do seem to fix the problem.

The configure options allows me to enable MT on the
SB1, but I'm pretty sure the SB1 does not support MT.
If this is indeed the case, then someone might want to
have this option disabled when the SB1 is selected. In
fact, it might be good to hunt for core-specific
options and have them in their own section. That way,
you don't have obscenely-complex checks for every
option.

ipc/msg.c is giving a bunch of warnings -
setbuf.qbytes, setbuf.uid, setbuf.gid and setbuf.mode
may be being used uninitialized in the sys_msgctl and
the sys_semctl functions. Probably nothing
significant, and GCC does love to throw out errors for
conditions that aren't actually possible, but it
probably wouldn't hurt to see if there's a problem
there.
