Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816153;
	b=dAQ/VEM2MlC7Q2eMAch8spsnsmvKWAts4P5KjUJmHdgdJeXWSObh6T0Z8SfTq5pHy+KL
	 vM1go/Kt1cjAJeJgjPkwRtU6aC4+8Gb6Rols1S+62ZJbSk6fIA7umthnwFUwnz08kgmRb
	 hUOs/cjWxYOjkv6BZFex0a3GLXPnOemU8L/4vxWCKZC/u8oZbAf8cX/Ph/bAt1OEOqZC3
	 6vsL87syz4wBafX4Ll1DNIHjjpt5OxkazYQI9XaCGxNCfn//Qrt3k+edQtJDRle8Y8Y4V
	 tlW7QF/0VPbE1e8h6cP8ExzpKKQjPzpe5eUXprCL7a331m7vJh2drZ7vjwldb7has9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816153;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=F2zJEatOU4CyFqJt2nHtTite5aLEewM7QlV0X2jkmG4=;
	b=MDd8hu9WGbaM4DDsLXJDz7gkeQBgzkrMQg6HTbU5r2AuuSEVicoIP6KFJQU6MJTJKNx0
	 R2UYf1mY6gO6LvVXPNKHBmdS6WmaMuXmf73EkxxGomTsm2rqfcD56wIgbotrvAxdWgxsh
	 YUny5E3K0LZW8qRHLoOugAM9VoA+7r6jxQXi61h8QYt/3qkPK03KSzdt/G/uJ+SMw+ULT
	 p8psonc2vRB3/FW3LnJ8Lecp7hNVW+wPFeSknaYYoSgDooMWVpC/ME0DpXcYQhXEXERH/
	 9bvMFavhiG1QN5ew12a7iTz8YIVIb8QxMJpPafMtM0fNZwhgN1kYfmnon+VPHHhTpAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HL0miFsj;
	arc=none smtp.remote-ip=209.85.210.225
Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8380F606A31B
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 18:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8380F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HL0miFsj
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so547410b3a.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 10:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816152; x=1794420952;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F2zJEatOU4CyFqJt2nHtTite5aLEewM7QlV0X2jkmG4=;
        b=fL5MTxFKS4pCEmueP8WgHtE+Tj+YaFDB9L7GIJ5QKDbyzdNn+Af3G1kNyssONbbkrG
         7WvTyqrZZUAt/X9G4CWKYQHFXGbGGWt+KoTX1CFpZyRPwiZRG29ekaquhsSJUu14B3qb
         abvmpFLMJD1gzWadfRE0qD/ce51046n3EsiZourf0PxPNaWJOtMNMQaxvfd/IVDCIwll
         HjeAL7rb9xIhXSH2VDCKKCETgHfOCWdEPsP7yHiHfTWvUV7nueIUrD/v8hm87PjJWADR
         4knqCOK9PgUkr39wX7ley32xP+ly7pdUnJomjYEXlAXCQV/ZwmeaOKdHbEcWGXpRic/l
         dadw==
X-Forwarded-Encrypted: i=1; AKwUvBwejtQWDbuIoIJ7KiPz6V/5MxjrEemcneFOQ0xPpOQINHGXxTHtOMUe3dY82h1Yj6Bj0+dvQooftc66@vger.kernel.org
X-Gm-Message-State: APuU4Z/GRjUFSwgDZAOEUowPX+IsgkbIbRy/zkOLF4uKnGbu8rAgHrd4
	HeAzSCLOye9vCrrzKxdNapBSivrFqHsQdKXp6wsi8nXGqTSBxbIQ6y3L5vu9QMDKGuV8xC4MIme
	emOvuX7MxfcYfMUZdja5T/Lbd5/dV5Tk4Oh5QGlNsgOe2crcyGnVIJssYp0kcfwYMiqwRBGtSUc
	RmuTOaI4vMk26ALtgaDL8hyedPbstWtFTamWMG0WV41u2y6Tx7Hlbmpnv1UAZwFEVkro/bEtKuk
	CqfnHrlpE5nXhRdZHStgoVj
