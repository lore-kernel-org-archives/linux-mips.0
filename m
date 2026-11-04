Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816119;
	b=3OgDES9reeVVmWY5tHEtsnqCAWrgdf1+wrfhwH2j87p8h4+hYCLfckLBeGSu5ldUXl/t
	 wRCDXUeFO3V2wucmeyGcqGQ3H1+mFATLJ92QtKBZ/66ZOwpvx11rQvRkL9lRH43x55ovh
	 o7VTIidQLCUjB3f85nhdSOsccfLHR/tvdCVqQbvu1R4kxM/NhxgwJEOPsnuBsaUTOeOe/
	 sa1MJ3bEEtcZgiWg3WqO03eq2ibx7d4OGqA13b/f8fcXAV1NZ+WeYj5MEZM5OQ8JZU8O/
	 JxoD7iJcpzkbknwSy3CsHyyqzcJ5EoL17uLbVyxIta/O61ePhcc0KudHsBilaL2pwuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816119;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=3gMaAWh6NQk15R7de3+ypmCGtyxD6uFeXuRwji4RdbQ=;
	b=jwd8v15VjZW1X7y4Dynj2vOFbNpoqUiu8eoQMhy2ZAKvUQgHCJuZH9ahDeEbV4UyjRZW
	 DsHNcoZHcdT6vM6uw55Lw5QOKcHPoRwkonGRweClZgm3ZLzZCR5zRsLraUuSAUD2vLeDE
	 L3pHZWuwWEFZl5mP2IFO0TkvA8kSL4YQSeHwloGBnhB9XzkXNYFrgxhsqj4PaKgcqjK6g
	 vrT7FE7iBIAFdh1FlxEjL6cf9pe8FPM+3kIQhgkXfStFTLLljOSvkPzA7ZlsN5Uy75ajm
	 9FflqkcgU3qj6s40ocBW8GLWEFrKIZlA2n+/ne+PaWi94ltWP6wSeTqjEsMfcZTCFJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fFU22zeE;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B09D606A326
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 18:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B09D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fFU22zeE
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso514205a91.2
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 10:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816118; x=1794420918;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3gMaAWh6NQk15R7de3+ypmCGtyxD6uFeXuRwji4RdbQ=;
        b=Enz9zbw1DoQQdDk5K+xab2aXPMAJN23zyJUyTBmr5MsvbdrllKXEYEF/oM5MPOgbmC
         z0ZKKJGzouJxCqBF4RPCIQFZ1ERjNjB7J8mNOoCc28HTubLbn2hkep1iEE7FcJHIlt7C
         6sc7Hq6epF3OUQUFswBfjlR0zXn3kwvY5k3FGodutGRqJnTE0bY9jExUZrdaEwHw+uo/
         ZAXnNPGKlUWHQN+TcPvCoj0gz02e9LzRtXVgfw0Oz31c2RbycnWG84AnyFzNjHTUw2RU
         Diu9dnlW0v1/MTDCSR+xTx2GCEcwOqX9Lk57ytcZbYMES3NpvBUxHjnIfLucrj2Al5bT
         6p1A==
X-Forwarded-Encrypted: i=1; AKwUvBzih17SlmZ3wMknlVW/XP72bAHPSoTewhnJQ7EVnQzKg4TKQ7PsaCkjGoyqyVaLgNJAPPNahy1FJRkh@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ia6xr/QfVJB6d/dj03YyHUHvhy72iVM+csliB6jDg3+XMInBH
	ThCzcLihrzR/JeOUnwF6xQY5V4H7aK7FAuE5UfBpfxEUX8ig+c2chDWr2pJ6HGH8Tf+qh/hs73b
	ct56CifFXbZ3F7IE3mIkgVk+OnSp3kKy9s+sfB54MvJ4/oH0ok/CIU2wDE1QFGvcGD0WDsjf0n4
	3BrGfCFeRc99mnYTOUEimwo/9sUHHebwkesvPEZpxnCFoNB/HuErQGuIa6JbxiTmr7b31+OR+oh
	EpsuVyrzhDk8DUMkigKxl8/
