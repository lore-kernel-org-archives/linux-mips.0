Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955783;
	b=E4m4ml3K5eVHInvLSofhJCEZ/FoenPkjlwx7kUhaWlXY/QcUoW1Knww2ukj6HL6l4kX+
	 4BalBX89NSF0omb3PJffB8FLND0gksnHb7vZj0oytC5ELXpw2IOtOAheMHp5kxSSPSRrx
	 i5u+7f0uI8qdIZQtCeO3fFx2mLiY6hfwLIiq1yLrnZgW/Fv3+0aRo1vFGp4Co43zrKoTp
	 8sUW8Ie6SATRgWst9XQFXkWyJltkkRCHgYIlsnngXBHGW9qUzVgfk1+spkJQ+oeStzzW9
	 1VqX6e8M2VKARriBlfojO4QT1PznaSnDnEWW7zR9gaa5lXqT7XLw6/ey91P9DClikfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LM2FwdNguq/ImKJvR0xsuDikculPVtq7hMnmk6i3FnU=;
	b=HGLo1IfqkEf5xreP3Bmrixya4MIB9QcE73x3QM5ZGPE9wiIkQcqfWNnwttqxC6tFjUTg
	 jFR2LauPpUW7olxOToVmaRBNB8ZklupnZrjBJIJWaQiN2CR5D3I4u5EwK/kQtUapw80ni
	 WDQLaGOjTJn6EXY+gCkO9aTmcH5qJ0EKXgtcB3Ac6N/2ooqYhc1dIc6D+tC+ilx2Lt6Kl
	 YApgNOeKz4rjiAx069kRciyF/xBzMcty6B4c+VsSii6ClNSsZdrGoOgwbzCAQGwVzf8ho
	 9pMmx/oe3Rar1nwGoUkrsT06zoSRyJic7iDiTJfHTxzpmgBzOnPsMpAA4k+uGlm9zRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LmQqjF89;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A411606A31B
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 19:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A411606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LmQqjF89
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso4561949eec.0
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 12:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955782; x=1793560582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LM2FwdNguq/ImKJvR0xsuDikculPVtq7hMnmk6i3FnU=;
        b=LmQqjF89Fdy3ENWR6BlHs9G6JK8iFLBDxSlyZjjqMxLW9ZCO5hSafen5NswiVziYha
         CJHv36Xuddf4S3CSuuGZTxVoeKYYqfb5tWxGZH9Jkfc7XPH/14OYbuhgeSQY3R6DMK0S
         8xgUD6I4XiDeS0XQ7j5bZR/we66S5VPbUda6Qia77GlsruZ+T0WVjQZtBEj/XVeOw+j3
         061uYSESGZfU0Nh8d0Kuc+NejGMk6iIUQHQJMP+VN7yct+YTOF+5eyw3ZyteMtErbIVq
         GZPxgr189fQzkZRyRcgwr1WA/ZImSXPlQBezsyvqMpt70WaRJ9zJQJwd4xnEhLo33ytt
         0y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955782; x=1793560582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LM2FwdNguq/ImKJvR0xsuDikculPVtq7hMnmk6i3FnU=;
        b=l+/HMoRNUhc9NzPeERltRVWIHER8Wyh93ggbYZkprp0LKgtVVUGITeU6rfEdgDXSAl
         CxlcfkdG91WFpA2qw8PgDTalVGBlMLYs4o5SNvP9fAQj3T9swKYXgPWafE5pfymq/egQ
         BRW5JfI9LfPkRIs9SFtBnQ0aPjdC7bgF+Lq7X3t8GO19wKKywCnbBmX+7qNdqR/e+nc1
         K99Qyeut6NGr7V4Ph4ONeZbbUuQ54qITx8lJKmBySGDA5zZomR0SYCJLa03gy4SZ546K
         8qiEZRos8yhgrCOzrY3w47jCuS8zYwDbg5TGVOdNmCr2ISLBJys/bIoUnpmhANnsd/Be
         x+Kg==
