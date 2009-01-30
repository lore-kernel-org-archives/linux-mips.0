Received: from rtp-iport-1.cisco.com ([64.102.122.148]:50047 "EHLO
	rtp-iport-1.cisco.com") by ftp.linux-mips.org with ESMTP
	id S21365766AbZA3Djr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 30 Jan 2009 03:39:47 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: memcpy and prefetch
Date: Thu, 29 Jan 2009 22:39:37 -0500
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A2898237E1@xmb-rtp-218.amer.cisco.com>
In-Reply-To: <20090129155854.GC29521@linux-mips.org>
References: <20090128103753.GC2234@linux-mips.org> <20090129.002850.118974677.anemo@mba.ocn.ne.jp> <20090128183047.GA1691@linux-mips.org> <20090129.213613.128618730.anemo@mba.ocn.ne.jp> <20090129155854.GC29521@linux-mips.org>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: ddaney@caviumnetworks.com, "Michael Sundius -X (msundius - Yoh Services LLC at Cisco)" <msundius@cisco.com>, linux-mips@linux-mips.org, msundius@sundius.com
Message-ID: <20090130033937.AlLY_KkwKj7qOpbKHnU-T4axrXbQfisTyrvH-wwjgBA@z>

> The idea here is that we have two issues with prefetching:
> 
>  o Prefetching beyond the end of the source or destination range on a
>    in-coherent range might bring back stale values from a DMA I/O
>    buffer resulting in data corruption.  Hardware DMA coherency will
>    avoid this issue.
> 
>  o IP27 has full blown hardware coherency.  Historically 
> CONFIG_DMA_COHERENT
>    was not able to cope with something of the complexity of IP27, so
>    there was a separate CONFIG_DMA_IP27 and the broken logic 
> expression
>    was meant to treat CONFIG_DMA_COHERENT and CONFIG_DMA_IP27 the same
>    as for prefetching.
> 
>  o Prefetching beyond the end of physical memory can cause 
> exceptions on
>    some systems.  The Malta has this problem.
> 
> Thus no prefetching on Malta or non-coherent systems.
> 
>   Ralf

It seems to me as though we could avoid the first and third problems
with a memcpy that doesn't prefetch past the end of the buffer, the
thought being that if we are reading or writing a memory region, we
really shouldn't be doing DMA to or from that location. This would
probably be slightly suboptimal, performance-wise, for those systems
that do have DMA coherence. It seems as though we could have two
mutually exclusive versions, selectable via the CONFIG_DMA_COHERENT
flag. For those of us without DMA coherence, it would probably give our
memcpy performance a bit of a kick in the pants over using no prefetch
at all.

If this makes sense, we might be able to sign up to do the work. Anyone
have a good, caching-aware memcpy test?
--
David VomLehn, dvomlehn@cisco.com
