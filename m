Received: from mailapp01.imgtec.com ([195.59.15.196]:39278 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026994AbcDSK2ACBvh1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 Apr 2016 12:28:00 +0200
Subject: Re: [PATCH] mips: pistachio: Determine SoC revision during boot
References: <1460989489-30469-1-git-send-email-james.hartley@imgtec.com>
 <57151260.1060300@cogentembedded.com>
From: James Hartley <james.hartley@imgtec.com>
Message-ID: <5716081C.9080506@imgtec.com>
Date: Tue, 19 Apr 2016 11:27:40 +0100
MIME-Version: 1.0
In-Reply-To: <57151260.1060300@cogentembedded.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hartley@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Jonas Gorski <jogo@openwrt.org>, James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Ionela Voinescu <ionela.voinescu@imgtec.com>
Message-ID: <20160419102740.SKLVwWHCEhO5aP2QMJzXSmv1zb2dJ99nJNI646WFeQA@z>

Hi Sergei

On 18/04/16 17:59, Sergei Shtylyov wrote:
> Hello.
>
> On 04/18/2016 05:24 PM, James Hartley wrote:
>
>> Now that there are different revisions of the Pistachio SoC
>> in circulation, add this information to the boot log to make
>> it easier for users to determine which hardware they have.
>>
>> Signed-off-by: James Hartley <james.hartley@imgtec.com>
>> Signed-off-by: Ionela Voinescu <ionela.voinescu@imgtec.com>
>>
>> diff --git a/arch/mips/pistachio/init.c b/arch/mips/pistachio/init.c
>> index 96ba2cc..48f8755 100644
>> --- a/arch/mips/pistachio/init.c
>> +++ b/arch/mips/pistachio/init.c
> [...]
>> @@ -24,9 +26,28 @@
>>   #include <asm/smp-ops.h>
>>   #include <asm/traps.h>
>>
>> +/*
>> + * Core revision register decoding
>> + * Bits 23 to 20: Major rev
>> + * Bits 15 to 8: Minor rev
>> + * Bits 7 to 0: Maintenance rev
>> + */
>> +#define PISTACHIO_CORE_REV_REG    0xB81483D0
>> +#define PISTACHIO_CORE_REV_A1    0x00100006
>> +#define PISTACHIO_CORE_REV_B0    0x00100106
>> +
>>   const char *get_system_type(void)
>>   {
>> -    return "IMG Pistachio SoC";
>> +    u32 core_rev;
>> +
>> +    core_rev = __raw_readl((const void *)PISTACHIO_CORE_REV_REG);
>> +
>> +    if (core_rev == PISTACHIO_CORE_REV_B0)
>> +        return "IMG Pistachio SoC (B0)";
>> +    else if (core_rev == PISTACHIO_CORE_REV_A1)
>> +        return "IMG_Pistachio SoC (A1)";
>> +    else
>> +        return "IMG_Pistachio SoC";
>
>    How about the *switch* instead?
Yes, that would be slightly more readable - I'll do that in V2.

Thanks for the review! 

James.
>
> [...]
>
> MBR, Sergei
>
