Received: from arrakis.dune.hu ([78.24.191.176]:45853 "EHLO arrakis.dune.hu"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6822181Ab3DSHTzMi-om (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 19 Apr 2013 09:19:55 +0200
Message-ID: <5170F016.6050502@openwrt.org>
Date: Fri, 19 Apr 2013 09:19:50 +0200
From: Gabor Juhos <juhosg@openwrt.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 3/3] of/pci: mips: convert to common of_pci_range_parser
References: <1366107508-12672-1-git-send-email-Andrew.Murray@arm.com> <1366107508-12672-4-git-send-email-Andrew.Murray@arm.com> <CACRpkdbBaT1OKr5t8HW4+8y_wSDmGxmewAyVMekx8S-K9s3K8Q@mail.gmail.com> <20130418125910.GA17128@arm.com> <20130418130919.GI27197@titan.lakedaemon.net>
In-Reply-To: <20130418130919.GI27197@titan.lakedaemon.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Return-Path: <juhosg@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Murray <andrew.murray@arm.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "siva.kallam@samsung.com" <siva.kallam@samsung.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Jingoo Han <jg1.han@samsung.com>, Liviu Dudau <Liviu.Dudau@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "suren.reddy@samsung.com" <suren.reddy@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Michal Simek <monstr@monstr.eu>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Thierry Reding <thierry.reding@avionic-design.de>, Thomas Abraham <thomas.abraham@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Message-ID: <20130419071950.plg61p25icpZlvaLcFxCAdcQ9R0w3nAJnRyD1UisEoE@z>

2013.04.18. 15:09 keltezéssel, Jason Cooper írta:
> On Thu, Apr 18, 2013 at 01:59:10PM +0100, Andrew Murray wrote:
>> On Wed, Apr 17, 2013 at 04:42:48PM +0100, Linus Walleij wrote:
>>> On Tue, Apr 16, 2013 at 12:18 PM, Andrew Murray <Andrew.Murray@arm.com> wrote:
>>>
>>>> This patch converts the pci_load_of_ranges function to use the new common
>>>> of_pci_range_parser.
>>>>
>>>> Signed-off-by: Andrew Murray <Andrew.Murray@arm.com>
>>>> Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
>>>> Reviewed-by: Rob Herring <rob.herring@calxeda.com>
>>>
>>> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Jason - you may not have seen this, but here (Linus Walleij) is another Tested-by
>> to add to this patch in your tree (if you can).
> 
> Thanks, I saw it.  Unfortunately, the PR was already sent, and the branch
> is now pulled into arm-soc.

Sorry I had no time earlier, but I have tested this now on MIPS. The patch
causes build errors unfortunately. Given the fact that this has been merged
already, I will send a fixup patch.

-Gabor
