Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110070;
	b=QtX+QJgk5hIjcYJ07JGkHYGU2P4reNKqu3V1Hd73qmiqOsb8ADyrm/hZH5+xYy4s7wQC
	 fY4UPV58GKIVCFVeVMbzgSKlIwXFOf/TEwul0V0L30Bnj06Ej/59heYWd8oPy5BortMa0
	 nMsjCjV7TmOYPSOV/OGyCkwRS577HSy2kafERa0cYBJNk7AWxPv84nyKoFQXJATJVcBX5
	 7iDep5D8Yjg1Iqozw/Ey0q8nvKehB0JZN6dDOi+Q5+8Lh3e/qOSWdsfEYRnCMUgctnbv0
	 ud90aMpibjhBOoyTiLVQNaPxV7hRuDgKGnwKILGhk0CdMywpf/A8CPwHt2Uhbd3vUJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=faMIeaoK/LPm6yriR8BPrSmHN2yGJNTk8EM5yBhbYJE=;
	b=0myZORYGLRhoP/DLKCYU5FGZoaBjyZZduMND0aNsnL14KYbKj28ohF2KTyyajGcZZqF6
	 tTwcAZ6SLqvEwntxs0kDIExccbWueDNgypenw2ZC3Kr7+gh/dXyDsUn54hj8C8u3JqHwH
	 j5faYhxttQwpxIrfIyGGDHF5izmeYS3+XZwnS1FuTdwsGRc75g/ou3E5399+c4PjE8TFI
	 0af0G5HIoFrxOT4J6D++Qi6HyzLdErJqOBEah9+PzFnU8Ye4MmOojGU+YFGA6mOg5rGaC
	 AYe8v9UIzYJQLOAzyGsNPNduaka1GeR7TSKnAjiXxOU6ELMA8QlKoDiuG8OUi1Jt7xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suAO1eCq;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4856606A32F
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 17:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4856606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suAO1eCq
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-92123588d53so12666396d6.1
        for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 09:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110068; x=1795714868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faMIeaoK/LPm6yriR8BPrSmHN2yGJNTk8EM5yBhbYJE=;
        b=suAO1eCqJga1A/tYYdkSwi4XBJmnRXDSxDZeXVJKY8Ea3/+PHg4Z6/hGQdMUsk8x/S
         q53/cQEr2GgRkbFuw5/y06+XyeJvcwVvlC6Zlz6c1MoAs9cicHzrVc4ryTUHIM84BREM
         EZXjvpOq9SHyM3554td220q7xAt2/NAHehhyD5Ab6iHJSII4YSMk4PZ65BTgR6EXsJ7E
         eghmzgZuwF7TOMH53gKJa+YoakGyAQdl5kp+Av6ha4QFFclZ9csHtCa7QzctoZF6xHkY
         vc0fR2vIaVtJreQC7DerH3IqXDUU+QT9h/JSB8vqN33zYGy8ALbvVAsRP+EJZFX8XmEI
         mVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110068; x=1795714868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faMIeaoK/LPm6yriR8BPrSmHN2yGJNTk8EM5yBhbYJE=;
        b=sd0ipBgDwLHEESU+oUnOGM+UZB0DwoO9hBuyLMTumbtzEM9hHsoV2KDpfd4gHpntQp
         4bQtJ5uR1nqpZHi36fWpcJgyOteU9ehxwVgXuONuk2UOxqcCIbi0RrKtxPq8Rs/DG+Vj
         sj57muC8KA7ojtCEzRUGcV3VxsqjkHvENS/UlJaoWvv+IUPNJ9lWs7AsDC7mltqZ9FbY
         h78q1dd6rTfxc/U+TbRvmlPDU0sM9FRsERyQOSKmsM9vgYNULTMWS38pv0vy1SChLiXp
         S0O1ZIM+NEmbyO4Z/6pm11zzdq+hpz/ni9m9KqyyHlYphUbCCi+EzgZMYrZTirIHbgdM
         1D5w==
