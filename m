Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A7A37268A;
	Fri, 18 Sep 2026 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745542; cv=none; b=PGWh6uKreYJ9Egm891liU6N030OtUyJ+/3xaJNDtN8CvQRoaCvqrGxbXGMqsDjXIUeIhFarRtVhKG73wc6EvduopxsLqaWcs24MdgBlv7/tVlrZJ2zFQRYAodTzVPCQPLGHa7ZgqRz2eWm5sFmH+hiHatfQN6Rch/5pChm2dWz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745542; c=relaxed/simple;
	bh=bZ8AXXlYD9sXIfdcgepX3Hd3vPbuUeKyv/P+N2vckA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHoG+2ZYBe4KUwuH6UOmHFP4LV0udBYs0yAYtbHjd1T49J9yhduDpt1gXuS/+Hg4rCKQOGT2E6lttKAputeiCQq6o93m2SUu1YrKYYtiLAiQABX3VeZqX1w28ZSCwAnH4Dd+FBQe8UxLib5LbiezVofstbAodefJxsOcdrdOxog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=f0Gt58dK; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="f0Gt58dK"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 413ED4E0A52;
	Fri, 18 Sep 2026 17:32:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789745538; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=78Xl4FOWGkjZe5U8AYrjpmnv50fnPoajS40Eazd24No=;
	b=f0Gt58dKJjzn5H5F7CY7YR+vPs4b8OVJ82qMv1+i9xvlmYhZCbk5qpdleKz4kDly+sfAXv
	XPmcZ63PTjvGksuMy6PJi0KhNYNyH2vzPShE8q8LSxoWf91/UFbgxpvPPgIYYFgvRuHnZT
	r/qv6Y9lz1DCnoj3eL1d+krDOg2XVTsySlGVcMb4KcyWTVZ91v+J2gd8USQLeNVEDudkic
	5WDAFjQxOyF+BIldVEkuVet4ah4yDMj7LREKcVLSD4b+A/5ddFNRvc1tK//qF+KE+b3r5I
	TIkg+evU7qYGsrEDahdAefUKkyXEB5JVhnecrcpJ3k2g6RY2uO5Q5xPjUNjTgw==
Message-ID: <d6ef5254-8906-4c5c-9842-5a7402426c7f@cjdns.fr>
Date: Fri, 18 Sep 2026 17:32:16 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v8 5/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
To: linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org, daniel.lezcano@kernel.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, naseefkm@gmail.com, robh@kernel.org,
 tglx@kernel.org, grandmaster@al2klimov.de
References: <20260918152822.343811-1-cjd@cjdns.fr>
 <20260918152822.343811-6-cjd@cjdns.fr>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260918152822.343811-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

> +	if (num_irqs > ARRAY_SIZE(econet_timer.irqs)) {
> +		pr_err("%pOFn: Too many IRQs max %d got %d\n", np,
> +		       ARRAY_SIZE(econet_timer.irqs), num_irqs);
> +		return -EINVAL;
> +	}
>
Oh no, missed a git command before sending, please disregard :(
