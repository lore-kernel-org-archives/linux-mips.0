Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050809;
	b=PvuTa09iCsnWSrCPFOsoSkhEGvBa4ZtLiqtpFZvl9AGiNOYV01YVTGKLcphptJfrRJl2
	 TVVtvGzqeC94VTOKv2SsC2dJkAbnSrsX9Pum6cuhzBUy7BW7Lu76YLVW52u1mHXYzte1b
	 RFGyEPROTK/4eKNn0lozWNo2BaSQfao5QdN3hhi/BD7eYVFHmxHEWvP5/YGsTXEJtFHUH
	 rsot1H8SVAfA2atKTubipTTAJBRsX2opSs//u1jCWxNz4bI3728fNbCaEzCYh6U1Qbhc5
	 Y57aVJaMECV8Dl6VrAlkdkn4uKAbFA2rzMezp68WKZqsSOc27gKbZF9xnjcdMmHhMxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=g4dAtIGbR20X1kAl/FU925LvRkvwCNieoeAJRhJ82cE=;
	b=vQn4gfAx1vHT8K53OpaVa1vq35y38Ntbq2B2dRXJreX752KBmDtcf9fPiqEr7/hFQD5e
	 7KKsWqIocUcrPRvUH8AnirO4Ti9Guh71LHGl2d82gzLMbDHY/XHAkjVI++1eMUSWdaDVn
	 STC8NZkd+lOymdFYsdQM8Rnf6jKf9dPPA3ADSDpRZaymZGz4R1iXzcwiu68uNsrq2nxX/
	 WTf20IJ75SrXEXAI3jxiZDGmjT7SvFTjLhgVhPd1mMLgd652LADsnBnCryGMgJeGdT34l
	 aYK+F9Ou5B4GXk0FN/QyG3kwcVxBv+cQDvu2nVHc4m5F4GBcOuUf28f9oGY+adCBbIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SzgskFNG;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645A5606A338
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 01:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645A5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SzgskFNG
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91f2dd5dddaso15690506d6.3
        for <linux-mips@vger.kernel.org>; Wed, 18 Nov 2026 17:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795050808; x=1795655608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4dAtIGbR20X1kAl/FU925LvRkvwCNieoeAJRhJ82cE=;
        b=SzgskFNGhl/Mk4avrSlgfyIDuBw3t8ZX2sNTzsYCD8HGyN3RfVJRp3Q0rumL74ear2
         83GS6iFAvpj6xQFLZfOwHwq2/Mt49793yW+ogOL0JoGMNVy6v7ov4VxbE8AizrReJtWJ
         rReLEAqYSZfCkGvaYFNCSZIq6AzIzNdFD1mFJWe8eZtYycBnVV7G+gnQ41Mcl389nYSM
         RwVfQiYf1PjsXh/XNyQJxSGsx6iQPiQpScxlnYVa2NpXJckonqEq1v3JsfEnHtJV+hH7
         EcztSXhe6yJgGCMEAmbsZR0bz+ZyM6GoNaed5IWisXy2vJH4RJN38dDBEdPVa21gcLp9
         exCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050808; x=1795655608;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4dAtIGbR20X1kAl/FU925LvRkvwCNieoeAJRhJ82cE=;
        b=Wc1U4mMBpCUDN9Xq+fc42FR9nxYGwHQCzKVedf/jwdNAfddhYoq4cefKMV0/QS/k5g
         jfliqpn5mMqoEuTwxqrb3LtXrbe2GvbPFFWCEf6+zcdmTjiS++4jX/PDFSIoddXURObh
         I/uXvbxGQCVP6ZIEbIE7vMls6sPQ4yFpu3SzJBIKVU90J61FNew3DbsgwmdMLyrro1+g
         oCXbP6QNOshWh+i0xqY2SahvSJuSE13KBFC/6WYymPHS34el4zrsOGo8nalxSpn7JctK
         TnzBVjLNAN4Y6U7aTtJz3QZNskSrpbdirtta9/HXBahUDtc71E2wYa/zVDlrbJEdQvGQ
         sTWA==
