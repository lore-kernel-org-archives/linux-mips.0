Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893543;
	b=ltHopKWmwK/uEjNHg4BsJJXE+n70mbSFaRZunCjILbvAh4zMPrRPvPmH1/yNDKam1Ydq
	 WqLxlUv9TyXXGOXsrQHGC7U4oHAcQz0xe2WgPziNONDIP4KZlslcbzLZK1Ue9be4Zhikw
	 HBmvoXZuxcUEcl4rEn2a18OXcmgON4lB1JlXJQOI4zwzabfK4fskEzoPWjU8Zz4LKmHrU
	 sC892ZMm8lpjbyOF5s6QOBLLHaVqM1t5EY60aqK392Slh+SiMJu68RsBxwJUr9Or7Fbd+
	 0oThT0sXmeDl7M3sLumG72gBsr0HLl9HuOWaG4Oz2AFi8djKzPgRbxSqyt+R18Sw0/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893543;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4EsP1Q9uHl9zcUo4J/SAhFK4CP2OnQlLM8lM1bBsfbA=;
	b=lXsA2+YGNRIkTgJQrrvQQVAmPIxXRgBJ0WNdZ3TzYdBFC5Pu4/G8JS4a/OJ8e53eWbG7
	 cf9cInwhdFWbD6lqBmv3gO2Z4iczCwQLEMuiwfmJtVj4lVFe0lUYasuxevuY5PJda4X5/
	 Tv+wSKEor0XLj8QRvwPC/oZClKhZcAVXtXlvLQePC+I/v/yOui/BEONJiechPCdGlV80R
	 xAlGzXr46s9FhdzfyArVvDqdpwc9ZSoevnktNUMuPnjJEhNruuC8guO8Qh6q8JDD/UOy7
	 IvfLI4MowDjGoPYKHLLF6g373OgLIskFja/GfkcVXlJkz/ptHvKZfS2f5OEtVZWzupA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B57A606A32E;
	Thu,  5 Nov 2026 15:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B57A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xOzeg-00071C-00; Thu, 05 Nov 2026 16:45:34 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A2DDFC0508; Thu,  5 Nov 2026 16:22:21 +0100 (CET)
Date: Thu, 5 Nov 2026 16:22:21 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Imre Kaloz <kaloz@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] MIPS: SGI-IP30: fix the defconfig defaults for the
 Bridge PROM and RTC
Message-ID: <auyfLWftx35e-Bk2@alpha.franken.de>
References: <20261013094554.16804-1-kaloz@kernel.org>
 <20261013094554.16804-4-kaloz@kernel.org>
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
In-Reply-To: <20261013094554.16804-4-kaloz@kernel.org>

On Tue, Oct 13, 2026 at 11:45:54AM +0200, Imre Kaloz wrote:
> The Bridge probe reads its part number from the 1-wire PROM and defers
> until the SGI 1-wire master and DS250x slave are present, so without
> them there is no PCI bus and no serial console.
> 
> The IP30 RTC is a DS1685-family part, but the defconfig, derived from
> ip27_defconfig, has the M48T35 driver, so there is no RTC.
> 
> Enable the 1-wire drivers and select the DS1685 family.
> 
> Also drop four lines that savedefconfig removes, as CRYPTO_CAMELLIA,
> CRYPTO_CTS and CRYPTO_HMAC are selected built-in and IPV6_SIT=m is the
> default.
> 
> Fixes: bb2d63500b5c ("MIPS: config: Add ip30_defconfig")
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>
> ---
>  arch/mips/configs/ip30_defconfig | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
