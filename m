Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1F23B47C4;
	Thu,  1 Oct 2026 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856778; cv=none; b=W9EbFC7pWUipFZoGTWi+dgkHEUpncaAE1T1hS/hXvAONF6YH2VyD5jWtsB0Nnt+vBSxZJz+twWXz+xzm5DnoeX3YC0DBVI5MsR2urMRohW0+8d4aewQmjbku0mKdhqNxOKedWvpk09oEPd6Vvb99+j87KYUDxlD1q8xB3jSdCKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856778; c=relaxed/simple;
	bh=g4Wl+3Z2B6ZJND8LP/rqERwhTJNrK5/yaAsX7QqEjnE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5jnA7d9rL3p2m7RxPlUCis/H7jgInVgWKO4CWCThctfsBwWOdtTuWPkTevGKZDZW93Ixwo4eAmntl8zLGBrUDau2KR0UcDS7BzzkSePVt7ni0a2eYCDenOlzTkDrl6Xhu6iUeDP4OE9wMFDL2hCSK27NQDN/38//kVIPVxRl7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xCFeU-00010k-00; Thu, 01 Oct 2026 14:12:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5F348C0955; Thu,  1 Oct 2026 14:12:12 +0200 (CEST)
Date: Thu, 1 Oct 2026 14:12:12 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: octeon: Use MIPS_MACHINE for boards without
 provided device tree
Message-ID: <ar5OHHZw7arItBEf@alpha.franken.de>
References: <20260927091512.117046-1-tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927091512.117046-1-tsbogend@alpha.franken.de>

On Sun, Sep 27, 2026 at 11:15:10AM +0200, Thomas Bogendoerfer wrote:
> There are older Octeon boards with ld U-Boots, which don't use and pass
> a device tree to the kernel. Use MIPS_MACHINE mechanism to get a device
> tree.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/cavium-octeon/setup.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
