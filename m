Message-ID: <003501c2de36$b27c8360$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20030227005338.GB2077@greglaptop.internal.keyresearch.com>
Subject: Re: volatile question
Date: Thu, 27 Feb 2003 09:03:17 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Greg Lindahl <lindahl@keyresearch.com>, linux-mips@linux-mips.org
Message-ID: <20030227080317.pF5ennczYbzBXAodTynfSY2pAmyj-2_lqEIpSORb5_4@z>

> In the mips, mips64, and even the i386 arch, arch/kernel/smp.c has
> this in smp_call_function:
> 
>         spin_lock(&call_lock);
>         call_data = &data;
> 
>         /* Send a message to all other CPUs and wait for them to respond */
>         for (i = 0; i < smp_num_cpus; i++)
>                 if (i != cpu)
>                         core_send_ipi(i, SMP_CALL_FUNCTION);
> 
> call_data isn't volatile, it's a plain static *. So how can we be sure
> that "call_data = &data" does anything other than change a register?
> 
> The i386 has a wb() after the assignment; we don't even have that.

call_data is neither local nor static to the function, so the modification
of the storage location would seem to be mandatory for the compiler
before the call to core_send_ipi(), so I can see how the code, as written, 
would generally work on most MIPS CPUs.  However, it would be legal 
for the compiler to defer the store until *just* before the invocation of 
core_send_ipi(), and on moderately complex,  high-ILP processors 
it seems to me like the wb() might well be necessary.  I take it that
you've observed a problem with this on your system?:
