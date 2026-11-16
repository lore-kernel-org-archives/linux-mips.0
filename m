Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870790;
	b=JgdKjukA+WPc3MCrhVCn1SskiwAwn5YLNJeNPW5W1UYHNZCeQsh9gjCQH+DwVUhI+cVa
	 6W2y9f0PECsD2M+HSg4AYnUcuAAPE1HVdVC6kWhbop83W5uqQSdYtHL1ItaywUfcCcQ61
	 XpeXCAs48dcTeWofpluzP7ZALkQ6vQMPf+ZrJQoZzqqBVRYKJu2l7z3VJNpxvk19A9pE5
	 8TGbVF/75y3Qz+UCRadceoRUh+H4Oau5DChbCyyps6ON8x8xwGekkNtCODLLkvV1dhTDS
	 lkQl+A8Ib6WidiaxagwG0Je3d+BXFbJGws6n8n9VHk/mJDRhpMZH2/fNm/Cz/7yrxIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870790;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=39KnhmpTvzW3NJqrAH4c7S3DWPwV9FJJvA+CtiAQvpY=;
	b=EOgHDXlFiqTx0v6+i8bV9JjtfYpH0aKfvQIyhtH64CrfJhxguQgkh5HYRD5bLKqVY4Ac
	 BlA0xko4GXp2bWpq8m6RpeMHHrZYdYCbqF5bNev8GAna32e8nsrqKXiVVC5Te1axUrMno
	 l9AbERv1cpllw67xMcQF2BjdSM6vaAtKm2Apy3wx5bkzqmY1MTI3tt1lXzcP3XTXF+ysz
	 +R3kw10yExRHVkfmyzvXe15MAzrX1CYKIWMOsV5OUcexRIjo/TMY4u7fwkMb14qhaXktr
	 rmffOy/0rC5kZT6r0wZrDscRx/Iwqe0hm7U4qG6uam1mFDs+sRC5/N2VTEyQ2AGkSBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ks84OXuH;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B2A606A323
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 23:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B2A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ks84OXuH
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cde1479f76fso12706a12.0
        for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 15:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870788; x=1795475588;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=39KnhmpTvzW3NJqrAH4c7S3DWPwV9FJJvA+CtiAQvpY=;
        b=ZktxR7Ix8rwsj2oxryU5Nv7phUXTIjlJAhrXYlTSIpAYC5qtUCH73Q4RGtnEQ6sTvU
         o4fe10Vft31a4W3VbxWKowXhLiSgP9hJwmS0GNh573kwhe76LLR0pgIfjozOn12tBtq9
         iR7tEV7aroieF7nGwSYBHx1naQBXKZqlUgRnZEEqn3lG3+W4YWJ/mABbc9AVFWoOP1Pb
         Yk4WjZ6XoYyS4guPpXmRbrltXcmwVcsqkOLAYPwayNpTrPQijiYfA/9HGlvJrIv3uZfD
         zSwTm8DaUSqYgRZwzoiPRObM15s2/91jMspKht54McLpsWcmSZjXTSdU5RW+zdWB0qvQ
         dOag==
X-Forwarded-Encrypted: i=1; AL+hErGT1qwumAnXYlujZpZm9ELDO9/TufVgzsDKGfXAEvE0KuBbH88DhjmeVYuOFk/8p+SzI88GnruUkrQ8@vger.kernel.org
X-Gm-Message-State: APuU4Z8L8s+wFu2PCJXK0fNJyH8eQp0jfSHIwkoCv3fx3wez6x0eOQ5E
	INzlYcsqMs7j9dyMuWG/ULjuMaO2rkOpo+cIjPsVdSV8Z1TaZ5r0vY8/65xQPiFmwbGCYEjRzq7
	7DLzcw+RBgLhyPZnB2gD0TVbBR/s8Qp6tf9Y3rOgbwQe+rH9vRFw3enXYzfmV99qXhqq4QZUOfR
	rBJxRRzwCRvkYekygEBQAbxUpyJOMderDt6k+Y7kpjc/3bxYGKAlFZ5fnU86N/pk6y+XsjqRxDw
	BkRREK/ZQIokG9SAhle2Q==
