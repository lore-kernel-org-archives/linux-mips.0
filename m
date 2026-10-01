Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD053AA504;
	Thu,  1 Oct 2026 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856779; cv=none; b=fO/4CxwX7MJjL2jrT7sVlkp3nOGW33ft0Q6/Lb2KXJC2KSeWwFnkdeCUmhgD4ZTTli84WSeLGj71LFvEXW9yMuc0Ux2xGplRkBc8Wv3PM+SgPxcUIUbVdiYWTQBvUQ1AafpuZjlJXkBpvLQSMOYu33Crwk7beKp4jbIBJoQGiVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856779; c=relaxed/simple;
	bh=zmElfo4wwKo+YuTwO44I2buljGIfeXw6fR9jlt6yYJk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uM2j3mDauMBdBAEhZBnvrsGbEY8oW037PUoGXP9siVDoqJV73tbyBPDwKELY7u8svSh4u0k+6HiShQ2pXD3Q8DllZUER8iGXkkJTurzFvIGE4y/bXzy1KVpdeIe3pveULuLbnFV7uyJWRyChPpBMQcmpWvG+L/4yzeoJ/0ZwrKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xCFeU-00010g-00; Thu, 01 Oct 2026 14:12:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1A43FC09D2; Thu,  1 Oct 2026 14:12:30 +0200 (CEST)
Date: Thu, 1 Oct 2026 14:12:30 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: octeon: Add detection of UBNT Edgeroute Lite
 devices
Message-ID: <ar5OLh3SBEmrr769@alpha.franken.de>
References: <20260927091512.117046-1-tsbogend@alpha.franken.de>
 <20260927091512.117046-2-tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927091512.117046-2-tsbogend@alpha.franken.de>

On Sun, Sep 27, 2026 at 11:15:11AM +0200, Thomas Bogendoerfer wrote:
> The U-Boot of Ubiquiti Edgerouter Lite don't provide a DT to the kernel.
> Use MIPS_MACHINE mechanism to provide one.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/boot/dts/cavium-octeon/Makefile |  1 +
>  arch/mips/cavium-octeon/Kconfig           |  5 +++++
>  arch/mips/cavium-octeon/Makefile          |  2 ++
>  arch/mips/cavium-octeon/board-ubnt.c      | 16 ++++++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 arch/mips/cavium-octeon/board-ubnt.c

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
