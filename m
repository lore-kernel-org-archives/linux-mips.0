Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816226;
	b=tumkUl/aSkwIpvRna1VcSFtjC12DtXyr3HYcMFbsRZYGuwD51+hDCeRvNrn/qH/ymk08
	 8Grk5PJuhlzqY3+tCm4/3h0Zq0d6h60Mu4lUHJ/q7lC4kMW4R8v+UatzUEfroGHkZsPSa
	 BC+g8RV/ugc4H64oFuPqQatjVUk2DL/CKc3hDMKQ79EEfNHNmWFjJuTloi/7zF67mavBJ
	 z7jdvktj7RdKwh00jXApltjjVsYlF7CDRFyB9Y9QezofKxVBED41FUWL9Zg6QwsouhHXs
	 5VZzLuWBfXyMJ/EatZwXWbgPZtEmdfxCYx/DTBryHO/3HAtojasUh7y/MJYqXLtnWGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816226;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=bLtDbnN1VHE+ADoqLmLIlJzENxx+1wvCpI3fUOziHnM=;
	b=x9BFLo1Oq7VTme3xftreRWtWO9QyE43qDilLd/QhcLQamM2B+9FO0GsVB4c2SwhRMemc
	 45r7fCnPgzW9On+O2iukHtxgN8U+WFZUROKiHevrhLi9ftBSpjjomnp3wzN4aRROYB+n+
	 QAv0qHNgI+VxsYhguL+KCNsezzZF6CXuLRB+hBmNKseLitnR2NC7UFhL1blsDyfLDInHi
	 eN9SKFR33kdVzQDqJQCGHK6RnQp0WiCwCcaMIjo+A4j2DW7wXLgjaaP7PeUBRNVL8+gUj
	 uk+JGchYYk78I4BvNKspRvwD9jBbfWCiah3Wpj4zh1ou7ceV5iF+dEi6tUbpRtOk3MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hcQnItgw;
	arc=none smtp.remote-ip=209.85.219.97
Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BF2606EEB7
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 18:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1BF2606EEB7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hcQnItgw
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-91c60e30054so10715376d6.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 10:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816225; x=1794421025;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bLtDbnN1VHE+ADoqLmLIlJzENxx+1wvCpI3fUOziHnM=;
        b=jCNRaTJYKUmAOtEmxSBtv+yBBrmm1myhtKRzEGSRXv8hRFG7eEZJWhSTmJWrWYSQQ1
         IjLHTfIkSnLmawDJR79HATsu1O1N9FNSz4bbcIA/Gvn4e0vPjyWxnKVtAdiayusUnYeV
         hfVbpKWpikogn1Ty41GF07v9CDZsgRjrnXcTDKAHCO7ypCKH/9EcfpYCLrkwKiv+ANqK
         62zkTrN6aIaUzAQhDbRoAmWCV2f8/GEz6hvF+Ukl6lbBtFWqKY2Oo/wajt+3c/++8Wh1
         ADoAJPRr/KdOXmKE2LtYxx/UIwTj+pV29mWz4N7d3LBRYOq3ggoG3mqKvMwlnth4FK/M
         1OzQ==
X-Forwarded-Encrypted: i=1; AKwUvByojNL9fLQbC65OdhWJGxYstROU1a8Or5dVqKS03khRNWt6yO5vh66wKY6MFDX5N6fSMnM2zKk4PEh+@vger.kernel.org
X-Gm-Message-State: APuU4Z+xnXRh+PFNcOQeImtrCZlT9DUvgIfpxUfjo50HiqmH4ozWOmy9
	8jsPvkPGxdFn3XNxPCM3EqJuuj5WSrJDjPch2e9pyotU1blr6GoE9JcNbFx2fpQzVSy7rUl+Ijo
	K8sBtn0ro5F6dZN/JLpUlTIvlFJVLea0X27E0kinYUu5a61OjUko+xuUJQmqfIUuo3oytYzsa9V
	sP4/WR9rp/SMuBH1Fba0L2iV6dy73pa3Su3iakxMkO3JWFnVzbBwJPaHzRyj9HF6BLv3Swq1ex/
	Ux5+gi/cp4dNGUuVSx4rL74
