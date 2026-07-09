Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2683E5EF8;
	Thu,  9 Jul 2026 09:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589263; cv=none; b=OZEcRPxO51YJnGKab0fpNf++inpbl562daMBrrBmOorl0lp/sBzvznE75yBUgJJI/JJ8uvWXBNdnDBlTgkYkLL1OTo0t1mOq6Lm2VDA+DrQgv8sODHXRehCPVryz9amGt1+MzTEUhqJ1Gtrw8P4dHgAfUSNxUYJKx971V1txu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589263; c=relaxed/simple;
	bh=QgoKajdPOdYb29ydfAhnL/M43u+U0YKRNYJk7pR7/0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9tg56uNErV1xWrQafgeghGaSK+cH4Y3MIw15EQEEYgLF8XgAHPjxCQQB1Z2orwUaQgWroZAmJfIkrUjccufhsISkzQL0u7iSmXRT33o/qudl5aqpTSC3Rmibr/JihNKrY9lNi4WFsbH95EnedRaa2MdOqWjXmqEUeMNnlUQpJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ABfMnAhW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ABfMnAhW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6730E357B;
	Thu,  9 Jul 2026 02:27:30 -0700 (PDT)
Received: from [10.2.200.62] (e119884-lin.cambridge.arm.com [10.2.200.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB26A3F66F;
	Thu,  9 Jul 2026 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589254; bh=QgoKajdPOdYb29ydfAhnL/M43u+U0YKRNYJk7pR7/0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ABfMnAhWZtzTFgR/kME8T2F65VeU9KoVPoBSn9xF3e15G/RZsL3ifIwKQAbLLTXt8
	 Iw0V0B0q6fNcR/PhkRBLB3P90d6jpe0sdnSJ2Hqh6neUaBVFlZIG9JVxt5jfPKupLN
	 OU76XjYRpWcLHlFim2cDhpEnOdx5BVAwqrM6dNcg=
Message-ID: <7767d625-ce36-418b-9bf0-fafe49963b29@arm.com>
Date: Thu, 9 Jul 2026 10:27:32 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] futex: Remove dependency on HAVE_GENERIC_VDSO from
 FUTEX_ROBUST_UNLOCK
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
 <20260709-vdso-have_generic_vdso-v1-1-d2e1061f268b@linutronix.de>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-1-d2e1061f268b@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/07/2026 08:28, Thomas Weißschuh wrote:
> The robust futex unlock functionality has no relation to the generic
> vDSO functionality.
> 
> Remove the dependency.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  init/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 5230d4879b1c..53178ea4bc93 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1857,7 +1857,7 @@ config HAVE_FUTEX_ROBUST_UNLOCK
>  	bool
>  
>  config FUTEX_ROBUST_UNLOCK
> -	def_bool FUTEX && HAVE_GENERIC_VDSO && GENERIC_IRQ_ENTRY && RSEQ && HAVE_FUTEX_ROBUST_UNLOCK
> +	def_bool FUTEX && GENERIC_IRQ_ENTRY && RSEQ && HAVE_FUTEX_ROBUST_UNLOCK
>  
>  config EPOLL
>  	bool "Enable eventpoll support" if EXPERT
> 

-- 
Regards,
Vincenzo

