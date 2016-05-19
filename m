Received: from mailapp01.imgtec.com ([195.59.15.196]:13346 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27030674AbcESHGpTOoie (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 19 May 2016 09:06:45 +0200
Subject: Re: [PATCH v2 2/2] MIPS: CPS: Copy EVA configuration when starting
 secondary VPs.
References: <1463587956-9160-1-git-send-email-matt.redfearn@imgtec.com>
 <1463587956-9160-2-git-send-email-matt.redfearn@imgtec.com>
 <20160518223457.GA1529@NP-P-BURTON>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <573D65FE.7050801@imgtec.com>
Date: Thu, 19 May 2016 08:06:38 +0100
MIME-Version: 1.0
In-Reply-To: <20160518223457.GA1529@NP-P-BURTON>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20160519070638.6Oxkg3nmE3boeGn9mDIUU9k77QOR0xgxWouPF6Hbou8@z>

Hi Paul,

On 18/05/16 23:34, Paul Burton wrote:
> On Wed, May 18, 2016 at 05:12:36PM +0100, Matt Redfearn wrote:
>> When starting secondary VPEs which support EVA and the SegCtl registers,
>> copy the memory segmentation configuration from the running VPE to ensure
>> that all VPEs in the core have a consistent virtual memory map.
>>
>> The EVA configuration of secondary cores is dealt with when starting the
>> core via the CM.
>>
>> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
>> ---
>>
>> Changes in v2:
>> - Skip check for config3 existing - we know it must to be doing
>> multithreading
>> - Use a unique lable name in the function
>>
>>   arch/mips/kernel/cps-vec.S | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
>> index ac81edd44563..f8eae9189e38 100644
>> --- a/arch/mips/kernel/cps-vec.S
>> +++ b/arch/mips/kernel/cps-vec.S
>> @@ -431,6 +431,21 @@ LEAF(mips_cps_boot_vpes)
>>   	mfc0	t0, CP0_CONFIG
>>   	mttc0	t0, CP0_CONFIG
>>   
>> +	/*
>> +	 * Copy the EVA config from this VPE if the CPU supports it.
>> +	 * CONFIG3 must exist to be running MT startup - just read it.
>> +	 */
>> +	mfc0	t0, CP0_CONFIG, 3
>> +	and	t0, t0, MIPS_CONF3_SC
> Tiny nit - I'd prefer "andi" here since we're using an immediate. The
> assembler will figure it out though, so it's not a big deal.
Yeah, I would have too, and I did have that to start off with, but the 
assembler gave me:
arch/mips/kernel/cps-vec.S: Assembler messages:
arch/mips/kernel/cps-vec.S:450: Error: operand 3 out of range `andi 
$8,$8,((1)<<25)'
So I fell back to letting the assembler generate the LUI and AND.
>
> For both in the series:
>
>      Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Thanks Paul,
Matt

> Thanks,
>      Paul
>
>> +	beqz	t0, 3f
>> +	 nop
>> +	mfc0    t0, CP0_SEGCTL0
>> +	mttc0	t0, CP0_SEGCTL0
>> +	mfc0    t0, CP0_SEGCTL1
>> +	mttc0	t0, CP0_SEGCTL1
>> +	mfc0    t0, CP0_SEGCTL2
>> +	mttc0	t0, CP0_SEGCTL2
>> +3:
>>   	/* Ensure no software interrupts are pending */
>>   	mttc0	zero, CP0_CAUSE
>>   	mttc0	zero, CP0_STATUS
>> -- 
>> 2.5.0
>>
