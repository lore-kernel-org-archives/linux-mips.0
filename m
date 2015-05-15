Received: from mailapp01.imgtec.com ([195.59.15.196]:61411 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012643AbbEOWmBa4XVi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 16 May 2015 00:42:01 +0200
Message-ID: <555675BA.9000700@imgtec.com>
Date: Fri, 15 May 2015 15:39:54 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] MIPS64: Support of at least 48 bits of SEGBITS
References: <20150515013351.7450.12130.stgit@ubuntu-yegoshin> <20150515215320.GI2322@linux-mips.org>
In-Reply-To: <20150515215320.GI2322@linux-mips.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: aleksey.makarov@auriga.com, james.hogan@imgtec.com, paul.burton@imgtec.com, david.daney@cavium.com, peterz@infradead.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, davidlohr@hp.com, kirill@shutemov.name, akpm@linux-foundation.org, mingo@kernel.org
Message-ID: <20150515223954.RuiAdbVtuu9yZFg7RvnbGdAxiiz1Pl3RICKFKpQpX04@z>

On 05/15/2015 02:53 PM, Ralf Baechle wrote:
> On Thu, May 14, 2015 at 06:34:43PM -0700, Leonid Yegoshin wrote:
>
> The order 1 allocation for the PGD are concerning me a little.  On a
> system under even moderate memory pressure that might become a bit of
> a reliability or performance issue.
>
> With 4kB pages we already need order 1 or even 2 allocations for the
> allocation of the stack and some folks have reported that to be an issue
> so we may have to start using the PUD for very large VA spaces.
>
>    Ralf

I don't think it is an issue here - people, who wants to exercise 256 
TERABAIT of memory PER PROCESS may even doesn't note that they have PGD 
= 2 pages. It is definitely not for systems with 4GB physmemory.

I also recommend for low memory to look into CONFIG_COMPACTION, it may 
be a great help for them here, look into mm/vmscan.c, 
in_reclaim_compaction().

Besides that, I defined this feature for 16KB and 64KB pages only, not 
for 4KB.
