Received: from mail-ig0-f181.google.com ([209.85.213.181]:33775 "EHLO
        mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27008759AbbEMC4RkKBlX convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 13 May 2015 04:56:17 +0200
Received: by igbpi8 with SMTP id pi8so106925219igb.0
        for <linux-mips@linux-mips.org>; Tue, 12 May 2015 19:56:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1429881457-16016-28-git-send-email-paul.burton@imgtec.com>
References: <1429881457-16016-1-git-send-email-paul.burton@imgtec.com>
 <1429881457-16016-28-git-send-email-paul.burton@imgtec.com>
Message-ID: <20150513025600.20636.34201@quantum>
Subject: Re: [PATCH v4 27/37] MIPS, clk: move jz4740_clock_set_wait_mode to jz4740-cgu
Date: Tue, 12 May 2015 19:56:00 -0700
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
Cc: Lars-Peter Clausen <lars@metafoo.de>, Ralf Baechle <ralf@linux-mips.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Message-ID: <20150513025600.DfLtvq0rtNLsmdg1P8ZnNPEgJKI-_9AEeBT7jqdwLS0@z>

Hi Paul,

Quoting Paul Burton (2015-04-24 06:17:27)
> +void jz4740_clock_set_wait_mode(enum jz4740_wait_mode mode)
> +{
> +       uint32_t lcr = readl(cgu->base + CGU_REG_LCR);
> +
> +       switch (mode) {
> +       case JZ4740_WAIT_MODE_IDLE:
> +               lcr &= ~LCR_SLEEP;
> +               break;
> +
> +       case JZ4740_WAIT_MODE_SLEEP:
> +               lcr |= LCR_SLEEP;
> +               break;
> +       }
> +
> +       writel(lcr, cgu->base + CGU_REG_LCR);
> +}

What do these modes do? How are they used?

Do you think the above function is a good candidate for .prepare and
.unprepare callback?

Regards,
Mike
