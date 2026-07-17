Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A53E376492;
	Fri, 17 Jul 2026 11:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286315; cv=none; b=rbdB8mPi2uTypWnsvkwh06eLEKYYJtPuloMb+2KAVvyg9zsYxQzIy8VB3EwRcWQDAOkUFP9Dt+OW+zLpulz0xVlTlTw0EylqQK8ZfAnHw+y2rTkP80j0LdIxxJ+QBrOay/SZ7mZFYogT/AJTmcfm7rhkiPKVN0R7jtfQC282Kto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286315; c=relaxed/simple;
	bh=YT8SN/1akh8bs6tuj//csUsANhXWRukKZlRbZ4kdkCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSZk5i7EZrWKPEpvHi0lf3cmy1erG9bUMhEv4SLQPw79nEAmAgpgb//msqyL9S02HykYty+kco94M0mAG+mJSzoGr0fi12wh9ygMR5B2IjFfYwDQa3dKRYQqsMUm+R5zcZT5EkgEtaGOsQPlr56+zD0obEYYI/+b1Vs0inQJgSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wkgNH-0007DT-00; Fri, 17 Jul 2026 13:04:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BD157C012A; Fri, 17 Jul 2026 13:01:27 +0200 (CEST)
Date: Fri, 17 Jul 2026 13:01:27 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Johan Hovold <johan@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] MIPS: ip22-gio: Drop #include of
 <linux/mod_devicetable.h>
Message-ID: <aloLh6Ja6aYTiLD1@alpha.franken.de>
References: <d90003bf53495591a15a5854fa2845fdee8f8d11.1783671791.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d90003bf53495591a15a5854fa2845fdee8f8d11.1783671791.git.ukleinek@kernel.org>

On Fri, Jul 10, 2026 at 10:24:12AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> That header doesn't use any device id provided by
> <linux/mod_devicetable.h>. Also the users of <asm/gio_device.h> (i.e.
> arch/mips/sgi-ip22/ip22-gio.c and drivers/video/console/newport_con.c)
> don't use any of them and they compile fine in a mips allmodconfig.
> 
> So drop the unused include that only yields unnecessary recompilations
> when a device id struct changes.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  arch/mips/include/asm/gio_device.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/gio_device.h b/arch/mips/include/asm/gio_device.h
> index f9c102f038d6..6e9d2897347d 100644
> --- a/arch/mips/include/asm/gio_device.h
> +++ b/arch/mips/include/asm/gio_device.h
> @@ -1,6 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  #include <linux/device.h>
> -#include <linux/mod_devicetable.h>
>  
>  struct gio_device_id {
>  	__u8 id;
> 
> base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
> -- 
> 2.55.0.11.g153666a7d9bb

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
