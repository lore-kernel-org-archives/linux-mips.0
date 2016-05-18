Received: from mailapp01.imgtec.com ([195.59.15.196]:39353 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27028605AbcERPjSozZI8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 18 May 2016 17:39:18 +0200
Subject: Re: [PATCH 2/2] MIPS: CPS: Copy EVA configuration when starting
 secondary VPs.
References: <1463582722-31420-1-git-send-email-matt.redfearn@imgtec.com>
 <1463582722-31420-2-git-send-email-matt.redfearn@imgtec.com>
 <20160518150452.GA30917@NP-P-BURTON>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <573C8CA0.5060606@imgtec.com>
Date: Wed, 18 May 2016 16:39:12 +0100
MIME-Version: 1.0
In-Reply-To: <20160518150452.GA30917@NP-P-BURTON>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20160518153912.qMhJSqJNXYzV52_QkuJsNKt_3oqf9LXI79CKNTb9qvM@z>



On 18/05/16 16:04, Paul Burton wrote:
> On Wed, May 18, 2016 at 03:45:22PM +0100, Matt Redfearn wrote:
>> When starting secondary VPEs which support EVA and the SegCtl registers,
>> copy the memory segmentation configuration from the running VPE to ensure
>> that all VPEs in the core have a consitent virtual memory map.
>>
>> The EVA configuration of secondary cores is dealt with when starting the
>> core via the CM.
>>
>> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
>> ---
>>
>>   arch/mips/kernel/cps-vec.S | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
>> index ac81edd44563..07b3274c8ae1 100644
>> --- a/arch/mips/kernel/cps-vec.S
>> +++ b/arch/mips/kernel/cps-vec.S
>> @@ -431,6 +431,22 @@ LEAF(mips_cps_boot_vpes)
>>   	mfc0	t0, CP0_CONFIG
>>   	mttc0	t0, CP0_CONFIG
>>   
>> +	/* Copy the EVA config from this VPE if the CPU supports it */
>> +	mfc0	t0, CP0_CONFIG, 1
>> +	bgez	t0, 1f
>> +	 mfc0	t0, CP0_CONFIG, 2
>> +	bgez	t0, 1f
>> +	 mfc0	t0, CP0_CONFIG, 3
>> +	and	t0, t0, MIPS_CONF3_SC
>> +	beqz	t0, 1f
>> +	 nop
> Hi Matt,
>
> The checks here aren't *quite* right since they do the mfc0 of the next
> register in the delay slot which will happen even if the M bit of the
> preceeding register wasn't set. There are other cases in cps-vec.S where
> I've made that mistake... Luckily, in this particular case, we know that
> we have MT ASE support which means we know that Config3 exists. So I
> think you can just remove the checks of Config1.M & Config2.M and just
> read Config3 straight away.
Good point - thanks Paul :-)

Matt
>
> Thanks,
>      Paul
>
>> +	mfc0    t0, CP0_SEGCTL0
>> +	mttc0	t0, CP0_SEGCTL0
>> +	mfc0    t0, CP0_SEGCTL1
>> +	mttc0	t0, CP0_SEGCTL1
>> +	mfc0    t0, CP0_SEGCTL2
>> +	mttc0	t0, CP0_SEGCTL2
>> +1:
>>   	/* Ensure no software interrupts are pending */
>>   	mttc0	zero, CP0_CAUSE
>>   	mttc0	zero, CP0_STATUS
>> -- 
>> 2.5.0
>>
