Received: from mail-ie0-f171.google.com ([209.85.223.171]:35149 "EHLO
        mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010627AbbEMDHH5tG20 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 13 May 2015 05:07:07 +0200
Received: by iebpz10 with SMTP id pz10so20461910ieb.2
        for <linux-mips@linux-mips.org>; Tue, 12 May 2015 20:07:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1429881457-16016-29-git-send-email-paul.burton@imgtec.com>
References: <1429881457-16016-1-git-send-email-paul.burton@imgtec.com>
 <1429881457-16016-29-git-send-email-paul.burton@imgtec.com>
Message-ID: <20150513030652.20636.98939@quantum>
Subject: Re: [PATCH v4 28/37] MIPS,
 clk: move jz4740 UDC auto suspend functions to jz4740-cgu
Date: Tue, 12 May 2015 20:06:52 -0700
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
Message-ID: <20150513030652.zkxtzyEsuB5FTlJlHCXgat5OwsnrHAVtutCqVbpqzm0@z>

Hi Paul,

Quoting Paul Burton (2015-04-24 06:17:28)
> -void jz4740_clock_udc_disable_auto_suspend(void)
> -{
> -       jz_clk_reg_clear_bits(JZ_REG_CLOCK_GATE, JZ_CLOCK_GATE_UDC);
> -}
> -EXPORT_SYMBOL_GPL(jz4740_clock_udc_disable_auto_suspend);
> -
> -void jz4740_clock_udc_enable_auto_suspend(void)
> -{
> -       jz_clk_reg_set_bits(JZ_REG_CLOCK_GATE, JZ_CLOCK_GATE_UDC);
> -}
> -EXPORT_SYMBOL_GPL(jz4740_clock_udc_enable_auto_suspend);

I couldn't find a caller for these functions. Where and how are they
used?

Thanks,
Mike
