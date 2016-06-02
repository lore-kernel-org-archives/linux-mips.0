Received: from smtpout.microchip.com ([198.175.253.82]:19079 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27033337AbcFBJVqhgvQu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Jun 2016 11:21:46 +0200
Subject: Re: [PATCH] MIPS: pic32mzda: fix linker error for pic32_get_pbclk().
References: <1464844821-1581-1-git-send-email-purna.mandal@microchip.com>
 <9f53c6f4-735a-1a76-9c62-a4f5f127b1e9@imgtec.com>
From: Purna Chandra Mandal <purna.mandal@microchip.com>
Message-ID: <574FFA30.1000507@microchip.com>
Date: Thu, 2 Jun 2016 14:49:44 +0530
MIME-Version: 1.0
In-Reply-To: <9f53c6f4-735a-1a76-9c62-a4f5f127b1e9@imgtec.com>
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
Message-ID: <20160602091944.gWwW0V4MQfRZda_0OGXA39Vr-HJgKyygSgg_7FTKKRA@z>

On 06/02/2016 02:45 PM, Harvey Hunt wrote:
> Hi Purna,
>
> On 02/06/16 06:20, Purna Chandra Mandal wrote:
>> Early clock API pic32_get_pbclk() is defined in early_clk.c and
>> used by time.c and early_console.c. When CONFIG_EARLY_PRINTK isn't
>> set, early_clk.c isn't compiled and so a linker error is reported
>> while referring the API from time.c.
>
> Maybe "early_clk.c isn't compiled and so time.c fails to link"?
>
ack.

>>
>> Fix it by compiling early_clk.c always. Also sort files in
>> alphabetical order.
>>
>> Cc: Harvey Hunt <harvey.hunt@imgtec.com>
>> Cc: Ralf Baechle <ralf@linux-mips.org>
>> Cc: linux-mips@linux-mips.org
>> Cc: Joshua Henderson <digitalpeer@digitalpeer.com>
>>
>> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
>>
>> ---
>>
>>  arch/mips/pic32/pic32mzda/Makefile | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/mips/pic32/pic32mzda/Makefile b/arch/mips/pic32/pic32mzda/Makefile
>> index 4a4c272..c286496 100644
>> --- a/arch/mips/pic32/pic32mzda/Makefile
>> +++ b/arch/mips/pic32/pic32mzda/Makefile
>> @@ -2,8 +2,7 @@
>>  # Joshua Henderson, <joshua.henderson@microchip.com>
>>  # Copyright (C) 2015 Microchip Technology, Inc.  All rights reserved.
>>  #
>> -obj-y            := init.o time.o config.o
>> +obj-y            := config.o early_clk.o init.o time.o
>>
>>  obj-$(CONFIG_EARLY_PRINTK)    += early_console.o      \
>> -                   early_pin.o        \
>> -                   early_clk.o
>> +                   early_pin.o
>>
>
> Perhaps add:
>
> Reported-by: Harvey Hunt <harvey.hunt@imgtec.com>
>
> Thanks for fixing this,
>
> Reviewed-by: Harvey Hunt <harvey.hunt@imgtec.com>
>
Thanks Harvey.

> Thanks,
>
> Harvey
