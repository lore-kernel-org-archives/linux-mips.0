Received: from col0-omc2-s15.col0.hotmail.com ([65.55.34.89]:10105 "EHLO
	col0-omc2-s15.col0.hotmail.com") by ftp.linux-mips.org with ESMTP
	id S28580648AbYGYRmu (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 25 Jul 2008 18:42:50 +0100
Message-ID: <COL102-DS32614E51D494DDF91E561DC860@phx.gbl>
From: <danieljlaird@hotmail.com>
In-Reply-To: <64660ef00807250921h75ec4e48v92ef964e1c1185f4@mail.gmail.com>
References: <64660ef00807250921h75ec4e48v92ef964e1c1185f4@mail.gmail.com>
Subject: Re: Is the new generic KGDB patch in upstream-akpm?
Date: Fri, 25 Jul 2008 18:42:39 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <danieljlaird@hotmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Daniel Laird <daniel.j.laird@nxp.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20080725174239.C3bJeXSW6jtYn0uSVj8YT78Zq2Y6aAhoMOrw-QhSzeE@z>

Ignore, suffering from friday stupidity, sorting it now 
Cheers
Dan

--------------------------------------------------
From: "Daniel Laird" <daniel.j.laird@nxp.com>
Sent: Friday, July 25, 2008 5:21 PM
To: "Ralf Baechle" <ralf@linux-mips.org>
Cc: <linux-mips@linux-mips.org>
Subject: Is the new generic KGDB patch in upstream-akpm?

> I am trying to respin the patch to add pnx833x support to linux 2.6.27.
> I wanted to patch against the new generic kernel KGDB patch.
> So I removed gdb-hook etc.
> 
> However when I compile I get
> arch/mips/kernel/built-in.o: In function `early_console_write':
> early_printk.c:(.init.text+0x1450): undefined reference to `prom_putchar'
> early_printk.c:(.init.text+0x1450): relocation truncated to fit:
> R_MIPS_26 against `prom_putchar'
> early_printk.c:(.init.text+0x145c): undefined reference to `prom_putchar'
> early_printk.c:(.init.text+0x145c): relocation truncated to fit:
> R_MIPS_26 against `prom_putchar'
> make[1]: *** [.tmp_vmlinux1] Error 1
> 
> These functions were defined in my gdb-hook.c.  Do I need to move
> these somewhere else now? Or just not support EARLY_PRINTK etc.
> 
> Is this true?
> Cheers
> Daniel Laird
> 
> 
