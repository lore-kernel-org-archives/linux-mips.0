Date: Tue, 14 Oct 2003 09:13:23 +0200
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: "sel" field in MTC0 instruction?
Message-ID: <20031014071323.GB5046@linux-mips.org>
References: <0C674B14EAEBD61196D900B0D03DB49F010C835E@blrw502w.blr.infineon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0C674B14EAEBD61196D900B0D03DB49F010C835E@blrw502w.blr.infineon.com>
Return-Path: <ralf@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Babbellapati Syam Krishna (IFIN DC COM)" <Syam-Krishna.Babbellapati@infineon.com>
Cc: "'linux-mips@linux-mips.org'" <linux-mips@linux-mips.org>
Message-ID: <20031014071323.oV8XHTZmcf3HMiOKtsR5wrqz3NiVGEBeiMS9-sZhhhI@z>

On Tue, Oct 14, 2003 at 11:16:20AM +0530, Babbellapati Syam Krishna (IFIN DC COM) wrote:

> #define write_32bit_cp0_performance_register(register,value) \
> __asm__ __volatile__( \
> "mtc0\t%0,"STR(register)",sel\n\t" \
> "nop" \
> : : "r" (value));

Which seems to be dervied from an old function which was eleminated months
ago.  Checkout a current mipsregs.h - which also accesses register with
a non-zero selector value.

> "sel" in the above assembly instruction is a value of either 0, 1, 2 or 3
> based on the register which we would like to write.
> "sel" in the above code is newly introduced by us and if there is no sel
> then the code compiles properly but I guess we would always be accessing one
> register only in that case.
> (A similar routine is written using "mfc0" also for reading the values
> back.)
>  
> But this code results in a compilation error:
> {standard input}: Assembler messages:
> {standard input}:41: Error: illegal operands `mtc0 $3,$25,0'
> {standard input}:45: Error: illegal operands `mfc0 $5,$25,1'
> where $25 is CP0_PERFORMANCE register.
>  
> The command used for compilation is:
> mipsel-linux-gcc -c -I /home/syam/linux-2.4.20with095LTT/include/ -Wall -O2
> -fomit-frame-pointer -fno-common -finline-limit=5000 -G 0 -mno-abicalls
> -fno-pic -mcpu=r4600 -mips2 -pipe -DMODULE -mlong-calls tempCache.c

The mtc/mfc syntax is MIP32, didn't exist in MIPS III.

> *Disclaimer*
> "This e-mail and any attachments are confidential and may contain trade
> secrets or privileged or undisclosed information. They may also be subject
> to copyright protection. Please do not copy, distribute or forward this
> email to anyone unless authorized. If you are not a named addressee, you
> must not use, disclose, retain or reproduce all or any part of the
> information contained in this e-mail or any attachments. If you have
> received this email by mistake please notify the sender immediately by
> return email and destroy/delete all copies of the email." 

Please print a hardcopy of this my answer, then eat it up because it's
confidential ;-)

Any and all email sent to this list will be archived and published
immediately no matter what bullshit disclaimer is attached.

  Ralf
