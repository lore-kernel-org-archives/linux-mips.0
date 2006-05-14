Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:16107 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133554AbWENTjC
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Sun, 14 May 2006 21:39:02 +0200
Message-ID: <009501c6778e$947c3ff0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <446735C6.2080306@mountolympos.net> <002a01c67761$253e97f0$0202a8c0@Ulysses> <4467796E.8060000@mountolympos.net>
Subject: Re: Instruction error with cache opcode
Date: Sun, 14 May 2006 21:42:46 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: John Miller <jamiller1110@cox.net>, linux-mips@linux-mips.org
Message-ID: <20060514194246.p6XhRZPyIPLe3q6VKt89kqur5r4ZtvShmYRD5xIqNig@z>

> > Where and how is the value of Index_Store_Tag_I  defined?
> 
> I included asm/cacheops.h from the kernel tree, it is defined there as :
> 
> #define Index_Store_Tag_I 0x08
> 
> I also tried to substitute 0x08 directly into my source and I got the
> same error.  Strangely enough, if I remove the include line, I get the
> same exact error.

Have you got your sources properly installes so that include/asm is
a symlink to include/asm-mips?  I've done the experiment at my end,
and it builds just fine so long as regdef.h and cacheops.h are really
on the include path of the compilation.  If they're not, I get:

[kevink@cthulhu tmp]$ mipsel-linux-gcc -I ~/smtchead/include -c cacheop.S
cacheop.S: Assembler messages:
cacheop.S:4: Error: Instruction cache requires absolute expression
cacheop.S:4: Error: Instruction cache requires absolute expression
cacheop.S:4: Error: illegal operands `cache'

            Regards,

            Kevin K.
