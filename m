Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CD22A1BF;
	Sun, 27 Sep 2026 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498630; cv=none; b=DWCWZiISA8lcSmco5dOQM8gX74KFIe57CzueXaSMM7Rlwa2QPwo34DVojn8XTySt2vmDJK20wSw8tTDxPszERWk2TKEFH/8E7JVro9nt3oHBnl2I5Kbogykr5hsBoAhClRPvF9Kcw3MBEAFMErGHpI08Lu8nYOHkhRp7/1BZ2YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498630; c=relaxed/simple;
	bh=L+LZ+XmSMjWrR8X2VVXOLMfn5PjdwHxGxapzLJ8kWvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLAhQCXYRVfWlvl4pQ5Mtz37JtCrH28SciPdO7QAORrdpTjnVfW8jvKUKmGfgeOr46c4Fu6gxVcSflw1ddwzJ/bd7P4+VEUVBHBj8woXgCmZhPpqKOJ4fVvGiaDJ0zS9WDmehQAnVQX9h8ylH6Yk/muE/kED3UE/Nujs3U9+Pnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAkTz-0008Gu-00; Sun, 27 Sep 2026 10:43:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 41995C0955; Sun, 27 Sep 2026 10:43:03 +0200 (CEST)
Date: Sun, 27 Sep 2026 10:43:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Kexy Biscuit <kexybiscuit@aosc.io>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: ABI: lefi: drop "ROM Size" in sysfs file doc.
Message-ID: <arjXF4kF9x-rpfDw@alpha.franken.de>
References: <20260921032048.4060710-1-rdunlap@infradead.org>
 <20260921032048.4060710-2-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921032048.4060710-2-rdunlap@infradead.org>

On Sun, Sep 20, 2026 at 08:20:48PM -0700, Randy Dunlap wrote:
> The "ROM Size" line was dropped in a previous commit. Now delete it
> in the ABI documentation also.
> 
> Fixes: bd2212d658d7 ("MIPS: Loongson64: remove ROM Size unit in boardinfo")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Kexy Biscuit <kexybiscuit@aosc.io>
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> 
>  Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo |    1 -
>  1 file changed, 1 deletion(-)
> 
> --- linux-next-20260918.orig/Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo
> +++ linux-next-20260918/Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo
> @@ -23,7 +23,6 @@ Description:
>  		 BIOS Info
>  		 Vendor                  : Kunlun
>  		 Version                 : Kunlun-A1901-V4.1.3-20200414093938
> -		 ROM Size                : 4 KB
>  		 Release Date            : 2020-04-14
>  
>  		By the way, using dmidecode command can get the similar info if there
> 

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
