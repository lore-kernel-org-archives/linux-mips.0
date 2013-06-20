Received: from mail-pd0-f181.google.com ([209.85.192.181]:44974 "EHLO
        mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6818712Ab3FTS1TYJv96 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Jun 2013 20:27:19 +0200
Message-ID: <51C3497D.2050107@gmail.com>
Date: Thu, 20 Jun 2013 11:27:09 -0700
From: David Daney <ddaney.cavm@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] gpio MIPS/OCTEON: Add a driver for OCTEON's on-chip GPIO
 pins.
References: <1371251915-18271-1-git-send-email-ddaney.cavm@gmail.com>  <CACRpkdYHzBBbPNujYRGkMFGuQRzeYKs9jgfc3e3HWyxQFahvRQ@mail.gmail.com>  <51C34584.8070301@gmail.com> <1371752324.2146.25.camel@joe-AO722>
In-Reply-To: <1371752324.2146.25.camel@joe-AO722>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <ddaney.cavm@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Joe Perches <joe@perches.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, David Daney <david.daney@cavium.com>
Message-ID: <20130620182709.vqkfyhAY9pQymywHQQ2tRAl2lxdWsozi2mt-c0mlQCw@z>

On 06/20/2013 11:18 AM, Joe Perches wrote:
> On Thu, 2013-06-20 at 11:10 -0700, David Daney wrote:
>> Sorry for not responding earlier, but my e-mail system seems to have
>> malfunctioned with respect to this message...
> []
>> On 06/17/2013 01:51 AM, Linus Walleij wrote:
>>>> +static int octeon_gpio_get(struct gpio_chip *chip, unsigned offset)
>>>> +{
>>>> +       struct octeon_gpio *gpio = container_of(chip, struct octeon_gpio, chip);
>>>> +       u64 read_bits = cvmx_read_csr(gpio->register_base + RX_DAT);
>>>> +
>>>> +       return ((1ull << offset) & read_bits) != 0;
>>>
>>> A common idiom we use for this is:
>>>
>>> return !!(read_bits & (1ull << offset));
>>
>> I hate that idiom, but if its use is a condition of accepting the patch,
>> I will change it.
>
> Or use an even more common idiom and change the
> function to return bool and let the compiler do it.
>

... but it is part of the gpiochip system interface, so it would have to 
be done kernel wide.

Really I don't like the idea of GPIO lines having Boolean truth values 
associated with them.  Some represent things that are active-high and 
others active-low.  Converting the pin voltage being above or below a 
given threshold to something other than zero or one would in my opinion 
be confusing.

David Daney
