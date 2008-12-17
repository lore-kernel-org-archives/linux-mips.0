Received: from rtp-iport-2.cisco.com ([64.102.122.149]:61409 "EHLO
	rtp-iport-2.cisco.com") by ftp.linux-mips.org with ESMTP
	id S24207952AbYLQU1Y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 17 Dec 2008 20:27:24 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: SPARSEMEM, HIGHMEM and the SMP8634
Date: Wed, 17 Dec 2008 15:26:26 -0500
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A2894C8911@xmb-rtp-218.amer.cisco.com>
In-Reply-To: <83f0348b0812120816p3d09ca8avafb7b9aca761b6e9@mail.gmail.com>
References: <83f0348b0812120816p3d09ca8avafb7b9aca761b6e9@mail.gmail.com>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ed Okerson <ed.okerson@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20081217202626._VAIs87zjKFO-UJMdGxB_kNbT7nyjBkeg2lAr0mWmyw@z>

Ed,

You don't need sparse memory to have high memory working. We're using
the 2.6.24 kernel. I don't know what might have changed concerning high
memory between the two, but the bottom line is that all we really ended
up having to do was to fix some bugs with high memory cache flushing.

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Ed Okerson
> Sent: Friday, December 12, 2008 8:16 AM
> To: linux-mips@linux-mips.org
> Subject: SPARSEMEM, HIGHMEM and the SMP8634
> 
> I am having great difficulty trying to get memory allocation from
> DRAM1 on the Sigma SMP8634.  It seems that some hybrid between
> SPARSEMEM and HIGHMEM would be needed.  I have read all the previous
> threads on this topic, but it appears no one has been successful yet.
> 
> I am working with the 2.6.22.19 kernel (latest release from Sigma).
> At this point, I have it kinda recognizing the memory:
> 
> On node 0 totalpages: 31712
>   DMA zone: 1024 pages used for memmap
>   DMA zone: 0 pages reserved
>   DMA zone: 22496 pages, LIFO batch:3
>   Normal zone: 0 pages used for memmap
>   HighMem zone: 256 pages used for memmap
>   HighMem zone: 7936 pages, LIFO batch:0
> Built 1 zonelists.  Total pages: 30432
> 
> But the memory output from the end of mem_init() does not show it:
> 
> Memory: 82432k/94080k available (2856k kernel code, 11604k reserved,
> 468k data, 5932k init, 0k highmem)
> 
> On the kernel command line I am passing:
> 
> mem=92M mem=32M@0x26000000
> 
> Which, as I understand it, should give me 32M out of the bottom of the
> 128M on bank DRAM1.  The output of 'free' also does not indicate any
> more memory than if I just pass 'mem=92M' to the kernel.
> 
> So what needs to be done to get the high memory added to usable
> memory?  I think I have gone beyond my understanding of memory
> management.  If the memory is in fact available, how can I tell, and
> how can it be allocated for user space programs?
> 
> Ed Okerson
> 
> 
