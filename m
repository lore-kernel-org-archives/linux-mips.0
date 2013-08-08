Received: from multi.imgtec.com ([194.200.65.239]:13152 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6865306Ab3HHLS43js7G (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 8 Aug 2013 13:18:56 +0200
Message-ID: <52037E98.2040902@imgtec.com>
Date: Thu, 8 Aug 2013 12:18:48 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: ralink: add support for periodic timer irq
References: <1375959950-31024-1-git-send-email-blogic@openwrt.org>
In-Reply-To: <1375959950-31024-1-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: John Crispin <blogic@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20130808111848.Hr4FjmAAi7XQujAZUwYmUPiMvhv1Mrw8O6qDJ9D-K-8@z>

Hi John,

On 08/08/13 12:05, John Crispin wrote:
> +static int rt_timer_probe(struct platform_device *pdev)
> +{
> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	struct rt_timer *rt;
> +	struct clk *clk;
> +
> +	if (!res) {
> +		dev_err(&pdev->dev, "no memory resource found\n");
> +		return -EINVAL;
> +	}

devm_request_and_ioremap already error checks res so you don't need to
check it yourself (see devm_request_and_ioremap kerneldoc comment in
lib/devres.c).

> +
> +	rt = devm_kzalloc(&pdev->dev, sizeof(*rt), GFP_KERNEL);
> +	if (!rt) {
> +		dev_err(&pdev->dev, "failed to allocate memory\n");
> +		return -ENOMEM;
> +	}
> +
> +	rt->irq = platform_get_irq(pdev, 0);
> +	if (!rt->irq) {
> +		dev_err(&pdev->dev, "failed to load irq\n");
> +		return -ENOENT;
> +	}
> +
> +	rt->membase = devm_request_and_ioremap(&pdev->dev, res);
> +	if (!rt->membase) {
> +		dev_err(&pdev->dev, "failed to ioremap\n");
> +		return -ENOMEM;
> +	}

Cheers
James
