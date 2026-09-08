Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23EE54CF4E;
	Tue,  8 Sep 2026 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877032; cv=none; b=bJ85K8i2ZoPfvUIwDcYipW4nS3C0/it1o+NQxHp2vUrX+GbqqOKK/IWxT+nKZdD1VCKg8clkM/U/izxKHSnLF5mbJTdtxrUhrD5NAsy298ybJVm+ou1QwYSBEZdIlVaf8QVTVbZ2AaqMRcI9jdZlmRO2JRkRu0O/fTOF2xv9pg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877032; c=relaxed/simple;
	bh=lFSQ5hvve9OJ1Rlt70iiN+0/zIaVvyA7RKQ6Ju9IvxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/PG6SlUTqkG4Rbj4VBRqF/4D9f2SJD1SoLN48uPZNi5w84NLdj6w2rTwK3tSgGIKEZCMg3RhfiQpqyYJgM/IxE4qghoh+eetZ+LlAJM44NTIqnRA980cGzQvZC711mXjoOP22qJJbIK3kpx4OkqQpi86c3cXqqdxrDKXY0CUaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1x3wd2-0002fd-00; Tue, 08 Sep 2026 16:16:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DE649C0121; Tue,  8 Sep 2026 16:13:52 +0200 (CEST)
Date: Tue, 8 Sep 2026 16:13:52 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	rdunlap@infradead.org, jonas.gorski@gmail.com,
	julianbraha@gmail.com
Subject: Re: [PATCH v2] MIPS: config: Add EcoNet EN751221 defconfig
Message-ID: <aqAYILcEZaMRm-Rs@alpha.franken.de>
References: <20260817220344.2931634-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817220344.2931634-1-cjd@cjdns.fr>

On Mon, Aug 17, 2026 at 10:03:44PM +0000, Caleb James DeLisle wrote:
> Add config based on OpenWrt for EN751221 boards.
> Of note: EcoNet bootloader has a 7.2MB kernel size limit so
> ZBOOT is assumed to be needed in all cases.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
> Updated to work after SERIAL_8250 and SERIAL_OF_PLATFORM removed
> from Kconfig.
> Link: https://lore.kernel.org/linux-mips/20260815235109.666268-1-julianbraha@gmail.com/
> ---
>  MAINTAINERS                                 |   1 +
>  arch/mips/configs/econet_en751221_defconfig | 264 ++++++++++++++++++++
>  2 files changed, 265 insertions(+)
>  create mode 100644 arch/mips/configs/econet_en751221_defconfig

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
