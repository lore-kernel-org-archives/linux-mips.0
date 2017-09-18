Received: from mail-pg0-x243.google.com ([IPv6:2607:f8b0:400e:c05::243]:35823
        "EHLO mail-pg0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990505AbdIRJ6ruhK0M (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Sep 2017 11:58:47 +0200
Received: by mail-pg0-x243.google.com with SMTP id j16so4989291pga.2
        for <linux-mips@linux-mips.org>; Mon, 18 Sep 2017 02:58:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170917093906.16325-8-linus.walleij@linaro.org>
References: <20170917093906.16325-1-linus.walleij@linaro.org> <20170917093906.16325-8-linus.walleij@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Sep 2017 11:58:40 +0200
Message-ID: <CAMuHMdX+bx9pNEAFoBzfM7JhhH800u-HumpQYRsG3d5BNuduvg@mail.gmail.com>
Subject: Re: [PATCH 7/7] i2c: gpio: Add support for named gpios in DT
Content-Type: text/plain; charset="UTF-8"
Return-Path: <geert.uytterhoeven@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Linux I2C <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>
Message-ID: <20170918095840.nfqy5Xmeq31M84N1AXDP3shOd8SU5INilAMEEI582-g@z>

Hi Linus,

On Sun, Sep 17, 2017 at 11:39 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> This adds support for using the "sda" and "scl" GPIOs in
> device tree instead of anonymously using index 0 and 1 of
> the "gpios" property.
>
> We add a helper function to retrieve the GPIO descriptors
> and some explicit error handling since the probe may have
> to be deferred. At least this happened to me when moving
> to using named "sda" and "scl" lines (all of a sudden this
> started to probe before the GPIO driver) so we need to
> gracefully defer probe when we ge -ENOENT in the error
> pointer.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This is pretty much a rewrite of Geerts patch on top of
> my own changes to support descriptors.
> ---
>  drivers/i2c/busses/i2c-gpio.c | 59 +++++++++++++++++++++++++++++++------------
>  1 file changed, 43 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index beb5ce523684..2738b851f470 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -82,6 +82,42 @@ static void of_i2c_gpio_get_props(struct device_node *np,
>                 of_property_read_bool(np, "i2c-gpio,scl-output-only");
>  }
>
> +static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
> +                                          const char *con_id,
> +                                          unsigned int index,
> +                                          enum gpiod_flags gflags)
> +{
> +       struct gpio_desc *retdesc;
> +       int ret;

[...]

> +       if (ret != -EPROBE_DEFER)
> +               dev_err(dev, "error trying to get descriptor: %ld\n", ret);

warning: format '%ld' expects argument of type 'long int', but
argument 3 has type 'int' [-Wformat=]

%d (0day busy?)

> +
> +       return retdesc;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
