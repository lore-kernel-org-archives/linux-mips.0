Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123815;
	b=yV8ierhobyLXDcZ96uXX/iUPVEpi8mdjZiTKx7fzbXRuvBVqtES+61o3MlOW6FuHmY4H
	 Dm9qWNeDvk5Plo2l8m7YrJD42DZVYoydqG8x05J77ekhTtLzasLShMsSBzg6jfafWxjIZ
	 flQwJViKbUT5Hr7aQN2NuQd7Am8Nr+5ZXEHf1EE9VYX+/8UE/jqmtWZP+2EeVMW39Fhas
	 g1nqd0NBHsT4CidGKB2lXw542bo4L2ICN2rX26P2nLed2BcWuEzd8hQWEaECb6Dp6MCHV
	 cJLPBuuuSdxmVF/sAPf13l76cFujqqJ1oYm6adhaV5ubCw92DEc/o0tEjbb6Qz+UKZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bZCkyOUbNeF4Kl4kbrR0/5p4X2Znv7p8mjS6tvEl6ec=;
	b=ik5P/sq56WU1o3IS64ga8px2fh35reB54srZ79noO6ygt+F7BugIsVyplmnVMfmX+Ndi
	 QRYtuMcO4+tqe94wxB12zj12LF2ga9MBmyAXiylf7irhY0hmUWWPzrleayjt7wf2EJUP3
	 0r3gqAI8wiKsJcyBMoaAZVFcyt9xzmVdRckdMU/gFR7r1Cv+XmpoujoAF1fcFUCkov+L5
	 oUkmg74zDs8CtIZWeqjLhe5YKZJoT0NCfA5EUaeneK2NNYXIZkkiZ9d90yPGxotwM38V8
	 uToJe+RpWBPEwDU4q6W6O2FIKD9WoIc1O3xVRwQTBkD7NwOneSBckBlzzC1kkkNiPhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH7GKxig;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48909606A325
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 21:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48909606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH7GKxig
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3712b6d9843so143387eec.1
        for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 13:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123814; x=1795728614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZCkyOUbNeF4Kl4kbrR0/5p4X2Znv7p8mjS6tvEl6ec=;
        b=IH7GKxigraZ4rc4Prs2sDGZJNk9/dC8TClmzlcBCLRyOm75heF3ogQb45s814EiOja
         FC3TRuNvQqAfx/pOadDV1KhMegifhwn5KWNYqWb9EpnffIci0acksl5bEFlfV8aCpXzQ
         fBFwtMvHnPY3BBGfXeP+DHW3yLx3EqdxdwzmloSbSn58J47wdj1o0nnUnZQ8nQCw7dPP
         Ls3xAmeyBdOkuUKYxz9KV+/NPp532aWaPzRXvnWRW7EKoulmp+UlerlcctfTYJYrbzs4
         9+BRH6FSCzcceQqt27BN0lbYmdYf9CC6lNgCZSIcie+reZpxb16GpzegFRZwDfagy59N
         VUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123814; x=1795728614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZCkyOUbNeF4Kl4kbrR0/5p4X2Znv7p8mjS6tvEl6ec=;
        b=H92tw3qGh1HM6asWaKeRNMYCqu6MjHz0MQiiZV1YfJILeAFM5T4rRCpN3dn8wUYk3l
         EqpkN6zQFml/o7GHL9PauAWZgK6MnQL6ja+BDadY41SFui7bADUb/yuUE+Ff+P2oz2DZ
         hC9XXeUC8c+X98LPM8QFHo0MEKcdTgFWpTb0JiFrRZl6KKnVXUlR3k8Hz7FLEQjRYD0H
         52jyRIIiuJRCljVvAiuI+uDX5qq8BHrCs+l8ypCTIK0ikH9uEfr8n1gTW5ggfcygtcYR
         bUj0zXKr/+iddBnVIHXrLf8puofpNiGSsVUhAZ6xACjDkUc2vzL6698vDTxYcB7T36AV
         GP+w==
