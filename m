Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D304A1E47CC;
	Wed, 14 Oct 2026 20:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010647; cv=none; b=kToraf8mLy/ytfgLvL+XYC8yvN0bFLZekZJbfq4i30yjU1P0+iOsldzfnCHiXkR2osjmsZnItP/B8rF29pKBZFRW00p3qRT1N/BMyaBmnnjSOqQZ+eUwSTOGaolNimdPuqKEpfyd07ogdJGbMrqgGRCEHIwB8E1k9F7Ns4a6a4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010647; c=relaxed/simple;
	bh=jn7IRmbONuBC8oZpjq61XkKCykiipOmii1osgmIlLXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgHX26r+0zaz/OnOGUNAct9CU2Oav8Y1C9P6Uac1uyrbBe+RrgPriEkAcqehcmbigalI1zoUv+rEF+HQiOWPty48SQC0rPwEE0D3uQyOTZNeqfk1Yv6N8j8CAN8b0sY1+PC8nuq00Lz+G0gJj1+kBJdWPaANYTo6MzJSiFpMOd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=mBWXnT99; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="mBWXnT99"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9709F595515;
	Wed, 14 Oct 2026 22:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1792010181; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=TpEWT3sVkC8/ApBQ3Zbal71RzkTTFaAnxbPQim+BB+o=;
	b=mBWXnT99GgRMTIKvfHWABp9bwdoRjhDdtIUjlpTYZyRF/Ufu2H9uPP0fAmOM83GE7Vx0Vw
	9tdh97dTrc6QFNsIOnJTtmv074jg/UdvAuAwmJ3ywyUPaOUL7ejzukQfuf4m0TS7sy4E6G
	8s3/D/PcAF1RTu3+7IAq5lCLtsFm18UAbDl+Y5AB5P6QRY6brJ9ExXPDupnmdSdjp9mFNH
	DNXxcn0/M/nBX0P0U2I+wJLn7S1ylOtCTxW84IBvdPE5xBqu7cWoyYSPw5DSCXNTn2qhhe
	eyNlE+BxYAuitA1TvG6pUnQ7DWc1tNGOSz/0yut24W5h1UNtabVIHSReVvr/gw==
Message-ID: <7108eadf-5dc8-4f39-beee-d748aa88e9af@cjdns.fr>
Date: Wed, 14 Oct 2026 22:36:18 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v9 5/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org, daniel.lezcano@kernel.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, naseefkm@gmail.com, robh@kernel.org,
 tglx@kernel.org, grandmaster@al2klimov.de
References: <20260918153606.344143-1-cjd@cjdns.fr>
 <20260918153606.344143-6-cjd@cjdns.fr>
 <5874ea6e-4e2f-416e-bcc1-851461c7308b@oss.qualcomm.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <5874ea6e-4e2f-416e-bcc1-851461c7308b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Daniel,

Thank you for the review.


On 14/10/2026 20:43, Daniel Lezcano wrote:
>
> Hi Caleb,
>
> with the help of a LLM, I got the following two issues with the changes
>
> On 9/18/26 17:36, Caleb James DeLisle wrote:
>> EN751627 is based on the 1004Kc which uses a different interrupt number
>> for each CPU timer. Support both this and the EN751221 which uses a
>> single percpu interrupt.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   drivers/clocksource/timer-econet-en751221.c | 122 ++++++++++++++++----
>>   1 file changed, 99 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/clocksource/timer-econet-en751221.c 
>> b/drivers/clocksource/timer-econet-en751221.c
>> index f2c4c1ee0a56..ff86a7edd31d 100644
>> --- a/drivers/clocksource/timer-econet-en751221.c
>> +++ b/drivers/clocksource/timer-econet-en751221.c
>> @@ -21,10 +21,12 @@
>>   #define ECONET_MAX_DELTA        GENMASK(ECONET_BITS - 2, 0)
>>   /* 34Kc hardware has 1 block and 1004Kc has 2. */
>>   #define ECONET_NUM_BLOCKS        DIV_ROUND_UP(NR_CPUS, 2)
>> +#define ECONET_NUM_IRQS            NR_CPUS
>>     static struct {
>>       void __iomem    *membase[ECONET_NUM_BLOCKS];
>> -    int        irq;
>> +    int        irqs[ECONET_NUM_IRQS];
>> +    bool        is_percpu;
>>       u32        freq_hz;
>>   } econet_timer __ro_after_init;
>>   @@ -102,6 +104,25 @@ static int cevt_init_cpu(uint cpu)
>>       struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, cpu);
>>       u32 reg;
>>   +    if (!reg_ctl(cpu)) {
>> +        pr_err("%s: missing address resource for CPU %d\n", cd->name,
>> +               cpu);
>> +        return -EINVAL;
>> +    }
>> +    if (cd->irq <= 0) {
>> +        pr_err("%s: missing IRQ for CPU %d\n", cd->name, cpu);
>> +        return -EINVAL;
>> +    }
>> +    if (!econet_timer.is_percpu) {
>> +        int ret = irq_force_affinity(cd->irq, cpumask_of(cpu));
>> +
>> +        if (ret) {
>> +            pr_err("%s: failed to set IRQ affinity to CPU %d: %pe\n",
>> +                   cd->name, cpu, ERR_PTR(ret));
>> +            return ret;
>> +        }
>> +    }
>> +
>>       pr_debug("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
>>         reg = ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
>> @@ -110,7 +131,10 @@ static int cevt_init_cpu(uint cpu)
>>       clockevents_config_and_register(cd, econet_timer.freq_hz,
>>                       ECONET_MIN_DELTA, ECONET_MAX_DELTA);
>>   -    enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
>> +    if (econet_timer.is_percpu)
>> +        enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
>> +    else
>> +        enable_irq(cd->irq);
>
> The new path calls enable_irq() each time a CPU starts, but the 
> hotplug state has no teardown callback to disable it. After an 
> offline/online cycle, the next enable_irq() encounters depth zero and 
> warns about an unbalanced enable.
> The IRQ also remains eligible for migration when its CPU goes offline. 
> Since cevt_interrupt() selects the timer using this_cpu_ptr(), an 
> interrupt migrated to another CPU checks and acknowledges that CPU’s 
> timer rather than the source timer, potentially leaving the source 
> interrupt asserted.
> Add a CPU-offline callback that masks the CPU’s timer interrupt and 
> balances enable_irq() with disable_irq_nosync() before migration.
>

I got this note from sashiko, and my thought process was that this CPU 
doesn't have hotplug, the vendor implementation didn't have it, the 
vendor doesn't make any MIPS based products anymore so no new products 
are coming out with this timer. So supporting hotplug here is adding 
code that will never run and adds confusion.

That said, I'm definitely open to alternative opinions on that.


>>       return 0;
>>   }
>> @@ -141,19 +165,52 @@ static void __init cevt_init(struct device_node 
>> *np)
>>                         CLOCK_EVT_FEAT_C3STOP |
>>                         CLOCK_EVT_FEAT_PERCPU;
>>           cd->set_next_event    = cevt_set_next_event;
>> -        cd->irq            = econet_timer.irq;
>> +
>> +        if (econet_timer.is_percpu)
>> +            cd->irq = econet_timer.irqs[0];
>> +        else
>> +            cd->irq = econet_timer.irqs[i];
>> +
>>           cd->cpumask        = cpumask_of(i);
>>           cd->name        = np->name;
>>   -        cevt_dev_init(i);
>> +        /*
>> +         * Tolerate CPUs that could exist but don't.
>> +         * Fail in cevt_init_cpu when they try to start.
>> +         */
>> +        if (reg_ctl(i))
>> +            cevt_dev_init(i);
>>       }
>>   }
>>     static int __init timer_init(struct device_node *np)
>>   {
>> -    int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
>> +    int num_blocks = of_address_count(np);
>> +    int num_irqs = of_irq_count(np);
>>       struct clk *clk;
>> -    int ret;
>> +    int ret, i;
>> +
>> +    econet_timer.is_percpu = of_device_is_compatible(np, 
>> "econet,en751221-timer");
>> +
>> +    if (econet_timer.is_percpu && num_irqs != 1) {
>> +        pr_err("%pOFn: EN751221 clock must have 1 IRQ not %d\n", np,
>> +               num_irqs);
>> +        return -EINVAL;
>> +    }
>> +    if (num_irqs > ARRAY_SIZE(econet_timer.irqs)) {
>> +        pr_err("%pOFn: Too many IRQs max %zd got %d\n", np,
>> +               ARRAY_SIZE(econet_timer.irqs), num_irqs);
>> +        return -EINVAL;
>> +    }
>> +    if (num_blocks > ARRAY_SIZE(econet_timer.membase)) {
>> +        pr_err("%pOFn: Too many regs: max %zd got %d\n", np,
>> +               ARRAY_SIZE(econet_timer.membase), num_blocks);
>> +        return -EINVAL;
>> +    }
>> +    if (num_blocks == 0) {
>> +        pr_err("%pOFn: At least one reg block must be provided\n", np);
>> +        return -EINVAL;
>> +    }
>
> The binding requires four interrupts and two register blocks for 
> EN751627, but the driver sizes its resource arrays from NR_CPUS and 
> rejects DTs exceeding those sizes. Consequently, a UP kernel 
> (NR_CPUS=1) or an SMP kernel configured for two CPUs rejects a valid 
> EN751627 DT before registering any timer.
>

This is a fair point, and I suppose a reasonable thing to do here is 
instead set num_blocks = ARRAY_SIZE(econet_timer.membase) so we just 
don't use the other blocks. I can send an updated patchset with that.


Does this sound good to you?


Thanks,

Caleb


>
>>       clk = of_clk_get(np, 0);
>>       if (IS_ERR(clk)) {
>> @@ -164,7 +221,7 @@ static int __init timer_init(struct device_node *np)
>>       econet_timer.freq_hz = clk_get_rate(clk);
>>       clk_put(clk);
>>   -    for (int i = 0; i < num_blocks; i++) {
>> +    for (i = 0; i < num_blocks; i++) {
>>           econet_timer.membase[i] = of_iomap(np, i);
>>           if (!econet_timer.membase[i]) {
>>               pr_err("%pOFn: failed to map register [%d]\n", np, i);
>> @@ -173,22 +230,32 @@ static int __init timer_init(struct device_node 
>> *np)
>>           }
>>       }
>>   -    econet_timer.irq = irq_of_parse_and_map(np, 0);
>> -    if (econet_timer.irq <= 0) {
>> -        pr_err("%pOFn: irq_of_parse_and_map failed\n", np);
>> -        ret = -EINVAL;
>> -        goto out_membase;
>> +    for (i = 0; i < num_irqs; i++) {
>> +        econet_timer.irqs[i] = irq_of_parse_and_map(np, i);
>> +        if (econet_timer.irqs[i] <= 0) {
>> +            pr_err("%pOFn: failed mapping irq %d\n", np, i);
>> +            ret = -EINVAL;
>> +            goto out_irq_mapping;
>> +        }
>>       }
>>   -    irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);
>> -
>> -    ret = request_percpu_irq(econet_timer.irq, cevt_interrupt, 
>> np->name,
>> -                 &econet_timer_pcpu);
>> -
>> -    if (ret < 0) {
>> -        pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
>> -               econet_timer.irq, ret);
>> -        goto out_irq_mapping;
>> +    for (i = 0; i < num_irqs; i++) {
>> +        irq_set_status_flags(econet_timer.irqs[i], IRQ_NOAUTOEN);
>> +
>> +        if (econet_timer.is_percpu)
>> +            ret = request_percpu_irq(econet_timer.irqs[i],
>> +                         cevt_interrupt, np->name,
>> +                         &econet_timer_pcpu);
>> +        else
>> +            ret = request_irq(econet_timer.irqs[i], cevt_interrupt,
>> +                      IRQF_TIMER | IRQF_NOBALANCING,
>> +                      np->name, NULL);
>> +
>> +        if (ret < 0) {
>> +            pr_err("%pOFn: IRQ %d setup failed: %pe\n", np,
>> +                   i, ERR_PTR(ret));
>> +            goto out_irq_free;
>> +        }
>>       }
>>         cevt_init(np);
>> @@ -220,9 +287,17 @@ static int __init timer_init(struct device_node 
>> *np)
>>       return 0;
>>     out_irq_free:
>> -    free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
>> +    while (--i >= 0) {
>> +        if (econet_timer.is_percpu)
>> +            free_percpu_irq(econet_timer.irqs[i], &econet_timer_pcpu);
>> +        else
>> +            free_irq(econet_timer.irqs[i], NULL);
>> +    }
>>   out_irq_mapping:
>> -    irq_dispose_mapping(econet_timer.irq);
>> +    for (i = 0; i < num_irqs; i++) {
>> +        if (econet_timer.irqs[i] > 0)
>> +            irq_dispose_mapping(econet_timer.irqs[i]);
>> +    }
>>   out_membase:
>>       for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
>>           if (econet_timer.membase[i]) {
>> @@ -235,3 +310,4 @@ static int __init timer_init(struct device_node *np)
>>   }
>>     TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", 
>> timer_init);
>> +TIMER_OF_DECLARE(econet_timer_en751627, "econet,en751627-timer", 
>> timer_init);
>
