Message-ID: <01fe01c2e8f6$c41451a0$6601010a@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <438113fe62.3fe6243811@netvision.net.il>
Subject: Re: allocating a large memory area
Date: Wed, 12 Mar 2003 19:23:26 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <brad@ltc.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Hilik Stein <hilik@netvision.net.il>
Cc: linux-mips@linux-mips.org
Message-ID: <20030313002326.IoiKp1AF1I8NfNgdexM34skWXzz5h6XYDaCviDnkf-c@z>

----- Original Message -----
From: "Hilik Stein" <hilik@netvision.net.il>
To: <linux-mips@linux-mips.org>
Sent: Wednesday, March 12, 2003 6:28 AM
Subject: allocating a large memory area


> i need to allocate a large memory region for my data (32MB), which is far
> beyond what kmalloc can provide for me.
> i do not want to use vmalloc, since it will allocate the memory out of
> KSEG2, which is too slow and will generate too many exceptions when i
> have to access my data randomly.
> i was thinking of limiting the linux from accessing the highest physical
> 32MB by using "mem=224M" kernel command line parameter. this was i
> can access my data using 0x8e000000 through KSEG1.

Or put it below the kernel load point.

Or... I've used this trick - define a large array and let the linker make
space for it in .bss.  This is convenient since now the kernel has no
special requirement about load address or memory limit and the address can
just be a pointer to the array.

Regards,
Brad
