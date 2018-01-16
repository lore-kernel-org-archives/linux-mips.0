Received: from smtp.codeaurora.org ([198.145.29.96]:60212 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994634AbeAPTQiWmYqL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 16 Jan 2018 20:16:38 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [for-4.15] ssb: Disable PCI host for PCI_DRIVERS_GENERIC
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180115211714.24009-1-jhogan@kernel.org>
References: <20180115211714.24009-1-jhogan@kernel.org>
Message-ID: <20180116191636.6B3E5605A4@smtp.codeaurora.org>
Date: Tue, 16 Jan 2018 19:16:36 +0000 (UTC)
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
To: James Hogan <jhogan@kernel.org>
Cc: Michael Buesch <m@bues.ch>, linux-wireless@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Guenter Roeck <linux@roeck-us.net>
Message-ID: <20180116191636.0YIuqpd56M35ZIl2rrurtiTediJTygcoRcK3w5UbNTg@z>

James Hogan <jhogan@kernel.org> wrote:

> Since commit d41e6858ba58 ("MIPS: Kconfig: Set default MIPS system type
> as generic") changed the default MIPS platform to the "generic"
> platform, which uses PCI_DRIVERS_GENERIC instead of PCI_DRIVERS_LEGACY,
> various files in drivers/ssb/ have failed to build.
> 
> This is particularly due to the existence of struct pci_controller being
> dependent on PCI_DRIVERS_LEGACY since commit c5611df96804 ("MIPS: PCI:
> Introduce CONFIG_PCI_DRIVERS_LEGACY"), so add that dependency to Kconfig
> to prevent these files being built for the "generic" platform including
> all{yes,mod}config builds.
> 
> Fixes: c5611df96804 ("MIPS: PCI: Introduce CONFIG_PCI_DRIVERS_LEGACY")
> Signed-off-by: James Hogan <jhogan@kernel.org>
> Cc: Michael Buesch <m@bues.ch>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: Matt Redfearn <matt.redfearn@imgtec.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-wireless@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> Tested-by: Guenter Roeck <linux@roeck-us.net>

Patch applied to wireless-drivers.git, thanks.

58eae1416b80 ssb: Disable PCI host for PCI_DRIVERS_GENERIC

-- 
https://patchwork.kernel.org/patch/10165371/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
