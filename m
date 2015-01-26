Received: from mailapp01.imgtec.com ([195.59.15.196]:32862 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010957AbbAZLrUVHhtj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Jan 2015 12:47:20 +0100
Message-ID: <54C62941.6060604@imgtec.com>
Date: Mon, 26 Jan 2015 11:47:13 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] MIPS: HTW: Prevent accidental HTW start due to nested
 htw_{start,stop}
References: <1422265236-29290-1-git-send-email-markos.chandras@imgtec.com> <1422265236-29290-3-git-send-email-markos.chandras@imgtec.com> <54C626CC.2070104@imgtec.com>
In-Reply-To: <54C626CC.2070104@imgtec.com>
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
To: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Cc: stable@vger.kernel.org
Message-ID: <20150126114713.AhtoceHr8QohYhTf2RkeJrLWuO4RbTjdFhq5PrHkYYU@z>

On 01/26/2015 11:36 AM, James Hogan wrote:

> 
>> +		raw_current_cpu_data.htw_seq++;				\
> 
> not "if (!raw_current_cpu_data.htw_seq++)) {"?
Why?

on _stop() calls you just increment it. The _start() will do the right
thing then.

I think what you suggest it to move the if() condition from the _start()
to _stop().

> 
>>  		write_c0_pwctl(read_c0_pwctl() &			\
>>  			       ~(1 << MIPS_PWCTL_PWEN_SHIFT));		\
>>  		back_to_back_c0_hazard();				\
>> +		local_irq_restore(flags);				\
>>  	}								\
>>  } while(0)
>>  
>>  #define htw_start()							\
>>  do {									\
>> +	unsigned long flags;						\
>> +									\
>>  	if (cpu_has_htw) {						\
>> -		write_c0_pwctl(read_c0_pwctl() |			\
>> -			       (1 << MIPS_PWCTL_PWEN_SHIFT));		\
>> -		back_to_back_c0_hazard();				\
>> +		local_irq_save(flags);					\
>> +		if (!--raw_current_cpu_data.htw_seq) {			\
>> +			write_c0_pwctl(read_c0_pwctl() |		\
>> +				       (1 << MIPS_PWCTL_PWEN_SHIFT));	\
>> +			back_to_back_c0_hazard();			\
>> +		}							\
>> +		local_irq_restore(flags);				\
>>  	}								\
>>  } while(0)
>>  
>> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
>> index dc49cf30c2db..5d6e59f20750 100644
>> --- a/arch/mips/kernel/cpu-probe.c
>> +++ b/arch/mips/kernel/cpu-probe.c
>> @@ -367,8 +367,10 @@ static inline unsigned int decode_config3(struct cpuinfo_mips *c)
>>  	if (config3 & MIPS_CONF3_MSA)
>>  		c->ases |= MIPS_ASE_MSA;
>>  	/* Only tested on 32-bit cores */
>> -	if ((config3 & MIPS_CONF3_PW) && config_enabled(CONFIG_32BIT))
>> +	if ((config3 & MIPS_CONF3_PW) && config_enabled(CONFIG_32BIT)) {
>> +		c->htw_seq = 0;
> 
> is that necessary, since cpu_data[] is global?

I checked and it is not placed in the .data instead of .bss section so i
was not sure if it is initialized properly.

-- 
markos
