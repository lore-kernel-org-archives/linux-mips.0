Received: from mailapp01.imgtec.com ([195.59.15.196]:60689 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009610AbbDQFaJYNhkZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 17 Apr 2015 07:30:09 +0200
Message-ID: <553099AF.3060108@imgtec.com>
Date: Fri, 17 Apr 2015 02:27:11 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH V3 2/2] pinctrl: Add Pistachio SoC pin control driver
References: <1428435862-14354-1-git-send-email-abrestic@chromium.org> <1428435862-14354-3-git-send-email-abrestic@chromium.org>
In-Reply-To: <1428435862-14354-3-git-send-email-abrestic@chromium.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Ezequiel.Garcia@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andrew Bresticker <abrestic@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>, Paul Bolle <pebolle@tiscali.nl>
Message-ID: <20150417052711.7ifYxPclUbll9l5CmsLEY4L485zOy09a7dPwxMzRZLs@z>


Hi Andrew,

On 04/07/2015 04:44 PM, Andrew Bresticker wrote:
[..]
> +static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
> +{
> +	struct device_node *node = pctl->dev->of_node;
> +	struct pistachio_gpio_bank *bank;
> +	unsigned int i;
> +	int irq, ret = 0;
> +
> +	for (i = 0; i < pctl->nbanks; i++) {
> +		char child_name[sizeof("gpioXX")];
> +		struct device_node *child;

The first submission used for_each_child_of_node, and I can't find
any review comments explaining why you've changed it to a regular for
loop.

> +
> +		snprintf(child_name, sizeof(child_name), "gpio%d", i);

This assumes the GPIO bank nodes are called gpio0, gpio1, ... and so on.
Do we really want to assume that?

Thanks,
-- 
Ezequiel
