Message-ID: <014a01c3dc18$c92b74a0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <40079391.7080301@mistralsoftware.com>
Subject: Re: VR4131 - MQ1132 - UPD63335
Date: Fri, 16 Jan 2004 11:09:09 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Suresh. R" <suresh@mistralsoftware.com>, linux-mips@linux-mips.org
Message-ID: <20040116100909.nuXVF_h1Oex4ZZsmAfWDi-k-uxRfPs1FDO1TyCN3aUQ@z>

If I recall correctly, WinCE runs drivers and system services in User mode,
so any memory-mapped I/O would need to be set-up explicitly in the virtual 
address space.  As Geert has pointed out, so long as it's in that first 512MB,
a Linux driver running in Kernel mode can access it directly via Kseg1 (or
Kseg0, if you wanted to be able to cache the data).

----- Original Message ----- 
From: "Suresh. R" <suresh@mistralsoftware.com>
To: <linux-mips@linux-mips.org>
Sent: Friday, January 16, 2004 8:32
Subject: VR4131 - MQ1132 - UPD63335


> Hi,
>    This might be a very basic question, but I am very new to this field. 
> So please help me.
> 
> I am writing a linux device driver for UPD63335 audio codec. Its 
> controlled through the MQ1132 co-processor. The VR4131 is the processor. 
> The memory of MQ1132 is mapped to the processor memory in Kseg1 (0xA000 
> 0000 onwards) which the manual says is TLB Unmapped region. Now my 
> question is is it necessary to map this region before using it in Linux. 
> Actually I have WinCE code for my reference. In that code the programmer 
> is mapping the region using Virtual Cpoy and Virtual Alloc. Is it 
> necessary to do that or Can I directly address the memory locatoin.
> 
> Please help
> 
> Thanks in advance
> 
> Regards
> Suresh
> 
> 
> 
