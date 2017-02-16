Received: from mailapp01.imgtec.com ([195.59.15.196]:14125 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993890AbdBPJ1WGe1-w (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 16 Feb 2017 10:27:22 +0100
Subject: Re: [PATCH 1/2] pwm: loongson1: Add PWM driver for Loongson1 SoC
References: <20170213152801.GA32019@ubuntu>
 <f27d34d4-b0ac-2fd6-bc75-89a6c913ba3c@imgtec.com>
 <20170215130902.GA32795@ubuntu>
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <0d0c43f5-1016-4cb5-01f8-9ca82860b8ad@imgtec.com>
Date: Thu, 16 Feb 2017 10:27:15 +0100
MIME-Version: 1.0
In-Reply-To: <20170215130902.GA32795@ubuntu>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Yang Ling <gnaygnil@gmail.com>
Cc: thierry.reding@gmail.com, keguang.zhang@gmail.com, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20170216092715.k79JZ25JkzFiPw3uG9gSCAEEs9tc6hWF9lwyHMXapVQ@z>

Hi Yang,

On 15.02.2017 14:09, Yang Ling wrote:

>>> +	tmp = (unsigned long long)clk_get_rate(pc->clk) * period_ns;
>>> +	do_div(tmp, 1000000000);

NSEC_PER_SEC ?

>>> +	period = tmp;
>>> +
>>> +	tmp = (unsigned long long)period * duty_ns;
>>> +	do_div(tmp, period_ns);
>>> +	duty = period - tmp;
>>> +
>>> +	if (duty >= period)
>>> +		duty = period - 1;
>>> +
>>> +	if (duty >> 24 || period >> 24)
>>> +		return -EINVAL;
>>> +
>>> +	chan->period_ns = period_ns;
>>> +	chan->duty_ns = duty_ns;
>>> +
>>> +	writel(duty, pc->base + PWM_HRC(pwm->hwpwm));
>>> +	writel(period, pc->base + PWM_LRC(pwm->hwpwm));
>>> +	writel(0x00, pc->base + PWM_CNT(pwm->hwpwm));
>>> +
>>
>> PWM_HRC and PWM_LRC names suggest that you're using high/low state
>> counters here rather than duty/period - but with no documentation
>> I'm just guessing here.
>
> Indeed, the high/low state counters is used here.
> Change the name to duty_cnt/period_cnt.
>
>

What I was referring to here is that if you have a high/low value 
counters that you enter then these are not the same as duty/period, in 
simple terms:
high_cnt = duty_cnt
low_cnt = period_cnt - duty_cnt

so please double check that this is what you want to be doing? As the 
names used suggest that this code may be wrong. Or maybe what you're 
doing is correct but the register access macros have misleading names?

Marcin
