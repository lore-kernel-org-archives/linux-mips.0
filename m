Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F0A363C74;
	Wed, 12 Aug 2026 19:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786561251; cv=none; b=pnXaF5Crt8d3EN7XNOM7QmOLnByqeWi2xJ3lFBty9jq01GSbXLKUgEh1Eg/E/jtxllpztyWr/EVU4E87laH9KCpQNMpSFPigZFzTlPj1uAPhUce3iscGOUuyEAUtD3PFY0/QmS3jPSRNY25qYWb3daS7ohfjCP0PL2NQcOrH2+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786561251; c=relaxed/simple;
	bh=BojrfbFR5ezC47RBbpgCo0QSuVl3jphvhgYf4GLEHp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHSQOj9xPMRLkinJ0WfE8ln5Dj/KcXgjlecpsMdMpwwsCikO8d7BxvvK/V7w5Ir4Ay15c23w0chCqGfyGGtq8D1rwMg9dcwwPXmwOMJ3DC9XDGAZB6g7OLTt3ceQlrEcCVRBxaeqlaWGDS9hXuD52GLbVanq+lMYh54SeOOBH40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=USm4FLaC; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="USm4FLaC"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2CF82CF143;
	Wed, 12 Aug 2026 20:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1786560659; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=WPnttnO8U9bZkLSxrIUIDAD/rtp4JX0DOm80hNbKywY=;
	b=USm4FLaCgS1P22l3zLFSpNOskrw/ekYvn/yEXcMOpwq5e42CsQtHyYH5paO1yAu79Jnd1A
	fZbrrm8fpg806Vfev4mnHxUSfHu2QLp6NbprBsVThcuJc6fEjmcr0skLQFBp7BABXQTCVp
	AbWhLVynmIsRkZ3i/EpTlIkVCbA5iSCmfyhvdpYs+Cm0RfXKpn5MBypcK6XF3iLMeSdskz
	YoLvfIvsWP2wPEnHcAMw3XL4+I4Fb39Z6Ei7Sqtx8gUM7WEXLyu3N7zGX8G8L0F9lggKJa
	8BGfxrPyVjLniiat4RmIpQIpcsfkkqOftjZOUR15IjDilpvSihUW9ojIXG07yw==
Message-ID: <4fec0e7a-939e-4b29-bf0b-f8c7523281fa@cjdns.fr>
Date: Wed, 12 Aug 2026 20:50:55 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] mips: econet: fulfill unmet kconfig dependencies
To: Jonas Gorski <jonas.gorski@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
References: <20260812032622.1759569-1-rdunlap@infradead.org>
 <CAOiHx=mrJh0szu2B8NWideUH8RqUaM7S4OV9J4wN6p93-quW4Q@mail.gmail.com>
 <486033fb-a846-4b41-9814-3ccf88e6d169@infradead.org>
 <CAOiHx=kxibbnfXCKwOfaVgNp2N87q0fY++Evh=VNKf+kJg5wPw@mail.gmail.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <CAOiHx=kxibbnfXCKwOfaVgNp2N87q0fY++Evh=VNKf+kJg5wPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3


On 12/08/2026 19:32, Jonas Gorski wrote:
> On Wed, Aug 12, 2026 at 5:19 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>> Hui,
>>
>> On 8/12/26 6:12 AM, Jonas Gorski wrote:
>>> Hi,
>>>
>>> On Wed, Aug 12, 2026 at 5:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>> ECONET selects SERIAL_8250 even though its TTY dependency is not met.
>>>> ECONET selects SERIAL_OF_PLATFORM even though its TTY dependency is not
>>>> met.
>>>> ECONET selects EARLY_PRINTK_8250 even though its EARLY_PRINTK dependency
>>>> is not met.
>>>>
>>>> Fix these kconfig warnings by adding selects for TTY and EARLY_PRINTK.
>>>>
>>>> WARNING: unmet direct dependencies detected for SERIAL_8250
>>>>    Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
>>>>    Selected by [y]:
>>>>    - ECONET [=y]
>>>>
>>>> WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
>>>>    Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
>>>>    Selected by [y]:
>>>>    - ECONET [=y]
>>>>
>>>> WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
>>>>    Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
>>>>    Selected by [y]:
>>>>    - ECONET [=y]
>>>>
>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>> ---
>>>> Cc: Caleb James DeLisle <cjd@cjdns.fr>
>>>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>>>> Cc: linux-mips@vger.kernel.org
>>>>
>>>>   arch/mips/Kconfig |    2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> --- linux-next-20260810.orig/arch/mips/Kconfig
>>>> +++ linux-next-20260810/arch/mips/Kconfig
>>>> @@ -396,6 +396,7 @@ config ECONET
>>>>          bool "EcoNet MIPS family"
>>>>          select BOOT_RAW
>>>>          select DEBUG_ZBOOT if DEBUG_KERNEL
>>>> +       select EARLY_PRINTK
>>>>          select EARLY_PRINTK_8250
>>> I think the correct solution here is to drop EARLY_PRINTK_8250 instead.
>>>
>> Gladly.
>>
>>> ECONET already selects SYS_HAS_EARLY_PRINTK and
>>> USE_GENERIC_EARLY_PRINTK_8250. EARLY_PRINTK defaults to y if
>>> SYS_HAS_EARLY_PRINTK is y (unless EXPERT is enabled), and
>>> EARLY_PRINTK_8250 defaults to y if both EARLY_PRINTK and
>>> USE_GENERIC_EARLY_PRINTK_8250 are y.
>>>
>>> That way users can actually disable EARLY_PRINTK if they wish.
>>>
>>>>          select ECONET_EN751221_TIMER
>>>>          select SERIAL_8250
>>>> @@ -407,6 +408,7 @@ config ECONET
>>>>          select SYS_SUPPORTS_32BIT_KERNEL
>>>>          select SYS_SUPPORTS_MIPS16
>>>>          select SYS_SUPPORTS_ZBOOT_UART16550
>>>> +       select TTY
>>> Here I don't know. ECONET seems to be the only platform (treewide)
>>> that selects SERIAL_OF_PLATFORM and SERIAL_8250. Everyone else just
>>> enables these via their defconfigs. No hard feelings one way or the
>>> other, just noticed ECONET is the exception here.
>> I don't prefer using "select" - it just went along with the rest of the
>> Kconfig file. IOW, I would prefer using "depends on TTY".
>> But you are saying that it could go into some (non-existing) defconfig file?
> More like I grepped through the whole tree and ECONET was the only one
> selecting these symbols, and all other occurrences where in
> defconfigs.
>
> But as you correctly pointed out, there is no defconfig for econet, so
> I guess as a quick fix selecting TTY is okay, and once a defconfig
> exists we can drop it.
>
> Caleb, could you maybe add one?


The use of select was not for any particular reason, when I implemented 
this I was still figuring out the platform and the best practices. I'll 
be happy to send a patch to normalize this in the next couple of days.

Thanks,

Caleb


>
> Best regards,
> Jonas
