Received: from mail-pf0-x244.google.com ([IPv6:2607:f8b0:400e:c00::244]:33982
        "EHLO mail-pf0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991131AbdIQAOvo4Rcx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 17 Sep 2017 02:14:51 +0200
Subject: Re: [PATCH 1/5] i2c: gpio: Convert to use descriptors
References: <20170910214424.14945-1-linus.walleij@linaro.org>
 <20170910214424.14945-2-linus.walleij@linaro.org>
 <20170914093509.uwk47vt3wnm3rtqb@dell>
 <CACRpkdZYDALXSoEE9jdo7A5P4XZczVbh_uiLkE54=sRtA3rNDQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <7f67dfa0-31da-0967-0929-28ae105bb2b5@roeck-us.net>
Date: Sat, 16 Sep 2017 17:14:42 -0700
MIME-Version: 1.0
In-Reply-To: <CACRpkdZYDALXSoEE9jdo7A5P4XZczVbh_uiLkE54=sRtA3rNDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <groeck7@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Ben Dooks <ben@fluff.org.uk>, Ville Syrjala <syrjala@sci.fi>, Magnus Damm <magnus.damm@gmail.com>, Heiko Schocher <hs@denx.de>
Cc: Wolfram Sang <wsa@the-dreams.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS <linux-mips@linux-mips.org>, adi-buildroot-devel@lists.sourceforge.net, "arm@kernel.org" <arm@kernel.org>, Steven Miao <realmz6@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170917001442.YC7icq4inf67I0XBM_r3n-976p9UDNlE0D83ulexFYg@z>

On 09/16/2017 03:25 PM, Linus Walleij wrote:
> On Thu, Sep 14, 2017 at 11:35 AM, Lee Jones <lee.jones@linaro.org> wrote:
> 
>>>   drivers/mfd/sm501.c                          |  49 +++++-----
>>
>> I'd prefer for this to be applied with a Tested-by.  I appreciate that
>> this is an old driver, but can you attempt to contact one of the
>> authors or someone else who might have hardware please?
> 
> For SM501 specifically I guess.
> 
> OK makes sense as it is the most invasive one, paging around...
> 
> Ben, Ville, Magnus, Heiko, Guenther: is one of you still using this
> hardware so you can test the patch set?
> 

qemu supports it. I _think_ my commit for this driver was to fix a warning
I saw when running some qemu test. Unfortunately, I have no idea how that
message was triggered in my tests, or in other words which qemu machine
actually uses it. I'll try to find out, but no promises.

Guenter
