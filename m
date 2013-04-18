Received: from mail-wi0-f179.google.com ([209.85.212.179]:50796 "EHLO
        mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6822444Ab3DRNpoJrbPq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Apr 2013 15:45:44 +0200
Received: by mail-wi0-f179.google.com with SMTP id l13so2505817wie.6
        for <linux-mips@linux-mips.org>; Thu, 18 Apr 2013 06:45:38 -0700 (PDT)
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v7 3/3] of/pci: mips: convert to common of_pci_range_parser
In-Reply-To: <1366107508-12672-4-git-send-email-Andrew.Murray@arm.com>
References: <1366107508-12672-1-git-send-email-Andrew.Murray@arm.com> <1366107508-12672-4-git-send-email-Andrew.Murray@arm.com>
Date: Thu, 18 Apr 2013 14:45:35 +0100
Message-ID: <20130418134535.5189E3E1319@localhost>
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
To: Andrew Murray <Andrew.Murray@arm.com>, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org
Cc: rob.herring@calxeda.com, jgunthorpe@obsidianresearch.com, linux@arm.linux.org.uk, siva.kallam@samsung.com, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, Liviu.Dudau@arm.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, bhelgaas@google.com, suren.reddy@samsung.com, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu, benh@kernel.crashing.org, paulus@samba.org, thomas.petazzoni@free-electrons.com, thierry.reding@avionic-design.de, thomas.abraham@linaro.org, arnd@arndb.de, linus.walleij@linaro.org
Message-ID: <20130418134535.bdc-ITmelaYKkehW6IhcFl8pqlnJmpL9LcfrAweEFB0@z>

On Tue, 16 Apr 2013 11:18:28 +0100, Andrew Murray <Andrew.Murray@arm.com> wrote:
> This patch converts the pci_load_of_ranges function to use the new common
> of_pci_range_parser.
> 
> Signed-off-by: Andrew Murray <Andrew.Murray@arm.com>
> Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> Reviewed-by: Rob Herring <rob.herring@calxeda.com>

Looks okay to me, and thank you very much for doing the legwork to merge
the common code.

Reviewed-by: Grant Likely <grant.likely@secretlab.ca>