X-Gm-Gg: AYBFou3UFOo+m9crgh8C7698OPacLbtKqvGqxA/jsgNCM3AOv12IiR5QEp5t1z4uyt7
	ctFp299Ii92SsXvOKwQSDwQ84C5KweSBuyzUvmz5tfyyF3CpcmfLQrdkwYaRNmRE7cVo+F4f4rs
	A8PhRDXeL7Y7t9VJ1RQ2aBidwrl6V1MoBkOVsKyExMw8oDL3/S/NAvn9t/5GCKlPASd1RKq49xO
	M3HSgKZ4siDjhP4N/QkgO834L3Di4xIg9mDH9yh1luQ7cx5euHXuGUpRqO2hZr/G7g6Bsgdsd+V
	rQD3iOTfYBhv8m6KWPovi7n0NLZp1262xVJRV8lLyK+JoxjJGq7B3TkkUgxgrHJEk3g5Vxsq7o7
	8kxd20+oAub0rYCfw2pXx/tpb7g1EuMCK5I0kqmCSdMUmoOpHqS8o1d1Wmh6Me6abWqm1Z5vPeg
	MyWOcdLxcnBibCinVcOopJWPLlO5/kuHpn7/+45jLU
X-Received: by 2002:a05:620a:3715:b0:93e:6283:eba6 with SMTP id af79cd13be357-944216bd491mr2962730085a.38.1793816224743;
        Wed, 04 Nov 2026 10:17:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91e7e7b6437sm511346d6.26.2026.11.04.10.17.03
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:17:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c7bf2d734so22051126d6.3
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 10:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816223; x=1794421023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLtDbnN1VHE+ADoqLmLIlJzENxx+1wvCpI3fUOziHnM=;
        b=hcQnItgw8S+799u1ibS6+lxx0vZ+BqHAOqDNpXOKcg1PT4kKVSw1cetu2S15UPs+av
         LoDWuud0E4DquEJUCu2s0/NmTmW10mPAZrBvuYPXz1nMDsXVR/oJoOwzgF/9KwpByfEv
         5BzckH0cK/8S8wMjatWpVFDDChqWZXceBVVWs=
X-Forwarded-Encrypted: i=1; AKwUvBygXySxRWu5DGuqUJQy5nNWozMm7x5y11q+gAkc6xreuLmy3VyvPoC4ECQwkieNBJi/duIpJAv86NVU@vger.kernel.org
X-Received: by 2002:a05:6214:611c:b0:91e:747c:f833 with SMTP id 6a1803df08f44-91e747cfbe9mr64271396d6.46.1793816223133;
        Wed, 04 Nov 2026 10:17:03 -0800 (PST)
X-Received: by 2002:a05:6214:611c:b0:91e:747c:f833 with SMTP id 6a1803df08f44-91e747cfbe9mr64270826d6.46.1793816222510;
        Wed, 04 Nov 2026 10:17:02 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e7146a1sm25250956d6.33.2026.11.04.10.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:17:01 -0800 (PST)
Message-ID: <ab9893c9-a874-4b27-b152-02fdef49ab33@broadcom.com>
Date: Wed, 4 Nov 2026 10:16:56 -0800
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
Subject: Re: [PATCH v3 4/5] bcma: add host driver for the BCM6362 integrated
 WLAN backplane
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
 <20261104-bcm6362-wlan-v3-4-e46562b2ac12@mythread.it>
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
In-Reply-To: <20261104-bcm6362-wlan-v3-4-e46562b2ac12@mythread.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/3/2026 3:31 PM, Alessio Ferri wrote:
> The BCM6362 integrates a WLAN macro on a dedicated bcma backplane.
> CFE leaves the macro clock gated and in reset, the backplane is
> a big-endian peripheral, and none of the cores has a wrapper:
> gating and reset of ChipCommon and of the 802.11 core go through
> per-core control registers in a separate WLAN control block.
> 
> Add a host driver for it that:
> 
>    - maps the ChipCommon and WLAN control register blocks;
>    - enables the clock, cycles the WLAN and WLAN UBUS resets and runs the
>      macro enable sequence bcma touches the backplane;
>    - provides big-endian register and block I/O ops;
>    - emulates BCMA_IOCTL, BCMA_IOST, BCMA_RESET_CTL and BCMA_RESET_ST
>      on top of the per-core control registers. The PHY bits of
>      BCMA_IOST report what b43 needs to hear;
>    - sets the big_endian and wrapperless bus flags before scanning.
> 
> As for the PCI and generic SoC hosts, the driver is linked into
> bcma.ko and registered from bcma_modinit().
> 
> Add a MAINTAINERS entry for the driver and its binding.
> 
> The 802.11 core (rev 0x16) is handled by b43 once a SPROM is
> available; on this SoC it is not stored on the chip and has to be
> provided. In openwrt i use 6362-sprom plus fixups.
> 
> Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>

Very neat, with Philip's comment addressed:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

