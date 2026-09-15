Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F0C3B27E9;
	Tue, 15 Sep 2026 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477702; cv=none; b=RoI3c4GhJVhopVmZUwl8kt+PTpRooplE4RMjnRLXjGx5p60jt/KqYDlu47/UZnabNWLCj+GP0r5v9kuT0yzttNMm97X8Zp6phPCV71Qcm2ZI1VdS3skvg7lRGcDuGEWF+in8YDSBzG+KOFAu1r+vzEU/3eTWfzlUXtrqSNpMArk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477702; c=relaxed/simple;
	bh=z+MR1Dc1wbC8ST4U9pB9+tP4zmF0NEONUFEFBKMN+ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoZ0kvv5gSDAWk+nIQUuN58YCn/RHMTP3ZEjvR0zPrpM1aqx1vcxvKpTsSJdDx/u51adCqqc0R+sqFHrMDg+zY+RyXI1GHP4dYo4YlFVamOY3R+45QmYiCqFWfLqpQeROFj1N5myZe3QjGmDA4OCcIOl7sknwhUjSsbkmsZOIh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=peUqkbed; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="peUqkbed"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2A80480672;
	Tue, 15 Sep 2026 15:08:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789477697; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Ftg5Iunzg/0fG8qzH+8qTz1m6Yvsiy2wpFJvavKMGGo=;
	b=peUqkbed6JCyna0busplirVAk8kgpK4Ijawx7nppeiM9gedTg+L4hM7vbCRUGXTrlJzNH6
	hM/uQh9OilvGq+sjeC0uLPZVex+sYC50pskmXE9W6WHcAI55DpEiWJXhxXPzWfPwhSlkYI
	cbtyuUiL5ybRNkszHhvtv5BBz/PtpuMjtKCxgHpWPd47VkenTPW1P6QIIJbRrAknEZVHLV
	LaC/nClJlxJPruaH+KbCWybmhlb0oX6ZJzvuWqqyvs6tZwccRACpV7AnRXm4ZxmdI7dRN5
	+uYxR7uTa4qAcgoHbu5E6dUuXaxuFy2Y+QAFQMDq12e0hWSQHb9FCw5VJWEzEg==
Message-ID: <162e2a0f-b494-4149-a829-7813569975c2@cjdns.fr>
Date: Tue, 15 Sep 2026 15:08:13 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] clocksource/drivers/timer-econet-en751221: Fix clock
 reference leak
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: daniel.lezcano@kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, tglx@kernel.org
References: <20260915054552.1729612-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260915054552.1729612-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 15/09/2026 07:45, Wentao Liang wrote:
> timer_init() obtains the timer clock with of_clk_get() and only reads
> its frequency with clk_get_rate(); the clock is never prepared nor
> enabled. All four return paths after the acquisition (of_iomap()
> failure, clocksource_mmio_init() failure, cevt_init() failure and
> success) return without clk_put(), leaking the consumer reference.
>
> Drop the reference with clk_put() right after the frequency has been
> read. The clock enable state is untouched.
>
> Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>


Tested-by: Caleb James DeLisle <cjd@cjdns.fr>


> ---
>   drivers/clocksource/timer-econet-en751221.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
> index 4008076b1a21..1859335345b5 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -181,6 +181,7 @@ static int __init timer_init(struct device_node *np)
>   	}
>   
>   	econet_timer.freq_hz = clk_get_rate(clk);
> +	clk_put(clk);
>   
>   	for (int i = 0; i < num_blocks; i++) {
>   		econet_timer.membase[i] = of_iomap(np, i);
