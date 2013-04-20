Received: from mho-03-ewr.mailhop.org ([204.13.248.66]:50359 "EHLO
        mho-01-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S6832097Ab3DTWeIS4rlE convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 21 Apr 2013 00:34:08 +0200
Date: Sat, 20 Apr 2013 18:33:43 -0400
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v7 3/3] of/pci: mips: convert to common
 of_pci_range_parser
Message-ID: <20130420223343.GB25724@titan.lakedaemon.net>
References: <1366107508-12672-1-git-send-email-Andrew.Murray@arm.com>
 <1366107508-12672-4-git-send-email-Andrew.Murray@arm.com>
 <CACRpkdbBaT1OKr5t8HW4+8y_wSDmGxmewAyVMekx8S-K9s3K8Q@mail.gmail.com>
 <20130418125910.GA17128@arm.com>
 <20130418130919.GI27197@titan.lakedaemon.net>
 <5170F016.6050502@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <5170F016.6050502@openwrt.org>
Content-Transfer-Encoding: 8BIT
Return-Path: <jason@lakedaemon.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Gabor Juhos <juhosg@openwrt.org>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "siva.kallam@samsung.com" <siva.kallam@samsung.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@avionic-design.de>, Liviu Dudau <Liviu.Dudau@arm.com>, Grant Likely <grant.likely@secretlab.ca>, Paul Mackerras <paulus@samba.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Jingoo Han <jg1.han@samsung.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Thomas Abraham <thomas.abraham@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Kukjin Kim <kgene.kim@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Michal Simek <monstr@monstr.eu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "suren.reddy@samsung.com" <suren.reddy@samsung.com>, Andrew Murray <andrew.murray@arm.com>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>
Message-ID: <20130420223343.AMH7kNA6RiuE-RGXPNnMY5sF0WftZFizoFMjbzDfCFc@z>

On Fri, Apr 19, 2013 at 09:19:50AM +0200, Gabor Juhos wrote:
> 2013.04.18. 15:09 keltezéssel, Jason Cooper írta:
> > On Thu, Apr 18, 2013 at 01:59:10PM +0100, Andrew Murray wrote:
> >> On Wed, Apr 17, 2013 at 04:42:48PM +0100, Linus Walleij wrote:
> >>> On Tue, Apr 16, 2013 at 12:18 PM, Andrew Murray <Andrew.Murray@arm.com> wrote:
> >>>
> >>>> This patch converts the pci_load_of_ranges function to use the new common
> >>>> of_pci_range_parser.
> >>>>
> >>>> Signed-off-by: Andrew Murray <Andrew.Murray@arm.com>
> >>>> Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> >>>> Reviewed-by: Rob Herring <rob.herring@calxeda.com>
> >>>
> >>> Tested-by: Linus Walleij <linus.walleij@linaro.org>
> >>
> >> Jason - you may not have seen this, but here (Linus Walleij) is another Tested-by
> >> to add to this patch in your tree (if you can).
> > 
> > Thanks, I saw it.  Unfortunately, the PR was already sent, and the branch
> > is now pulled into arm-soc.
> 
> Sorry I had no time earlier, but I have tested this now on MIPS. The patch
> causes build errors unfortunately. Given the fact that this has been merged
> already, I will send a fixup patch.

Olof has dropped this branch from arm-soc, plase post the build error
and fix here so that it can be included in this series.

thx,

Jason.
