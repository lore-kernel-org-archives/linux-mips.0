Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531204;
	b=u5u8Mn/48I4NbxSYnYyq+8NJ6vK64Fpg4OQx888/T0423qhVxrv4Nw3CED2A53OXP7JI
	 vYu8FFznnnoVXME2hyohrm5AIfamkEAS6GZXVA1lkphrHwa7ePkW7LTx/8z63Tw29o7Mh
	 JyYIGtCxLDIOX1+54FgRpLm/DBitn2Ol5vjw2cmc1i6T2OizPbZpM5FWM45/3Zh+dWCBx
	 NJ3inl9dKiKqbFTEcROZ2HeVvaqYXygVDwS1xmSsFjkuBon0xUx5zaZNtpPg+elN0XfW1
	 DWhdNBqtTsy8QfUkLwXqJ1cipc/Jl0nOX4FOB14TgCjxFgd0uNsSw9e6nWy8bbKn9Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531204;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Z59pT3NHTzt1vGh6SEMvmIHQDI+TZDXO/yovkvk0Xo0=;
	b=e4SjSXIhqapN1kxecQ06Os8PMctkwPA8LvU8Q1eTrVXpjMIeOnV+HqFglYtFdgQcXe5p
	 Mo6crBpqpVF0EHbDlKvEQi0lxOR549QxZmRqckMuAObo60aPbvJHlOFPDy0cuSIVV7Dn4
	 BTCvpvhxU5jGx9jO0PdZgRnv1QMF6wDOdLjVa7WScIF42TUIj6TdstrCLzAu/nv29iyL0
	 MRZAU1smQvABCqrCLMYfjZ3///yNW8wZPHOaZiKSM76oDaCdb6SW7YknWuQGU3O/j7pnS
	 Y5dhxDYBTX3NKkjX1RvAeSOJ+pvuKvlP1qjYhjSEdhtXWLVvm3i8olSNyOniWchu/Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AUsYi5fd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4FFC1606A321
	for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AUsYi5fd
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5B98B1F000C0;
	Tue, 24 Nov 2026 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795531203;
	bh=Z59pT3NHTzt1vGh6SEMvmIHQDI+TZDXO/yovkvk0Xo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AUsYi5fd6IvbZBFNCZL9IWpIReqNyyt4x0Z9ak7fVcNMPw8iwMk+9cOOeKBlOPwGa
	 lxF2lQ0iC4vOsMjRENVC9x0qZiOmq229j6AdJLQBzX87bGN6tEt3JU4rV4OR25Lx6/
	 QYqc8ZOSnzDfcznGTT3DF+4M1dPD8RCdn0+ZaETwd7epRhD2mdZP/zjRxK0c616Kto
	 rTGB3QtnC8sJ78WIwTrSKB6DMJWoSwvhT5fK4yWke7fn+o146HvRuop0JVDGXWM0W6
	 391FWVfokNEox+nTr1r79NCSW4Sc3WqZ+plqk2x6GofQ7NaErTeV/xoUr3Mi6QQ1z1
	 Pm/RnTUPUullQ==
Date: Tue, 24 Nov 2026 15:40:00 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Linus Walleij <linusw@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: txx9: drop linux/gpio.h inclusion
Message-ID: <euwnpo2ezvaw4bnqheytyw35zr4bit6u7v6nkvcf5ghawfc2ky@t4y2n3if63cp>
References: <20261124143432.3234864-1-arnd@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124143432.3234864-1-arnd@kernel.org>

On Tue, Nov 24, 2026 at 03:34:26PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This header is going away soon, so include the appropriate one instead.
> The legacy interface is no longer needed since the conversion to a
> lookup table, but the consumer interface is still used.
> 
> Fixes: 0caeacb11691 ("MIPS: TXX9: rbtx4927: Use GPIO lookup table for SIO DTR")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> --
> This was previously part of the patch to remove the header,
> but we ended up splitting that up again.
> ---
>  arch/mips/txx9/rbtx4927/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
> index 223889c03186..fdbe2bd87979 100644
> --- a/arch/mips/txx9/rbtx4927/setup.c
> +++ b/arch/mips/txx9/rbtx4927/setup.c
> @@ -48,7 +48,7 @@
>  #include <linux/ioport.h>
>  #include <linux/platform_device.h>
>  #include <linux/delay.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/leds.h>
>  #include <asm/io.h>
> -- 
> 2.53.0
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
