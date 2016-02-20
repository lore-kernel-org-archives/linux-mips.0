Received: from exsmtp03.microchip.com ([198.175.253.49]:34679 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27011328AbcBTHFEzXMhV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 20 Feb 2016 08:05:04 +0100
Subject: Re: [PATCH v7 2/3] clk: clk-pic32: Add PIC32 clock driver
References: <1455899179-14097-1-git-send-email-joshua.henderson@microchip.com>
 <1455899179-14097-3-git-send-email-joshua.henderson@microchip.com>
 <20160219201615.2278.2909@quark.deferred.io>
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Message-ID: <56C80FC3.8050205@microchip.com>
Date: Sat, 20 Feb 2016 12:33:31 +0530
MIME-Version: 1.0
In-Reply-To: <20160219201615.2278.2909@quark.deferred.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Purna.Mandal@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Michael Turquette <mturquette@baylibre.com>, Joshua Henderson <joshua.henderson@microchip.com>, linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Message-ID: <20160220070331.RBXg-AVpTcQ47jKus8SqRNSRqOqdyzeFy3du3CPEJzA@z>

On 02/20/2016 01:46 AM, Michael Turquette wrote:

> Quoting Joshua Henderson (2016-02-19 08:25:35)
>> +const struct clk_ops pic32_roclk_ops = {
>> +       .enable                 = roclk_enable,
>> +       .disable                = roclk_disable,
>> +       .is_enabled             = roclk_is_enabled,
>> +       .get_parent             = roclk_get_parent,
>> +       .set_parent             = roclk_set_parent,
>> +       .determine_rate         = roclk_determine_rate,
>> +       .recalc_rate            = roclk_recalc_rate,
>> +       .round_rate             = roclk_round_rate,
>> +       .set_rate_and_parent    = roclk_set_rate_and_parent,
>> +       .set_rate               = roclk_set_rate,
>> +       .init                   = roclk_init,
>> +};
> You can remove .round_rate and only use .determine_rate.

Ack. Will remove .round_rate.

> ...
>> +CLK_OF_DECLARE(pic32mzda_clk, "microchip,pic32mzda-clk", pic32mzda_clock_init);
> Can you make this a platform_driver instead of using CLK_OF_DECLARE? I
> asked this in v6 but there was no response.

Mike,
I tried to use platform_driver approach, but didn't work for me.
On MIPS/PIC32 first call of clk_get() happens from "start_kernel -> time_init()->
plat_time_init()" which is very early in boot sequence even before execution of
early_initcall(). In short, by platform_driver way I'was not able to register clock(s)
before the first clock user becomes ready. Whereas with CLK_OF_DECLARE() I can
explicitly call of_clk_init() in plat_time_init() just before calling clk_get().

Please suggest me if you have any reference to avoid my case.

> Regards,
> Mike
>
>> -- 
>> 1.7.9.5
>>