X-Gm-Gg: AYBFou23vmzzwF5d7iezeDqaY2NpGB3yxmGKo0EbYjEdeqYNUDxPoIdDstliDo5OKTR
	rMH8QnWKrWlUg9aB8Ik0gxQaeLT4AljUEIcpT/9oHTOOaia096Y3hUhaOHXOdWdi95X9ZuAJGVq
	LNKfHiWoUfPmAahiDh8Srrb9TWwkTG0cyoXviNdg0dJnOA+l9VCFTpJieK+KHvJrl3pCEwopCOm
	4VDsfy/zVs6p1MW8hFeXvpsqzlFFzfU3fWy+l22ajk5CtBz8EuOkwilBI9lX1iOM3f7fquYNFyh
	O3gGoWudCJPsAH2lKiPsbi46CRP6AKR92hjaU/K88kDVQ4ay/tAnGpjEKpwOybqvkwDVacI0XfG
	QXK/N9DMFNuUp0Tk0gDDuLJA/Ou0b3X2Lv1fMzCLmqmvKB9QCbPEayWzA0xALzAwEqemFSZa0l6
	/BHZ3N1mOvexMQCqBuzTJhUh72hrL0QO2sBvAhOnxE
X-Received: by 2002:aa7:88c3:0:b0:8a0:92e5:8856 with SMTP id d2e1a72fcca58-8b1e27bf7d9mr169715b3a.5.1793816151799;
        Wed, 04 Nov 2026 10:15:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8b08fe47a9fsm49391b3a.10.2026.11.04.10.15.51
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso2998870eec.0
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 10:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816150; x=1794420950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2zJEatOU4CyFqJt2nHtTite5aLEewM7QlV0X2jkmG4=;
        b=HL0miFsjjSv/CpcIZvjozOqslbWgvwdETERSoQyxZWMArhUne4FYR8HI7sww73FYyY
         EDsPzEWXEnYRKC7dWJ25onLVOA/iTK5NeNkPYcIKmzue754w8uaF2Z9gkdGEwoLgiAlG
         sY07/JG7OJiLR2TbVPHP+hbuw1eBoKWOvkpZA=
X-Forwarded-Encrypted: i=1; AKwUvBy0ovfWMLB4ON4neiAQ4W8Kxhm/Fnv5NecI0WFBBVowGks8zNwyXtDWhaxbIj75xmX7rJ0tlhRK21iU@vger.kernel.org
X-Received: by 2002:a05:7022:b881:b0:145:ac96:3917 with SMTP id a92af1059eb24-1b24f4d380fmr308741c88.21.1793816149688;
        Wed, 04 Nov 2026 10:15:49 -0800 (PST)
X-Received: by 2002:a05:7022:b881:b0:145:ac96:3917 with SMTP id a92af1059eb24-1b24f4d380fmr308704c88.21.1793816148953;
        Wed, 04 Nov 2026 10:15:48 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm10038316c88.13.2026.11.04.10.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:48 -0800 (PST)
Message-ID: <1113b8a2-70ce-40ea-b8bf-9a40c8116dcc@broadcom.com>
Date: Wed, 4 Nov 2026 10:15:46 -0800
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
Subject: Re: [PATCH v3 3/5] bcma: scan: accept wrapper-less cores on
 wrapper-less backplanes
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
 <20261104-bcm6362-wlan-v3-3-e46562b2ac12@mythread.it>
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
In-Reply-To: <20261104-bcm6362-wlan-v3-3-e46562b2ac12@mythread.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/3/2026 3:30 PM, Alessio Ferri wrote:
> The scan drops every component that publishes no master or slave
> wrapper in the EROM (NMW = NSW = 0), apart from a few known cores,
> because without a wrapper bcma has no agent registers to gate and
> crash. Since usually bcma is loaded early, it ends as a loop-crash.
> 
> Some backplanes, such as the integrated WLAN of the BCM6362, have
> no wrappers on any core. ChipCommon and the 802.11 core are gated
> through a SoC-level register block owned by the host driver, whose
> aread32/awrite32 ops emulate the agent registers, and core 0x837
> needs no gating.
> 
> Add a wrapperless flag to struct bcma_bus, set by the host driver
> before bcma_init_bus(), and accept these cores without wrappers when
> it is set. Other hosts keep rejecting them.
> 
> Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

