Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934982;
	b=l1Dr3lpmrA0cDvc2tOJgi6eBoeVVtdomZZQHF2kkzoTY1IcdpMRGRQX3RcHVASUZIiwH
	 9KeGxZIgM0ddEEV0imiPN831g/MxRXHXBqJbuiqLYGI/XE+DQrHCYLaKg3Os70mvjVSCy
	 iGu9DPkxP7JwsaQS4lxdTDBsmrzZGo9dWM+fbuWd3xbHvuDB1/J2fg9ltbtFxk6c386C9
	 6mhqmoJ8walb20V1a+EEBE2BePNM1N4amRR0rUhR1cO15tMj8NcyyF7iPid/6yd2DANhM
	 7aWuQ9tLOFoImTj7PVx+IXc6kQTVTEKvzBkePZz0YDRsYyuVgT/ona8AwFQ5GaRYeLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934982;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DWSbG4O7NNcxX8fObj3HSY6oLeblqc38YjrZ70564Yc=;
	b=zACFmkp9RXWSW3RPqgz88AMIfAgHbR/yeR056Jd+Uu8JhpEs1+NsBunzyeb10a9xcflW
	 eTFrzjWjrJXv/Pq/PadF38O3T830YF12Avwe5XzZvh69tCN21nC1c9FyA5OWLeRh2x2Ya
	 FniBVyXsWWv5Z1NYZmmxZnHZi5xFvz/9y7X3PMbjtQ7r0H9lvZM4A+ZUPq5nxpfBqrH8u
	 OaVV1U/K8UoTzP1hn+PwcFeF4RjesPQ7MYW12mfZX3gUO1ph9Z/BpMuglio9jRcIpxRSt
	 AJb2yy5VUa55bwIQSiCm/xKCoEqWkLUbAfCK0r4KfjTlnV/Al/EH9c+7l/2T8k/4/rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48050606A32A;
	Tue, 17 Nov 2026 17:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48050606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTMaC-0005GF-00; Tue, 17 Nov 2026 18:03:00 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 034DFC0546; Tue, 17 Nov 2026 17:56:41 +0100 (CET)
Date: Tue, 17 Nov 2026 17:56:40 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mips: ralink: mt7621: avoid casting away __iomem in
 wraparound test
Message-ID: <avyHSKd4l8YYdESO@alpha.franken.de>
References: <20261004184828.31284-1-rosenp@gmail.com>
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
In-Reply-To: <20261004184828.31284-1-rosenp@gmail.com>

On Sun, Oct 04, 2026 at 11:48:28AM -0700, Rosen Penev wrote:
> CPHYSADDR() casts its argument to an integer, which strips the __iomem
> annotation from dm and triggers a sparse warning. Compute the physical
> address from detect_magic directly. The result is unchanged since the
> sum never exceeds the 512MB KSEG mask.
> 
> Fixes: 4ddaf88aadd3 ("mips: ralink: mt7621: add missing __iomem")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610041411.uJXWXF8i-lkp@intel.com/
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
> index ae7b8cfedd5f..2d10c74b13c1 100644
> --- a/arch/mips/ralink/mt7621.c
> +++ b/arch/mips/ralink/mt7621.c
> @@ -65,7 +65,7 @@ static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
>  {
>  	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
>  
> -	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
> +	if (CPHYSADDR(&detect_magic) + size >= MT7621_LOWMEM_MAX_SIZE)
>  		return true;
>  	__raw_writel(MT7621_MEM_TEST_PATTERN, dm);
>  	if (__raw_readl(dm) != __raw_readl(dm + size))
> -- 
> 2.56.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
