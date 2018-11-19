Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:6323
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993829AbeKSVFniZamg convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 19 Nov 2018 22:05:43 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 3/9] MIPS: remove the HT_PCI config option
Date: Mon, 19 Nov 2018 21:05:39 +0000
Message-ID: <20181119210538.p6xhyxf3s2diyv2v@pburton-laptop>
References: <20181115190538.17016-1-hch@lst.de>
 <20181115190538.17016-4-hch@lst.de>
 <20181119210141.nissqr6zaldt23xg@pburton-laptop>
In-Reply-To: <20181119210141.nissqr6zaldt23xg@pburton-laptop>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BC927875E6C6E54FBD90D6D3F816A9AB@namprd22.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <pburton@wavecomp.com>
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alex.bou9@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181119210539.sHM640r1dzItbILQ59PBNoPagl9MPNa1E2vd-Do_c0E@z>

On Mon, Nov 19, 2018 at 01:01:41PM -0800, Paul Burton wrote:
> On Thu, Nov 15, 2018 at 08:05:31PM +0100, Christoph Hellwig wrote:
> > This option is always selected from LOONGSON_MACH3X.  Switch to just
> > seleting PCI from that option and definining LOONGSON_PCIIO_BASE based
> > on CONFIG_LOONGSON_MACH3X.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  arch/mips/Kconfig                                | 11 -----------
> >  arch/mips/include/asm/mach-loongson64/loongson.h |  2 +-
> >  arch/mips/loongson64/Kconfig                     |  2 +-
> >  3 files changed, 2 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index 8272ea4c7264..7d28c9dd75d0 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -3040,17 +3040,6 @@ config PCI
> >  	  your box. Other bus systems are ISA, EISA, or VESA. If you have PCI,
> >  	  say Y, otherwise N.
> >  
> > -config HT_PCI
> > -	bool "Support for HT-linked PCI"
> > -	default y
> > -	depends on CPU_LOONGSON3
> > -	select PCI
> > -	select PCI_DOMAINS
> > -	help
> > -	  Loongson family machines use Hyper-Transport bus for inter-core
> > -	  connection and device connection. The PCI bus is a subordinate
> > -	  linked at HT. Choose Y for Loongson-3 based machines.
> > -
> >  config PCI_DOMAINS
> >  	bool
> >  
> > diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
> > index c865b4b9b775..781a5156ab21 100644
> > --- a/arch/mips/loongson64/Kconfig
> > +++ b/arch/mips/loongson64/Kconfig
> > @@ -76,7 +76,7 @@ config LOONGSON_MACH3X
> >  	select CPU_HAS_WB
> >  	select HW_HAS_PCI
> >  	select ISA
> > -	select HT_PCI
> > +	select PCI
> >  	select I8259
> >  	select IRQ_MIPS_CPU
> >  	select NR_CPUS_DEFAULT_4
> 
> Should this also select PCI_DOMAINS to preserve the existing behavior?
> 
> If not, could you explain why in the commit message?

Ah, I see - PCI already selects PCI_DOMAINS. I think it would have been
worth mentioning but I don't mind if you don't think it a big enough
deal to respin the patch, so:

    Acked-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul
