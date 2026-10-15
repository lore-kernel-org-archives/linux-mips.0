Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1889C3EC82D;
	Thu, 15 Oct 2026 08:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053015; cv=none; b=P6ZPlU/7CwIKxjYvsqHBKJW2y4ar56A6F4KTWTZll27bVfMyk78sn1xk2Q/jL7M0JQItUUFANof9qMIkdDDXN4sg5rQfXy+fY2+ne1G6I0Eb3wGFUgVGR+A/F2eGmxbWPHWRMwMgQ7bItQIQ9tWaG3WUglNvrOyCS5e+ffqYTTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053015; c=relaxed/simple;
	bh=Zk5Oxo9KgQ2tMQ1wDDO0h1go4gdEADQo50k+uaxhSC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJIfhJfDkAu0s1MWKS4vhS3a0vyptqB8YXOSNVvv+XbJv+EYxyQesAsJWVvYI9oHPyPP3EWH51qCmYCHaozE+LazU9oiNmzy4N7JYqc9SDa851LJFswTfV3oQxVomq84fXJUDjhLoQ2BjsNgYjPrKk7HvzLdzQIcBnoVvBVr0vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=GZCekg95; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="GZCekg95"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34BF959EA95;
	Thu, 15 Oct 2026 10:30:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1792053010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=iAfV/MGI365MMwVlzE37IrEkLbuMhd+nSRvCmw1vi+Q=;
	b=GZCekg95gW+TsAFzQie0UhzgjaZ/u1DyAYIQvifeR6Qh4uBYYFKrmi+nSxiA3JCxV5WOKP
	3KsDw3WTH5EPd3w8pj7dnGJOckYZQlo+wWfKSVtBbm+Jn7DQb5oJr7Ke3JyTAqYuoK3sQp
	whMTmi+SVnDf3K8SQNxpqyuaL8frgLDT20YNIGYOlUQk0qgKDSQiRj8dSf5VLJUhwbCoIO
	2TqRwGvKCmWrUeJj+EpoNWuHVMg6GYl8dUnRRMSTff6GONYPaz/mhprYBQKHYMdtbu8Tjw
	0UWTRcplJ7KQCQxn3hXALt0/Fig2Bc7wX89wKqDkLEMfJ7DhBuW1VpkGnvYtqg==
Message-ID: <77600922-a335-4bfd-a3ad-035a516ce307@cjdns.fr>
Date: Thu, 15 Oct 2026 10:30:03 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v9 5/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org, daniel.lezcano@kernel.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, naseefkm@gmail.com, robh@kernel.org,
 tglx@kernel.org, grandmaster@al2klimov.de
References: <20260918153606.344143-1-cjd@cjdns.fr>
 <20260918153606.344143-6-cjd@cjdns.fr>
 <5874ea6e-4e2f-416e-bcc1-851461c7308b@oss.qualcomm.com>
 <7108eadf-5dc8-4f39-beee-d748aa88e9af@cjdns.fr>
 <08095630-fd5f-49f9-b502-d5b2b33c60f4@oss.qualcomm.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <08095630-fd5f-49f9-b502-d5b2b33c60f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3


On 15/10/2026 09:21, Daniel Lezcano wrote:
> On 10/14/26 22:36, Caleb James DeLisle wrote:
>> Hello Daniel,
>>
>> Thank you for the review.
>>
>>
>> On 14/10/2026 20:43, Daniel Lezcano wrote:
>>>
>>> Hi Caleb,
>>>
>>> with the help of a LLM, I got the following two issues with the changes
>>>
>>> On 9/18/26 17:36, Caleb James DeLisle wrote:
>>>> EN751627 is based on the 1004Kc which uses a different interrupt 
>>>> number
>>>> for each CPU timer. Support both this and the EN751221 which uses a
>>>> single percpu interrupt.
>>>>
>>>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>>>> ---
>
> [ ... ]
>
>>> The binding requires four interrupts and two register blocks for 
>>> EN751627, but the driver sizes its resource arrays from NR_CPUS and 
>>> rejects DTs exceeding those sizes. Consequently, a UP kernel 
>>> (NR_CPUS=1) or an SMP kernel configured for two CPUs rejects a valid 
>>> EN751627 DT before registering any timer.
>>>
>>
>> This is a fair point, and I suppose a reasonable thing to do here is 
>> instead set num_blocks = ARRAY_SIZE(econet_timer.membase) so we just 
>> don't use the other blocks. I can send an updated patchset with that.
>
> IMO, econet_timer.irqs[] and econet_timer.membase[] should just be big 
> enough to store all nodes without using NR_CPUS.
>
> Given you have num_irqs and num_blocks, why not just kzalloc them ?


That works for me, I'll re-send it like that then.


Thanks,

Caleb



