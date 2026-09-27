Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0105F3B71A6;
	Sun, 27 Sep 2026 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498631; cv=none; b=ivSvptEokF0RVFAfcmyTKRl/C/xf3Jj7eE65rXb6wZDHXDEupwP2BlKMvhkiKcei5spYHqxfTKlqzUC/MIp8UIMsX73dKjYMI8Hais4CK0LUEuGHtmQCDnhqmta1wtFZAvgOK2KLNOYugQK1xage+ncPnUfsV5VeeNNepe0/dV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498631; c=relaxed/simple;
	bh=RUvJixkwO41Lq/mOFU8tZgpREqfwsc4Ff8hnSqHqGFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRBvUhiNI/xq9cHF6OMc1NYexm/JXcFzQ8FbYYgTagmtiIst7eEULLw3L024Etx1s7dkxME98kcVkm5MYGGSwYU/SC2zwQ6BoGCevoTllXzVSVeL2yNyC9x3IgLXJsxfYjXAL4lxZ6N2ZDWyHNQdyvT+6fmRfQtNz2NPF6MxFQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAkTz-0008Gs-00; Sun, 27 Sep 2026 10:43:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 33ED3C0423; Sun, 27 Sep 2026 10:42:49 +0200 (CEST)
Date: Sun, 27 Sep 2026 10:42:49 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Kexy Biscuit <kexybiscuit@aosc.io>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: ABI: lefi: use literal blocks
Message-ID: <arjXCdB-3SYoQhTc@alpha.franken.de>
References: <20260921032048.4060710-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921032048.4060710-1-rdunlap@infradead.org>

On Sun, Sep 20, 2026 at 08:20:47PM -0700, Randy Dunlap wrote:
> Use literal blocks for console I/O examples so that the lines
> aren't run together in the produced html.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Kexy Biscuit <kexybiscuit@aosc.io>
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> 
>  Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo |   22 +++++-----
>  1 file changed, 11 insertions(+), 11 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
