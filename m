Received: from mail-ie0-f169.google.com ([209.85.223.169]:37403 "EHLO
        mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6816553Ab3DQPmz1gyso (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 17 Apr 2013 17:42:55 +0200
Received: by mail-ie0-f169.google.com with SMTP id ar20so2082906iec.14
        for <linux-mips@linux-mips.org>; Wed, 17 Apr 2013 08:42:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1366107508-12672-4-git-send-email-Andrew.Murray@arm.com>
References: <1366107508-12672-1-git-send-email-Andrew.Murray@arm.com>
        <1366107508-12672-4-git-send-email-Andrew.Murray@arm.com>
Date: Wed, 17 Apr 2013 17:42:48 +0200
Message-ID: <CACRpkdbBaT1OKr5t8HW4+8y_wSDmGxmewAyVMekx8S-K9s3K8Q@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] of/pci: mips: convert to common of_pci_range_parser
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <linus.walleij@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andrew Murray <Andrew.Murray@arm.com>
Cc: linux-mips@linux-mips.org, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, siva.kallam@samsung.com, linux-pci@vger.kernel.org, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Jingoo Han <jg1.han@samsung.com>, Liviu.Dudau@arm.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, suren.reddy@samsung.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Michal Simek <monstr@monstr.eu>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Thierry Reding <thierry.reding@avionic-design.de>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Message-ID: <20130417154248.XMAn2x94Qne6Cs5GrcbR3-Rjtpq2z3ZdeDGPHMo8l7o@z>

On Tue, Apr 16, 2013 at 12:18 PM, Andrew Murray <Andrew.Murray@arm.com> wrote:

> This patch converts the pci_load_of_ranges function to use the new common
> of_pci_range_parser.
>
> Signed-off-by: Andrew Murray <Andrew.Murray@arm.com>
> Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> Reviewed-by: Rob Herring <rob.herring@calxeda.com>

Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
