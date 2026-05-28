Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE463BE621;
	Thu, 28 May 2026 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984308; cv=none; b=CaAjKh0cxhLnwTnK3dhlKJTUc1bfj/xkLZtktVtCJp5kkv29aB6rsiKu42PI1OXmXE4sguXiQVwH25JeCIStWoqQpvdyWh0DfOQh899IkV2ZDfxtF4V6KvfQX9NHaq7Y37i1q2cn5xwIQ2vUYOR3sOSECK4E68jnlQuVmM1BBBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984308; c=relaxed/simple;
	bh=5vUYFQQ2uwiuNQzGqZiulkmjLJASQv+IxIJBIykDOfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OBk6HQOQSjnPffNRRri64Vv3YLzw7eU3QSLi0tWciYGdcFJl6KRO3m6ZoBxZ44ipOI8drNagiAzCEInjxB5yynKgPRxE1WcztsCu+xuSkpOAcwhIPJAvU70wJNBM4hQECyhYspZPdopDMzGG9XBm4XVkW+gIkw6CwUGqd0qTYaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Uk4thqEJ; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Uk4thqEJ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65CA84B7A1C;
	Thu, 28 May 2026 18:05:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779984304; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DGCAxovR8cQXSZk9VAMwDAmb6Tt0PSEHhUnSGPFAhVs=;
	b=Uk4thqEJgvJEtDQQ+JZA+/ZXWG4SWpoio+PeSnOPZz7Nl4ivC9ojVPYBCk6/uomRo3QKtU
	JNqfr/IXo/6fWpfkuJYOgdDCkb+I9rfgIBFlGMknpSJR/m5wKqmkFgdFpWpE8E90SjP8YT
	0jdhRjs8MLzmj1KG2AZf3rSD38Y7ZwJy7ynBIJyqlKpzJVN/eNVUOCZzddX/7kLcdA+KhX
	cHi38+hAQUjNgICoF1qECp7XAyPZqqUSQegSZduOxGwnnacUnbvVhPkPA3KkocItMnZpVB
	qF8qvjNXtG1C3iEcZIWSdUxuITYHAMSav6u0qVzFebYKDfWqkYPholwF6jaYcw==
Message-ID: <d941faa8-53fc-4159-ad6e-447a3f98a60e@cjdns.fr>
Date: Thu, 28 May 2026 18:05:02 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] clocksource/timer-econet-en751221: fix refcount leak
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>,
 "open list:ECONET MIPS PLATFORM" <linux-mips@vger.kernel.org>,
 "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>
References: <20260526184105.18962-1-grandmaster@al2klimov.de>
 <20260526184105.18962-3-grandmaster@al2klimov.de>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260526184105.18962-3-grandmaster@al2klimov.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 26/05/2026 20:40, Alexander A. Klimov wrote:
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.

Thank you for this. Since I have an open patchset on this driver, I've 
integrated your patch in v6.

Link: 
https://lore.kernel.org/linux-mips/20260528140046.2897674-1-cjd@cjdns.fr/

Thanks,

Caleb

>
> Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
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
