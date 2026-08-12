Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731D1360EE1;
	Wed, 12 Aug 2026 19:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563141; cv=none; b=BG5Cl5zER12/F5Fuwd0LsvGwAHmWJ3LvLc9M0qnD/F4Lv7h+EyohB6zU4aV7fH37BOMkC7ilyXChr+Q0k6Cs/7fzUF8L6ew3kYcGsJXEDvOhsDkSdtXSVXQrwB9fMP5mJnnUpWGnzGRabrL4zmrCO9Qp+6ibXrHPfsntHfrx3II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563141; c=relaxed/simple;
	bh=vLuXGSzqZRaSuT7OY1sDlXkikmHIh74PBGPCNG03pxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJia+5qo83wk5KyT2y/qFvyrflCZPRuBmroBvGBRqjkHJHTqCAEjIzypH1/EGiP/iueeQFsbYOvSokIiu+GzisPl5yoPYG1gM2wHnYtrxSD4d1KA3p88J61j/J2QOsqIZOpgSsaqX/OQdN+A4ZoEy8bWZ1eXs+j2EejSXuIP9Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=CEz76qal; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="CEz76qal"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C23E22D03EE;
	Wed, 12 Aug 2026 21:32:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1786563134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LUSEvnBk4o4pNu42fv0p88WTTnosqqpdG6xm9MgaJcc=;
	b=CEz76qalHtBQ9QbOGfDJDhAQzfCkU2TOuJhzt5w7EhPbdijb2aGXmulNfK4y4upHo2zamn
	DVZNV0egbAtbkoSkW3cf+gxWetyJp3hZpGWL1C/tF3OrtRUVkvVGBtRukrKCitBwu0dWjt
	Z57BuL5TtuZBYRBOg51uig2e5pC/KW9cWkDR+JLUxWOVoKuhFqDDIHAz5SZekNb6flutlU
	+L/z/KiH5u716RIhlAVDCgnfw/QJxYSgJOn/Rl81owZ9B83auqbPttvQWYf9O1eAP04CRG
	dopfWVg2eMp1tCZKZKZwJBz0xj7teLdEqNlI61sHbvHMqr6IZBG5idCp3X6oDg==
Message-ID: <f98f17aa-0f95-4b03-9f95-385e8af762df@cjdns.fr>
Date: Wed, 12 Aug 2026 21:32:08 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v7 0/5] clocksource/timer-econet-en751221: Support irq
 number per timer
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org, daniel.lezcano@kernel.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, naseefkm@gmail.com, robh@kernel.org,
 tglx@kernel.org, grandmaster@al2klimov.de
References: <20260731120246.1296955-1-cjd@cjdns.fr>
 <4917ef30-0ed9-4c5a-8516-1033b5f02fdc@oss.qualcomm.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <4917ef30-0ed9-4c5a-8516-1033b5f02fdc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3


