Message-ID: <0C674B14EAEBD61196D900B0D03DB49F010C8361@blrw502w.blr.infineon.com>
From: "Babbellapati Syam Krishna (IFIN DC COM)"
	<Syam-Krishna.Babbellapati@infineon.com>
Subject: RE: "sel" field in MTC0 instruction?
Date: Tue, 14 Oct 2003 15:48:52 +0530
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Syam-Krishna.Babbellapati@infineon.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>
Cc: "'linux-mips@linux-mips.org'" <linux-mips@linux-mips.org>
Message-ID: <20031014101852.O8rjA5tlZD9xb2--orTT-fy5Hii8Nzi4nHxRIL_EGW8@z>

>> #define write_32bit_cp0_performance_register(register,value) 
>\ __asm__ 
>> __volatile__( \ "mtc0\t%0,"STR(register)",sel\n\t" \
>> "nop" \
>> : : "r" (value));
>
>Which seems to be dervied from an old function which was 
>eleminated months ago.  Checkout a current mipsregs.h - which 
>also accesses register with a non-zero selector value.
>

Thanks Ralf. I could get out of it.

Syam
