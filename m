content-class: urn:content-classes:message
Subject: RE: mmap'ed memory cacheable or uncheable
Date: Fri, 25 Jul 2003 15:52:33 -0700
Message-ID: <61F6477DE6BED311B69F009027C3F58403AA396F@EXCHANGE>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
From: "Teresa Tao" <Teresat@tridentmicro.com>
Return-Path: <Teresat@tridentmicro.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jun Sun <jsun@mvista.com>, Teresa Tao <Teresat@tridentmicro.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20030725225233.8Zi4myZaqkDcqjx9PTvdLIsmFKcUaTk4OS5kxIYbrPs@z>

How about if I specify the following flags in my mmap routine just like what the pgprot_noncached micro did.
	pgprot_val(vma->vm_page_prot) &= ~_CACHE_MASK;
	pgprot_val(vma->vm_page_prot) |= _CACHE_UNCACHED;

Will this have kernel make the mmap'd memory non-cacheable? Or is there a mmap non-cacheable patch?

Thanks in advance!

Teresa



-----Original Message-----
From: Jun Sun [mailto:jsun@mvista.com]
Sent: Friday, July 25, 2003 3:02 PM
To: Teresa Tao
Cc: linux-mips@linux-mips.org; jsun@mvista.com
Subject: Re: mmap'ed memory cacheable or uncheable


On Thu, Jul 24, 2003 at 08:26:59PM -0700, Teresa Tao wrote:
> Hi there,
> 
> I got a question regarding the mmap'ed memory. Is the mmap'ed memory cacheable or uncheable? My driver just use the remap_page_range to map a reserved physical memory.
>

I am pretty much sure it is cached, although I can't pin down exactly
where in the mm subsystem it does so - I have had cache bugs related
to mmap().

Jun
