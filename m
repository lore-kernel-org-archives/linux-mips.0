Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934983;
	b=JTNblRJfiFJ5wkPYVH1CyH2pi66ReZsyPdfv+8I8OYhFzZzQ5RKHvmBmt7V7k2jQSWnn
	 zt1D+XNnboUrYMUlyNQSc/4ot2wW4t/N1TeKX6vcFb3omDKaldY1eEO4l9uyhLukftPsf
	 U0DZu2GQDCDyXx0v9r5qZeTseEzt03WyweaCTox478h0BseWMv7whGWbjUWNo1R9g8O2m
	 CdkhEVZo5IjdzuXrhOqgM46DKtwbaUcy38JbjhaGiVJLpHTT/lOpSbVFTW9rXgBHupPYW
	 1nIY0CNziqozx+2bwKFA4cIzqCebjKi7gKKGcKlL9YKXCrSXehPP09az7PxOrVI6q1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934983;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mivQzK/DT27iWrrIydbZFjDJTCzWiU8e35fYnl5IazU=;
	b=14EEAcH7m6zo1ztvOIXDYMW4BHf99eJVuaF+6RbXsbkSyz2iPCuuEW5dAsBsaTBRED1u
	 2g0sucKpkKBRqg5Ba85uFvkAsAw6twvpCWMW1dirqk5nr5dhyuPASGuwVr/jKyp0noZhJ
	 KCMtjhzDzfMbcwC/V+osuGdhHZWhUx3WtOCOy2zTNp5tKSQBFVkzt8BaxPPXOHHw2/bsV
	 OQ6kJIybcQWfXw8tB3jG1yudxhv4S0x5SmJIZDLMrjbyVsvKZYMNN7AeMMScLE607lHmS
	 jVPZstNCRJUXYeSamqukw5vEXwm4oPKmkj/HLBYUUzSGdDG/CkR+mP8jDF/zvcOwOmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4825B606A331;
	Tue, 17 Nov 2026 17:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4825B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTMaC-0005GN-00; Tue, 17 Nov 2026 18:03:00 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 81772C05C3; Tue, 17 Nov 2026 17:57:41 +0100 (CET)
Date: Tue, 17 Nov 2026 17:57:41 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Imre Kaloz <kaloz@kernel.org>
Cc: linux-mips@vger.kernel.org, Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Add an R10000 family cache error handler
Message-ID: <avyHhVQ1LzYa2a-T@alpha.franken.de>
References: <20261026132613.9875-1-kaloz@kernel.org>
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
In-Reply-To: <20261026132613.9875-1-kaloz@kernel.org>

On Mon, Oct 26, 2026 at 02:26:12PM +0100, Imre Kaloz wrote:
> cache_parity_error() does not decode the R10000 family's CacheErr
> layout, and panics with ERL set on every error.
> 
> Recover I-cache errors by rewriting both ways of the set, as
> invalidating leaves the bad word in the data array, and panic on
> others with ERL clear. The handler is built with CONFIG_CPU_R10000.
> 
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>
> ---
>  arch/mips/include/asm/traps.h |   2 +
>  arch/mips/mm/Makefile         |   1 +
>  arch/mips/mm/c-r4k.c          |   9 +++
>  arch/mips/mm/cerr-r10k.c      | 141 ++++++++++++++++++++++++++++++++++
>  arch/mips/mm/cex-r10k.S       | 125 ++++++++++++++++++++++++++++++
>  5 files changed, 278 insertions(+)
>  create mode 100644 arch/mips/mm/cerr-r10k.c
>  create mode 100644 arch/mips/mm/cex-r10k.S

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
