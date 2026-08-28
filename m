Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D813DAADE;
	Fri, 28 Aug 2026 10:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913658; cv=none; b=VmB5xsXhYPO03TFrpxaIY8OdDeSRBI5KDrgw1DrJ8VHPB1uWzNHJqqQWO8l49Jevz08Ed6tNx8x6TGdi4WplMtt17w2EX4ihGUSL1bY4dZF3FVOt6WY7aIa+TJGkmJFxrI8dzkOq3g7ntl2+6R/UdGoxazRC4/6XqafWncOhqqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913658; c=relaxed/simple;
	bh=GlYOctbS27Crbn7mNHENzdteRGpVV/EpprlDm0o4OMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKtH8FFwHEpBQOmOQ6CnL5KF++o3HQDMIFvFjomK5DTh60Hz4CNlbDYK+CrUEB+K5RGJ8xMaDfp45TwIuhOyeFLVJI0GImgAvA6DFeMw4O6RyRep1zQcZJ8fZzNke+fdvuPegdnXsypgHUcly1Qzn7qZiCyKnh55ZivXawRRgY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=F50EA460; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="F50EA460"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3D6621A96F;
	Fri, 28 Aug 2026 12:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787913647; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7G5so9kD5XBHPaoycuRizcuAGxyMjcTHKKAdkLKRsjw=;
	b=F50EA460KDaWQ9pYCB/6CtmecBG8sr7DjT6GV8DN9gU29/iCANBlRSDsK/6fGF5FU5/dee
	GGc8stSgF2peV/S3od74kKzBqjnCw1QCsxkxE43ss1u0tR1LrvlGWyLSJ46156e18KiRim
	Xz3lznvpMUhTO2bwXHOFaMXxPWdUH6xXbT5ZOuiAqVsRTadtykmfuICi1avMzkkyhWIYCG
	TQxb4jiN7tIMrkksSZhg9izbnT0O4bdyV1dsdecYeU27+kOMfzKyilk3F5shCwZB7VMG3r
	RlUPDc6hLuJ+3xPeMDQNmHusH91Vn/n+Fcc+ChHfTW3HhnexnaQ03ekN0IAdbg==
Message-ID: <3b55f50b-ec0a-4f93-9ccb-ba0e828ba32b@cjdns.fr>
Date: Fri, 28 Aug 2026 12:40:43 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2] MIPS: config: Add EcoNet EN751221 defconfig
To: Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org
Cc: tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
 jonas.gorski@gmail.com, julianbraha@gmail.com
References: <20260817220344.2931634-1-cjd@cjdns.fr>
 <6bd84489-88e4-4b72-b1f8-af5e1866a37e@infradead.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <6bd84489-88e4-4b72-b1f8-af5e1866a37e@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 28/08/2026 01:48, Randy Dunlap wrote:
>
> On 8/17/26 3:03 PM, Caleb James DeLisle wrote:
>> Add config based on OpenWrt for EN751221 boards.
>> Of note: EcoNet bootloader has a 7.2MB kernel size limit so
>> ZBOOT is assumed to be needed in all cases.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>> Updated to work after SERIAL_8250 and SERIAL_OF_PLATFORM removed
>> from Kconfig.
>> Link: https://lore.kernel.org/linux-mips/20260815235109.666268-1-julianbraha@gmail.com/
>> ---
>>   MAINTAINERS                                 |   1 +
>>   arch/mips/configs/econet_en751221_defconfig | 264 ++++++++++++++++++++
>>   2 files changed, 265 insertions(+)
>>   create mode 100644 arch/mips/configs/econet_en751221_defconfig
>>
> ...
>> base-commit: 3b7711be02612845e44b5e9ef7c0b9f203cf29b6
>> prerequisite-patch-id: 0f044e47a76450ebb4fe52dc60a6b2f79625bbff
>> prerequisite-patch-id: 6380783b9da35b966b64c237b0ef50c31c7425d6
> Hi,
> Can you identify these 2 prerequisite patches?
> They are not in linux-next so I can't test this patch.


Ahh, I'm sorry for not being clearer about this in the message.

The first (0f044e47a76450ebb4fe52dc60a6b2f79625bbff) is 
2077ccb9baa2cbbbccf5f0d8c2196dd9d5e43399, i.e. 
https://patch.msgid.link/20260702150704.265282-1-cjd@cjdns.fr which is 
in (at least) next-20260827 but not in mips-next. I included it so I 
could verify PCIe works on the device.

6380783b9da35b966b64c237b0ef50c31c7425d6 is the patch I mentioned: 
https://lore.kernel.org/linux-mips/20260815235109.666268-1-julianbraha@gmail.com/ 
which I applied to verify it works without needing the symbols that the 
goal was to remove.

That said, this should definitely build without either of these patches 
which is why I neglected to explain them in any more detail.

Thanks,

Caleb

>
> thanks.
