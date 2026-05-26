Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3526A378806;
	Tue, 26 May 2026 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809771; cv=none; b=icABxLFNtxmZnKgnHJNlZVPZMwtniH/mGUUtO2uQN/oHLIavD1zBerwIH8WfWg62VgBzOcXGQrNWwSi85HZgZ6jhhUW7bBLG4674FywrYcbdo4gXH+AGmPtABn5CQrftNIZCxGKUzJjDkw2LDe9QswAt4+4Bmu9EIMK9N246gS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809771; c=relaxed/simple;
	bh=FQRWY6AEKrfKqaq7BdmWUYjUT4ICHvNZnwYxHBU2XAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5koMV/gdeHkAJt2Yr/jUI1nT6SSohkUHP4SVZxxOKmcjrkJ7ZW5JTzcBGQZTxcq06XzmB259SpsyNOemZdUGdqp7Csbm2DRWt4YpDRv3BKutGgDPndVLDG3LbdUW8E/Ra+UX3UrSxZE9oeX89n7mj4XhVbrPBmt4HaR/h1qI18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRtp9-0003HS-00; Tue, 26 May 2026 17:36:07 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E6B65C0522; Tue, 26 May 2026 16:53:56 +0200 (CEST)
Date: Tue, 26 May 2026 16:53:56 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, Lauri Kasanen <cand@gmx.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mips: n64: add __iomem for writel call
Message-ID: <ahW0BDXCpPseQ4Sx@alpha.franken.de>
References: <20260509035727.1016256-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509035727.1016256-1-rosenp@gmail.com>

On Fri, May 08, 2026 at 08:57:27PM -0700, Rosen Penev wrote:
> sparse: incorrect type in argument 2 (different address spaces) @@
> expected void volatile [noderef] __iomem *mem @@
> got unsigned int [usertype] *
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202105261445.AcvPd2EE-lkp@intel.com/
> Fixes: baec970aa5ba ("mips: Add N64 machine type")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/n64/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
