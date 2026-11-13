Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593235;
	b=s+k5nUVLGXTCCRC2PCG9kNnPdM4XTbJcwkzY7TeRMsD0YrxotPGhJTA9NSeA+bwmtvDL
	 Dv9h3u8OBdnICPhe+JTr9o/JPrAICMoDZWXeg6rWc6ClwZDCf6z6hrtbrW9N2K5LQxoJC
	 NGv9oF2lDrBf1hebCidJQPof9S4eynC0oNch1OQrMKmmUZBGQPFFG53paFOKjcOrtG6rF
	 BKVW87LkFZP8LtR80p2qb6R5HT/5CxaWeCCqX7JfEuPHxwoD3lR59RqR+VwCQM56rQyPv
	 U/oveUPpJDWGOtOIHyiNOlz2RGLc1DMrqZlsC9+o8Lk9BTBvI8XI34umueM730xYsFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vttGBAmDDCax2U5XiqRhhpJQxPTLOEnFzBvSm8vFABc=;
	b=YGvff144G79wfK48VSBfEv3/iLqgLgUCAZgls9AA/OP31PJEt8CZGrkf7Ztfp34NGFHR
	 xR9ouBVofDJTSB5yd6iGw5En9pj6EFZVkjWuFT5sKOrcwEUAd99h5yn+CBtibuIT/wRiK
	 tUR1kNW7MCbOaDE0c5m7rzkfwUWpALf35Q9VFZ5kKZEQhyK4VxOmAud7umiZag4o1pqrf
	 sXa9+ZiJzMWzp8oO8DYEesUp6QdNe0GhCuS7pmz/68RpyxCTssvOcz9MOmGR8tKkPe6q+
	 n2qh1iXyZ5tGHvmzJYqiYQjCyAGLnFJgON9UABmxwl9vW/2i0gWh96RBQbov8Z0PGPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRlfz9WH;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E6E606A330
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 18:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28E6E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRlfz9WH
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91e7af9a67fso8096156d6.2
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 10:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593234; x=1795198034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vttGBAmDDCax2U5XiqRhhpJQxPTLOEnFzBvSm8vFABc=;
        b=NRlfz9WHgzlWq3BwvZ3LZZs75s5z7t1bERLgNZIYnFeQklJKU9R5SBhrm36IohFyJG
         DfTGW/64xCpX2/VhCdmA4NGukO67ZJ4EMK2ypUxgOFxWIvscnBF2jm4rGiz7q4+I4tGh
         JPoz8ym/FtwzDnyI49ME1Eok0OBcR+h3YabA2x9983URMqLDqgm8Xi9u0jt6PgI0PG1Q
         IPiEHWZ3h5Awvtn9LQdlU8iQchp1abmbjnqrM/yFM5s3MgGO2lQ+CXPBjOZxCzpVPG6a
         xB383LF6SjNkjYEy3phhlvfBtarXEd/DzpgKrlGl/eMmRULJYyiK5Xx3/qw86KrLGau0
         Okfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593234; x=1795198034;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vttGBAmDDCax2U5XiqRhhpJQxPTLOEnFzBvSm8vFABc=;
        b=iqfMNlett6IDcPGQs0XBKKaiyq68jtsLwiqt5CN/P8dUrLhpGKNAR4OmUDUbvh2WXA
         QpHKzcg8T1EquyzX7afbNAvbjfAwVTgOKVKJS7D1E3G79w2BfMj19oXRH1Ky3oewg4sK
         u44CBuJKRjq8vPp8f+UjwzqjBYPzPMEZ2VlIBIYKVNPNcljD7/NdjMIm/bfHiRilPMb1
         1hcuw8zZybMiXVyIFKZ99OlZyid9e3CviXinlckTNRC3EfdBU+opYVVBQiX5y1Hfcy6T
         OYpb8tX4oF7Nl1Z8HVExOXGEMLe3NYsKpArck1I9nOc6nDOhshgY1qeKfjQ9+ilUOW7T
         AQkA==
