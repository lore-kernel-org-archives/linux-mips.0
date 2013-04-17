Received: from mail-wg0-f51.google.com ([74.125.82.51]:46739 "EHLO
        mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6816285Ab3DQQAbgIMg3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 17 Apr 2013 18:00:31 +0200
Received: by mail-wg0-f51.google.com with SMTP id b13so1752242wgh.6
        for <linux-mips@linux-mips.org>; Wed, 17 Apr 2013 09:00:26 -0700 (PDT)
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v7 1/3] of/pci: Unify pci_process_bridge_OF_ranges from Microblaze and PowerPC
In-Reply-To: <20130416103005.GB12726@arm.com>
References: <1366107508-12672-1-git-send-email-Andrew.Murray@arm.com> <1366107508-12672-2-git-send-email-Andrew.Murray@arm.com> <20130416103005.GB12726@arm.com>
Date: Wed, 17 Apr 2013 17:00:15 +0100
Message-ID: <20130417160015.777453E2B73@localhost>
Return-Path: <grant.likely@secretlab.ca>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andrew Murray <andrew.murray@arm.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: "siva.kallam@samsung.com" <siva.kallam@samsung.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, Liviu Dudau <Liviu.Dudau@arm.com>, "paulus@samba.org" <paulus@samba.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "jg1.han@samsung.com" <jg1.han@samsung.com>, "jgunthorpe@obsidianresearch.com" <jgunthorpe@obsidianresearch.com>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "arnd@arndb.de" <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "thomas.petazzoni@free-electrons.com" <thomas.petazzoni@free-electrons.com>, "monstr@monstr.eu" <monstr@monstr.eu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "suren.reddy@samsung.com" <suren.reddy@samsung.com>
Message-ID: <20130417160015.elhafqVAZW3C2BDpHdWk-zVuckijOHUH1Y-wdkaEUSc@z>

On Tue, 16 Apr 2013 11:30:06 +0100, Andrew Murray <andrew.murray@arm.com> wrote:
> On Tue, Apr 16, 2013 at 11:18:26AM +0100, Andrew Murray wrote:
> > The pci_process_bridge_OF_ranges function, used to parse the "ranges"
> > property of a PCI host device, is found in both Microblaze and PowerPC
> > architectures. These implementations are nearly identical. This patch
> > moves this common code to a common place.
> > 
> > Signed-off-by: Andrew Murray <Andrew.Murray@arm.com>
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > Reviewed-by: Rob Herring <rob.herring@calxeda.com>
> > Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Tested-by: Linus Walleij <linus.walleij@linaro.org>
> > Acked-by: Michal Simek <monstr@monstr.eu>
> > ---
> >  arch/microblaze/include/asm/pci-bridge.h |    5 +-
> >  arch/microblaze/pci/pci-common.c         |  192 ----------------------------
> >  arch/powerpc/include/asm/pci-bridge.h    |    5 +-
> >  arch/powerpc/kernel/pci-common.c         |  192 ----------------------------
> 
> Is there anyone on linuxppc-dev/linux-mips that can help test this patchset?
> 
> I've tested that it builds on powerpc with a variety of configs (some which
> include fsl_pci.c implementation). Though I don't have hardware to verify that
> it works.
> 
> I haven't tested this builds or runs on MIPS.
> 
> You shouldn't see any difference in behaviour or new warnings and PCI devices
> should continue to operate as before.

I've got through a line-by-line comparison between powerpc, microblaze,
and then new code. The differences are purely cosmetic, so I have
absolutely no concerns about this patch. I've applied it to my tree.

g.
