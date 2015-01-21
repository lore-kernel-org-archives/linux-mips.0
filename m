Received: from mailapp01.imgtec.com ([195.59.15.196]:50437 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010502AbbAUJZyfTBDS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Jan 2015 10:25:54 +0100
Message-ID: <54BF709B.1080609@imgtec.com>
Date: Wed, 21 Jan 2015 09:25:47 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC v2 30/70] MIPS: kernel: proc: Add MIPS R6 support
 to /proc/cpuinfo
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com> <1421405389-15512-31-git-send-email-markos.chandras@imgtec.com> <alpine.LFD.2.11.1501202336540.28301@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1501202336540.28301@eddie.linux-mips.org>
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
Message-ID: <20150121092547.zpJzWPc1B0it29Ace8MjTON8ns8YC6OJMjNNng2IGdY@z>

On 01/20/2015 11:42 PM, Maciej W. Rozycki wrote:
> On Fri, 16 Jan 2015, Markos Chandras wrote:
> 
>> Print 'mips64r6' and/or 'mips32r6' if the kernel is running on
>> a MIPS R6 core.
>>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> ---
>>  arch/mips/kernel/proc.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
>> index 097fc8d14e42..a8fdf9685cad 100644
>> --- a/arch/mips/kernel/proc.c
>> +++ b/arch/mips/kernel/proc.c
>> @@ -82,7 +82,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>>  		seq_printf(m, "]\n");
>>  	}
>>  
>> -	seq_printf(m, "isa\t\t\t: mips1");
>> +	seq_printf(m, "isa\t\t\t:"); 
>> +	if (!cpu_has_mips_r6)
>> +		seq_printf(m, " mips1");
> 
>  I think define `cpu_has_mips_r1' instead and use it here.  It may turn 
> out needed elsewhere too.  We probably don't need a new `MIPS_CPU_ISA_I' 
> bit at this stage so this could be:

the change is simple enough and I see no reason to define the
cpu_has_mips_r1 at the moment. If we ever need to explicitly handle r1,
we can reconsider that.

-- 
markos
