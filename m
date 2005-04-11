Message-ID: <004a01c53ed4$dab12b00$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <42553E49.7080004@timesys.com> <4256991C.4020601@timesys.com> <20050408161357.GB19166@linux-mips.org> <4256B524.2080509@timesys.com> <425AD440.5050600@timesys.com>
Subject: Re: another 4kc machine check.
Date: Mon, 11 Apr 2005 22:27:15 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Greg Weeks <greg.weeks@timesys.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20050411202715.v1kEX0JokBN7jWRR_JN1z3rPPVhSew3e3I41tWc-u2I@z>

If the 4KC and 4KEC need it, so does the 4KSC (and 4KSD).

----- Original Message ----- 
From: "Greg Weeks" <greg.weeks@timesys.com>
To: "Ralf Baechle" <ralf@linux-mips.org>
Cc: <linux-mips@linux-mips.org>
Sent: Monday, April 11, 2005 21:47
Subject: Re: another 4kc machine check.


> This patch appears to fix my machine check problem on the 4kc. The 4kc 
> shouldn't need an ssnop here, but this appears to fix it.
> 
> Greg Weeks
> 


--------------------------------------------------------------------------------


> --- mips-malta4kcle-basic/arch/mips/mm/tlbex.c-orig
> +++ mips-malta4kcle-basic/arch/mips/mm/tlbex.c
> @@ -847,7 +847,6 @@
>  
>   case CPU_R10000:
>   case CPU_R12000:
> - case CPU_4KC:
>   case CPU_SB1:
>   case CPU_4KSC:
>   case CPU_20KC:
> @@ -874,6 +873,7 @@
>   tlbw(p);
>   break;
>  
> + case CPU_4KC:
>   case CPU_4KEC:
>   case CPU_24K:
>   i_ehb(p);
> 