X-Gm-Gg: AZFdTZdeKNXvgsgftDK3QvJBbcays2++ya3hePj5+kz2HhlTusL4opT5e97FjJLdw+B
	GoAaq/oatIQY92UuS24ceUGq+ZHZ971UwSlppQ9VCwyCn77Y4M6+qJyHouGPZLplN9PCFBntBsv
	pXgNsy5Uw8LyZ8OxPUhiV+xf2FiHmysqcHVO79mrIC1Qep8CjgONk+Kk4UEfeRGlYZCvR3PCGWf
	3+49xD6K3LT66wIKmsv3yUGKlxmAu1ADAXV0JqVgfc8Ao2RUCAiFf4VZSo5EIqPMLwzPH15+3gW
	p/3a6g9qFwpj9akD0choW+wdBOL/Dgp0346vgB6BNhFO4DaoTSF90mLgEMkC9+DJHTIh7re8HWl
	5li39l4AaiPfo4BDLw4BvVuZCmg+RlZGgP/Kzw2B7Y+HlIRHEz+CnhRyr/C9iC+G0pIg96EZG2s
	02bVuj96x+5DTFnBW9t6xrFZv/9QIXlyaq/2MjiSDB
X-Received: by 2002:a17:90b:3c4e:b0:3ac:8ee9:c8ed with SMTP id 98e67ed59e1d1-3b1b0b667b4mr11980606a91.13.1794870788384;
        Mon, 16 Nov 2026 15:13:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abceb007sm551480a91.4.2026.11.16.15.13.07
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:13:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920f97bcad4so10599346d6.0
        for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 15:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870787; x=1795475587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39KnhmpTvzW3NJqrAH4c7S3DWPwV9FJJvA+CtiAQvpY=;
        b=Ks84OXuHKcDj1m0yqe2j4zQcIXuj7e0bt67frusWZUnW2uI2jckkhYFxJvypHWImpV
         PXMf8rXIHKj8yjqz5p8qurErMp8qkmaRM7uuRBsuBNBmJAi3WkvGrcHOY+QtOkB59qjp
         sH7wmu6bTin/bfJxp028Qws+PMsF4InONId9c=
X-Forwarded-Encrypted: i=1; AL+hErGDRQkbToQ6+IpRYxeaD2eqPczyAznwFgULf+SHkQ1LxgJrmyLjdVBOGcX2XYq7toCXkc6vdmOq454Z@vger.kernel.org
X-Received: by 2002:a05:6214:2623:b0:921:201:e835 with SMTP id 6a1803df08f44-9210201ebefmr2038346d6.27.1794870786567;
        Mon, 16 Nov 2026 15:13:06 -0800 (PST)
X-Received: by 2002:a05:6214:2623:b0:921:201:e835 with SMTP id 6a1803df08f44-9210201ebefmr2037266d6.27.1794870785971;
        Mon, 16 Nov 2026 15:13:05 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm96715216d6.28.2026.11.16.15.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:13:05 -0800 (PST)
Message-ID: <2ad1cc65-0381-478c-959e-9bee1a597110@broadcom.com>
Date: Mon, 16 Nov 2026 15:12:57 -0800
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
Subject: Re: [PATCH] irqchip: Convert chained handlers to guard_chained_irq()
To: Peng Fan <peng.fan@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 Tan Siewert <tan.siewert@9elements.com>, Eddie James
 <eajames@linux.ibm.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Caleb James DeLisle <cjd@cjdns.fr>,
 Marc Zyngier <maz@kernel.org>, Miodrag Dinic <miodrag.dinic@mips.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Qin Jian <qinjian@cqplus1.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Anirudha Sarangi <anirudha.sarangi@amd.com>,
 Tushar Nimkar <tushar.nimkar@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, git@amd.com, linux-arm-msm@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
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
In-Reply-To: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/14/26 07:06, Peng Fan wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Use the scope-based guard_chained_irq() helper in all chained handlers
> under drivers/irqchip/ so that chained_irq_exit() is always invoked when
> the handler returns. Handlers that duplicated the exit call on an error
> path or jumped to a common exit label simply return now and rely on the
> guard.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> With [1] now merged in irq/drivers, convert the chained IRQ handlers in
> drivers/irqchip/ to use guard_chained_irq(). This removes the explicit
> chained_irq_exit() calls and the gotos that only existed to reach them,
> reducing boilerplate.
> 
> I use a script to do the job, and after that, do mannual checking.
> 
> No functional changes.
> 
> [1] https://lore.kernel.org/all/179417458323.2093942.14330197609841896598.tip-bot2@tip-bot2/#t
> ---

>   drivers/irqchip/irq-bcm2836.c              | 4 +---
>   drivers/irqchip/irq-bcm6345-l1.c           | 4 +---
>   drivers/irqchip/irq-bcm7038-l1.c           | 4 +---
>   drivers/irqchip/irq-bcm7120-l2.c           | 4 +---
>   drivers/irqchip/irq-brcmstb-l2.c           | 4 +---

For those drivers above:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