X-Gm-Message-State: AFq9FYItmrFyocyUrYw87i9tfKlH8DXuV5BNuFFmR0iqOa4+zS+0ubit
	eW8t/b1Smh0BSFr4eifaZ6sh0aJ08hD1Gbl7rSXXo9iZ/ixuXgD7YyxT
X-Gm-Gg: AYBFou01A0Iob4mJmUWG0dCzHASJ9KCKF/wvcY2JrPKbzrDSEMjIIRj1LMvO+KIRtDj
	bExroqvhdVPX7pcvoRvZlLVxmLI0A3DlkR/2n+SoIy6ITcch6uUy+JO+idSJ5thlccMBOMm9gI9
	mOyyuRAOZhSkAs/fjpPgEKnoy1DeY36S3rZ5xM2xmgVPzAhbUM4Z1+TNiXMK3k51U707CJWKSoe
	W1m8h9yeEmGNbIjc5eZFvF42bUXJouFARHsTecu5N4MMOyNvI1gVh70cF6VbMstUBf/XKC3fpFJ
	hQqPTj6c0MMVQOfhef2Pu64L6VzMucMJSPuEW2fMjwAB24K++p4ubtEyC0DdO855KqxEui9RWLd
	sm1qEIo6wh75VFFItQC9zHkfumIfFPdmi4uxGmM2JDO77intuatOLlIchGxRmrUHkBoNflrHjHn
	oc6lQl3VZ1lZKRd8Gr9tnU8OqdNGkJnWyybEzOkfutvt7EqAVkVhAFfaAyOOXOMdMS8BPwmGezb
	00I4bZ1Vd9UcufXsz27C0c01C5LUf3JVT/keZMai50LnZskEqtIqYBkdSxaYVCYi8xbE84QrhLp
	16iyGwoG/P0JHl22091Q9pOuZWB/70qyFox6zGMyws9weHPfmLBqw/yOqAOYQEgXrdSeRV3e8sN
	M0v/5hHQimustgOMFbCCmHAGd
X-Received: by 2002:a05:693c:4195:20b0:34e:c001:1486 with SMTP id 5a478bee46e88-369e84daa95mr8406622eec.8.1792955782167;
        Sun, 25 Oct 2026 12:16:22 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:1f81:d121:605b:ad3:d032? ([2600:8802:b00:1f81:d121:605b:ad3:d032])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm10603999eec.15.2026.10.25.12.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 12:16:21 -0700 (PDT)
Message-ID: <ff0e6a32-af88-432b-a976-2a432f625cb2@gmail.com>
Date: Sun, 25 Oct 2026 12:16:20 -0700
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
Subject: Re: [PATCH v2] MIPS: Cobalt: Include legacy IDE ports in the PCI I/O
 window
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, open list <linux-kernel@vger.kernel.org>
References: <20261022163106.1410595-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2610250247210.42255@angie.orcam.me.uk>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2610250247210.42255@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/24/2026 7:55 PM, Maciej W. Rozycki wrote:
> On Thu, 22 Oct 2026, Florian Fainelli wrote:
> 
>> Changes in v2:
>>
>> - implement Maciej's suggestion to reserve PCI resources first
>>    and then the rest of the peripherals
> 
>   Thanks.
> 
>> diff --git a/arch/mips/cobalt/pci.c b/arch/mips/cobalt/pci.c
>> index 85ec9cc31d66..29fd052766b2 100644
>> --- a/arch/mips/cobalt/pci.c
>> +++ b/arch/mips/cobalt/pci.c
>> @@ -14,6 +14,8 @@
>>   
>>   #include <asm/gt64120.h>
>>   
>> +#include <cobalt.h>
>> +
> 
>   Hmm, why do you need it here now, a leftover from testing?

Yes indeed it was a leftover from moving code around until I settled on 
the current approach.

> 
>   With that removed, unless proved otherwise:
> 
> Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

Thanks v3 incoming.
-- 
Florian

