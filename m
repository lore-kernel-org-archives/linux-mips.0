Received: from gate.crashing.org ([63.228.1.57]:46410 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23994901AbdFQUux6PJVF (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 17 Jun 2017 22:50:53 +0200
Message-ID: <1497732627.2897.128.camel@kernel.crashing.org>
Subject: Re: [PATCH 42/44] powerpc/cell: use the dma_supported method for
 ops switching
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Sun, 18 Jun 2017 06:50:27 +1000
In-Reply-To: <20170616181059.19206-43-hch@lst.de>
References: <20170616181059.19206-1-hch@lst.de>
         <20170616181059.19206-43-hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <benh@kernel.crashing.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Christoph Hellwig <hch@lst.de>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org, linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@linux-mips.org, openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, iommu@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <20170617205027.KfNjJYG41KHmpBXBQMRz6LSNLz1yw5vmntdijUnxfaU@z>

On Fri, 2017-06-16 at 20:10 +0200, Christoph Hellwig wrote:
> Besides removing the last instance of the set_dma_mask method this also
> reduced the code duplication.

What is your rationale here ? (I have missed patch 0 it seems).

dma_supported() was supposed to be pretty much a "const" function
simply informing whether a given setup is possible. Having it perform
an actual switch of ops seems to be pushing it...

What if a driver wants to test various dma masks and then pick one ?

Where does the API documents that if a driver calls dma_supported() it
then *must* set the corresponding mask and use that ?

I don't like a function that is a "boolean query" like this one to have
such a major side effect.
