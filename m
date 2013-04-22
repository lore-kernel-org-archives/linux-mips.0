Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]:32935
        "EHLO va3outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6816635Ab3DVRd1A7yDf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 22 Apr 2013 19:33:27 +0200
Message-ID: <5175744D.5020404@caviumnetworks.com>
Date: Mon, 22 Apr 2013 10:33:01 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mips: Fix invalid interrupt name in cavium-octeon
References: <2202498.1401366325451851.JavaMail.weblogic@epv6ml11> <20130422132203.GB31642@linux-mips.org>
In-Reply-To: <20130422132203.GB31642@linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: EUNBONG SONG <eunb.song@samsung.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20130422173301._QMhuEVMAWP2UtGlE5wew6A7ZayOTDaoM38qAZgPzuE@z>

On 04/22/2013 06:22 AM, Ralf Baechle wrote:
> On Thu, Apr 18, 2013 at 10:50:52PM +0000, EUNBONG SONG wrote:
>
>> Change interrupt name from "RML/RSL" to "RMLRSL".
>> This fixes following warning message.
>>
>> [   24.938793] WARNING: at fs/proc/generic.c:307 __xlate_proc_name+0x124/0x160()
>> [   24.945926] name 'RML/RSL'
>> [   24.948642] Modules linked in:
>> [   24.951707] Call Trace:
>> [   24.954157] [<ffffffff8069fe18>] dump_stack+0x8/0x34
>> [   24.959136] [<ffffffff80290d90>] warn_slowpath_common+0x78/0xa8
>> [   24.965056] [<ffffffff80290e60>] warn_slowpath_fmt+0x38/0x48
>> [   24.970723] [<ffffffff803cbc8c>] __xlate_proc_name+0x124/0x160
>> [   24.976556] [<ffffffff803cbe78>] __proc_create+0x78/0x128
>> [   24.981963] [<ffffffff803cd044>] proc_mkdir_mode+0x2c/0x70
>> [   24.987451] [<ffffffff80302418>] register_handler_proc+0x108/0x130
>> [   24.993642] [<ffffffff802fd078>] __setup_irq+0x210/0x540
>> [   24.998963] [<ffffffff802fd67c>] request_threaded_irq+0x114/0x1a0
>> [   25.005060] [<ffffffff80262e0c>] prom_free_prom_memory+0xd4/0x588
>> [   25.011164] [<ffffffff80691820>] free_initmem+0x10/0xc0
>> [   25.016390] [<ffffffff80691720>] kernel_init+0x20/0x100
>> [   25.021624] [<ffffffff8026c7e0>] ret_from_kernel_thread+0x10/0x18
>>
>> Signed-off-by: Eunbong Song <eunb.song@samsung.com>
>> ---
>>   arch/mips/cavium-octeon/setup.c |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
>> index b0baa29..92c3150 100644
>> --- a/arch/mips/cavium-octeon/setup.c
>> +++ b/arch/mips/cavium-octeon/setup.c
>> @@ -1066,7 +1066,7 @@ void prom_free_prom_memory(void)
>>
>>   	/* Add an interrupt handler for general failures. */
>>   	if (request_irq(OCTEON_IRQ_RML, octeon_rlm_interrupt, IRQF_SHARED,
>> -			"RML/RSL", octeon_rlm_interrupt)) {
>> +			"RMLRSL", octeon_rlm_interrupt)) {
>>   		panic("Unable to request_irq(OCTEON_IRQ_RML)");
>>   	}
>>   #endif
>
> Interesting.  While your patch certainly is correct, you seem to have
> further modifications in your tree.
>
> David, Above code is wrapped by #ifdef CONFIG_CAVIUM_DECODE_RSL but doesn't
> seem to get defined anywhere.  What shall we do about this?

It seems to be a vestige of the out-of-tree version.  I was going to 
send a patch to remove it all, and perhaps another to replace it with 
something better.

David Daney


>
>    Ralf
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
>