X-Gm-Message-State: APuU4Z+7tXMO0z7qyMGkahLV+Vu8xMTR7tGCH/Gh04qCMfFzsWWWbhK6
	SaHCKs37pcrRb1+A6ixnNjRPrRhKZsEYQZQ4oq4DVeNzoLXVYGJQ1Krh
X-Gm-Gg: AZFdTZdSayu4BrJ6ATwBilNPljpREpE4Ti2MQx4GUpnTuiSO99Z2B8DOJjFBSE+iClX
	qC0lT0W/LB55abvN0ScGSN3Upr1GtofhDqqcLlwkJ9zLRsFXQiKmAAIUkJ2HlMA5kYSzTXma+Sz
	lTV5MR3tN+tSb94f7mldn900Afpd98RsLlp1yLPIH1rnzEYZ6KzUsVdHVCbSwskmxNpnKUl/164
	ATks9YGZt8dgNfOhvx9wSBGadBT6CbV4vcGsycwkqsNwJxe/f2hKF2mgoV4EPqNBny9ogDGIl+a
	qs7Svfe+2zXPvM1Y0h8eOHc/5skj3AeW1F1Y33knTYaQGSURfD6BflJKReLjHbrOp8BZXrUPuLC
	81Ay4pH57ecUye/zhIFwT88WLCIJsj+drKpMlEywNhDhhr6/XNCpXDUHfBtvWN9xRCtc/WJt3MC
	dPMPa+463HtHwzzs839V8bvrDSnOOgdUADv6jNAPo1CKcKdevUn9nCqWRb/zXLLhjowsBQa98Qo
	tsLaJC79vpQ+IdzEXIux7DMjvKZiRfldtYGgT+xAiOdknDFbeZCIYdKzJ3P1KjR8Fr5OeFPZh+C
	MLx8mGU+KRLgyMkd5TtoVd43lAwv/2vc/VMDIpKrzoIi3KbB8HOxrqYEUA==
X-Received: by 2002:a05:7300:e9cd:20b0:36c:f88b:caae with SMTP id 5a478bee46e88-3857025cda6mr693592eec.22.1795123814059;
        Thu, 19 Nov 2026 13:30:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385675c9a3asm1145138eec.19.2026.11.19.13.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:30:12 -0800 (PST)
Message-ID: <75c6a1d4-8c72-4590-9c29-4218bef2a1e7@gmail.com>
Date: Thu, 19 Nov 2026 13:30:11 -0800
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
Subject: Re: [PATCH v6 3/4] MIPS: Ingenic: Add XBurst SMP support
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?=
 <zhouyanjie@wanyeetech.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Paul Burton <paulburton@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261113190836.470937-1-f.fainelli@gmail.com>
 <20261113190836.470937-4-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2611191915570.54328@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2611191915570.54328@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 11:17, Maciej W. Rozycki wrote:
> On Fri, 13 Nov 2026, Florian Fainelli wrote:
> 
>> diff --git a/arch/mips/ingenic/ingenic-smp-entry.S b/arch/mips/ingenic/ingenic-smp-entry.S
>> new file mode 100644
>> index 000000000000..290e23c65707
>> --- /dev/null
>> +++ b/arch/mips/ingenic/ingenic-smp-entry.S
>> @@ -0,0 +1,54 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (C) 2013 Paul Burton <paulburton@kernel.org>
>> + * XBurst secondary CPU reset entry
>> + */
>> +
>> +#include <asm/addrspace.h>
>> +#include <asm/asm.h>
>> +#include <asm/asmmacro.h>
>> +#include <asm/cacheops.h>
>> +#include <asm/mipsregs.h>
>> +
>> +#define CACHE_SIZE	(32 * 1024)
>> +#define CACHE_LINESIZE	32
>> +
>> +	/* The CP0 REIM register only stores the upper 16 address bits. */
>> +	.section .text.smp-entry, "ax"
>> +	.balign 0x10000
>> +	.set noreorder
> 
>   What's the point of making this code `noreorder'?  We want to avoid such
> code whenever possible.

This was in Zhou's implementation and I did not modify that part.
-- 
Florian
