Message-ID: <010401c132fe$610d0610$3501010a@ltc.com>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <20010901165842.B13357@tuxedo.skovlyporten.dk>
Subject: Re: set_except_vector question
Date: Sat, 1 Sep 2001 11:54:26 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Lars Munch <lars@segv.dk>, linux-mips@oss.sgi.com
Message-ID: <20010901155426.VUeq0LkwwHv7QWbI8V-aV8T3WBlcFfv-KSuDSlouQKE@z>

Looks like it is synthesizing a jump (j) instruction to forward interrupt
exceptions to the interrupt handler for cpus that have a dedicated interrupt
vector (DIVEC).  arch/mips/kernel/setup.c sets the DIVEC option for certain
cpus.

Regards,
Brad

----- Original Message -----
From: "Lars Munch" <lars@segv.dk>
To: <linux-mips@oss.sgi.com>
Sent: Saturday, September 01, 2001 10:58 AM
Subject: set_except_vector question


> Hi
>
> I have been looking at the set_except_vector function in
> arch/mips[64]/kernel/traps.c and wondering why the handler
> address is changed/recalculated before it is stored:
>
> *(volatile u32 *)(KSEG0+0x200) = 0x08000000 | (0x03ffffff & (handler >>
2));
>
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Could someone please enlighten me?
>
> Thanks
> Lars Munch
>
