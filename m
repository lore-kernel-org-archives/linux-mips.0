Received: from mail-pa0-f41.google.com ([209.85.220.41]:34876 "EHLO
        mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27013221AbcBSUQZ0A4Z0 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 19 Feb 2016 21:16:25 +0100
Received: by mail-pa0-f41.google.com with SMTP id ho8so57037709pac.2
        for <linux-mips@linux-mips.org>; Fri, 19 Feb 2016 12:16:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1455899179-14097-3-git-send-email-joshua.henderson@microchip.com>
References: <1455899179-14097-1-git-send-email-joshua.henderson@microchip.com>
 <1455899179-14097-3-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20160219201615.2278.2909@quark.deferred.io>
Subject: Re: [PATCH v7 2/3] clk: clk-pic32: Add PIC32 clock driver
Date: Fri, 19 Feb 2016 12:16:15 -0800
Return-Path: <mturquette@baylibre.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Joshua Henderson <joshua.henderson@microchip.com>, linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, Purna Chandra Mandal <purna.mandal@microchip.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Message-ID: <20160219201615.7bp_xtRNoY5dUJaOYMU62oZuVnDiESGbnwtmswdbiyE@z>

Quoting Joshua Henderson (2016-02-19 08:25:35)
> +const struct clk_ops pic32_roclk_ops = {
> +       .enable                 = roclk_enable,
> +       .disable                = roclk_disable,
> +       .is_enabled             = roclk_is_enabled,
> +       .get_parent             = roclk_get_parent,
> +       .set_parent             = roclk_set_parent,
> +       .determine_rate         = roclk_determine_rate,
> +       .recalc_rate            = roclk_recalc_rate,
> +       .round_rate             = roclk_round_rate,
> +       .set_rate_and_parent    = roclk_set_rate_and_parent,
> +       .set_rate               = roclk_set_rate,
> +       .init                   = roclk_init,
> +};

You can remove .round_rate and only use .determine_rate.

...
> +CLK_OF_DECLARE(pic32mzda_clk, "microchip,pic32mzda-clk", pic32mzda_clock_init);

Can you make this a platform_driver instead of using CLK_OF_DECLARE? I
asked this in v6 but there was no response.

Regards,
Mike

> -- 
> 1.7.9.5
> 