X-Gm-Gg: AYBFou156+/r6tAT8CxHMeEhJamoCc4Lj2Kmgis8iy1CIVksYfI5qvqE0Io/ZbLPsOy
	uvMtmCzJU/SllOOaH3hUNg/eUS+zfuqc/aAczVyUyoRRT4ks3poNHeEQ7MThKDHPWxEAo18LQzz
	ujHJxwFutdXbPT3y5NbNuhG3sDdg6ezxQe0eJHfKd4SUEhH2bvsoKzk0smA7hOaFGPOeP+TZnv+
	WJ4OMV8u52vTV8OT+Bcs+MkDEGIHkD8mBojf153nUlF5mBAElvxZLFend61VTwwXShaKNZ4S5uT
	DWkUm7CvL7ISCwk+MblctnHRXYzTJBXPsaOi9wkOnxixUQBxS5ejDkICnrTtXs9XJEW5toq4AFl
	bgGLk4zQc4DTw6rfFAbu9/7FV/D6KxACmt04FefiqE4OI67sXJyf7UrlJO+szJYpXHuNyAHyWFc
	M988Z5Lfeuk1UxinPRYYQ56Me+CpdlEZ+hTrGbpiIw
X-Received: by 2002:a17:90b:5111:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3ae897f5b58mr13245577a91.30.1793816117835;
        Wed, 04 Nov 2026 10:15:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0b327b8b5sm36299a91.6.2026.11.04.10.15.17
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c71966998so13808506d6.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 10:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816116; x=1794420916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gMaAWh6NQk15R7de3+ypmCGtyxD6uFeXuRwji4RdbQ=;
        b=fFU22zeEOUr9v1KGFgGKhFk6YuxSVedNvOcme4Px9/eBMcFh9dKyJAPf/bi5voOqie
         EaG1Ce+t4FxlJ8mjQ8R/Sn/OWtj5BK9lrDsKVGpfWrPll1QDqICGtbrf1IurlCZK8qPf
         aI/hcSHaPEL5OjGxjizH0TF6X3Q5+uSGpLwyY=
X-Forwarded-Encrypted: i=1; AKwUvBxW1RfU/k3wPc7yJ5z6oMk1YHEBwWDkZCDv/z3P922VGrqk1833o4DFhshWBCn1jEz+Dzlg35x23NVG@vger.kernel.org
X-Received: by 2002:a05:6214:8110:b0:91c:61e8:f9cb with SMTP id 6a1803df08f44-91e792ee5eamr60525366d6.35.1793816116012;
        Wed, 04 Nov 2026 10:15:16 -0800 (PST)
X-Received: by 2002:a05:6214:8110:b0:91c:61e8:f9cb with SMTP id 6a1803df08f44-91e792ee5eamr60524216d6.35.1793816115094;
        Wed, 04 Nov 2026 10:15:15 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dfba098sm25119636d6.12.2026.11.04.10.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:14 -0800 (PST)
Message-ID: <675d9836-4958-460e-83e5-159627c8b0de@broadcom.com>
Date: Wed, 4 Nov 2026 10:15:11 -0800
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
Subject: Re: [PATCH v3 2/5] bcma: scan: support big-endian backplanes
To: Alessio Ferri <alessio.ferri@mythread.it>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20261104-bcm6362-wlan-v3-0-e46562b2ac12@mythread.it>
 <20261104-bcm6362-wlan-v3-2-e46562b2ac12@mythread.it>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261104-bcm6362-wlan-v3-2-e46562b2ac12@mythread.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/3/2026 3:30 PM, Alessio Ferri wrote:
> On some SoCs the bcma backplane is a big-endian peripheral, so the
> ChipCommon ID/EROM pointer registers and the EROM itself read wrong
>   with readl().
> 
> Add a big_endian flag to struct bcma_bus, set by the host driver
> before bcma_init_bus(), and use ioread32be() for scan-time accesses
> when it is set. Core register accesses after the scan already go
> through the host ops, which the host driver provides with the right
> endianness.
> 
> Nothing changes for other devices.
> 
> Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

