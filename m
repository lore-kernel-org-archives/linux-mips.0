Received: from mailapp01.imgtec.com ([195.59.15.196]:20543 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026006AbcDDKJuN4n2a (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 4 Apr 2016 12:09:50 +0200
Date: Mon, 4 Apr 2016 11:09:40 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v2 03/15] MIPS: PCI: Compatibility with ARM-like PCI host
 drivers
Message-ID: <20160404100940.GA21568@NP-P-BURTON>
References: <1454499045-5020-1-git-send-email-paul.burton@imgtec.com>
 <1454499045-5020-4-git-send-email-paul.burton@imgtec.com>
 <56FB0D90.8000200@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56FB0D90.8000200@gmail.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Joshua Kinard <kumba@gentoo.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Jens Axboe <axboe@fb.com>, linux-kernel@vger.kernel.org, Yijing Wang <wangyijing@huawei.com>, John Crispin <blogic@openwrt.org>, Yinghai Lu <yinghai@kernel.org>
Message-ID: <20160404100940.TugwmRRDYJtJb4YduCKyo9Zjq5u0yWpqTy3n4qPQiOc@z>

On Tue, Mar 29, 2016 at 04:19:44PM -0700, Florian Fainelli wrote:
> Le 03/02/2016 03:30, Paul Burton a écrit :
> > Introduce support for struct hw_pci & the associated pci_common_init_dev
> > function as used by the PCI drivers written for ARM platforms under
> > drivers/pci. This is in preparation for reusing the xilinx-pcie driver
> > on the MIPS Boston board.
> > 
> > Platforms that make use of this more generic code will need to select
> > CONFIG_MIPS_GENERIC_PCI. Platforms which don't will continue to work as
> > they have, with the intent that PCI drivers be migrated towards struct
> > hw_pci & drivers/pci/ over time.
> > 
> > Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> > ---
> 
> [snip]
> 
> > +		if (hw->preinit)
> > +			hw->preinit();
> > +
> > +		ret = hw->setup(i, &ctl->sysdata);
> > +		if (ret < 0) {
> 
> This needs to be ret <= 0 to be compliant with what ARM PCI host
> controllers do, which is return 1 in case they could get hw->setup to
> finish with success, and 0 or negative if they could not, see
> arch/arm/kernel/bios32.c.
> -- 
> Florian

Hi Florian,

Just an FYI, the pcie-xilinx driver I wrote this for has since been
converted away from the ARM-like pci_common_init_dev & struct hw_pci to
use only functions provided by the core PCI subsystem[1]. As a result
I've stopped using this patch & don't plan to continue work on it.
Perhaps it would be cleanest to do a similar conversion for the driver
you're using?

[1] https://patchwork.ozlabs.org/patch/581967/ & the rest of the series

Thanks,
    Paul
