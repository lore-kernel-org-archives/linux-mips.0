Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006D33D565B;
	Mon, 17 Aug 2026 22:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787004482; cv=none; b=f6aoTghOEw2QsTF3KfqH2I6l3V/NbXRBIXMesSJjZBg4JUyiZRTi3ukP0cy0TA9lDP7J0fvHjHOtQlTUjBWnn9oT0jiRbOd7h2q/b2SesG71mTkEyLabOy8VCBJRtXvK2VDo3X0tx/u0zabfHxf1esFoxCS5ZUa7Dvw+ROWbW2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787004482; c=relaxed/simple;
	bh=/pNhYh21CvM9TkTNpexI6W0Y/dNpQVuZPxhxNQHeC2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L8EY2t/wUug1/0IPTIo9ArIWocLz9pYSsuhpYY87t9y9GRQHxLh21KiQzbYz3q+v2R3YA6OGxLA9FNaX1ZiMg/xPfbHtRXx59Ek7HzNFF4svLoAP/4XizGh3kdcBw+byzInxJv1GnESg6BimUCxRMEpy2LVFc8DXb72n8BpSWfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=v1K2OUmI; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="v1K2OUmI"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F76735DE3C;
	Tue, 18 Aug 2026 00:07:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787004478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BgiEfIgJB7G6tmZiEolKtAFAjC/e7O/txSbmVdcgihc=;
	b=v1K2OUmI1KEvEvC/vSV/Y3aXFX+GoOOHLiQzgtsB7cArotb8FM14LPgJJnsLmmo6T5TLMX
	FNC21brH79AV/BHrlFy7goTdlK6mG1GF9hHTLMauJBAz+RRtfKtNIWtYKGG5sZoz7fb/SP
	QLvTZ3XkexLll6yrYbnxAKYGOfIZZAnTDO+rf8dC7/xB8nes+ssGryz7MWe/HSTZyrLqB8
	xcf3KZGk6LshkFqf1xucrWSUVM0ogegLydeZRrN+oKV9hcPiDjuDmC1QyTfJPAGjAiHBMV
	o/b1S7F8lErhLyD0RxrY4UibJY4pyXW63xdlkdOG6ogaEGdfTcSzw6FXQyC1GA==
Message-ID: <e53ff826-c4c3-4979-af5b-bb1a2c28767f@cjdns.fr>
Date: Tue, 18 Aug 2026 00:07:55 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2] mips: econet: fix unmet dependencies for ECONET
To: Julian Braha <julianbraha@gmail.com>, tsbogend@alpha.franken.de
Cc: arnd@arndb.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260815235109.666268-1-julianbraha@gmail.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260815235109.666268-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 16/08/2026 01:51, Julian Braha wrote:
> ECONET selects EARLY_PRINTK_8250, SERIAL_OF_PLATFORM, and SERIAL_8250
> without ensuring their dependencies, EARLY_PRINTK and TTY are met. This
> causes unmet dependencies:
>
> WARNING: unmet direct dependencies detected for SERIAL_8250
>    Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
>    Selected by [y]:
>    - ECONET [=y]
>
> WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
>    Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
>    Selected by [y]:
>    - ECONET [=y]
>
> WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
>    Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
>    Selected by [y]:
>    - ECONET [=y]
>
> However, in the discussion of v1 of this patch, Arnd pointed out that these
> selects don't belong here in the first place. [1]
> Let's remove them to resolve the unmet dependencies.
>
> These unmet dependencies were found by kconfirm, a static analysis tool for
> Kconfig.
>
> Fixes: 79ee1d20e37c ("mips: econet: Fix incorrect Kconfig dependencies")
> Fixes: 35fb26f94dfa ("mips: Add EcoNet MIPS platform support")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>


Tested-by: Caleb James DeLisle <cjd@cjdns.fr>


> ---
> Link: https://lore.kernel.org/all/59c5582d-6fc1-48d0-a5df-b3b6f58aa227@app.fastmail.com/ [1]
>
> Changes since v1: remove the selects, instead of selecting more
> Link to v1: https://lore.kernel.org/all/20260802161555.491549-1-julianbraha@gmail.com/
> ---
>   arch/mips/Kconfig | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index e2eb9627bd14..c3f69def2008 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -396,10 +396,7 @@ config ECONET
>   	bool "EcoNet MIPS family"
>   	select BOOT_RAW
>   	select DEBUG_ZBOOT if DEBUG_KERNEL
> -	select EARLY_PRINTK_8250
>   	select ECONET_EN751221_TIMER
> -	select SERIAL_8250
> -	select SERIAL_OF_PLATFORM
>   	select SYS_SUPPORTS_BIG_ENDIAN
>   	select SYS_HAS_CPU_MIPS32_R1
>   	select SYS_HAS_CPU_MIPS32_R2
