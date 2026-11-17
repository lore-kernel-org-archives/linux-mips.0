Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934983;
	b=jCIzb9bQdoJHI3CGkTXrmM861abmiVp2m6w06PtPvj84KLP0JM6LVDCGOUqABCtwKbW/
	 TieHJT0cP69wIPkS0Lo06chjH/5OrJ/CYOy6yzt7T8NhBanFs+weqpWRvoJZhmZmLcxlq
	 6LY0Buusj5j0LdM3SFbQInq2AUwlft9+z23SXpBe3kLjSxL3FIc2xELcY7ccbvZnEUQok
	 RcErTksGhcEWgzFZvdc+GIpdMY11j6ZxvevIcCqgxnx6Slyz+3iI+5XQBTZxyaDFSEOAq
	 urjHq7iUlCXYNukHRFtWd7xGYTjDFShIEPWfHB36TYJTCazzJiCB5s6HupdkYwYt2Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934983;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=23ke5IW9wL+schlh0UIfnTkss9BuX8z53RQFsMW/cT0=;
	b=TgneD2kDZSLA61RchqqXVT5qavaYd2ZE6fsfe/iRoeDRE3RtAOZYT2/b7U6RP8J3MEve
	 MTBHKxUx/eWId4YZfZappYbmtjeSzXt3CgELZjLPIsLeoWU17f+tJCOV45JSlx00gMsdL
	 V4erAY2zi283njaMzrar8RepCFlp0foOtU5BmRddGSf9zMivkt+MONLGMKe9WxiRXFlfi
	 al2xLPDua5JVJn4GbWBqwR8MDhVSYEEDFpM9v2Uo7p1Ab89TfcjdtFYlV+RW0TegLkgFj
	 auasYrsVqiEYH2I1RJa5T8BztxzQkiNPJSdlDnPQF0luH+gf69S5cbNbmgvpUQuN6Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4815B606A32F;
	Tue, 17 Nov 2026 17:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4815B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTMaC-0005GR-00; Tue, 17 Nov 2026 18:03:00 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BB28BC06EF; Tue, 17 Nov 2026 17:57:59 +0100 (CET)
Date: Tue, 17 Nov 2026 17:57:59 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Imre Kaloz <kaloz@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] MIPS: SGI updates
Message-ID: <avyHl6mPdR0oJ1Jd@alpha.franken.de>
References: <20261026134543.27207-1-kaloz@kernel.org>
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
In-Reply-To: <20261026134543.27207-1-kaloz@kernel.org>

On Mon, Oct 26, 2026 at 02:45:38PM +0100, Imre Kaloz wrote:
> A stack fix for run_uncached(), a missing prototype and defconfig
> updates for the SGI machines. Applies on top of "MIPS: SGI fixes"
> (<20261013094554.16804-1-kaloz@kernel.org>).
> 
> Patch 1 keeps the stack that run_uncached() gives its callee clear of
> the registers it saves in its own frame.
> 
> Patch 2 declares ip22_eisa_init() in asm/sgi/ip22.h, so that enabling
> EISA on IP22 does not add a -Wmissing-prototypes warning.
> 
> Patches 3 to 5 clean up ip22_defconfig, ip30_defconfig and
> ip32_defconfig. They enable EISA, HAL2 audio and the Zilog serial
> console on IP22, the front panel LEDs on IP30 and the audio driver on
> IP32. Patch 3 also switches ip22_defconfig to the R4x00 CPU type,
> which most of these machines shipped with.
> 
> Imre Kaloz (5):
>   MIPS: lib/uncached: fix run_uncached()'s stack switch
>   MIPS: sgi-ip22: Add prototype for ip22_eisa_init() to header
>   MIPS: ip22_defconfig: correct CPU type, add EISA and refresh config
>   MIPS: ip30_defconfig: drop add-in drivers, enable the LED driver
>   MIPS: ip32_defconfig: drop dead options and add-in drivers, add audio
> 
>  arch/mips/configs/ip22_defconfig | 79 ++++++--------------------------
>  arch/mips/configs/ip30_defconfig | 13 ++----
>  arch/mips/configs/ip32_defconfig | 36 ++++-----------
>  arch/mips/include/asm/sgi/ip22.h |  1 +
>  arch/mips/lib/uncached.c         |  7 +++
>  arch/mips/sgi-ip22/ip22-int.c    |  2 -
>  6 files changed, 34 insertions(+), 104 deletions(-)

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