X-Gm-Message-State: APuU4Z/Dzyytpbec2s77Ci+aQ7sGyfQbNCIg0+2y6KGHQpATRtmX2TIW
	UpWGx934tIJ+k56ooIH4399JgENAdtvJaYiXTg7IGgwLi1ViT/YYws95
X-Gm-Gg: AZFdTZfzVKcKtnens2Qy3DMXVOqwXnY6cu6aG56N3U530ygvupo+cM37nd3vtiNzYjW
	Z6FvZttDOklbKX6gGn1rFo9L+Zf0KA4C9ZfRan1eX8pF29DXdOfrM6Q0/h0ygWGvpDrHUI8ykMY
	oyh0GIB4Yjo0/LqCXMJ4yJwvDHaNqwtV57SpiSiLNPH2rjBq2Bb598z+AYYVr0UeSkYNyWB5lsD
	7qkEtP5vbaOKKiWGnfkzMttcqE+VLWl+6rwByTTAbuhmMm+GqWsSj0ESRciqnHu/3SF09ZNmKAi
	U0+bGAfZyxV2Kxvpl02tGw9FrrzZZjyIjOpHpRiZi2UFKj2sMEZOA/Iu1eDvTiYLHqsJ5nb6Uyd
	X8zfcUF0NhB3L7uWFqnn5H0muXHVB4a4hpJFsGtZn/aZs3OjdqJp09T/D7fCHvz6FfBl8svD2+H
	jIH6ALRKgemTQYNro5w33fVbzV1LdH9XT9bQKXeHRWlfiAEd/pLGw9jm35jbZQErw1ESKR346rW
	xvJ/WCjgCj1sORPU7Fi0jBryirVSE3FyFpCsXY4/DcnrWsTiXLWvIVQGvoQD9iFUNKPZHV1d1+t
	WL1mOQVK0ZcVVLlzZOOXAoRkTf766TGsyYOMQWll+5KWSTZDDUI8Ay53
X-Received: by 2002:a05:6214:623:b0:921:162:ce9f with SMTP id 6a1803df08f44-92114f2b51bmr72529536d6.39.1795050808274;
        Wed, 18 Nov 2026 17:13:28 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d10f89sm36108536d6.13.2026.11.18.17.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:13:27 -0800 (PST)
Message-ID: <b6546264-4c51-45e4-9728-a433527fb355@gmail.com>
Date: Wed, 18 Nov 2026 17:13:26 -0800
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
Subject: Re: [PATCH v2] MIPS: SiByte: Fix missing function prototypes
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 open list <linux-kernel@vger.kernel.org>
References: <20261113191933.477395-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2611180154490.54328@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2611180154490.54328@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 17:57, Maciej W. Rozycki wrote:
> On Fri, 13 Nov 2026, Florian Fainelli wrote:
> 
>> The SB1250 SWARM build reports missing prototypes for platform time
>> initialization, SoC setup, IRQ and SMP helpers, and both RTC backends.
> 
>   Thank you for doing this.  I've meant to for a long time, but have been
> distracted with higher priority stuff.
> 
>>   static inline int __maybe_unused bcm1250_m3_war(void)
>>   {
>> -	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
>> -		return sb1250_m3_workaround_needed();
>> +#ifdef CONFIG_SB1_PASS_2_WORKAROUNDS
>> +	return sb1250_m3_workaround_needed();
>> +#else
>>   	return 0;
>> +#endif
>>   }
> 
>   It seems a style regression, why is this change needed?

The declaration is wrapped under #ifdef CONFIG_SB1_PASS_2_WORKAROUNDS, 
which would hide the prototype when the option was disabled. The if 
(IS_ENABLED() would not compile in that case since we would have lacked 
a visible declaration. We could keep this and just make the prototype 
unconditionally visible instead.

Thomas, I can send a v3 as an incremental fixup or complete replacement?
-- 
Florian
