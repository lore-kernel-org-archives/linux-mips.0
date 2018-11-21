Received: from mail-eopbgr760093.outbound.protection.outlook.com ([40.107.76.93]:61168
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993845AbeKUSVcfTiq0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Nov 2018 19:21:32 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: malta: Use img-ascii-lcd driver for LCD display
Date: Wed, 21 Nov 2018 18:21:30 +0000
Message-ID: <MWHPR2201MB12776EB2EEF77CCFB0AE99C9C1DA0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20181120235937.32049-1-paul.burton@mips.com>
In-Reply-To: <20181120235937.32049-1-paul.burton@mips.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <pburton@wavecomp.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181121182130.zwDTGS4iaFoe6XcD4Zw8HYhYxGBLxojURzHFlUUuDXw@z>

Hello,

Paul Burton wrote:
> Remove the Malta display platform code in favour of probing the
> img-ascii-lcd driver via device tree. This reduces the amount of
> platform code & the img-ascii-lcd driver offers us advantages in terms
> of code sharing with other boards & functionality such as changing the
> displayed message via sysfs. Defconfigs are untouched because the driver
> already defaults y on when CONFIG_MIPS_MALTA=y.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
