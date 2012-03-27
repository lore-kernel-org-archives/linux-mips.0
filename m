Received: from mail3.caviumnetworks.com ([12.108.191.235]:4731 "EHLO
        mail3.caviumnetworks.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903659Ab2C0B3h (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 27 Mar 2012 03:29:37 +0200
Message-ID: <4F7117FD.7000700@cavium.com>
Date: Mon, 26 Mar 2012 18:29:33 -0700
From: David Daney <david.daney@cavium.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] i2c: Convert i2c-octeon.c to use device tree.
References: <1332808075-8333-1-git-send-email-ddaney.cavm@gmail.com> <1332808075-8333-2-git-send-email-ddaney.cavm@gmail.com> <4F7115FA.6080507@gmail.com>
In-Reply-To: <4F7115FA.6080507@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Rob Herring <robherring2@gmail.com>
Cc: David Daney <ddaney.cavm@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "Ben Dooks (embedded platforms)" <ben-linux@fluff.org>, "Jean Delvare (PC drivers, core)" <khali@linux-fr.org>
Message-ID: <20120327012933.8zV8zrd5e4_kMypiWX8b69mwsPuC_-cXEZf6pQWqp5A@z>

On 03/26/2012 06:20 PM, Rob Herring wrote:
[...]
>> ---
>>
>> Should probably go via Ralf's linux-mips.org tree.
>>
>>   arch/mips/cavium-octeon/octeon-irq.c      |    2 -
>>   arch/mips/cavium-octeon/octeon-platform.c |   84 -------------------------
>>   arch/mips/include/asm/octeon/octeon.h     |    5 --
>>   drivers/i2c/busses/i2c-octeon.c           |   94 ++++++++++++++++-------------
>>   4 files changed, 52 insertions(+), 133 deletions(-)
>
> snip
>
>>
>> -	if (i2c_data == NULL) {
>> -		dev_err(i2c->dev, "no I2C frequency data\n");
>> +	/*
>> +	 * "clock-rate" is a legacy binding, the official binding is
>> +	 * "clock-frequency".  Try the official one first and then
>> +	 * fall back if it doesn't exist.
>> +	 */
>> +	data = of_get_property(pdev->dev.of_node, "clock-frequency",&len);
>> +	if (!data || len != sizeof(*data))
>> +		data = of_get_property(pdev->dev.of_node, "clock-rate",&len);
>> +	if (data&&  len == sizeof(*data)) {
>> +		i2c->twsi_freq = be32_to_cpup(data);
>
> Can't you use of_property_read_u32?

I will investigate, and use it if possible.

>
> Does the legacy binding really exist as DT support is new?
>

Yes, unfortunately some bootloaders escaped into the wild with the 
"clock-rate" binding.

> Otherwise,
>
> Acked-by: Rob Herring<rob.herring@calxeda.com>
>

Thanks,
