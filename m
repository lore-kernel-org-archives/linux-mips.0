Received: from mailgw02.mediatek.com ([210.61.82.184]:56692 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27006154AbbAPFuVCMjPw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 06:50:21 +0100
Subject: Re: [RFC 01/11] i2c: add quirk structure to describe adapter flaws
From: Eddie Huang <eddie.huang@mediatek.com>
In-Reply-To: <1420824103-24169-2-git-send-email-wsa@the-dreams.de>
References: <1420824103-24169-1-git-send-email-wsa@the-dreams.de>
         <1420824103-24169-2-git-send-email-wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 16 Jan 2015 13:50:08 +0800
Message-ID: <1421387408.9323.10.camel@mtksdaap41>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <eddie.huang@mediatek.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-mips@linux-mips.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@atmel.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Message-ID: <20150116055008.52T2idhoxc0tER3dWaHAWURdzUJX2PBA1BsFoEkdIR4@z>

Hi Wolfram,

On Fri, 2015-01-09 at 18:21 +0100, Wolfram Sang wrote:
>  
> + */
> +struct i2c_adapter_quirks {
> +	u64 flags;
> +	int max_num_msgs;
> +	u16 max_write_len;
> +	u16 max_read_len;
> +	u16 max_comb_write_len;
> +	u16 max_comb_read_len;
> +};
> +
> +#define I2C_ADAPTER_QUIRK_COMB_WRITE_FIRST	BIT(0)
> +#define I2C_ADAPTER_QUIRK_COMB_READ_SECOND	BIT(1)
> +#define I2C_ADAPTER_QUIRK_COMB_WRITE_THEN_READ	(I2C_ADAPTER_QUIRK_COMB_WRITE_FIRST | \
> +						I2C_ADAPTER_QUIRK_COMB_READ_SECOND)
> +
>  /*
>   * i2c_adapter is the structure used to identify a physical i2c bus along
>   * with the access algorithms necessary to access it.
> @@ -472,6 +506,7 @@ struct i2c_adapter {
>  	struct list_head userspace_clients;
>  
>  	struct i2c_bus_recovery_info *bus_recovery_info;
> +	struct i2c_adapter_quirks *quirks;
>  };
>  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>  

I suggest to add const.
	const struct i2c_adapter_quirks *quirks;

also, in i2c-core.c, should modify:
	const struct i2c_adapter_quirks *q = adap->quirks;
