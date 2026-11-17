Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932886;
	b=UuRROlBLUy9DEN0v5Gxsqj67zxdnKOii7ccCPXX9ZvHKMgvBlla1O18hw9d5N6Qdaol1
	 aSPLsnJ3a0MvOFmYxGMlEHxbhq5TVtgmsEuTARazElgmEPP54GJSrLtLiY+35OTQERhIf
	 0n463LNWlIWX953vxWikwp/FzugnTL59M87c1R2bBHPP55r3PQ5ijuXvPEkg7jdaaBQhN
	 Jlx8y5OejLwAYQLZwlQ6S0JyLjMh/eFfUFVlQfp9UYwqcqavGCdPdPCLOVME1BJnQyGhf
	 9Yquv5xewvpp9ClEfsiMNaasIYWPyfEYtbYlg57LLd/lNhu0WvM5lrLnJ5dlwa9N1hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932886;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gty/81swefS3HXULCwVL7HY+Cp/LXxL7MrtQsCdFtT0=;
	b=d2CGOJPvgoKs4haWlqXjqZ7jM6jLbzof+19vGONu9q2Hbi1bOLCP4aR/s1Rnbev20t8+
	 qbSdVUXS7ZLcFPDlfqc+I5gmoQ1xEDwP2R8rbd+3ilUESWgrERcj6e1DvydR5FMFEcUOI
	 jbZa68SyBwAOUWkH1Bbht1p5/iM3pw4XFt7mUqH8j5bvsmLD333fF9tEpVdzBFMWPluM7
	 Om6RKyynGmO8xIkaZStAQzt3tRuS4PfndnrnGzq58hoL/dx0fVSxn8ELUHjNp9rd3K02L
	 pwLjK22cJ0YWRmhr6hY6NCz7U+QmcP4rOoMWJqdvwBt/Vjq6XjDxFvnxqoA2hzFZp0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578F1606A32C;
	Tue, 17 Nov 2026 16:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578F1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTM2N-0004sB-00; Tue, 17 Nov 2026 17:28:03 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id F3212C0546; Tue, 17 Nov 2026 17:14:50 +0100 (CET)
Date: Tue, 17 Nov 2026 17:14:50 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Timo Joannin <timo.joannin@gmail.com>
Cc: Orgad Shaneh <orgads@gmail.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: cavium-octeon: fix missing prototypes
Message-ID: <avx9enOXbOGmpirP@alpha.franken.de>
References: <20261108143140.157628-1-timo.joannin@gmail.com>
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
In-Reply-To: <20261108143140.157628-1-timo.joannin@gmail.com>

On Sun, Nov 08, 2026 at 03:31:40PM +0100, Timo Joannin wrote:
> The compiler throws -Wmissing-prototypes warnings for
> several functions in the cavium octeon architecture code.
> 
> It occurs due to a mix of hardcoded prototypes scattered
> across C files, a block-scoped extern declaration,
> and missing header files.
> 
> Fix the warnings by:
> - Moving the prototype for octeon_fill_mac_addresses() from
> setup.c to <asm/octeon/octeon.h>
> - Removing the block-scoped extern declaration for
> octeon_send_ipi_single() in mm/c-octeon.c and exposing via
> <asm/octeon/octeon.h>
> - Moving the prototype __cvmx_interrupt_gmxx_rxx_int_en_enable()
> from cvmx-interrupt-rsl.c to the cvmx-gmxx-defs shared header.
> - Adding the missing #include <asm/octeon/cvmx-helper-errata.h> to
> cvmx-helper-errata.c.
> 
> These changes pass the compiler's -Wmissing-prototypes safety
> checks without changing any runtime logic.
> 
> Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
> ---
>  arch/mips/cavium-octeon/executive/cvmx-helper-errata.c | 1 +
>  arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c | 2 --
>  arch/mips/cavium-octeon/setup.c                        | 2 --
>  arch/mips/include/asm/octeon/cvmx-gmxx-defs.h          | 2 ++
>  arch/mips/include/asm/octeon/octeon.h                  | 2 ++
>  arch/mips/mm/c-octeon.c                                | 1 -
>  6 files changed, 5 insertions(+), 5 deletions(-)

I've applied https://lore.kernel.org/all/20261101234657.1820661-1-rdunlap@infradead.org,
which also cleans up cavium octeon code. So your patch doesn't apply any
longer. Can you check, if all your warning fixes are applied, and if not
send an updates patch ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
