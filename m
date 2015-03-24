Received: from mailapp01.imgtec.com ([195.59.15.196]:26411 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006953AbbCXJACrmNEW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Mar 2015 10:00:02 +0100
Message-ID: <5511278D.4030109@imgtec.com>
Date: Tue, 24 Mar 2015 08:59:57 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] MIPS: asm: r4kcache: Use correct base register for
 MIPS R6 cache flushes
References: <1425408530-21613-1-git-send-email-markos.chandras@imgtec.com> <1425408530-21613-2-git-send-email-markos.chandras@imgtec.com> <alpine.LFD.2.11.1503050245540.18344@eddie.linux-mips.org> <54FD5D34.7060201@imgtec.com> <alpine.LFD.2.11.1503232033060.8758@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1503232033060.8758@eddie.linux-mips.org>
Content-Type: text/plain; charset="windows-1252"
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20150324085957.WrGYl7lMWuK9WZOxg1GRTyo_waJDPxnY2EPNPYowndA@z>

On 03/23/2015 08:40 PM, Maciej W. Rozycki wrote:
> On Mon, 9 Mar 2015, Markos Chandras wrote:
> 
>>>  Since this operates on addresses shouldn't PTR_ADDIU be used instead?
>>>
>>>   Maciej
>>>
>>
>> I don't know. I thought PTR_ADDIU should be used for pointers but the
>> arguments in these macros are "unsigned long".
> 
>  Hmm, good point.  I think we should match the C data type used even 
> though we have an assumption that sizeof(long) == sizeof(void *), so your 
> change looks right to me as it stands.
> 
>  I think we have a convention to separate `linux' from `asm' inclusions by 
> an empty line though, so I suggest that you add one here:
> 
>> diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kcache.h
>> index 1b22d2da88a1..d329f7328bd4 100644
>> --- a/arch/mips/include/asm/r4kcache.h
>> +++ b/arch/mips/include/asm/r4kcache.h
>> @@ -12,6 +12,7 @@
>>  #ifndef _ASM_R4KCACHE_H
>>  #define _ASM_R4KCACHE_H
>>  
>> +#include <linux/stringify.h>
>>  #include <asm/asm.h>
>>  #include <asm/cacheops.h>
>>  #include <asm/compiler.h>
> 
> as well.  I can offer you my review tag if you repost the change with this 
> trivial update.
> 
>   Maciej
> 
Hi,

I believe Ralf can fix this trivial change whenever he gets to apply
these patches. If not, I will post it again.

-- 
markos
