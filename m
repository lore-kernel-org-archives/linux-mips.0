Received: from mailapp01.imgtec.com ([195.59.15.196]:34964 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013589AbbEUWFsh2Uhx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 May 2015 00:05:48 +0200
Message-ID: <555E55F4.2060500@imgtec.com>
Date: Thu, 21 May 2015 19:02:28 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] clocksource: Add Pistachio clocksource-only driver
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com> <1432244506-15388-1-git-send-email-ezequiel.garcia@imgtec.com> <alpine.DEB.2.11.1505212352330.5457@nanos>
In-Reply-To: <alpine.DEB.2.11.1505212352330.5457@nanos>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Ezequiel.Garcia@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien.Horsley@imgtec.com, Govindraj.Raja@imgtec.com
Message-ID: <20150521220228.5jpU-0rQctKq_Nh_CiNpfghBQJPuReX04dg9yC89nn8@z>



On 05/21/2015 07:00 PM, Thomas Gleixner wrote:
> On Thu, 21 May 2015, Ezequiel Garcia wrote:
>> +static cycle_t clocksource_read_cycles(struct clocksource *cs)
>> +{
>> +	u32 counter, overflw;
>> +	unsigned long flags;
>> +
>> +	raw_spin_lock_irqsave(&lock, flags);
> 
> Hmm. Is that lock really necessary to read that counter? The
> clocksource is global. And if its actually used for timekeeping, the
> lock can get heavy contended.
> 

Yup, it is really (and sadly) necessary. The kernel hangs up completely
without it when the counter is accesed by more than one CPU.

Apparently, those two timer registers overflow and counter must be read
atomically.

>> +	overflw = gpt_readl(TIMER_CURRENT_OVERFLOW_VALUE, 0);
>> +	counter = gpt_readl(TIMER_CURRENT_VALUE, 0);
>> +	raw_spin_unlock_irqrestore(&lock, flags);
>> +
>> +	return ~(cycle_t)counter;
>> +}
> 
> Thanks,
> 
> 	tglx
> 

-- 
Ezequiel
