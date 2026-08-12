Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE8435AA1;
	Wed, 12 Aug 2026 15:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547992; cv=none; b=iLAXv1PnPJOflj+JqPtnBbeW8i9bYoW4gUUbmc8Lpi/U305/N6ip7GmoQFC8L9kQPM9UxqklRr0hK/ZoIs0qMYBUHl8zKj/AIC610+duOmSdBBfaymclPYS3wiQo9ZvKjXzBh94WGfLr9YooU/NEyIDzMGgcg7AWT4GXfRsQCt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547992; c=relaxed/simple;
	bh=Aadh4Rx4lJjnqGOKhEBxH2NnIczz5qYDOLHGG0rL3+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unUM2VXE3cS6YmswZyY9D4LnU8VgSb0UptvOQ/+AlD+aX9zb55sKSbDI5XGK2gbnkr9MvG+STPMYgbVc4tm6DIQDKW//NN+7vLQF1jTZ1cl/G5vnejTkZTEq/2LaOCtWMWLbAys+DqJqbI17bcX8soeVLWJRVQ/w8s5IjVA9GJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vlKYJ5Z/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vlKYJ5Z/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rKGg676/eB+/SHyd1ghkskDR9SaoRFV/oOdAnR9FK38=; b=vlKYJ5Z/NE7VevPosY01vnjUwz
	JoUEDd3zj/pLCyYnLiYsLFTNVFZR11gnqafOcELvbwdiM7sVpRsdjpPdxanV2wis+2fLzFIH4ixnT
	hoDS2TRNtLBdrvyB4asxJIrbs38yg3W04u/lfbrwKm38y2zoUPQiz0Qqvm69O7Sl4q2r6wd95p052
	eVEyVUwwZCrVya/mJthDfSfccy1JydC+lOhw6n+3lX3GtduNhT2S5uBO2KvVD6PMT3aBQO/6APPVN
	Qm3GL9XHClTr1zepRgh/BD4iZMocXhlAi9gUpPqblouicRDxPOo3Igb3Zc7XDaxrCnCqg8WkFIflL
	4t4S2Heg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAk7-0000000GSRn-2LNd;
	Wed, 12 Aug 2026 15:19:47 +0000
Message-ID: <486033fb-a846-4b41-9814-3ccf88e6d169@infradead.org>
Date: Wed, 12 Aug 2026 08:19:46 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: econet: fulfill unmet kconfig dependencies
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-kernel@vger.kernel.org, Caleb James DeLisle <cjd@cjdns.fr>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
References: <20260812032622.1759569-1-rdunlap@infradead.org>
 <CAOiHx=mrJh0szu2B8NWideUH8RqUaM7S4OV9J4wN6p93-quW4Q@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAOiHx=mrJh0szu2B8NWideUH8RqUaM7S4OV9J4wN6p93-quW4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hui,

On 8/12/26 6:12 AM, Jonas Gorski wrote:
> Hi,
> 
> On Wed, Aug 12, 2026 at 5:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> ECONET selects SERIAL_8250 even though its TTY dependency is not met.
>> ECONET selects SERIAL_OF_PLATFORM even though its TTY dependency is not
>> met.
>> ECONET selects EARLY_PRINTK_8250 even though its EARLY_PRINTK dependency
>> is not met.
>>
>> Fix these kconfig warnings by adding selects for TTY and EARLY_PRINTK.
>>
>> WARNING: unmet direct dependencies detected for SERIAL_8250
>>   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
>>   Selected by [y]:
>>   - ECONET [=y]
>>
>> WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
>>   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
>>   Selected by [y]:
>>   - ECONET [=y]
>>
>> WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
>>   Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
>>   Selected by [y]:
>>   - ECONET [=y]
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: Caleb James DeLisle <cjd@cjdns.fr>
>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>> Cc: linux-mips@vger.kernel.org
>>
>>  arch/mips/Kconfig |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> --- linux-next-20260810.orig/arch/mips/Kconfig
>> +++ linux-next-20260810/arch/mips/Kconfig
>> @@ -396,6 +396,7 @@ config ECONET
>>         bool "EcoNet MIPS family"
>>         select BOOT_RAW
>>         select DEBUG_ZBOOT if DEBUG_KERNEL
>> +       select EARLY_PRINTK
>>         select EARLY_PRINTK_8250
> 
> I think the correct solution here is to drop EARLY_PRINTK_8250 instead.
> 

Gladly.

> ECONET already selects SYS_HAS_EARLY_PRINTK and
> USE_GENERIC_EARLY_PRINTK_8250. EARLY_PRINTK defaults to y if
> SYS_HAS_EARLY_PRINTK is y (unless EXPERT is enabled), and
> EARLY_PRINTK_8250 defaults to y if both EARLY_PRINTK and
> USE_GENERIC_EARLY_PRINTK_8250 are y.
> 
> That way users can actually disable EARLY_PRINTK if they wish.
> 
>>         select ECONET_EN751221_TIMER
>>         select SERIAL_8250
>> @@ -407,6 +408,7 @@ config ECONET
>>         select SYS_SUPPORTS_32BIT_KERNEL
>>         select SYS_SUPPORTS_MIPS16
>>         select SYS_SUPPORTS_ZBOOT_UART16550
>> +       select TTY
> 
> Here I don't know. ECONET seems to be the only platform (treewide)
> that selects SERIAL_OF_PLATFORM and SERIAL_8250. Everyone else just
> enables these via their defconfigs. No hard feelings one way or the
> other, just noticed ECONET is the exception here.

I don't prefer using "select" - it just went along with the rest of the
Kconfig file. IOW, I would prefer using "depends on TTY".
But you are saying that it could go into some (non-existing) defconfig file?

>>         select USE_GENERIC_EARLY_PRINTK_8250
>>         select USE_OF
>>         help

thanks.
-- 
~Randy

