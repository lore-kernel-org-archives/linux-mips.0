Received: from smtpout.microchip.com ([198.175.253.82]:17794 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27033603AbcFBFH6bZZQY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Jun 2016 07:07:58 +0200
Subject: Re: [PATCH 03/11] MIPS: pic32mzda: fix getting timer clock rate.
References: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
 <1463461560-9629-3-git-send-email-purna.mandal@microchip.com>
 <062abb47-931c-c47f-bcc1-1642db0c0def@imgtec.com>
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Message-ID: <574FBEB5.9090407@microchip.com>
Date: Thu, 2 Jun 2016 10:35:57 +0530
MIME-Version: 1.0
In-Reply-To: <062abb47-931c-c47f-bcc1-1642db0c0def@imgtec.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Purna.Mandal@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Harvey Hunt <harvey.hunt@imgtec.com>, linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Joshua Henderson <digitalpeer@digitalpeer.com>, Joshua Henderson <joshua.henderson@microchip.com>
Message-ID: <20160602050557.40_Qsb7c6Ru3pL9sBVc_9BIX-PXVri9XQgr3Wh6RRD0@z>

On 05/25/2016 09:32 PM, Harvey Hunt wrote:
> Hi Purna,
>
> On 17/05/16 06:05, Purna Chandra Mandal wrote:
>> PIC32 clock driver is now implemented as platform driver instead of
>> as part of of_clk_init(). It meants all the clock modules are available
>> quite late in the boot sequence. So request for CPU clock by clk_get_sys()
>> and clk_get_rate() to find c0_timer rate fails.
>>
>> To fix this use PIC32 specific early clock functions implemented for early
>> console support.
>>
>> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
>>
>> ---
>> Note: Please pull this complete series through the MIPS tree.
>>
>> ---
>>
>>  arch/mips/pic32/pic32mzda/time.c | 13 ++++---------
>>  1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/mips/pic32/pic32mzda/time.c b/arch/mips/pic32/pic32mzda/time.c
>> index ca6a62b..62a0a78 100644
>> --- a/arch/mips/pic32/pic32mzda/time.c
>> +++ b/arch/mips/pic32/pic32mzda/time.c
>> @@ -11,13 +11,12 @@
>>   *  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
>>   *  for more details.
>>   */
>> -#include <linux/clk.h>
>>  #include <linux/clk-provider.h>
>>  #include <linux/clocksource.h>
>>  #include <linux/init.h>
>> +#include <linux/irqdomain.h>
>>  #include <linux/of.h>
>>  #include <linux/of_irq.h>
>> -#include <linux/irqdomain.h>
>>
>>  #include <asm/time.h>
>>
>> @@ -58,16 +57,12 @@ unsigned int get_c0_compare_int(void)
>>
>>  void __init plat_time_init(void)
>>  {
>> -    struct clk *clk;
>> +    unsigned long rate = pic32_get_pbclk(7);
>
> pic32_get_pbclk() is defined in arch/mips/pic32/pic32mzda/early_clk.c. When CONFIG_EARLY_PRINTK isn't set, early_clk.c isn't compiled and so a linker error occurs.
>
> Maybe it's best to always build the early_clk.c file, or perhaps there is a better place to put pic32_get_pbclk()?
>
Thanks Harvey.

Will fix in separate patch.

> Thanks,
>
> Harvey
>
