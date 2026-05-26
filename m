Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879D63FFACC;
	Tue, 26 May 2026 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807072; cv=none; b=SPpvLf5lYv4fh9sPMx/QtIKKkg2nWQdPa3aiUJM6Dp2BtvgXTKtaZ2S1N4Q+VXZ5r1UKpevoh2F8RpBLHhPAYDqUFwFVshPMsVOS074nfk8nOBMdPOdetHmE3+iyOAWqDCnFqKLF55o0VNiWiSxWzk4N7cd+5gvyypQdGW2up5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807072; c=relaxed/simple;
	bh=KPRiFIlbynf01kb4hMs1KrlTehjlvAPHaigdv9G5CB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQiVapKyQnAew7GEmH8al3/Qg+CxOUlomltEf9W7asc2hJgFOdQ2Zqyw9DLPdfPG/bIAUMYXpfmeJ+wRCUF26fQx2VG/LGiDJQDbctSSKy9eJSeiWCPLUx1z6rKwbGvlxo8a74om8L6GivAR9pKERITOP19S6DwttWjJeTEyqzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRt7c-00015B-00; Tue, 26 May 2026 16:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 703AEC0ADD; Tue, 26 May 2026 16:50:03 +0200 (CEST)
Date: Tue, 26 May 2026 16:50:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mips: ralink: mt7621: add missing __iomem
Message-ID: <ahWzG3s5PKezh_t4@alpha.franken.de>
References: <20260508042724.1719688-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508042724.1719688-1-rosenp@gmail.com>

On Thu, May 07, 2026 at 09:27:24PM -0700, Rosen Penev wrote:
> raw_readl and writel calls expect pointers annotated with __iomem.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild/202211060456.cnV6IK6G-lkp@intel.com/
> Fixes: cc19db8b312a ("MIPS: ralink: mt7621: do memory detection on KSEG1")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
> index a4bdda8541c0..ae7b8cfedd5f 100644
> --- a/arch/mips/ralink/mt7621.c
> +++ b/arch/mips/ralink/mt7621.c
> @@ -63,7 +63,7 @@ phys_addr_t mips_cpc_default_phys_base(void)
>  
>  static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
>  {
> -	void *dm = (void *)KSEG1ADDR(&detect_magic);
> +	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
>  
>  	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
>  		return true;
> -- 
> 2.54.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
