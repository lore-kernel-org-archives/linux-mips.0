Received: from mail-ie0-f181.google.com ([209.85.223.181]:33518 "EHLO
        mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27006508AbbEMCwU6fHEy convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 13 May 2015 04:52:20 +0200
Received: by iebgx4 with SMTP id gx4so20099607ieb.0
        for <linux-mips@linux-mips.org>; Tue, 12 May 2015 19:52:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1429881457-16016-27-git-send-email-paul.burton@imgtec.com>
References: <1429881457-16016-1-git-send-email-paul.burton@imgtec.com>
 <1429881457-16016-27-git-send-email-paul.burton@imgtec.com>
Message-ID: <20150513025204.20636.10155@quantum>
Subject: Re: [PATCH v4 26/37] MIPS,clk: migrate JZ4740 to common clock framework
Date: Tue, 12 May 2015 19:52:04 -0700
Return-Path: <mturquette@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Message-ID: <20150513025204.AuL1JikXJGEEtXiUAT2QMtJBZk2lZnyfqxPr1UN8lBo@z>

Hi Paul,

Quoting Paul Burton (2015-04-24 06:17:26)
> +static void __init jz4740_cgu_init(struct device_node *np)
> +{
> +       int retval;
> +
> +       cgu = ingenic_cgu_new(jz4740_cgu_clocks,
> +                             ARRAY_SIZE(jz4740_cgu_clocks), np);
> +       if (!cgu) {
> +               pr_err("%s: failed to initialise CGU\n", __func__);
> +               return;
> +       }
> +
> +       retval = ingenic_cgu_register_clocks(cgu);
> +       if (retval)
> +               pr_err("%s: failed to register CGU Clocks\n", __func__);
> +}
> +CLK_OF_DECLARE(jz4740_cgu, "ingenic,jz4740-cgu", jz4740_cgu_init);
> -- 
> 2.3.5
> 

Patch looks good to me, but I have one question. Is it possible for you
to have a proper platform_device for the cgu instead of relying on
CLK_OF_DECLARE?

For an example of a clock driver that does this, check out the bottom of
drivers/clk/qcom/gcc-msm8660.c.

Regards,
Mike