X-Forwarded-Encrypted: i=1; AL+hErGNezZRWm851F2wOOowROkQgZUMaBLSqqa5NAoWQ3I/bhQH8vTqOQ/DE/OLlHTKynNw+CuwU8qY1hCV@vger.kernel.org
X-Gm-Message-State: APuU4Z9YAHknANIgPzww4eOmhU4+yjRcB9nunQP3mK0eh5cJzvTF5noV
	s+faVk+FmQgn8QXuVrRiV89pgDUGA35k5l+dvtYDiGKqp+vKiD04AJmQ
X-Gm-Gg: AYBFou06a96QVIUPN4UOJsBgOpHurAf2VrIae+PFkyQoWLJ5AVtELtv6JyBa6GsKdjZ
	YFMjU8dc5r3/RqvXG3iy2cEfDA+2zwzLfoy7P2hqkCLs6na4Au2cnBOmtz2L2Es+6aK4WgmROpp
	YNGJAdfKYxzJBkviNAoUdU3wSGn3YP8Qi6nDm7HXfOpTRWw7yqnC9hKwjvrIberuK2jBMRX2nyO
	6fikTUoRc+CndFc/Ff6waMTjRToF1vfDpKIZUhiFAF5H7DTcL7JcQHS/VevwW3/BS4pSUVAXw2x
	eLWv6TGtW8J+wb5JThQ0/seIu3Rx+pcn6mt+zuoOdhk2td+U9sooNslWFcaTr5lakNz7N/IF0QK
	KYjeHKZKr4gGYdGuX8UD6H0l1CX1nj58s3gRS8mz/UrAFZPEbg7ENz18+3idKh9wgpRkG5E2ava
	wq6EwgoqAKhPrsKF7eJj4L3INPHATTxD52e4r/Vx0Z4/ZinoYtsHm66Td/8V+MpWUZ6QKpRQ2mr
	ASjTdG1Mg8KqrRbMwv9+WuMuquYAH6SQD07ceVRCS2l+42bU7TihBT8ayvgb3dmE73cKV/65UBz
	7pcUDOxNWZV0M9YH6LYtVAoaae670NhC35P6+2oEMrGcMHdslUU40HUQkg==
X-Received: by 2002:a05:6214:1d0e:b0:91e:af07:e146 with SMTP id 6a1803df08f44-91f24217bbamr50370466d6.29.1794593233740;
        Fri, 13 Nov 2026 10:07:13 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d452bbsm25025776d6.7.2026.11.13.10.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:07:12 -0800 (PST)
Message-ID: <18bc9378-3f8c-4212-98cb-40e876bf996b@gmail.com>
Date: Fri, 13 Nov 2026 10:07:10 -0800
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] MIPS: Ingenic: Add XBurst SMP support
To: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
Cc: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261112184441.3724150-1-f.fainelli@gmail.com>
 <20261112184441.3724150-3-f.fainelli@gmail.com>
 <ea78059f26aa3e25822665a1a462951695bd1e80.camel@crapouillou.net>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <ea78059f26aa3e25822665a1a462951695bd1e80.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/26 04:54, Paul Cercueil wrote:
> Hi Florian,
> 
> Le jeudi 12 novembre 2026 à 10:44 -0800, Florian Fainelli a écrit :
>> From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>
>> Add support for the second XBurst core on the JZ4780, based on Zhou
>> Yanjie's 2020 series and Paul Burton's original CI20 SMP implementation.
>> Use the CP0 mailboxes for inter-processor interrupts.
>>
>> XBurst stops its private cache clock when executing WAIT. Write back
>> the data cache before entering idle so that the other core can access
>> data belonging to the sleeping core.
>>
>> Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
>> Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
>> Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
>> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>> Tested-by: Paul Cercueil <paul@crapouillou.net>
> 
> You updated the patch after my Reviewed-by, so that voids it...

Indeed, sorry about that.

> 
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> [florian: forward ported to latest version]
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
> 
> Please add a changelog per patch too.

I would rather do this only in the cover letter, but fine, I will oblige 
here.

[snip]

