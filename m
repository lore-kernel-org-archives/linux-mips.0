Received: from mailapp01.imgtec.com ([195.59.15.196]:38673 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992183AbcIHIfEtm-9K (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 8 Sep 2016 10:35:04 +0200
Subject: Re: [PATCH 15/21] mips: octeon: smp: Convert to hotplug state machine
References: <20160906170457.32393-1-bigeasy@linutronix.de>
 <20160906170457.32393-16-bigeasy@linutronix.de>
 <6ef2674b-aca6-f45f-03b2-ec9aa9a5bf91@imgtec.com>
 <20160907142712.rr34s2c6xiwcrjaz@linutronix.de>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <ca94f44f-a589-2e3a-50c3-4b7e87d3bf0a@imgtec.com>
Date: Thu, 8 Sep 2016 09:34:48 +0100
MIME-Version: 1.0
In-Reply-To: <20160907142712.rr34s2c6xiwcrjaz@linutronix.de>
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
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, rt@linutronix.de, tglx@linutronix.de, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160908083448.VsqdzQRqAVsbdhjiiBXUQDNaC0w10WGlHI6Bf20sRHE@z>

Hi Sebastian


On 07/09/16 15:27, Sebastian Andrzej Siewior wrote:
> On 2016-09-07 09:24:57 [+0100], Matt Redfearn wrote:
>> HI Sebastian,
> Hi Matt,
>
>>> --- a/include/linux/cpuhotplug.h
>>> +++ b/include/linux/cpuhotplug.h
>>> @@ -44,6 +44,7 @@ enum cpuhp_state {
>>>    	CPUHP_SH_SH3X_PREPARE,
>>>    	CPUHP_X86_MICRCODE_PREPARE,
>>>    	CPUHP_NOTF_ERR_INJ_PREPARE,
>>> +	CPUHP_MIPS_CAVIUM_PREPARE,
>> But I'm curious why we have to create a new state here - this is going to
>> get very unwieldy if every variant of every architecture has to have it's
>> own state values in that enumeration. Can this use, what I assume is (and
>> perhaps could be documented better in include/linux/cpuhotplug.h), the
>> generic prepare state CPUHP_NOTIFY_PREPARE?
> We can't share the states - one state is for one callback and one
> callback only. If you want CPUHP_MIPS_PREPARE and you ensure that this
> used only _once_ then this can be arranged.
> For online states we have dynamic allocation of ids (which is what most
> drivers should use). We don't have this of STARTING + PREPARE callbacks.

OK, fair enough - it just feels slightly unwieldy. That enumeration is 
going to grow to an enormous size to store every single callback which 
could be used, when no kernel is going to use all states, the majority 
of which exist for other architectures. As a result cpuhp_bp_states and 
cpuhp_ap_states are going to waste memory storing states that the kernel 
won't use.
But that's the design decision taken, so fine. I think we have to keep 
one enumeration value associated with one callback definition - anything 
else is going to end in a mess, so lets keep the values as you suggest.

Thanks,
Matt


>
>> Thanks,
>> Matt
>>
> Sebastian
