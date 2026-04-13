Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAD83D8137;
	Mon, 13 Apr 2026 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089772; cv=none; b=E3IWFljn0VK9JvyQ4sJsI5QBb2nzeqt5TAj7G4bjF/dG5wScsrL0fm0Lzw6D61/1qjPKiT1QUPWOnqc8DRdU8BQJEzkMsmI1PWAmlHkuqs0G0H9UrAY3bFHBBwEDB45z1jAE+ll5IvJYBjDMP+dR+Iw42/jcWu7EBoWe6bOtSPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089772; c=relaxed/simple;
	bh=15HVRr9FxS7zuALkTAS7ae7c5cS7VQL2Gnqx813nRu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cln8nt+CCyFXI1O8YeJ+nhhm90c+mlNRio5BLNkHGuclSiyC0OuGHIqfyhnO7vBvjrt5HsZ1fGl0vGibtzuO1kgPn1ycKDFGCUJPeYTXbJ8ZQ4Q93dwn7b1RiVh4nmxKdVxyIKO9GznoGxIzqfacDdQz5/4MX3DWcrGcA/geA2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=vAqWeFdP; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="vAqWeFdP"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D63519C872;
	Mon, 13 Apr 2026 16:16:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1776089768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dDjfswQvvaWRNlZ37ECbTNWQHjOFehAi3h2ZA2ux8mw=;
	b=vAqWeFdPZrKKkFY0SIIySs8uOjXErPN6nbCPAv/6UdHLFVsJ8vkyN++K2XluZ21nNUCJwO
	/HpmVcGMpibr0ffg99vtP3bG7GrX4GYt9RUFySVXp7OxGqXJeeyyJzc0DC7ysM11s2HWHY
	xuXLfh4WajtJ1W1tv74SqFXRuJwjmqV2NMRLujWvA3ei6QCophgyiM4VWgLnFL+AVLVQcL
	077SyZKCgIakAst/y3OQqM44JxPZkUUw3mMYiLvzCcYTBOq6HbMECT+suHJN78jwXXIkv8
	g93TDo2oSD+nbvkuwsX0vFEyDI8UPoCUPByBrR9bKF5nrrWsV6vi5m57vli9FQ==
Message-ID: <b74f2951-4905-4190-bee5-f43016e8fb4d@cjdns.fr>
Date: Mon, 13 Apr 2026 16:16:00 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/2] clocksource: timer-econet-en751221: fix timer block
 mapping at boot
To: kpursoty@proton.me,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "naseefkm@gmail.com" <naseefkm@gmail.com>
References: <9Rwn4wIPxs9vc3ZNs2cz2TiRae-nX8aEihtdbFI1uMH5BC4KrwDh-70Pg2UbBsUTAB7ltbnSuVpGQ-fGz02o5XJmJRYhz9YIrzilyyiBdlk=@proton.me>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <9Rwn4wIPxs9vc3ZNs2cz2TiRae-nX8aEihtdbFI1uMH5BC4KrwDh-70Pg2UbBsUTAB7ltbnSuVpGQ-fGz02o5XJmJRYhz9YIrzilyyiBdlk=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 13/04/2026 12:12, kpursoty@proton.me wrote:
> timer_init() used DIV_ROUND_UP(num_possible_cpus(), 2) to determine how
> many register blocks to iomap. At early boot with VPE-based SMP, MIPS
> reports num_possible_cpus()=1 (VPEs not yet brought online), giving
> num_blocks=1. Only membase[0] is then mapped via of_iomap.
>
> The EN751627 SoC has 2 physical cores, each with 2 VPEs, giving NR_CPUS=4
> and two timer register blocks (one per core). Each block serves two VPEs:
> block 0 handles CPU0+CPU1 (core 0), block 1 handles CPU2+CPU3 (core 1).
> The block count is a silicon constant: DIV_ROUND_UP(NR_CPUS, 2) = 2.
>
> cevt_init() calls cevt_dev_init(i) for each possible CPU via
> for_each_possible_cpu(). On EN7528/EN751627 with 4 VPEs, NR_CPUS=4 so
> cevt_dev_init(2) is called. cevt_dev_init(2) writes to reg_compare(2)
> which dereferences membase[2>>1] = membase[1], which is NULL:
>
>    CPU 0 Unable to handle kernel paging request at virtual address 00000008
>    epc : iowrite32+0x4/0x10
>    ra  : cevt_dev_init+0x40/0x64
>
> Fix: replace the runtime calculation with ECONET_NUM_BLOCKS, which is
> DIV_ROUND_UP(NR_CPUS, 2) evaluated at compile time. This is the same
> expression used to declare the membase[] array, so the loop bound and
> array size are provably consistent. For NR_CPUS=4 this is always 2,
> correctly mapping both register blocks regardless of how many VPEs are
> visible at early boot.
>
> Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
> Signed-off-by: Kervin Pursoty <kpursoty@proton.me>

Reviewed-by: Caleb James DeLisle <cjd@cjdns.fr>

> ---
>   drivers/clocksource/timer-econet-en751221.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -160,7 +160,6 @@ static u64 notrace sched_clock_read(void)
>   static int __init timer_init(struct device_node *np)
>   {
> -	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
>   	struct clk *clk;
>   	int ret;
>
> @@ -172,7 +171,7 @@ static int __init timer_init(struct device_node *np)
>
>   	econet_timer.freq_hz = clk_get_rate(clk);
>
> -	for (int i = 0; i < num_blocks; i++) {
> +	for (int i = 0; i < ECONET_NUM_BLOCKS; i++) {
>   		econet_timer.membase[i] = of_iomap(np, i);
>   		if (!econet_timer.membase[i]) {
>   			pr_err("%pOFn: failed to map register [%d]\n", np, i);
>
