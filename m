Received: from mailapp01.imgtec.com ([195.59.15.196]:58376 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010483AbbAVPDSQc4Dw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 22 Jan 2015 16:03:18 +0100
Message-ID: <54C1112F.1010707@imgtec.com>
Date: Thu, 22 Jan 2015 15:03:11 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC v2 30/70] MIPS: kernel: proc: Add MIPS R6 support
 to /proc/cpuinfo
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com> <1421405389-15512-31-git-send-email-markos.chandras@imgtec.com> <alpine.LFD.2.11.1501202336540.28301@eddie.linux-mips.org> <54BF709B.1080609@imgtec.com> <alpine.LFD.2.11.1501210936410.28301@eddie.linux-mips.org> <54C10C88.7060106@imgtec.com>
In-Reply-To: <54C10C88.7060106@imgtec.com>
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
Message-ID: <20150122150311.jptezhhl2YNt6wvzowMYqKWFP8lx7tGnEaqUdp9l9IA@z>

On 01/22/2015 02:43 PM, Markos Chandras wrote:
> On 01/22/2015 02:08 PM, Maciej W. Rozycki wrote:
>> On Wed, 21 Jan 2015, Markos Chandras wrote:
>>
>>>>> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
>>>>> index 097fc8d14e42..a8fdf9685cad 100644
>>>>> --- a/arch/mips/kernel/proc.c
>>>>> +++ b/arch/mips/kernel/proc.c
>>>>> @@ -82,7 +82,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>>>>>  		seq_printf(m, "]\n");
>>>>>  	}
>>>>>  
>>>>> -	seq_printf(m, "isa\t\t\t: mips1");
>>>>> +	seq_printf(m, "isa\t\t\t:"); 
>>>>> +	if (!cpu_has_mips_r6)
>>>>> +		seq_printf(m, " mips1");
>>>>
>>>>  I think define `cpu_has_mips_r1' instead and use it here.  It may turn 
>>>> out needed elsewhere too.  We probably don't need a new `MIPS_CPU_ISA_I' 
>>>> bit at this stage so this could be:
>>
>>  Typo here, I meant `cpu_has_mips_1' actually, sorry about that.
>>
>>> the change is simple enough and I see no reason to define the
>>> cpu_has_mips_r1 at the moment. If we ever need to explicitly handle r1,
>>> we can reconsider that.
>>
>>  It's a matter of code clarity, good code is self-explanatory.  Here the 
>> intent is to print `mips1' if it is supported.  By avoiding the extra 
>> definition you're detaching the intent from what code says.  Someone 
>> reading this code (who may not necessarily know the architecture documents 
>> by heart) has to scratch their head thinking: "why isn't `mips1' printed 
>> for R6, what the former has to do with the latter, and why is this case 
>> different to `mips2' and other ones that follow?"
>>
>>  Whereas the intent is clear with this:
>>
>> #define cpu_has_mips_1 (!cpu_has_mips_r6) // Aha, `mips1' is there if no R6!
>>
>> 	if (cpu_has_mips_1)
>> 		seq_printf(m, " mips1");  // Well, this is obvious...
> 
> however, someone may wonder then why not have
> 
> if (cpu_has_mips_1)
> print mips1
> if (cpu_has_mips_2)
> print mips2
> if (cpu_has_mips_3)
> print mips3
> 
> and only care about mips1.
oops that's already there. Then I guess your proposal makes the whole
thing consistent indeed.

-- 
markos
