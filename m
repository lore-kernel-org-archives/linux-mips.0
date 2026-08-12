Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5080330D35;
	Wed, 12 Aug 2026 18:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786560816; cv=none; b=u4MSgbYhHuIj2FkZwYV2N/+gpDNgpidYErng4GDTEmx3rrb+NPFUatE2BB9nef31TtkvnfXxj/fEJZoZx0SgK1qkXVY0/C2SVSva8PfkGPHPss7wxFULDyZ8B2mENhk2dusIc4tWqMPWm2viqJ6Jd8i90qPRzyOpONod5F78bJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786560816; c=relaxed/simple;
	bh=oRTrSW6JKuLNU5+Yt1muP/d5JJvqnIq8p0x1jZNSbW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WdBfYod2p9peq21TZcu4U1MlFPLUYnkpX47pzWVcDtqgUrxbQflSfGvQsdIP0zWsNGlPhxIqbyeOdFQfUJvMtx6IPXSJoNglYfISnk9IjzSX2enugnWXzAfUhx6nezO6mq8353mZkEby8RowP0PVJ5fcfKwirMPXlx1/JWmkjRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=xIah+Ye+; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="xIah+Ye+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Pv/u2xPJH1XukE1LarUoQpLIMQffe+riEYBa3PeQ47M=; b=xIah+Ye+x8TI7veEqpEV8OZEeH
	/i3xy+vz0f1HjcuYRTz/S6cOfAH0SxSgU+Q+omQzxslmC17fDnqjgAm5dOj2zEeoADG1o8veI7WcK
	s2i3h1M99Argl01XRhkEOQ/fjYyh7C6V04u3fAdX6lB/+yKLvHc38pewhk160ADIIQT3yKIAjl8Em
	BUhTLWGfvk6nyHfpmSI65xn22JGQFSG/8NT0Lgbc8yHDE+MitN7L+umEz3mO4X44z0o2QOLsXssIB
	s3HfwCyfoRQkcUgtf+dCYQEvm0NiCJpNSz6b5oBQWteIYIGd9roma4FamNwXwJJIm+OqcK0z5Rb93
	OmkN2Z5Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuE4y-0000000GptW-4C7r;
	Wed, 12 Aug 2026 18:53:33 +0000
Message-ID: <73b3e387-7365-46a8-af56-2386064d82bd@infradead.org>
Date: Wed, 12 Aug 2026 11:53:32 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: econet: fulfill unmet kconfig dependencies
To: Caleb James DeLisle <cjd@cjdns.fr>, Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
References: <20260812032622.1759569-1-rdunlap@infradead.org>
 <CAOiHx=mrJh0szu2B8NWideUH8RqUaM7S4OV9J4wN6p93-quW4Q@mail.gmail.com>
 <486033fb-a846-4b41-9814-3ccf88e6d169@infradead.org>
 <CAOiHx=kxibbnfXCKwOfaVgNp2N87q0fY++Evh=VNKf+kJg5wPw@mail.gmail.com>
 <4fec0e7a-939e-4b29-bf0b-f8c7523281fa@cjdns.fr>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <4fec0e7a-939e-4b29-bf0b-f8c7523281fa@cjdns.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/12/26 11:50 AM, Caleb James DeLisle wrote:
> 
> On 12/08/2026 19:32, Jonas Gorski wrote:
>> On Wed, Aug 12, 2026 at 5:19 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>> Hui,
>>>
>>> On 8/12/26 6:12 AM, Jonas Gorski wrote:
>>>> Hi,
>>>>
>>>> On Wed, Aug 12, 2026 at 5:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>> ECONET selects SERIAL_8250 even though its TTY dependency is not met.
>>>>> ECONET selects SERIAL_OF_PLATFORM even though its TTY dependency is not
>>>>> met.
>>>>> ECONET selects EARLY_PRINTK_8250 even though its EARLY_PRINTK dependency
>>>>> is not met.
>>>>>
>>>>> Fix these kconfig warnings by adding selects for TTY and EARLY_PRINTK.
>>>>>
>>>>> WARNING: unmet direct dependencies detected for SERIAL_8250
>>>>>    Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
>>>>>    Selected by [y]:
>>>>>    - ECONET [=y]
>>>>>
>>>>> WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
>>>>>    Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
>>>>>    Selected by [y]:
>>>>>    - ECONET [=y]
>>>>>
>>>>> WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
>>>>>    Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
>>>>>    Selected by [y]:
>>>>>    - ECONET [=y]
>>>>>
>>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>>> ---
>>>>> Cc: Caleb James DeLisle <cjd@cjdns.fr>
>>>>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>>>>> Cc: linux-mips@vger.kernel.org
>>>>>
>>>>>   arch/mips/Kconfig |    2 ++
>>>>>   1 file changed, 2 insertions(+)
>>>>>
>>>>> --- linux-next-20260810.orig/arch/mips/Kconfig
>>>>> +++ linux-next-20260810/arch/mips/Kconfig
>>>>> @@ -396,6 +396,7 @@ config ECONET
>>>>>          bool "EcoNet MIPS family"
>>>>>          select BOOT_RAW
>>>>>          select DEBUG_ZBOOT if DEBUG_KERNEL
>>>>> +       select EARLY_PRINTK
>>>>>          select EARLY_PRINTK_8250
>>>> I think the correct solution here is to drop EARLY_PRINTK_8250 instead.
>>>>
>>> Gladly.
>>>
>>>> ECONET already selects SYS_HAS_EARLY_PRINTK and
>>>> USE_GENERIC_EARLY_PRINTK_8250. EARLY_PRINTK defaults to y if
>>>> SYS_HAS_EARLY_PRINTK is y (unless EXPERT is enabled), and
>>>> EARLY_PRINTK_8250 defaults to y if both EARLY_PRINTK and
>>>> USE_GENERIC_EARLY_PRINTK_8250 are y.
>>>>
>>>> That way users can actually disable EARLY_PRINTK if they wish.
>>>>
>>>>>          select ECONET_EN751221_TIMER
>>>>>          select SERIAL_8250
>>>>> @@ -407,6 +408,7 @@ config ECONET
>>>>>          select SYS_SUPPORTS_32BIT_KERNEL
>>>>>          select SYS_SUPPORTS_MIPS16
>>>>>          select SYS_SUPPORTS_ZBOOT_UART16550
>>>>> +       select TTY
>>>> Here I don't know. ECONET seems to be the only platform (treewide)
>>>> that selects SERIAL_OF_PLATFORM and SERIAL_8250. Everyone else just
>>>> enables these via their defconfigs. No hard feelings one way or the
>>>> other, just noticed ECONET is the exception here.
>>> I don't prefer using "select" - it just went along with the rest of the
>>> Kconfig file. IOW, I would prefer using "depends on TTY".
>>> But you are saying that it could go into some (non-existing) defconfig file?
>> More like I grepped through the whole tree and ECONET was the only one
>> selecting these symbols, and all other occurrences where in
>> defconfigs.
>>
>> But as you correctly pointed out, there is no defconfig for econet, so
>> I guess as a quick fix selecting TTY is okay, and once a defconfig
>> exists we can drop it.
>>
>> Caleb, could you maybe add one?
> 
> 
> The use of select was not for any particular reason, when I implemented this I was still figuring out the platform and the best practices. I'll be happy to send a patch to normalize this in the next couple of days.

Great. I'll drop my patch and look forward to seeing yours.

Thanks.

-- 
~Randy

