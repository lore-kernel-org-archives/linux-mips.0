Received: from smtprelay.synopsys.com ([198.182.60.111]:44934 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27041564AbcFJK4PJ0Od8 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 10 Jun 2016 12:56:15 +0200
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 43/44] dma-mapping: Remove dma_get_attr
Date: Fri, 10 Jun 2016 10:55:52 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501069390A9@US01WEMBX2.internal.synopsys.com>
References: <1465553521-27303-1-git-send-email-k.kozlowski@samsung.com>
 <1465553521-27303-44-git-send-email-k.kozlowski@samsung.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Vineet.Gupta1@synopsys.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: "hch@infradead.org" <hch@infradead.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jonathan Corbet <corbet@lwn.net>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Russell King <linux@armlinux.org.uk>, Stefano Stabellini <sstabellini@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Jonas Bonn <jonas@southpole.se>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Mark Yao <mark.yao@rock-chips.com>, David Airlie <airlied@linux.ie>, Heiko Stuebner <heiko@sntech.de>, Joerg Roedel <joro@8bytes.org>, Pawel Osciak <pawel@osciak.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rabin Vincent <rabin@rab.in>, Alexandre Courbot <acourbot@nvidia.com>, Doug Anderson <armlinux@m.disordat.com>, Robin Murphy <Robin.Murphy@arm.com>, Jisheng Zhang <jszhang@marvell.com>, "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>, Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>, Max Filippov <jcmvbkbc@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Alex Smith <alex.smith@imgtec.com>, Qais Yousef <qais.yousef@imgtec.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Akinobu Mita <akinobu.mita@gmail.com>, "Luis R. Rodriguez" <mcgrof@suse.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Zhen Lei <thunder.leizhen@huawei.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-metag@vger.kernel.org" <linux-metag@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Message-ID: <20160610105552.qgpkWpecXmTuxDat91Pq5UYlTYWpbMGrgwefNFRk8Us@z>

On Friday 10 June 2016 03:44 PM, Krzysztof Kozlowski wrote:
> After switching DMA attributes to unsigned long it is easier to just
> compare the bits.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> [for avr32]
> Acked-by: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>

Acked-by: Vineet Gupta <vgupta@synopsys.com>   #for arch/arc
