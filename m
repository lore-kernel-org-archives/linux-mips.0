Received: from multi.imgtec.com ([194.200.65.239]:43000 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6816668Ab3GANGOmPtSQ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 1 Jul 2013 15:06:14 +0200
Message-ID: <51D17EBE.7000902@imgtec.com>
Date: Mon, 1 Jul 2013 14:06:06 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: bcm63xx: clk: Add dummy clk_set_rate() function
References: <1372676244-1399-1-git-send-email-markos.chandras@imgtec.com> <51D1629A.6040700@metafoo.de>
In-Reply-To: <51D1629A.6040700@metafoo.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-mips@linux-mips.org
Message-ID: <20130701130606.7koKzUcBrEM2KQ7i8tajU7pigvuSaHni8lgg3FJ20o8@z>

On 07/01/13 12:06, Lars-Peter Clausen wrote:
> On 07/01/2013 12:57 PM, Markos Chandras wrote:
>> Several drivers use the clk_set_rate() function that needs
>> to be defined in the platform's clock code. The Broadcom
>> BCM63xx platform hardcodes the clock rate so we create a new
>> dummy clk_set_rate() function which just returns -EINVAL.
>>
>> Also fixes the following build problem on a randconfig:
>> drivers/built-in.o: In function `nop_usb_xceiv_probe':
>> phy-nop.c:(.text+0x3ec26c): undefined reference to `clk_set_rate'
>>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> Acked-by: Steven J. Hill <Steven.Hill@imgtec.com>
>
> To make the set complete clk_round_rate() should be added as well
>
>> ---
>> This patch is for the upstream-sfr/mips-for-linux-next tree
>> ---
>>   arch/mips/bcm63xx/clk.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/mips/bcm63xx/clk.c b/arch/mips/bcm63xx/clk.c
>> index c726a97..70dcc52 100644
>> --- a/arch/mips/bcm63xx/clk.c
>> +++ b/arch/mips/bcm63xx/clk.c
>> @@ -318,6 +318,12 @@ unsigned long clk_get_rate(struct clk *clk)
>>
>>   EXPORT_SYMBOL(clk_get_rate);
>>
>> +int clk_set_rate(struct clk *clk, unsigned long rate)
>> +{
>> +	return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(clk_set_rate);
>> +
>>   struct clk *clk_get(struct device *dev, const char *id)
>>   {
>>   	if (!strcmp(id, "enet0"))
>

Hi Lars,

Thanks. I will submit a new patch