On 12/08/2026 10:26, Daniel Lezcano wrote:
> On 7/31/26 14:02, Caleb James DeLisle wrote:
>> This timer appears on both the EcoNet EN751221 (34Kc) and on the
>> EN751627 / EN7528 (1004Kc) SoCs. On the 34Kc the interrupt controller
>> uses a percpu interrupt while on the others it uses an individual
>> IRQ number for each CPU timer. Add support for EN751627 and EN7528.
>> Add support for IRQ number for each CPU timer under the
>> econet,en751627-timer compatible.
>>
>> Changes since v6:
>> * Rebase to tip/timers/core (base-commit below)
>
> Got this:
>
> In file included from 
> /home/dlezcano/Work/src/linux/timers/include/asm-generic/bug.h:31,
>                  from 
> /home/dlezcano/Work/src/linux/timers/arch/arm64/include/asm/bug.h:26,
>                  from 
> /home/dlezcano/Work/src/linux/timers/arch/arm64/include/asm/pgtable.h:8,
>                  from 
> /home/dlezcano/Work/src/linux/timers/include/linux/pgtable.h:6,
>                  from 
> /home/dlezcano/Work/src/linux/timers/arch/arm64/include/asm/io.h:12,
>                  from 
> /home/dlezcano/Work/src/linux/timers/include/linux/io.h:12,
>                  from 
> /home/dlezcano/Work/src/linux/timers/drivers/clocksource/timer-econet-en751221.c:8:
> /home/dlezcano/Work/src/linux/timers/drivers/clocksource/timer-econet-en751221.c: 
> In function ‘timer_init’:
> /home/dlezcano/Work/src/linux/timers/include/linux/kern_levels.h:5:25: 
> warning: format ‘%d’ expects argument of type ‘int’, but argument 3 
> has type ‘long unsigned int’ [-Wformat=]
>     5 | #define KERN_SOH        "\001"          /* ASCII Start Of 
> Header */
>       |                         ^~~~~~
> /home/dlezcano/Work/src/linux/timers/include/linux/printk.h:483:25: 
> note: in definition of macro ‘printk_index_wrap’
>   483 |                 _p_func(_fmt, ##__VA_ARGS__);         \
>       |                         ^~~~
> /home/dlezcano/Work/src/linux/timers/include/linux/printk.h:554:9: 
> note: in expansion of macro ‘printk’
>   554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> /home/dlezcano/Work/src/linux/timers/include/linux/kern_levels.h:11:25: 
> note: in expansion of macro ‘KERN_SOH’
>    11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
>       |                         ^~~~~~~~
> /home/dlezcano/Work/src/linux/timers/include/linux/printk.h:554:16: 
> note: in expansion of macro ‘KERN_ERR’
>   554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |                ^~~~~~~~
> /home/dlezcano/Work/src/linux/timers/drivers/clocksource/timer-econet-en751221.c:201:17: 
> note: in expansion of macro ‘pr_err’
>   201 |                 pr_err("%pOFn: Too many IRQs max %d got %d\n", 
> np,
>       |                 ^~~~~~
> /home/dlezcano/Work/src/linux/timers/include/linux/kern_levels.h:5:25: 
> warning: format ‘%d’ expects argument of type ‘int’, but argument 3 
> has type ‘long unsigned int’ [-Wformat=]
>     5 | #define KERN_SOH        "\001"          /* ASCII Start Of 
> Header */
>       |                         ^~~~~~
> /home/dlezcano/Work/src/linux/timers/include/linux/printk.h:483:25: 
> note: in definition of macro ‘printk_index_wrap’
>   483 |                 _p_func(_fmt, ##__VA_ARGS__);         \
>       |                         ^~~~
> /home/dlezcano/Work/src/linux/timers/include/linux/printk.h:554:9: 
> note: in expansion of macro ‘printk’
>   554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> /home/dlezcano/Work/src/linux/timers/include/linux/kern_levels.h:11:25: 
> note: in expansion of macro ‘KERN_SOH’
>    11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
>       |                         ^~~~~~~~
> /home/dlezcano/Work/src/linux/timers/include/linux/printk.h:554:16: 
> note: in expansion of macro ‘KERN_ERR’
>   554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |                ^~~~~~~~
> /home/dlezcano/Work/src/linux/timers/drivers/clocksource/timer-econet-en751221.c:206:17: 
> note: in expansion of macro ‘pr_err’
>   206 |                 pr_err("%pOFn: Too many regs: max %d got 
> %d\n", np,
>       |                 ^~~~~~
>

I gather you must have built this on a 64 bit machine, so the size_t of 
ARRAY_SIZE() is a uint64_t (?)

I just double-checked building it for MIPS 24Kc GCC and it all passes. 
This is a built-in CPU timer for EcoNet MIPS SoCs. Those were all 32 bit 
and they're not making any more of them so we don't need to worry about 
a future 64 bit port.

But I'm not that knowledgeable in best practices, perhaps its expected 
to compile on 64 bit? Or perhaps I should forbid 64 bit in the Kconfig? 
There is no way to get CONFIG_ECONET and 64 bit, but through 
TEST_COMPILE I suppose it is.

Any suggestions would be appreciated.

Thanks,

Caleb


>
>> Changes since v5:
>> * Integrate patch fix refcount leak from:
>> Link: 
>> https://lore.kernel.org/linux-mips/20260526184105.18962-3-grandmaster@al2klimov.de/
>> * NULL econet_timer.membase after unmapping
>> * NULL check dev->event_handler in case clockevents_config_and_register
>>    failed to fully register.
>> * v5: 
>> https://lore.kernel.org/linux-mips/20260516233943.49502-1-cjd@cjdns.fr/
>>
>> Changes from v4:
>> * Fixed incorrect compatible in DT schema
>> * Bracing in out_irq_free if statement
>> * I did not move cpuhp_setup_state past the point of no return
>> * v4: 
>> https://lore.kernel.org/linux-mips/20260516215720.4160831-1-cjd@cjdns.fr
>>
>> Changes from v3:
>> * off-by-one in out_irq_free
>> * Gracefully fail if too many address resources are provided in the DT
>> * Allow fewer actual timers than num_possible_cpus, as long as they
>> never start
>> * v3: 
>> https://lore.kernel.org/linux-mips/20260516182648.3987792-1-cjd@cjdns.fr
>>
>> v3 note:
>>
>> I decided to take this patchset in a slightly different direction from
>> v2. There is a certain amount of initialization that once it has run,
>> it cannot be reverted in case of error. The original driver init was a
>> mixture of revertible and non-revertible code which made it too easy
>> for code which is designed with best practices in mind to in fact
>> introduce a bug. Therefore I start by making the init process more
>> legible but without any business logic changes, then fix a race
>> condition by keeping IRQ disabled until after cevt is setup, then
>> finally add non-percpu IRQ support.
>>
>> * v2: 
>> https://lore.kernel.org/linux-mips/20260514000601.3430262-1-cjd@cjdns.fr
>>
>> Changes from v1:
>> * Split changes over 3 refactoring patches + main patch
>> * Remove driver discussion from dt commit message
>> * v1: 
>> https://lore.kernel.org/linux-mips/20260416175101.958073-1-cjd@cjdns.fr/
>>
>>
>> Alexander A. Klimov (1):
>>    clocksource/timer-econet-en751221: fix refcount leak
>>
>> Caleb James DeLisle (4):
>>    dt-bindings: timer: econet: Update EN751627 for multi-IRQ
>>    clocksource/timer-econet-en751221: Init teardown on error if possible
>>    clocksource/timer-econet-en751221: Disable IRQ until cevt registered
>>    clocksource/timer-econet-en751221: Support EN751627 without percpu 
>> IRQ
>>
>>   .../bindings/timer/econet,en751221-timer.yaml |  31 +--
>>   drivers/clocksource/timer-econet-en751221.c   | 181 ++++++++++++++----
>>   2 files changed, 159 insertions(+), 53 deletions(-)
>>
>>
>> base-commit: ecc330e3096173f433659aa64ab3674d0d48440e
>
>
