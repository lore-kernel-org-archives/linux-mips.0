Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932886;
	b=UoqT4d5SSCZ79zU1AABdtfyngQwhvXWPsbxB/KYVqdmrowY6sItubuUxTFbw418Or0G+
	 PKAwA3ULWpX9Dk+l3So5D8tMgnApVeT9ZyYQwpHx4i8auwQhkDCjDrRFTw5EPFTUAf1Eb
	 F/qfEnXQMbAK1niQgsQdA+omvAoM4r23cz9xzVUA5OPi69gMicTkXsikz+VYpi1sFiADG
	 QYoc2cjmKx2MkbTnhMtr5mzvckxaKZYPdEIRZt/MDGGTzWk6fdKzE2SIoCf8WVEugtJb4
	 AtYEzbYCpHq8FLgYb8yoZhuY/SIU1hHun+Oe9ehyQarzXY1Ooa8l4mNGhBHicTYQXHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932886;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=U1M3hKlNYIbPg2/9VS3D0JbOfxvI5ZFacesUvDvYz6Q=;
	b=Q+xNLyWIqZYLi4Pu5Mpp+9SgPJ/h555uyK66370cYdRjngD/JgBGjiqhSNZ9RUCNj4Hq
	 zgV6WaCjuvM2Ra0Kb5apSF9kSFZo7YBgd6vESa5UAZPFNNdZnf1nU7AKk25tXquZ46msE
	 iqv7bmTGAcGGO5HYZ1heOHt7w9hBjCrnY2I9c6Laf2zlvCTplKg14sHWnoW/hoZJ9KURG
	 IPTUmbf6DP0KWXpG4iImzgWnLabrpUn1LyqSIh+j3Wz8rJF8txUTY9VlC9zUQQ8/cpATW
	 X353g6RFV5qzjUBiMKZ4UzNXVeIEGoZOPsQJtSEy20XGg4PK/JszGNH1QYUjpJYU1lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A12606A331;
	Tue, 17 Nov 2026 16:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A12606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTM2N-0004sD-00; Tue, 17 Nov 2026 17:28:03 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A285CC0794; Tue, 17 Nov 2026 17:16:27 +0100 (CET)
Date: Tue, 17 Nov 2026 17:16:27 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, macro@orcam.me.uk,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: SiByte: Fix missing function prototypes
Message-ID: <avx927r8iDC8fRDj@alpha.franken.de>
References: <20261113191933.477395-1-f.fainelli@gmail.com>
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
In-Reply-To: <20261113191933.477395-1-f.fainelli@gmail.com>

On Fri, Nov 13, 2026 at 11:19:02AM -0800, Florian Fainelli wrote:
> The SB1250 SWARM build reports missing prototypes for platform time
> initialization, SoC setup, IRQ and SMP helpers, and both RTC backends.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Changes in v2:
> 
> - corrected warning reported by kbuild test robot by gating the
>   inclusion of sb1250.h to avoid warnings on bcm63xx_defconfig
> 
>  arch/mips/include/asm/sibyte/sb1250.h  | 17 +++++++++++++++++
>  arch/mips/mm/cerr-sb1.c                |  2 --
>  arch/mips/mm/tlbex.c                   | 11 +++++++----
>  arch/mips/sibyte/bcm1480/irq.c         |  4 +---
>  arch/mips/sibyte/bcm1480/smp.c         |  6 +-----
>  arch/mips/sibyte/bcm1480/time.c        |  4 ++--
>  arch/mips/sibyte/common/bus_watcher.c  |  2 +-
>  arch/mips/sibyte/sb1250/irq.c          |  4 +---
>  arch/mips/sibyte/sb1250/smp.c          |  6 +-----
>  arch/mips/sibyte/sb1250/time.c         |  4 ++--
>  arch/mips/sibyte/swarm/rtc.h           | 15 +++++++++++++++
>  arch/mips/sibyte/swarm/rtc_m41t81.c    |  1 +
>  arch/mips/sibyte/swarm/rtc_xicor1241.c |  1 +
>  arch/mips/sibyte/swarm/setup.c         | 18 ++----------------
>  14 files changed, 52 insertions(+), 43 deletions(-)
>  create mode 100644 arch/mips/sibyte/swarm/rtc.h

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
