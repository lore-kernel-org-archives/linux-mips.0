Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199705301731.TAA13819@informatik.uni-koblenz.de>
Subject: Re: ld error with 2.0.12-davem
Date: Fri, 30 May 1997 19:31:13 +0200 (MET DST)
In-Reply-To: <199705301556.LAA16331@neon.ingenia.ca> from "Mike Shaver" at May 30, 97 11:56:55 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970530173113.h1z-4xggw4wkm2VxLuu0dCSq-cbKgR1NMZIT_NNlHek@z>

> Using Ralf's gcc and binutils, and davem's cvs'd linux-2.0.12, I get:
> mips-linux-ld -static -N -e kernel_entry -mips2 -Ttext 0x88069000 \
>   arch/mips/kernel/head.o init/main.o init/version.o \
>   arch/mips/lib/lib.a /export/sgi-linux/kernel/mips-linux/lib/lib.a \
>   arch/mips/lib/lib.a -o vmlinux
> mips-linux-ld: vmlinux: Not enough room for program headers \
>   (allocated 3, need 4)
> mips-linux-ld: final link failed: Bad value
> make: *** [vmlinux] Error 1

This is typically caused by an inapropriate mixture of flags to ld,
especially -Ttext and a linker script.  In your case no linker script
has been specified using a -T option, so the buildtin script is being
used.  Just check the right script in <prefix>/mips-linux/lib/ldscripts/.

  Ralf
