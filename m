Received: from mailapp01.imgtec.com ([195.59.15.196]:49499 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008284AbbCFVwbopDR6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 6 Mar 2015 22:52:31 +0100
Message-ID: <54FA2197.2000005@imgtec.com>
Date: Fri, 6 Mar 2015 13:52:23 -0800
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 14/15] MIPS: csrc-sb1250: Implement read_sched_clock
References: <1425517137-26463-1-git-send-email-dengcheng.zhu@imgtec.com> <1425517137-26463-15-git-send-email-dengcheng.zhu@imgtec.com> <alpine.LFD.2.11.1503061228410.15786@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1503061228410.15786@eddie.linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <DengCheng.Zhu@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150306215223.uCrM75Jqdq_s7wGv90EWPHE3GG_7jxEp1Cd_jk-RPWw@z>

Thank you Maciej for the review!


On 03/06/2015 04:47 AM, Maciej W. Rozycki wrote:
> On Wed, 4 Mar 2015, Deng-Cheng Zhu wrote:
>
>> Use sb1250 hpt for sched_clock source. This implementation will give high
>> resolution cputime accounting.
>>
>> Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
>> ---
>>   arch/mips/kernel/csrc-sb1250.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/mips/kernel/csrc-sb1250.c b/arch/mips/kernel/csrc-sb1250.c
>> index df84836..6546fff 100644
>> --- a/arch/mips/kernel/csrc-sb1250.c
>> +++ b/arch/mips/kernel/csrc-sb1250.c
>> @@ -12,6 +12,7 @@
>>    * GNU General Public License for more details.
>>    */
>>   #include <linux/clocksource.h>
>> +#include <linux/sched_clock.h>
>>   
>>   #include <asm/addrspace.h>
>>   #include <asm/io.h>
>> @@ -46,6 +47,11 @@ struct clocksource bcm1250_clocksource = {
>>   	.flags	= CLOCK_SOURCE_IS_CONTINUOUS,
>>   };
>>   
>> +static u64 notrace sb1250_read_sched_clock(void)
>> +{
>> +	return sb1250_hpt_read(NULL);
>> +}
>> +
>   I think you're abusing the API of `sb1250_hpt_read' here, by relying on
> the implementation not using its `cs' argument.
>
>   I think it would make sense to reverse the implementation, by calling
> `sb1250_read_sched_clock' from `sb1250_hpt_read' instead.  Or perhaps
> better yet use a static inline helper for both, so as to avoid the extra
> tail call and the associated performance hit.
>
>    Maciej

Good point. Will do in v2.


Deng-Cheng
