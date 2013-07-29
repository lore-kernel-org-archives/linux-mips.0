Received: from mail-by2lp0242.outbound.protection.outlook.com ([207.46.163.242]:27522
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6830610Ab3G2Vcfofgm1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 29 Jul 2013 23:32:35 +0200
Message-ID: <51F6DF65.9050301@caviumnetworks.com>
Date: Mon, 29 Jul 2013 14:32:21 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] OCTEON GPIO support.
References: <1375133350-18828-1-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1375133350-18828-1-git-send-email-ddaney.cavm@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, Linus Walleij <linus.walleij@linaro.org>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20130729213221.NjHAWTyEFDD6ydtp6CBt_r9ehDBFH6sJO3N2beov-hY@z>

On 07/29/2013 02:29 PM, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
>
> The Cavium, OCTEON is a MIPS based SoC.  Here we add support for its
> on-chip GPIO lines.
>
> Changes from v1: Cleaned up variable names, messages and added some
> comments as suggested by Linus Walleij.
>
> The second patch depends on the first, but is in code maintained by
> Ralf.  It may be best to mrege both of these together, perhaps from
> the GPIO tree, with Ralf's Acked-by.

Really I meant to say that the first patch is in the MIPS tree, and 
should be Acked-by Ralf, if that wasn't clear.

David Daney


>
> David Daney (2):
>    MIPS: OCTEON: Select ARCH_REQUIRE_GPIOLIB
>    gpio MIPS/OCTEON: Add a driver for OCTEON's on-chip GPIO pins.
>
>   arch/mips/Kconfig                               |   1 +
>   arch/mips/include/asm/mach-cavium-octeon/gpio.h |  21 ++++
>   drivers/gpio/Kconfig                            |   8 ++
>   drivers/gpio/Makefile                           |   1 +
>   drivers/gpio/gpio-octeon.c                      | 157 ++++++++++++++++++++++++
>   5 files changed, 188 insertions(+)
>   create mode 100644 arch/mips/include/asm/mach-cavium-octeon/gpio.h
>   create mode 100644 drivers/gpio/gpio-octeon.c
>
