Received: from sccrmhc11.comcast.net ([204.127.202.55]:1209 "EHLO
	sccrmhc11.comcast.net") by ftp.linux-mips.org with ESMTP
	id S8133577AbVJGUSe (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 7 Oct 2005 21:18:34 +0100
From: "Kyle Unice" <unixe@comcast.net>
Subject: Cross-compiling Linux problem
Date: Fri, 7 Oct 2005 14:18:24 -0600
Message-ID: <002b01c5cb7c$45c181e0$0400a8c0@buzz>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-Path: <unixe@comcast.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20051007201824.WRAH73CcC06tSot5lwwvKe64UXo952JuPiE-b7iBzV4@z>

  LD      arch/mips/au1000/common/built-in.o
  CC      arch/mips/kernel/cpu-probe.o
  CC      arch/mips/kernel/branch.o
  AS      arch/mips/kernel/entry.o
  AS      arch/mips/kernel/genex.o
  CC      arch/mips/kernel/irq.o
  CC      arch/mips/kernel/process.o
  CC      arch/mips/kernel/ptrace.o
  CC      arch/mips/kernel/reset.o
  CC      arch/mips/kernel/semaphore.o
  CC      arch/mips/kernel/setup.o
  CC      arch/mips/kernel/signal.o
  CC      arch/mips/kernel/syscall.o
  CC      arch/mips/kernel/time.o
  CC      arch/mips/kernel/traps.o
  CC      arch/mips/kernel/unaligned.o
  CC      arch/mips/kernel/mips_ksyms.o
  CC      arch/mips/kernel/module.o
  AS      arch/mips/kernel/r4k_fpu.o
  AS      arch/mips/kernel/r4k_switch.o
  AS      arch/mips/kernel/scall32-o32.o
  CC      arch/mips/kernel/proc.o
  LD      arch/mips/kernel/built-in.o
  AS      arch/mips/kernel/head.o
  CC      arch/mips/kernel/init_task.o
  LDS     arch/mips/kernel/vmlinux.lds
  CC      arch/mips/mm/cache.o
  CC      arch/mips/mm/extable.o
  CC      arch/mips/mm/fault.o
  CC      arch/mips/mm/init.o
  CC      arch/mips/mm/pgtable.o
  CC      arch/mips/mm/tlbex.o
arch/mips/mm/tlbex.c:516:5: warning: "CONFIG_64BIT" is not defined
  AS      arch/mips/mm/tlbex-fault.o
  CC      arch/mips/mm/ioremap.o
arch/mips/mm/ioremap.c: In function `__ioremap':
include/asm-mips/mach-au1x00/ioremap.h:15: sorry, unimplemented: inlining
failed
 in call to '__fixup_bigphys_addr': function body not available
arch/mips/mm/ioremap.c:28: sorry, unimplemented: called from here
make[1]: *** [arch/mips/mm/ioremap.o] Error 1
make: *** [arch/mips/mm] Error 2
