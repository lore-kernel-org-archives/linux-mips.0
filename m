Received: from multi.imgtec.com ([194.200.65.239]:47147 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6822344Ab3HLQMzU8JAz (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 12 Aug 2013 18:12:55 +0200
Message-ID: <5209093D.8060205@imgtec.com>
Date: Mon, 12 Aug 2013 17:11:41 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] SPI: ralink: add Ralink SoC spi driver
References: <1376074288-29302-1-git-send-email-blogic@openwrt.org> <1376074288-29302-2-git-send-email-blogic@openwrt.org> <520908DD.9040008@imgtec.com>
In-Reply-To: <520908DD.9040008@imgtec.com>
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
Cc: Mark Brown <broonie@kernel.org>, Gabor Juhos <juhosg@openwrt.org>, linux-spi@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20130812161141.JWyyAYmmOreZQhAc8HeQfEPtysu9hg7JYxGIGfTx-jA@z>

Sorry, should have read Mark's feedback first :)

James

On 12/08/13 17:10, James Hogan wrote:
> On 09/08/13 19:51, John Crispin wrote:
>> +#ifdef DEBUG
>> +#define spi_debug(args...) printk(args)
>> +#else
>> +#define spi_debug(args...)
>> +#endif
> 
> This looks a bit like pr_debug. If you have a device pointer around,
> there's also a dev_dbg which takes an additional device pointer and
> prepends it's name to the message.
> 
>> +static int rt2880_spi_probe(struct platform_device *pdev)
>> +{
> 
> <snip>
> 
>> +	clk = devm_clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(clk)) {
>> +		dev_err(&pdev->dev, "unable to get SYS clock, err=%d\n",
>> +			status);
>> +		return PTR_ERR(clk);
>> +	}
> 
> <snip>
> 
>> +}
>> +
>> +static int rt2880_spi_remove(struct platform_device *pdev)
>> +{
>> +	struct spi_master *master;
>> +	struct rt2880_spi *rs;
>> +
>> +	master = dev_get_drvdata(&pdev->dev);
>> +	rs = spi_master_get_devdata(master);
>> +
>> +	clk_disable(rs->clk);
>> +	clk_put(rs->clk);
> 
> The devm_clk_get in your probe function means you don't need clk_put here.
> 
> Cheers
> James
> 
