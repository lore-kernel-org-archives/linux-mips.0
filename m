Received: from mail5.windriver.com ([192.103.53.11]:33281 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27011154AbcBVSkQYiZ1N (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 22 Feb 2016 19:40:16 +0100
Subject: Re: Does CN68XX still need DCache prefetch workaround?
References: <56CB51CE.6070905@windriver.com> <56CB5595.1090505@gmail.com>
From: Yang Shi <yang.shi@windriver.com>
Message-ID: <56CB5605.8070806@windriver.com>
Date: Mon, 22 Feb 2016 10:40:05 -0800
MIME-Version: 1.0
In-Reply-To: <56CB5595.1090505@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Yang.Shi@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: david.daney@cavium.com, linux-mips@linux-mips.org
Message-ID: <20160222184005.ABryNu8hFPGBOL-iYoi5SyIeKmNsJFIiUYmspchiWyw@z>

On 2/22/2016 10:38 AM, David Daney wrote:
> On 02/22/2016 10:22 AM, Yang Shi wrote:
>> I David,
>>
>> When I booted up 4.5-rc4 kernel on CN68xx board, both pass 1.1 and pass
>> 2.2 reports:
>>
>> Kernel panic - not syncing: OCTEON II DCache prefetch workaround not in
>> place (cfa00000).
>> Please build kernel with proper options (CONFIG_CAVIUM_CN63XXP1).
>>
>> According to the description of he option, it should just have impact on
>> 63xx pass 1.x. It looks confusing.
>>
>
> The name of the Kconfig variable is CAVIUM_CN63XXP1.  It turns out 
> that it is also needed for somethings that are not cn63xxP1.  It is a 
> bit confusing, but as of now we decided not to rename the Kconfig 
> variable.

OK, however, it would sound better to add more comments or notes about 
this in Kconfig help text?

>
>> Any hint is appreciated?
>
> Enable it and see what happens.

Once I enable it could bootup without problem.

Thanks,
Yang

>
>>
>> Thanks,
>> Yang
>>
>
>