X-Gm-Message-State: APuU4Z+65NaLVF14uwDHqkd2NRqu17pIeIilu+yRro+8YZUW3UNGZN65
	1KSc8ZwkRhiyRiAFI7hFJRNgSOh7Mfz7PDkhs+2/50oA4R88kuXrjX+JnuVl3A==
X-Gm-Gg: AZFdTZfi1ws/IXkLZB/M3u+bOJCFucjJR045vC88krCO8WII5wK2wJfUPQNGtbas/7I
	ONoXRZR3J9b+QYWrzpOmyzqC8ByKQ5w1A8OQ5XcCF2wWq+mfkl4GG2UGvEu2FrGFzsZ1Jhe8lBB
	VEquw6C06Q0dNOeBU9nEVGauk+crnEye/RUNHBPD1QVfs6p0MkIoTyY26Afhx+e5Vd/SVf99RYF
	PADw2O1eIQh0X24pDd6NfaOp2UZKfn3Gqn0el1NtWmdBrzgE2z0hSTAM7EJqt862YALzWxmijao
	W9bSL/nivL8oQ+DgB687Iwc28ibzx96EIZsbc6J7+zG2zOngqJpMrFbkxGeSKgT2aSFMH1i4Wg6
	SBhytLjIiGMN3OFvRg2i6m/odN+YTl2CA41sNiZI9yEAlZFG6SRwLjj1EmlHCpMnC2E6JI3/1y7
	EYQ61L5d2aVhBxU0zp1+JnWKSROE5wJHn97/wnB8ruWREKl7vQgIjNYjQ3olxnFvtSiXfIEbbXY
	lJbovhKCUrwC5A7MIYG7mcP2JMUsmFms4lziLZ7jUzCKFH9SzvmqS6DpX+j0kE95BDcewY1nDPz
	kYipjmcBw0YitIE3z5KHcgYQzn1qijZOiH+sLMZtTUPte0Y2okADR3QK
X-Received: by 2002:a05:6214:c2b:b0:921:1e3c:efeb with SMTP id 6a1803df08f44-9212e0d16a1mr28186266d6.18.1795110068390;
        Thu, 19 Nov 2026 09:41:08 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a0f5d7sm4654166d6.37.2026.11.19.09.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 09:41:07 -0800 (PST)
Message-ID: <ca5c0e46-3cb9-4604-8882-ae60c3d8fca1@gmail.com>
Date: Thu, 19 Nov 2026 09:41:06 -0800
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
 <b6546264-4c51-45e4-9728-a433527fb355@gmail.com>
 <alpine.DEB.2.21.2611190811510.54328@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2611190811510.54328@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 00:31, Maciej W. Rozycki wrote:
> On Wed, 18 Nov 2026, Florian Fainelli wrote:
> 
>>>>    static inline int __maybe_unused bcm1250_m3_war(void)
>>>>    {
>>>> -	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
>>>> -		return sb1250_m3_workaround_needed();
>>>> +#ifdef CONFIG_SB1_PASS_2_WORKAROUNDS
>>>> +	return sb1250_m3_workaround_needed();
>>>> +#else
>>>>    	return 0;
>>>> +#endif
>>>>    }
>>>
>>>    It seems a style regression, why is this change needed?
>>
>> The declaration is wrapped under #ifdef CONFIG_SB1_PASS_2_WORKAROUNDS, which
>> would hide the prototype when the option was disabled. The if (IS_ENABLED()
>> would not compile in that case since we would have lacked a visible
>> declaration. We could keep this and just make the prototype unconditionally
>> visible instead.
> 
>   I've pondered it a bit more and I'm not entirely happy with the use of a
> platform header in generic code in the first place.  Would <asm/bugs.h> be
> a better place for the prototype?

Yes, I like that, fixup coming up for Thomas to apply. Thanks!
-- 
Florian