>> +static const struct plat_smp_ops xburst_smp_ops = {
>> +	.send_ipi_single = xburst_send_ipi_single,
>> +	.send_ipi_mask = xburst_send_ipi_mask,
>> +	.init_secondary = xburst_init_secondary,
>> +	.smp_finish = xburst_smp_finish,
>> +	.boot_secondary = xburst_boot_secondary,
>> +	.smp_setup = xburst_smp_setup,
>> +	.prepare_cpus = xburst_prepare_cpus,
>> +#ifdef CONFIG_HOTPLUG_CPU
>> +	.cpu_disable = xburst_cpu_disable,
>> +#endif
> 
> Drop the macro guards:
> .cpu_disable = IF_PTR(IS_ENABLED(CONFIG_HOTPLUG_CPU), xburst_cpu_disable),

OK.

> 
>> +};
>> +
>> +int __init register_ingenic_smp_ops(void)
>> +{
>> +	if (!of_machine_is_compatible("ingenic,jz4780"))
>> +		return -ENODEV;
>> +
>> +	register_smp_ops(&xburst_smp_ops);
>> +	return 0;
>> +}
>> diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
>> index 80e8a04a642e..0b042a328ad7 100644
>> --- a/arch/mips/kernel/idle.c
>> +++ b/arch/mips/kernel/idle.c
>> @@ -18,6 +18,7 @@
>>   #include <asm/cpu-type.h>
>>   #include <asm/idle.h>
>>   #include <asm/mipsregs.h>
>> +#include <asm/r4kcache.h>
>>   
>>   /*
>>    * Not all of the MIPS CPUs have the "wait" instruction available. Moreover,
>> @@ -71,6 +72,27 @@ static void __cpuidle rm7k_wait_irqoff(void)
>>   		"	.set	pop					\n");
>>   }
>>   
>> +/* XBurst gates its private cache clock in WAIT; write back dirty data first.
>> */
>> +static void __cpuidle xburst_wait_irqoff(void)
>> +{
>> +	unsigned long pending;
>> +
>> +	if (need_resched())
>> +		return;
>> +
>> +	r4k_blast_dcache();
>> +	pending = read_c0_cause() & read_c0_status() & CAUSEF_IP;
>> +	if (!need_resched() && !pending) {
> 
> You now call need_resched() twice, that's on purpose?

The two need_resched() checks are intentional: the first avoids an 
unnecessary cache flush; the second checks for work arriving during it.

> 
>> +		__asm__ __volatile__(
>> +			".set push\n"
>> +			".set arch=r4000\n"
>> +			"sync\n"
>> +			"wait\n"
>> +			".set pop\n"
>> +			: : : "memory");
>> +	}
>> +}
>> +
>>   /*
>>    * Au1 'wait' is only useful when the 32kHz counter is used as timer,
>>    * since coreclock (and the cp0 counter) stops upon executing it. Only an
>> @@ -156,10 +178,16 @@ void __init check_wait(void)
>>   	case CPU_CAVIUM_OCTEON_PLUS:
>>   	case CPU_CAVIUM_OCTEON2:
>>   	case CPU_CAVIUM_OCTEON3:
>> -	case CPU_XBURST:
>>   	case CPU_LOONGSON32:
>>   		cpu_wait = r4k_wait;
>>   		break;
>> +	case CPU_XBURST:
>> +		if (IS_ENABLED(CONFIG_MACH_JZ4780) &&
>> +		    IS_ENABLED(CONFIG_SMP) && num_possible_cpus() > 1)
>> +			cpu_wait = xburst_wait_irqoff;
>> +		else
>> +			cpu_wait = r4k_wait;
>> +		break;
>>   	case CPU_LOONGSON64:
>>   		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
>>   				(PRID_IMP_LOONGSON_64C |
>> PRID_REV_LOONGSON3A_R2_0) ||
>> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
>> index 0f28b4a62e72..46c70d866723 100644
>> --- a/arch/mips/kernel/smp.c
>> +++ b/arch/mips/kernel/smp.c
>> @@ -338,7 +338,10 @@ int mips_smp_ipi_free(const struct cpumask *mask)
>>   
>>   static int __init mips_smp_ipi_init(void)
>>   {
>> -	if (num_possible_cpus() == 1)
>> +	/* Platforms with their own IPI callbacks do not need an IRQ domain.
>> */
>> +	if ((mp_ops->send_ipi_single != mips_smp_send_ipi_single &&
>> +	     mp_ops->send_ipi_mask != mips_smp_send_ipi_mask) ||
>> +	    num_possible_cpus() == 1)
> 
> Needs braces now because of the multi-line if().
> 
> This change wasn't in your v3, and I also feel like this would belong in a
> separate patch.

Yes, that's fair enough.
-- 
Florian
