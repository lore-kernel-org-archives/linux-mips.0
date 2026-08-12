Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385321E5B70
	for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 01:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786498445; cv=none; b=l5wGGhxQg9BLyrB1GiO1qIUunxoyTJ76I1PM2PIlZcrKsHB2iSj9DL/9ElbeOPrLxG4CVx677815ivabj0soqRJvsNku0WuUqKW3fIA1o+r4ciGg6OBEnGATtXZUJIhc9Fn6bvoB4PAbZ89Kg1cqoAYQefJ8bhIFMoUGepxsJQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786498445; c=relaxed/simple;
	bh=egqUZklBG/dbZooRB/6a7a7Apq9jgQjgUa0tbMIE3X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZMCq/TCDI3R52mz8OXEGW2HQhE3twKjqpm3bV1JG0suhq8VmNemkd0TVq8i8GknkCSimbVaSK6/ZuGeUjpx6zXDzqwHp5iyncrglv8Num+dzkOZ5Gf36r8XJxFqkV4IrU5osrO3wG2p5LxTKvyjGhtXMb3q80NboB+fDoXLkRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Z2CsWjvQ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Z2CsWjvQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=PzxXTvug+TaoaNWVZrThgEJjDorynKj7tqJFmRRAX1E=; b=Z2CsWjvQRyKj6IfVU6XyBpqmfa
	pqZVHbP2Rz4fP3chpurC07vTEBT4nEx29uhnmsQ8cGn0u3J/4Sbk8/PlFaSTu1Igh2BK7604cs8Nm
	FNQFdYRJaIyA+d0K1wKWp5Mo8KenPHSNaqMEhN1E1KOZf2vG8wpo3p+Z7Dp/8MOrwhs58yCWP59iP
	7hszmN1Snwe3BncHAX3RGyANH4XQJyHa1Prt52n0AbvB+9NxHSBUa2qrxEdswABK2IAWD9bdezn23
	YiKrYJ0qboAGsgkzEJ3IHqCAzgozp6oQRQNguV4js0Eg4d7yISPD83NGwWWM3KFeRWYEv0qArygM0
	VWwjsEAA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtxqu-0000000FD2u-3abc;
	Wed, 12 Aug 2026 01:33:57 +0000
Message-ID: <206694af-a47d-421f-ad14-969a677aa5e2@infradead.org>
Date: Tue, 11 Aug 2026 18:33:30 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mips randconfig builds?
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <85609635-09af-4aa2-82ae-f022ee20264d@infradead.org>
 <alpine.DEB.2.21.2608111241300.48788@angie.orcam.me.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <alpine.DEB.2.21.2608111241300.48788@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/11/26 5:47 AM, Maciej W. Rozycki wrote:
> On Wed, 5 Aug 2026, Randy Dunlap wrote:
> 
>> I do lots of randconfig builds but I don't have a reliable way to
>> specify mips 32BIT or mips 64BIT builds.
> 
>  How is the MIPS port different from other dual-wordsize ones, such as 
> RISC-V?

To me it's the dependencies of the 32BIT and 64BIT symbols:

config 32BIT
	bool "32-bit kernel"
	depends on CPU_SUPPORTS_32BIT_KERNEL && SYS_SUPPORTS_32BIT_KERNEL
	select TRAD_SIGNALS
	help
	  Select this option if you want to build a 32-bit kernel.

config 64BIT
	bool "64-bit kernel"
	depends on CPU_SUPPORTS_64BIT_KERNEL && SYS_SUPPORTS_64BIT_KERNEL

For RISC-V (after s/32BIT/RV32I/ and s/64BIT/RV64I/), it's:

config ARCH_RV32I
	bool "RV32I"
	depends on NONPORTABLE
	select 32BIT
	select GENERIC_LIB_UCMPDI2

config ARCH_RV64I
	bool "RV64I"
	select 64BIT
	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
	select SWIOTLB if MMU

and the NONPORTABLE part of RV32I is easily handled in
arch/riscv/configs/32-bit.config.

Most of the other ARCHes -- if they have any 32/64BIT dependencies --
are easily handled via a mini.config file.

> Can you just grep .config resulting for 32BIT/64BIT and assign the build > accordingly?

That will still depend on the other dependencies listed above.
And since they have dependencies, it's probably not reliable.
And I'm looking for something that is scriptable.

In the end, what I'm looking for is something similar to what
arch/powerpc/ and arch/riscv/ have for randconfig targets:
  ppc32_randconfig
  ppc64_randconfig
  rv32_randconfig
  rv64_randconfig

I'll play around with setting {CPU,SYS}_SUPPORTS_32BIT_KERNEL for 32-bit
and {CPU,SYS}_SUPPORTS_64BIT_KERNEL for 64-bit [done via mini.config files]
to see if that will help me make some progress.

>  One target toolchain will handle both, so there is no need to know that 
> in advance of `make randconfig' invocation (one advantage of not linking 
> libgcc.a or any other target libraries is there's no need for multilibs).

OK. That might be useful info.

thanks.
-- 
~Randy

