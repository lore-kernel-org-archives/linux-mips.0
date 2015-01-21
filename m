Received: from mailapp01.imgtec.com ([195.59.15.196]:28128 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011451AbbAUMQ2NRyZN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Jan 2015 13:16:28 +0100
Message-ID: <54BF9895.5000200@imgtec.com>
Date: Wed, 21 Jan 2015 12:16:21 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC v2 18/70] MIPS: asm: spram: Add MIPS R6 related definitions
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com> <1421405389-15512-19-git-send-email-markos.chandras@imgtec.com> <alpine.LFD.2.11.1501200009520.28301@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1501200009520.28301@eddie.linux-mips.org>
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
Message-ID: <20150121121621.s5tGMrSp55_sKGX3Nzn07yFBD7oGLqxoUFJ_1voofXg@z>

On 01/20/2015 12:13 AM, Maciej W. Rozycki wrote:
> On Fri, 16 Jan 2015, Markos Chandras wrote:
> 
>> MIPS R6, just like MIPS R2, can use the spram_config() function
>> in spram.c
>>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> ---
>>  arch/mips/include/asm/spram.h | 4 ++--
>>  arch/mips/kernel/Makefile     | 1 +
>>  2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/spram.h b/arch/mips/include/asm/spram.h
>> index 0b89006e4907..e02a1961c542 100644
>> --- a/arch/mips/include/asm/spram.h
>> +++ b/arch/mips/include/asm/spram.h
>> @@ -1,10 +1,10 @@
>>  #ifndef _MIPS_SPRAM_H
>>  #define _MIPS_SPRAM_H
>>  
>> -#ifdef CONFIG_CPU_MIPSR2
>> +#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
>>  extern __init void spram_config(void);
>>  #else
>>  static inline void spram_config(void) { };
>> -#endif /* CONFIG_CPU_MIPSR2 */
>> +#endif /* CONFIG_CPU_MIPSR2 || CONFIG_CPU_MIPSR6 */
>>  
>>  #endif /* _MIPS_SPRAM_H */
>> diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
>> index 92987d1bbe5f..0862ae781339 100644
>> --- a/arch/mips/kernel/Makefile
>> +++ b/arch/mips/kernel/Makefile
>> @@ -53,6 +53,7 @@ obj-$(CONFIG_MIPS_CMP)		+= smp-cmp.o
>>  obj-$(CONFIG_MIPS_CPS)		+= smp-cps.o cps-vec.o
>>  obj-$(CONFIG_MIPS_GIC_IPI)	+= smp-gic.o
>>  obj-$(CONFIG_CPU_MIPSR2)	+= spram.o
>> +obj-$(CONFIG_CPU_MIPSR6)	+= spram.o
>>  
>>  obj-$(CONFIG_MIPS_VPE_LOADER)	+= vpe.o
>>  obj-$(CONFIG_MIPS_VPE_LOADER_CMP) += vpe-cmp.o
> 
>  It looks to me like this should be a separate CONFIG_MIPS_SPRAM option 
> selected by CPU_MIPSR2 and CPU_MIPSR6.  This will avoid the need to list 
> `spram.o' twice which may be asking for troubles.  Also this will keep 
> simple the `#ifdef' condition above.
> 
>   Maciej
> 
ok i will do that instead. thanks

-- 
markos
