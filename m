Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:37609 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133616AbWENOX5
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Sun, 14 May 2006 16:23:57 +0200
Message-ID: <002a01c67761$253e97f0$0202a8c0@Ulysses>
From: "Kevin D. Kissell" <KevinK@mips.com>
References: <446735C6.2080306@mountolympos.net>
Subject: Re: Instruction error with cache opcode
Date: Sun, 14 May 2006 16:17:14 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <KevinK@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: John Miller <jamiller1110@cox.net>, linux-mips@linux-mips.org
Message-ID: <20060514141714.gKqFyj8BoYLbmZzsCB3EUkuBEJSXWDb1B9EDkz9cEhU@z>

> I am attempting to write a routine to initialize the cache for a MIPS
> 4kc core to get Linux 2.6.16.14 to compile.  I am sure someone has
> probably already done this, but I am doing it for educational reasons. 
> I am receiving the following error:
> 
> arch/mips/kernel/head.S: Assembler messages:
> arch/mips/kernel/head.S:131: Error: Instruction cache requires absolute
> expression
> 
> From the following code section:
> 
> li t0, 0x80000000  # start address (KSEG0)
> addu t1,t0,0x2000 # 8KB I-cache
> 1: addu t0,0x10 # 16B line size
> cache Index_Store_Tag_I,-4(t0) # clear tag
> nop
> cache Fill_I,-4(t0) # fill line
> nop
> bne t0,t1,1b
> cache Index_Store_Tag_I,-4(t0)
> 
>  I copied the code section from See MIPS Run, so I know the code must be
> correct.  What am I doing wrong?

Where and how is the value of Index_Store_Tag_I  defined?

            Regards,

            Kevin K.
