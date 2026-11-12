Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511316;
	b=sRa9WHLeBiRAvt+VfTUBR9i79AoAWaA0NnOUN2+63e4+akhD5N1FZ7XQJDT6LEqeijq3
	 fIi7Sy/iFecrHj3kiKv/bkIRXvB489rtj8umQSqLh2zIgktm08N78zPZXay++7eNISOBb
	 2cQC3+LnIJT7/vI0hwb93OI+zLsF4vuqAYXTNUMRmsb8kQ0MIJfzm6DNZOjibHkA0UDPP
	 hdVVHSWeXivoO0BDctqjLWFjOitQzFnTULpeMjRITuezDjk4HFMr68hHAXJYpPdWov/1t
	 A2BH4YQJlKER1E5OJJRYmZZCKTqXuSdtvg/00EExYtsm7i+8lqJ+P3qmHSA5V90BG5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=01sL97ssAo9+QnpHtaCzSuqPvKdXMurbEXs7EQQ6WQY=;
	b=QVpilYo/FcTn1yqOVklesv3d91GkTmpEevPUxvwKM12fKO5Iyd4V2VZnvn79AuVEXzbj
	 WAgZRDnqLwA13j7N+p6A5x5WGF5xxt1+cORN9KKMmDA1jYZ6Z+omIP73R+ZzTDZm46GJd
	 Fz0DX70r8+D2xEXzOfNEd5sQzjf66AKxEVOSFIGYsdpa1WJxazKKNHiyn4IzwmFThHp3A
	 cIm62HQMqZI38mnNRHThvOEK7PWfPm/mz8auxRoAFpi6uXhGIr+hQYix/oHGmFI8h8Sd+
	 gTI6D6KYLzRaCos6GaBztHHQ2Xlk+58c9MtFVrypg3pCCKZhPIni2HhcieI7i7em7Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XryGaR31;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D93606A31C
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 19:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XryGaR31
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-930c0f9c1b1so11762385a.1
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 11:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511315; x=1795116115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01sL97ssAo9+QnpHtaCzSuqPvKdXMurbEXs7EQQ6WQY=;
        b=XryGaR31B5ngrL4TkY5JKI8s/l0YrSvOED2HMkhUaYiyQcWTWrU8K8NbwJufCLwSBA
         7YxQKvHJkNdUZaV1YTiuhCc9sOeqAwTNjELeNQGUB827v/6LeB4kroWT0MdJjf95N3g/
         403nAVntpIL80gVaOkshrX878wldPB733TJLTp+7IPRUqjSS4aNGfcZFfWDGwrOYoaFi
         ChRI5a8Yu7UbHCkQJJ+LxHWRAKdfLhGowvUWfOUxjZGmiHV0rfYVHMRBtVfqMwk0sn8D
         bp9qDgD+Ne1JWHCxIN2l47sXnOZLJjuSZkqaDJUWFtQQmb4UROflT5qu/rpeXtPaPBeR
         GCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511315; x=1795116115;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01sL97ssAo9+QnpHtaCzSuqPvKdXMurbEXs7EQQ6WQY=;
        b=tp+8TZ0RQIH5O0V6A7mVzIVLEkuhQNWtCdSkVO8Z6uxDuL9d2CR1EvXkGv31m1eY68
         vFjz0KjI/TfV49dk04fvseGqgEj8sKT9SjUwJAwtUgOpZjhkG1/YndPBsvQk1d89jR5d
         wm4CBfjzFzhlthFmlQ72iHBYpUQKv3JZ6dSPJWfsiMoG4rV2wzlbuQEVF6uoRe/wCnJi
         ahvzBsJwgQudnSmSeFTl9fy2UEKG6sr4tCMoGOhUTDyBhSZGIH/sOkAKmSqCX3s8LIWH
         UaxjmhUsgwqMES6iBV61IbX3EiWEWyP+JShTl7y7lc4e51kASNbMxc1L7Q38ARw75P9Y
         D6BQ==
X-Gm-Message-State: APuU4Z/vrbITwauGjW+Y0OLL6UqtTM5lh27WH6HlCTY5igK4jafftdev
	N6lHHl4/DHo7j5E96gjRfkADOSze9ZAHUbOQulCOSZ/3UAEbinpwg9MuqlktCg==
X-Gm-Gg: AYBFou1F3zjzFaw2dzvU0j9rtC5GIXFO/prHyAs1opSTRc5Rejo34v/Jq/UiKDTr/JV
	SNmwXuh037UxcEiuJCOFfaZlw/srON7Ub9LbkZey0khKzpu+ckZmwkK0b8542zjsXLwsgC8KUZJ
	IOKcvV3xLr7tpXF1Bc9mdLFKrVDhZXW76ZY/4vgDoRILSAomsiXndt5DQTgtlMY6c4xwtulCqV2
	g6QeTK+yUGJ7Q5Y610k6H7/40FXcV+p3C17XiG8Pw6L1bW+6RHIAM7fsTckclmQ3tV0Q7tUwVTN
	F4DFNr5ZIK/acI0+skF78cPooP4sow6TkRhmbj/o6vo3lCA1bmKpfNshGGpS3tpWmN/TpwFPEZR
	TNYKuW8XtbcaRcvdpV+DUoN5yHXLWeJnP5AfNfGGRs34hHk/LuJtYXSafwqQFmQVVcFSL8QfwAd
	KR7jsxHmPexcCEMBfj3ztwG5C0yycUZ2l96PDcyqUySilRDa4TJy4G7LHVy+5+y2XgkqJwClGBU
	hBATa3HuZePlT2UeNYsDK8dZ8j6S3kOflcGNCqSDXWnK0zhOma+P3e/hCnh4fRPtCj52b+TfVWk
	ecyInqdfm2IV79lJ0J8jaKQmUpljidAuyXyALdwpfd4FeTXwlTPbf/lY
X-Received: by 2002:a05:620a:4109:b0:93f:3e39:efa1 with SMTP id af79cd13be357-9494bb85894mr67625385a.23.1794511315258;
        Thu, 12 Nov 2026 11:21:55 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c80387dsm8362885a.13.2026.11.12.11.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:21:54 -0800 (PST)
Message-ID: <01705c8c-2043-40d9-bd4a-446081eac4a5@gmail.com>
Date: Thu, 12 Nov 2026 11:21:52 -0800
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
Subject: Re: [PATCH] MIPS: SiByte: Add missing sb1_cache_error() prototype
To: linux-mips@vger.kernel.org
Cc: macro@orcam.me.uk, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 open list <linux-kernel@vger.kernel.org>
References: <20261110223651.2698860-1-f.fainelli@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261110223651.2698860-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/26 14:36, Florian Fainelli wrote:
> Fixes the following warning:
> 
> arch/mips/mm/cerr-sb1.c:165:17: warning: no previous prototype for ‘sb1_cache_error’ [-Wmissing-prototypes]
>    165 | asmlinkage void sb1_cache_error(void)
>        |                 ^~~~~~~~~~~~~~~
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

There are many more, let me squash them all and resubmit.
-- 
Florian
