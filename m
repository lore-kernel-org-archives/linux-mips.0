Received: from smtp.codeaurora.org ([198.145.29.96]:44446 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990405AbeCMQsOB1tDg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Mar 2018 17:48:14 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [v2] bcma: Prevent build of PCI host features in module
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1519898292-12155-1-git-send-email-matt.redfearn@mips.com>
References: <1519898292-12155-1-git-send-email-matt.redfearn@mips.com>
Message-ID: <20180313164807.428F860390@smtp.codeaurora.org>
Date: Tue, 13 Mar 2018 16:48:07 +0000 (UTC)
Return-Path: <kvalo@codeaurora.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Matt Redfearn <matt.redfearn@mips.com>
Cc: zajec5@gmail.com, linux-wireless@vger.kernel.org, linux-mips@linux-mips.org, jhogan@kernel.org
Message-ID: <20180313164807.y0nqQoBHZZoUNbXa1rv77maT7u5GQHowQ6AS5cRBSfU@z>

Matt Redfearn <matt.redfearn@mips.com> wrote:

> Attempting to build bcma.ko with BCMA_DRIVER_PCI_HOSTMODE=y results in
> a build error due to use of symbols not exported from vmlinux:
> 
> ERROR: "pcibios_enable_device" [drivers/bcma/bcma.ko] undefined!
> ERROR: "register_pci_controller" [drivers/bcma/bcma.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:92: __modpost] Error 1
> 
> To prevent this, don't allow the host mode feature to be built if
> CONFIG_BCMA=m
> 
> Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>

Patch applied to wireless-drivers-next.git, thanks.

79ca239a68f8 bcma: Prevent build of PCI host features in module

-- 
https://patchwork.kernel.org/patch/10250739/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
