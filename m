Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4113A2C11CA;
	Thu, 23 Jul 2026 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769001; cv=none; b=bDd8HZwOnKG8awGpNI60m7rnMV7iyr8kbppuO75D/upcXhww7mwSVLpWeuCfUnZz+4PJF1ESqRUMa3gSR6o07RnQsaDpzVlXTHNnbngSxLAyPSTK1OXO+BWQt1bEwMg74B8BpTM8PAopaHVrFHfCerXMSYlS98T0wZGaReJ9WYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769001; c=relaxed/simple;
	bh=3e0OXuLP10kVZpL6TBceoaQOowYfgH5M46K/xPqU0rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0oBu/Qqr/03axg33rIa5HIxHc0y7TglUiaUIwrXLvrZTe+VN4Dylv5DsSRpkdok3qRTwcpscO5zWY1GtS9s5XW/DNUx0n3qiTdlOnbXVjNrcq62aoBCpYoGo0MNCNbOf6L2eaDePrHMXbv0PSzHUUvdHjlpDPnaTgwQuAVaDtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=hBqXt0Bh; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="hBqXt0Bh"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA35541191;
	Thu, 23 Jul 2026 03:09:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1784768988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=RYHgZ5W/7cRGW53gN8/LTD+3Yndd0KY178wo1ydfFQg=;
	b=hBqXt0BhNYYPwQL2JwELR4SIEZT4S/3MV2VOGQZLwaVw2194Ukvm+Q0NR8EDInjY7F1IoY
	nM6yxzQjbYVU8VXd0uhqXQvBF+NoxeROElgsK86yD5UtGTUaJw9cx9N/PO4P0dr0y/8tXC
	f8gNpW1fjrVnS98S/h5XTyWWW7hqxllLHjV0/kTW+bZ9IOsGm+LvEmvBI2WcCwekNCBBwX
	r29CwLqC7jvFWD7t22vez5XsWpDQycPuw1eLC2Dt22nEnpRcAWRhNqOnvfkbNAFQZsmdap
	zyQgAzYe0mYc4CbLaguIdKxOixeSEK489b6If/Zz6CRLejfbziyiu8Rpr3CbOA==
Message-ID: <05b6aa37-dad4-4b72-a999-dc06e9582e54@cjdns.fr>
Date: Thu, 23 Jul 2026 03:09:41 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 09/16] irqchip/econet: clean up VEIC initialization
To: Haofeng Li <920484857@qq.com>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>,
 Haofeng Li <lihaofeng@kylinos.cn>, linux-mips@vger.kernel.org
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <20260714132453.3302672-1-920484857@qq.com>
 <tencent_880FD85090AE06087ABB6451DAE1F77A0309@qq.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <tencent_880FD85090AE06087ABB6451DAE1F77A0309@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 14/07/2026 15:24, Haofeng Li wrote:
> From: Haofeng Li <lihaofeng@kylinos.cn>
>
> When cpu_has_veic is set, econet_cpu_init() failure returns without
> tearing down the already created IRQ domain, ioremap, memory region,
> or parent IRQ mapping. The parent interrupt-controller node obtained
> while finding the IPI domain also retains an OF node reference on both
> success and failure.
>
> Drop the parent node reference after the domain lookup and route VEIC
> initialization failures through the existing resource cleanup labels
> after removing the IRQ domain.
>
> Fixes: 2ee2a685ee83 ("irqchip/econet-en751221: Support MIPS 34Kc VEIC mode")
>
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>   drivers/irqchip/irq-econet-en751221.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-econet-en751221.c
> index 2ca5d901866f..f6f890b3f881 100644
> --- a/drivers/irqchip/irq-econet-en751221.c
> +++ b/drivers/irqchip/irq-econet-en751221.c
> @@ -378,6 +378,7 @@ static int __init econet_cpu_init(struct device_node *node)
>   	}
>   
>   	econet_intc.ipi_domain = irq_find_matching_host(parent_intc, DOMAIN_BUS_IPI);
> +	of_node_put(parent_intc);
>   	if (!econet_intc.ipi_domain) {
>   		pr_err("%pOF: Failed to find parent %s\n", node, "IPI domain");
>   		return -ENODEV;
> @@ -459,7 +460,7 @@ static int __init econet_intc_of_init(struct device_node *node, struct device_no
>   		ret = econet_cpu_init(node);
>   
>   		if (ret)
> -			return ret;
> +			goto err_remove_domain;
>   	} else {
>   		irq_set_chained_handler_and_data(irq, econet_intc_from_parent, domain);
>   	}
> @@ -468,6 +469,8 @@ static int __init econet_intc_of_init(struct device_node *node, struct device_no
>   
>   	return 0;
>   
> +err_remove_domain:
> +	irq_domain_remove(domain);
>   err_unmap:
>   	iounmap(econet_intc.membase);
>   err_release:
