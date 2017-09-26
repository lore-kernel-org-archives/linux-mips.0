Received: from mailapp01.imgtec.com ([195.59.15.196]:23284 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992111AbdIZSsfTxFES (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Sep 2017 20:48:35 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH] net: stmmac: Meet alignment requirements for DMA
Date: Tue, 26 Sep 2017 11:48:19 -0700
Message-ID: <71740323.RRBhnhefTi@np-p-burton>
In-Reply-To: <20170926.103400.1009342814128022820.davem@davemloft.net>
References: <1506078833-14002-1-git-send-email-matt.redfearn@imgtec.com> <587dc9a8-b974-e222-95b4-93c2a8f2aba2@imgtec.com> <20170926.103400.1009342814128022820.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1593612.t0nK0YYSNi";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Miller <davem@davemloft.net>
Cc: matt.redfearn@imgtec.com, netdev@vger.kernel.org, alexandre.torgue@st.com, peppe.cavallaro@st.com, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, james.hogan@imgtec.com
Message-ID: <20170926184819.9Zy8Z1NTfVXsrVvLFyZHlzsgyx-JgvqHRajE4xvzf3I@z>

--nextPart1593612.t0nK0YYSNi
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi David,

On Tuesday, 26 September 2017 10:34:00 PDT David Miller wrote:
> From: Matt Redfearn <matt.redfearn@imgtec.com>
> Date: Tue, 26 Sep 2017 14:57:39 +0100
> 
> > Since the MIPS architecture requires software cache management,
> > performing a dma_map_single(TO_DEVICE) will writeback and invalidate
> > the cachelines for the required region. To comply with (our
> > interpretation of) the DMA API documentation, the MIPS implementation
> > expects a cacheline aligned & sized buffer, so that it can writeback a
> > set of complete cachelines. Indeed a recent patch
> > (https://patchwork.linux-mips.org/patch/14624/) causes the MIPS dma
> > mapping code to emit warnings if the buffer it is requested to sync is
> > not cachline aligned. This driver, as is, fails this test and causes
> > thousands of warnings to be emitted.
> 
> For a device write, if the device does what it is told and does not
> access bytes outside of the periphery of the DMA mapping, nothing bad
> can happen.
> 
> When the DMA buffer is mapped, the cpu side cachelines are flushed (even
> ones which are partially part of the requsted mapping, this is _fine_).

This is not fine. Let's presume we writeback+invalidate the cache lines that 
are only partially covered by the DMA mapping at its beginning or end, and 
just invalidate all the lines that are wholly covered by the mapping. So far 
so good.

> The device writes into only the bytes it was given access to, which
> starts at the DMA address.

OK - still fine but *only* if we don't write to anything that happens to be 
part of the cache lines that are only partially covered by the DMA mapping & 
make them dirty. If we do then any writeback of those lines will clobber data 
the device wrote, and any invalidation of them will discard data the CPU 
wrote.

How would you have us ensure that such writes don't occur?

This really does not feel to me like something to leave up to drivers without 
any means of checking or enforcing correctness. The requirement to align DMA 
mappings at cache-line boundaries, as outlined in Documentation/DMA-API.txt, 
allows this to be enforced. If you want to ignore this requirement then there 
is no clear way to verify that we aren't writing to cache lines involved in a 
DMA transfer whilst the transfer is occurring, and no sane way to handle those 
cache lines if we do.

> The unmap and/or sync operation after the DMA transfer needs to do
> nothing on the cpu side since the map operation flushed the cpu side
> caches already.
> 
> When the cpu reads, it will pull the cacheline from main memory and
> see what the device wrote.

This is not true, because:

1) CPUs may speculatively read data. In between the invalidations that we did
   earlier & the point at which the transfer completes, the CPU may have
   speculatively read any arbitrary part of the memory mapped for DMA.

2) If we wrote to any lines that are only partially covered by the DMA mapping
   then of course they're valid & dirty, and an access won't fetch from main
   memory.

We therefore need to perform cache invalidation again at the end of the 
transfer - on MIPS you can grep for cpu_needs_post_dma_flush to find this. 
--nextPart1593612.t0nK0YYSNi--
