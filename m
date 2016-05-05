Received: from mail-bn1on0096.outbound.protection.outlook.com ([157.56.110.96]:21472
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27028096AbcEEWxv2pDkb (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 6 May 2016 00:53:51 +0200
Subject: Re: [PATCH] MIPS: Octeon: byteswap initramfs in little endian mode
References: <1462484017-29988-1-git-send-email-aurelien@aurel32.net>
 <572BBDB8.8000300@caviumnetworks.com> <20160505221649.GA29979@aurel32.net>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <572BCECE.7040600@caviumnetworks.com>
Date: Thu, 5 May 2016 15:53:02 -0700
MIME-Version: 1.0
In-Reply-To: <20160505221649.GA29979@aurel32.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
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
To: linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20160505225302.7D65P1Jw5i4a9BLN7x2cfjRUCMg9zPurAtPGuvLhqLA@z>



On 05/05/2016 03:16 PM, Aurelien Jarno wrote:
> On 2016-05-05 14:40, David Daney wrote:
>> On 05/05/2016 02:33 PM, Aurelien Jarno wrote:
>>> The initramfs if loaded in memory by U-Boot running in big endian mode.
>>> When the kernel is running in little endian mode, we need to byteswap it
>>> as it is accessed byte by byte.
>>
>> Ouch!
>>
>> Really it should be fixed in the bootloader, but that probably won't happen.
>
> How would you see that fixed in the bootloader? I doubt it's difficult
> to autodetect that, as the initramfs is basically loaded in memory
> first, and later only the address and size are passed on the kernel
> command line using the rd_start= and rd_size= options.
>
> The other alternative would be to provide reversed endian fatload,
> ext2load, ext4load, ... versions. Or maybe a better alternative would be
> a function to byteswap a memory area, it could be inserted in a bootcmd
> between the load and the bootoctlinux.

The easiest thing might be to byteswap it before u-boot ever gets 
involved, and leave the kernel alone.

>
>> I wonder, is there a magic number that the initrd has?  If so, we could
>> probe for a byteswapped initrd and not do the byte reversal unconditionally.
>
> There is a magic number... after it has been uncompressed. The magics
> for the compressed version are defined in lib/decompress.c. Maybe we can
> call decompress_method() from the finalize_initrd with the first 8 bytes
> byteswapped and check for the result.

I guess you could look for magic numbers of the supported compression 
protocols (gzip, xz, etc), but that could be error prone.

I don't really object to the original patch, but was just trying to 
consider alternatives.


>
>> The logic seems correct, we need to byte swap each 8-byte aligned 8-byte
>> word in the image.
>>
>>>
>>> Cc: David Daney <david.daney@cavium.com>
>>> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
>>> ---
>>>   arch/mips/kernel/setup.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> Note: It might not be the best place to byteswap the initramfs not the
>>> best way to do it. At least it shows the problem and what shoudl be done.
>>> Suggestions to improve the patch are welcome.
>>>
>>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>>> index 4f60734..e7d015e 100644
>>> --- a/arch/mips/kernel/setup.c
>>> +++ b/arch/mips/kernel/setup.c
>>> @@ -263,6 +263,16 @@ static void __init finalize_initrd(void)
>>>   		goto disable;
>>>   	}
>>>
>>> +#if defined(CONFIG_CPU_CAVIUM_OCTEON) && defined(CONFIG_CPU_LITTLE_ENDIAN)
>>> +	{
>>> +		unsigned long i;
>>> +		pr_info("Cavium Octeon kernel in little endian mode "
>>> +			"detected, byteswapping ramdisk\n");
>>> +		for (i = initrd_start; i < ALIGN(initrd_end, 8); i += 8)
>>> +			*((unsigned long *)i) = swab64(*((unsigned long *)i));
>>> +	}
>>> +#endif
>>> +
>>>   	reserve_bootmem(__pa(initrd_start), size, BOOTMEM_DEFAULT);
>>>   	initrd_below_start_ok = 1;
>>>
>>>
>>
>>
>
