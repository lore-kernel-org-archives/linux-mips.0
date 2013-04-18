Received: from fw-tnat.cambridge.arm.com ([217.140.96.21]:38969 "EHLO
        cam-smtp0.cambridge.arm.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S6822444Ab3DRO0uXy9au (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Apr 2013 16:26:50 +0200
Date: Thu, 18 Apr 2013 15:26:35 +0100
From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v7 3/3] of/pci: mips: convert to common
 of_pci_range_parser
Message-ID: <20130418142635.GB18881@arm.com>
References: <1366107508-12672-1-git-send-email-Andrew.Murray@arm.com>
 <1366107508-12672-4-git-send-email-Andrew.Murray@arm.com>
 <20130418134535.5189E3E1319@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20130418134535.5189E3E1319@localhost>
Return-Path: <andrew.murray@arm.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "jgunthorpe@obsidianresearch.com" <jgunthorpe@obsidianresearch.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "siva.kallam@samsung.com" <siva.kallam@samsung.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "jg1.han@samsung.com" <jg1.han@samsung.com>, Liviu Dudau <Liviu.Dudau@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "suren.reddy@samsung.com" <suren.reddy@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "monstr@monstr.eu" <monstr@monstr.eu>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org" <paulus@samba.org>, "thomas.petazzoni@free-electrons.com" <thomas.petazzoni@free-electrons.com>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Message-ID: <20130418142635.TxAFUi7rg0Bbr9bsCb97uxJTPtdTXOPAlhU95cUmv_o@z>

On Thu, Apr 18, 2013 at 02:45:35PM +0100, Grant Likely wrote:
> On Tue, 16 Apr 2013 11:18:28 +0100, Andrew Murray <Andrew.Murray@arm.com> wrote:
> > This patch converts the pci_load_of_ranges function to use the new common
> > of_pci_range_parser.
> > 
> > Signed-off-by: Andrew Murray <Andrew.Murray@arm.com>
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > Reviewed-by: Rob Herring <rob.herring@calxeda.com>
> 
> Looks okay to me, and thank you very much for doing the legwork to merge
> the common code.

No problem, though I think there is more than can be done in this area -
there is a lot of similar PCI code floating about.

> 
> Reviewed-by: Grant Likely <grant.likely@secretlab.ca>

Thanks for the review.

Andrew Murray
