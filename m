Received: from mail3.caviumnetworks.com ([12.108.191.235]:3916 "EHLO
        mail3.caviumnetworks.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903631Ab2DRQUc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 18 Apr 2012 18:20:32 +0200
Message-ID: <4F8EE9CC.20000@cavium.com>
Date: Wed, 18 Apr 2012 09:20:28 -0700
From: David Daney <david.daney@cavium.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] i2c: Convert i2c-octeon.c to use device tree.
References: <1332808075-8333-1-git-send-email-ddaney.cavm@gmail.com> <1332808075-8333-2-git-send-email-ddaney.cavm@gmail.com> <4F7115FA.6080507@gmail.com> <4F7117FD.7000700@cavium.com> <20120418151621.GF19802@pengutronix.de>
In-Reply-To: <20120418151621.GF19802@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: Rob Herring <robherring2@gmail.com>, David Daney <ddaney.cavm@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "Ben Dooks (embedded platforms)" <ben-linux@fluff.org>, "Jean Delvare (PC drivers, core)" <khali@linux-fr.org>
Message-ID: <20120418162028.ldwujsM-HSYiyyz6ub4hyzN2e5pLInqdnn7yQ_sNRco@z>

On 04/18/2012 08:16 AM, Wolfram Sang wrote:
>>>> -	if (i2c_data == NULL) {
>>>> -		dev_err(i2c->dev, "no I2C frequency data\n");
>>>> +	/*
>>>> +	 * "clock-rate" is a legacy binding, the official binding is
>>>> +	 * "clock-frequency".  Try the official one first and then
>>>> +	 * fall back if it doesn't exist.
>>>> +	 */
>>>> +	data = of_get_property(pdev->dev.of_node, "clock-frequency",&len);
>>>> +	if (!data || len != sizeof(*data))
>>>> +		data = of_get_property(pdev->dev.of_node, "clock-rate",&len);
>>>> +	if (data&&   len == sizeof(*data)) {
>>>> +		i2c->twsi_freq = be32_to_cpup(data);
>>>
>>> Can't you use of_property_read_u32?
>>
>> I will investigate, and use it if possible.
>
> Any outcome?

Yes, I have implemented Rob's suggestions.  A new patch set reflecting 
this is coming soon.

>
> And shouldn't the bindings be documented? Or are they only standard and
> we hide the legacy one?
>

Yes, they are documented here:

http://patchwork.linux-mips.org/patch/3536/

look in the cavium-i2c.txt file.

Thanks,
David Daney
