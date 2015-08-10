Received: from mailapp01.imgtec.com ([195.59.15.196]:48304 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010825AbbHJSgo0YDca (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 10 Aug 2015 20:36:44 +0200
Message-ID: <55C8EF32.5010807@imgtec.com>
Date: Mon, 10 Aug 2015 11:36:34 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [4.1,013/123] MIPS: c-r4k: Fix cache flushing for MT cores
References: <20150808220718.304261727@linuxfoundation.org>
In-Reply-To: <20150808220718.304261727@linuxfoundation.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150810183634.HOFj2_abIpaOUsDSbxZZW-WB03Ff1dzvJcnhQEPdioE@z>

On 08/08/2015 03:08 PM, gregkh@linuxfoundation.org wrote:
> 4.1-stable review patch.  If anyone has any objections, please let me know.
>
>
Yes, I have objection. Please look into excepts from my mail exchange 
with Markos:

> On 06/25/2015 03:59 AM, Markos Chandras wrote:
>
>> @@ -51,9 +51,8 @@ static inline void r4k_on_each_cpu(void (*func) (void *info), void *info)
>>   {
>>   	preempt_disable();
>>   
>> -#ifndef CONFIG_MIPS_MT_SMP
>> -	smp_call_function(func, info, 1);
>> -#endif
>> +	if (config_enabled(CONFIG_SMP))
>> +		smp_call_function_many(&cpu_foreign_map, func, info, 1);
>>   	func(info);
>>   	preempt_enable();
>>   }
>
> You can NOT do this because r4k_on_each_cpu() is still used for 
> non-MIPS/IMG processors for SAFE INDEX cache flushes - 
> cpu_has_safe_index_cacheops (it is not safe in CM/CM2/CM3 environment).
>
>
> And a little explanation and history:
>
> The function r4k_on_each_cpu() can NOT be used simultaneously for 
> index cacheops and address cacheops because both have a different 
> rules in applying in other cores and that is different in inter-core 
> HW blocks of various vendors. CM propogates address cacheops from 
> core-to-core (no IPI calls are needed) but another vendors may do not 
> - this is indicated by CONFIG_MIPS_MT_SMP (and a dropped now 
> CONFIG_MIPS_MT_SMTC).
>
> Unfortunately, before 2.6.35.9 this function was used for index 
> cacheops too in any kernel and that is WRONG, at least for CM-based 
> systems.
> So, I splitted index and address cacheops and wrote a functions 
> r4k_indexop_on_each_cpu and put it in use in at least in dlm-2.6.35.9 
> and it finally made a way to dev-linux-mti-3.6. This is a famous patch 
> named:
>
>     MIPS: Cache flush functions are reworked.
>
>     This patch is a preparation for EVA support in kernel.
>
>     However, it also fixes a bug then index cacheop was not ran
>     on multiple CPUs with unsafe index cacheops (flush_cache_vmap,
>     flush_icache_range, flush_cache_range, __flush_cache_all).
>
>     Additionally, it optimizes a usage of index and address cacheops for
>     address range flushes depending from address range size.
>
>     Because of that reasons it is a separate patch from EVA support.
>
>     Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
>     Signed-off-by: Steven J. Hill <Steven.Hill@imgtec.com>
>     (cherry picked from commit 6b05dd71da1136fbad0ce642790c4c99343f05e7)
>

(history is skipped)

Note: the replacement of

     if (config_enabled(CONFIG_SMP))

to
if (!mips_cm_present())

doesn't solve a problem - in CM-based environment the index cache ops 
MUST be delivered to other core via IPI.

- Leonid.
