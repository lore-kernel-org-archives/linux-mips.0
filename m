Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117931F936;
	Sun, 18 Oct 2026 23:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365964; cv=none; b=C6tNh/eWl9Iqey4kXGJ36+AK7Xvuq0E6CN8BEU4vw9fVMvo3kKhVUQyrKcQyH4wG1sNbcpZmCCsyrhn2MeZF84y8ky/WW1A/X7IbkDuJRTy51gOhzvxUglExwefXKC7KzQvnRM9uhK0sixcQ9PjU/eZ2TLnPnA/dkjMN642jIyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365964; c=relaxed/simple;
	bh=B4k67NdBVXPAsDjJcr1u7v/xHPv7tLFynVjb4zYtYMk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rqdn9bJR8CwrfMnotbRuy/aUYiYPjAAznFdZNBEyPKJVQhGTd+dGeYURZayazjKotnJluLaEKBpl/b86V/HHRT1Mai7KYvDHaL1eEfIwh3H9kZw0/uC+Dvcbvn/k1whrV5t3HMUb+lYqIMhhAstCxcLNIfnrOGrdzKn9d2eegnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id B1EC892009C; Mon, 19 Oct 2026 01:26:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id ABB4992009B;
	Mon, 19 Oct 2026 00:26:00 +0100 (BST)
Date: Mon, 19 Oct 2026 00:26:00 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: kernel test robot <lkp@intel.com>
cc: Rosen Penev <rosenp@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
    linux-mips@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
In-Reply-To: <202610131201.wWk11MLy-lkp@intel.com>
Message-ID: <alpine.DEB.2.21.2610190013300.22065@angie.orcam.me.uk>
References: <20261010065442.23780-1-rosenp@gmail.com> <202610131201.wWk11MLy-lkp@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Oct 2026, kernel test robot wrote:

> config: mips-rbtx49xx_defconfig (https://download.01.org/0day-ci/archive/20261013/202610131201.wWk11MLy-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131201.wWk11MLy-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610131201.wWk11MLy-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    Assembler messages:
> >> arch/mips/lib/csum_partial.S:202: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x100($4)'
>    arch/mips/lib/csum_partial.S:203: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x120($4)'
>    arch/mips/lib/csum_partial.S:204: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x140($4)'
>    arch/mips/lib/csum_partial.S:205: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x160($4)'

 So oddly enough we're missing Tx49 support in the toolchain and we've 
only managed to survive with CPU_HAS_PREFETCH enabled for CPU_TX49XX 
because it also implies DMA_NONCOHERENT via MACH_TX49XX -> MACH_TXX9, 
which in turn disables stuff in arch/mips/lib/memcpy.S.

 Quite straighforward to fix in binutils since docs are available (as in: 
I have a copy), but do we have any users?  Geert?

  Maciej
