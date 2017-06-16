Received: from verein.lst.de ([213.95.11.211]:60875 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993859AbdFPIjH2rEKU (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 16 Jun 2017 10:39:07 +0200
Date: Fri, 16 Jun 2017 10:39:07 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 33/44] openrisc: remove arch-specific dma_supported
        implementation
Message-ID: <20170616083907.GB10582@lst.de>
References: <20170608132609.32662-1-hch@lst.de> <20170608132609.32662-34-hch@lst.de> <CAMuHMdUPeFJJtz8eJkQEAR-2w9oHt-fXeGHvvKFLfU2A4YyviQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUPeFJJtz8eJkQEAR-2w9oHt-fXeGHvvKFLfU2A4YyviQ@mail.gmail.com>
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>, the arch/x86 maintainers <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, xen-devel@lists.xenproject.org, linux-c6x-dev@linux-c6x.org, "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, openrisc@lists.librecores.org, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, iommu@lists.linux-foundation.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20170616083907.P9NKQuHLRkJRt7WZEBSQ-tzUkrruMCk0DRD2-z5q41w@z>

On Fri, Jun 09, 2017 at 02:20:42PM +0200, Geert Uytterhoeven wrote:
> Hi Christoph,
> 
> On Thu, Jun 8, 2017 at 3:25 PM, Christoph Hellwig <hch@lst.de> wrote:
> > This implementation is simply bogus - hexagon only has a simple
> 
> openrisc?

Yeah.
