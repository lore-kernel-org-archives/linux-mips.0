Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB43321B1
	for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2026 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254230; cv=none; b=ecop2Fuo+UZdE8XNgHqmPbEJGMYfBLSqul0D50BbVKptK0EEKn+VYKasNCywndmeddfUbnH4qkDOekA43Lj1Niy3uZ/2ieluSutH8g/EuJaxc/6ANAauHfiVTztmZrGPOeyBzPYqnanK5L/Qk7vJ0ctJDlhfAzPL7kU1Oelobw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254230; c=relaxed/simple;
	bh=GKljBHDRRmg07Rca8fkUIg/4A4pmQuHDBT1Nd6497uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gR3sUSFPv+lXBBTtPPikNVZvsJkJeU8XKDQTAUagnpRQZzGJTTz5qb2VEmBcB23VtjY/U0Re9EmLZQXirDlxte8CbzSuvDIbvTX1u4o1/nPiBisKhHCAQn4xCpd9H2Glv3ii6zgL87JzhEwabfbM2Vq32aa93Q3QzZNl7tNeMPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=f2cRSkjV; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="f2cRSkjV"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2ceae1ed204so543205ad.0
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2026 08:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785254228; x=1785859028;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eEcBT0DqDFqRvEXW/LVtISbv9SdiNpotZ+Mcrmq9BAs=;
        b=FjjiUUND2IrwcsGJYzTYu7iK7WQbw4MyaPTDcCZa0a5AJeNvno2z4oTEPcs2s4FxEe
         30Qyfl1OCgAOIztJFZOwFoWBvZkZhZRAOPUQFzBw6kEyx6K2WDdyagXG/8eg2vI9bmjo
         8Z/Ix/dY72BoM6aQFoARTcERA595StsJdSSvDTBKZBqP3KuJanc3+elTKd2piWdsGE0J
         Y+gveNPZg0s7lyWo7Rb0O0Trr5InF+RpNIuv31Q+/pfJyzighXh9LfMMZR9Ovv/LZ/ym
         TMKmB0hiud6NKSq6k90JGFGNiaC0xUCjRxN5GUnplxc3Yl6Cg6+JEWplPSoR6nsFFi+I
         dZ8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrwnBKSQsXng5wcZqBLVUKBS5y+TPd5KxB39RYBUtPkmY08UysSZRE22r/sbg6KDTp7VfCB6eWOaYNP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm6/EbzgD4Cd4ZsoFhn2ZwSwF2B5fbUeC7LJONFJ32sXQHl3F0
	IP5X7iNKn6srMzTaT2VLhOkcnw7ZnuTLNyKqgVIoMonNlZzt4uxO1e7VJt3OTtO6NMB1sMCiGvL
	nOAktfzqDSujt6u15U9nEbkk7caAazDLflxjlE6nucfM4BNdnepGq4KAFX0qDiHdC+AiaUfgyAs
	69i9RfH3Z+KW1kib6FVecLPJf6pT1HVZ8X+6qS1scfaoEfhG1zxQYGXre3UNdI2drMMFClkf00b
	nTzZbYS7/bNwkm6kfRA/w==
X-Gm-Gg: AR+sD10edbLQW3H37ZTYsSUjGyC4Tpr+xlD+CgyBNQPBV89LfvfDXugPMF+VkJBqqky
	A5kcAQY5lOgYBfarMM/fEAO94zVGWHOnf9xEvLS4RG6fxh/lYugwJxgDs25GTp1t8mWxqrjIYlF
	lN/lTI4dSyeQRo/1ZzibZn+9cTx99R+jQuJJ9K2O3II1wgMmlNZdgLhEsbsDiC270cq7JdrxOy4
	Hc3MJy/m34zAGp47xLgelGOsSIYNjpoCGZu99NUo+9djGqiBwO0bEv7e5L8RyYwGIXFFry3j3at
	LmY8MUzdg4QKmITL6qrNyv+odJdCh/+oYqxLtZsNzQHghj94BVQ8u9shEeOHbkWFZ4KbzBvx0Zw
	gYe03O0jjNMGnD7XSaHt7d1xnQ8LsHM2+SxQiKh6SJoUkmT+Pb2Ogylx+PdSUCnWcO5xgZnNtoO
	uZZtTde4fnGOqxlGNBNqGH+sc6prYKix29WV6ZE5OS
X-Received: by 2002:a17:903:1b24:b0:2c6:a981:b591 with SMTP id d9443c01a7336-2d015c8768emr36813795ad.30.1785254228233;
        Tue, 28 Jul 2026 08:57:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cfde7c2b6csm10492605ad.50.2026.07.28.08.57.07
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 08:57:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so69241491cf.2
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2026 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785254227; x=1785859027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eEcBT0DqDFqRvEXW/LVtISbv9SdiNpotZ+Mcrmq9BAs=;
        b=f2cRSkjVIgUvSJdzgqBp6cmkNC93D7xC6F0/TsHp1JxnvndCaRapHLLeAPyobqhIFf
         xHu4WhgBek2Mw8pB0Ej5L++6PWef80YyOxieeIylHNLlGUjnR1YarYEo1h7ZfGOai2au
         TkPIesuWjerz/67Z5o6oExVzCtltTYPkB2qds=
X-Forwarded-Encrypted: i=1; AHgh+RpS99Ri00aIwMzeb+oVwhOVAI3PcR71C2Y8VBHe6ohyyo3oLkUgsj6Fp3LAT0Qx4AxanzZIpe5Qz2u+@vger.kernel.org
X-Received: by 2002:ac8:7f48:0:b0:51e:47a4:4851 with SMTP id d75a77b69052e-529d7056a7dmr29635781cf.8.1785254226836;
        Tue, 28 Jul 2026 08:57:06 -0700 (PDT)
X-Received: by 2002:ac8:7f48:0:b0:51e:47a4:4851 with SMTP id d75a77b69052e-529d7056a7dmr29635321cf.8.1785254226245;
        Tue, 28 Jul 2026 08:57:06 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2db86dasm596251cf.20.2026.07.28.08.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 08:57:05 -0700 (PDT)
Message-ID: <d6d9b8b9-ec15-4305-9072-235e119cf46d@broadcom.com>
Date: Tue, 28 Jul 2026 08:57:03 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] irqchip/bcm7120-l2: fix parent IRQ count error
 handling
To: Haofeng Li <920484857@qq.com>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>,
 Haofeng Li <lihaofeng@kylinos.cn>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Marc Zyngier <maz@kernel.org>,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <20260714132453.3302672-1-920484857@qq.com>
 <tencent_C245DB15F66403C1D9EA90BC06987A016509@qq.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <tencent_C245DB15F66403C1D9EA90BC06987A016509@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 7/14/26 06:24, Haofeng Li wrote:
> From: Haofeng Li <lihaofeng@kylinos.cn>
> 
> When platform_irq_count() fails or returns zero, probe reported -ENOMEM
> even though no memory allocation failed. Negative values such as
> -EPROBE_DEFER were also discarded, which breaks deferred probe.
> 
> Propagate negative errno from platform_irq_count(), and return -EINVAL
> only for a zero parent interrupt count.
> 
> Fixes: 3ac268d5ed22 ("irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER")
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

