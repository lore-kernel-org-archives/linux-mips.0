Received: from mail-by2nam01on0086.outbound.protection.outlook.com ([104.47.34.86]:51262
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992307AbcIAXDJuwRIb (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 2 Sep 2016 01:03:09 +0200
Message-ID: <57C8B3A2.4080209@caviumnetworks.com>
Date: Thu, 1 Sep 2016 16:02:58 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 6/6] MIPS: OCTEON: delete unused cvmx-mdio.h
References: <20160901204400.16562-1-aaro.koskinen@iki.fi> <20160901204400.16562-7-aaro.koskinen@iki.fi>
In-Reply-To: <20160901204400.16562-7-aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160901230258.HBfykJbt7WUFd8EEPfdBnOxw-hi4Sjj8BcZoE5NlKAI@z>

On 09/01/2016 01:44 PM, Aaro Koskinen wrote:
> Delete unused cvmx-mdio.h.
>
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Nice one!

Acked-by: me

> ---
>   .../cavium-octeon/executive/cvmx-helper-board.c    |   2 -
>   .../cavium-octeon/executive/cvmx-helper-rgmii.c    |   2 -
>   .../cavium-octeon/executive/cvmx-helper-sgmii.c    |   1 -
>   arch/mips/include/asm/octeon/cvmx-mdio.h           | 506 ---------------------
>   4 files changed, 511 deletions(-)
>   delete mode 100644 arch/mips/include/asm/octeon/cvmx-mdio.h
>
[...]
