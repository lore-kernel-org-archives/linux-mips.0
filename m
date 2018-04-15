Received: from bombadil.infradead.org ([IPv6:2607:7c80:54:e::133]:39450 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993885AbeDOO7zMueKu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 15 Apr 2018 16:59:55 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: centralize SWIOTLB config symbol and misc other cleanups
Date: Sun, 15 Apr 2018 16:59:35 +0200
Message-Id: <20180415145947.1248-1-hch@lst.de>
Return-Path: <BATV+7d17fcac680d61fee2d2+5348+infradead.org+hch@bombadil.srs.infradead.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, iommu@lists.linux-foundation.org
Cc: x86@kernel.org, linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org, linux-ide@vger.kernel.org, linux-mips@linux-mips.org, sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi all,

this seris aims for a single defintion of the Kconfig symbol.  To get
there various cleanups, mostly about config symbols are included as well.
