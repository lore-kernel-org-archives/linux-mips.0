Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:54785 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993514AbeGKMq4PtFyi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Jul 2018 14:46:56 +0200
Date: Wed, 11 Jul 2018 13:46:31 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH 12/25] MIPS: loongson: untangle dma implementations
In-Reply-To: <20180525092111.18516-13-hch@lst.de>
Message-ID: <alpine.DEB.2.00.1807110407510.30992@tp.orcam.me.uk>
References: <20180525092111.18516-1-hch@lst.de> <20180525092111.18516-13-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <maciej.rozycki@uk.mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Christoph Hellwig <hch@lst.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, David Daney <david.daney@cavium.com>, Tom Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@linux-mips.org, iommu@lists.linux-foundation.org
Message-ID: <20180711124631.JmaopBLzN4fIEF7q0-0C3aKeTw_W_TNxJFM8OaEVQwU@z>

On Fri, 25 May 2018, Christoph Hellwig wrote:

> Only loongson-3 is DMA coherent and uses swiotlb.  So move the dma
> address translations stubs directly to the loongson-3 code, and remove
> a few Kconfig indirections.

 SiByte should too though, at least for those boards, such as the SWARM 
and the BigSur, that can have DRAM over 4GiB (and 32-bit PCI devices 
plugged).

 I never got to have the wiring of swiotlb completed for these boards as 
I got distracted with getting set up to debug a DRAM controller issue 
observed in the form of memory data corruption with the banks fully 
populated (which might have to do something with the parameters of bank 
interleaving enabled in such a configuration, as replacing a single 
module with a smaller-sized one and therefore disabling interleaving, 
which can only work with all modules being the same size, makes the 
problem go away).

 FWIW,

  Maciej
