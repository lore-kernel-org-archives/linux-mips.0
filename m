Received: from verein.lst.de ([213.95.11.211]:53279 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992036AbdFTMllbTh6n (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 20 Jun 2017 14:41:41 +0200
Date: Tue, 20 Jun 2017 14:41:40 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: new dma-mapping tree, was Re: clean up and modularize arch
        dma_mapping interface V2
Message-ID: <20170620124140.GA27163@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170616181059.19206-1-hch@lst.de>
Return-Path: <hch@lst.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org, linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@linux-mips.org, openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, iommu@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <20170620124140.TGSLP-kg-p37EjRKGNim5Ni5T75V8Qy9hf5562LxIyQ@z>

On Fri, Jun 16, 2017 at 08:10:15PM +0200, Christoph Hellwig wrote:
> I plan to create a new dma-mapping tree to collect all this work.
> Any volunteers for co-maintainers, especially from the iommu gang?

Ok, I've created the new tree:

   git://git.infradead.org/users/hch/dma-mapping.git for-next

Gitweb:

   http://git.infradead.org/users/hch/dma-mapping.git/shortlog/refs/heads/for-next

And below is the patch to add the MAINTAINERS entry, additions welcome.

Stephen, can you add this to linux-next?

---
