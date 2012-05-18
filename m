Received: from dns0.mips.com ([12.201.5.70]:56233 "EHLO dns0.mips.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1901167Ab2ERIKy (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 18 May 2012 10:10:54 +0200
Message-ID: <4FB60403.3080700@mips.com>
Date: Fri, 18 May 2012 16:10:43 +0800
From: Deng-Cheng Zhu <dczhu@mips.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] MIPS: fix/enrich 34K APRP (APSP) functionalities
References: <1337244680-29968-1-git-send-email-dczhu@mips.com> <1337244680-29968-2-git-send-email-dczhu@mips.com> <4FB4EF81.10005@phrozen.org>
In-Reply-To: <4FB4EF81.10005@phrozen.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: John Crispin <john@phrozen.org>
Cc: linux-mips@linux-mips.org, kevink@paralogos.com
Message-ID: <20120518081043.4h8f6N0hFp1sWgsgIB2vUK1Pxkr-EvaI6hRgtviNZmo@z>

Thanks for reviewing the code.


On 05/17/2012 08:30 PM, John Crispin wrote:
> Hi,
>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index ce30e2f..8205afe 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -1925,7 +1925,7 @@ config MIPS_MT_FPAFF
>>
>>   config MIPS_VPE_LOADER
>>   	bool "VPE loader support."
>> -	depends on SYS_SUPPORTS_MULTITHREADING
>> +	depends on SYS_SUPPORTS_MULTITHREADING&&  MIPS_MALTA
>
> This would lead to the second user of the API having to patch this piece
> of code to make it work.
>
> You could introduce a ARCH_HAS_APRP which any platform can then select ?

Hmm... This is a good idea. Maybe the name could be SYS_SUPPORTS_APRP?

> I think it would also make sense to split changes to generic and malta
> code into separate patches if that is possible.

Yes, that's possible. Will do it in the next version.


Regards,

Deng-Cheng
