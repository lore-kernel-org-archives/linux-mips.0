Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50B635F161;
	Fri, 28 Aug 2026 17:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787938427; cv=none; b=plIkGlCOpVTCbZLUSbrJvMEgSaxg4Jkqk1mUiGaCZjbrIxMAoReue+y01RUVhNSv1hwoIvOv6raad8hu72ZBOq5t1CxDSVKtxDbC+DaRtBuLmm0dGzsx6cJIJcJDGhyQkgTRO5tHu7/tbvN1TB5NVoWorhULgmLc5/Yk1FbOmig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787938427; c=relaxed/simple;
	bh=mCP5z2EYKH6RZrswaAf5Kzi/if3nVqtD02Wm/RwH704=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIw12S1ow0b+IkmwWNHlNBcOlRqShvqQj3c92Nelhe9klAVEGZXMn7wXrKTyMxbXVtbKxqygFVMrbv7ow5pGGGkfemszXG27nkHxHHX6XZuXuHUs23Eix+3TsfpeOZvEm63rtTvkWZBG/nr7anlisRwW1Aasyn3QeZdNT8bY44Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EV/TMhbs; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EV/TMhbs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=l1QGqAfCbQ6LXbtkAiDHF6nGrW0REnethuzg6QBfuNs=; b=EV/TMhbs1o2y5TC2BaZC6+Rojv
	lwjHzk6kXPn04dyfldojwi07VUxvAeEmO4vU/X6KLiEclTHEUP54gCNrYUhdzCJMfD36BNqj2g0ls
	nl7JZrVDdjUeAlO6TWgnFDTogj+zM83aQ+3nd2vEGeAQ2Pzv3RCnpnntFZMM2EUIFfatnkjmqLQPr
	Mp2s/cVEtPNibIwiHyq5Zd04XjJ4C0J9dXq8dkEAFZoTgMF2H2hTMhcLIlbx2m2WqtINIGzxruHqi
	inYQMmufap2g8dB7o2jUsDhjD46skAVT6RHfP2I/BGJLzZKr5oNn9P7s7ooA0bf/byloyaSEpLMHH
	YqJzyovA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00SP-00000006GhR-2vgD;
	Fri, 28 Aug 2026 17:33:37 +0000
Message-ID: <a5dc8c42-232c-45f8-8ec4-2d7c5b68f01b@infradead.org>
Date: Fri, 28 Aug 2026 10:33:37 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MIPS: config: Add EcoNet EN751221 defconfig
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
 jonas.gorski@gmail.com, julianbraha@gmail.com
References: <20260817220344.2931634-1-cjd@cjdns.fr>
 <6bd84489-88e4-4b72-b1f8-af5e1866a37e@infradead.org>
 <3b55f50b-ec0a-4f93-9ccb-ba0e828ba32b@cjdns.fr>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <3b55f50b-ec0a-4f93-9ccb-ba0e828ba32b@cjdns.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/28/26 3:40 AM, Caleb James DeLisle wrote:
> 
> On 28/08/2026 01:48, Randy Dunlap wrote:
>>
>> On 8/17/26 3:03 PM, Caleb James DeLisle wrote:
>>> Add config based on OpenWrt for EN751221 boards.
>>> Of note: EcoNet bootloader has a 7.2MB kernel size limit so
>>> ZBOOT is assumed to be needed in all cases.
>>>
>>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>>> ---
>>> Updated to work after SERIAL_8250 and SERIAL_OF_PLATFORM removed
>>> from Kconfig.
>>> Link: https://lore.kernel.org/linux-mips/20260815235109.666268-1-julianbraha@gmail.com/
>>> ---
>>>   MAINTAINERS                                 |   1 +
>>>   arch/mips/configs/econet_en751221_defconfig | 264 ++++++++++++++++++++
>>>   2 files changed, 265 insertions(+)
>>>   create mode 100644 arch/mips/configs/econet_en751221_defconfig
>>>
>> ...
>>> base-commit: 3b7711be02612845e44b5e9ef7c0b9f203cf29b6
>>> prerequisite-patch-id: 0f044e47a76450ebb4fe52dc60a6b2f79625bbff
>>> prerequisite-patch-id: 6380783b9da35b966b64c237b0ef50c31c7425d6
>> Hi,
>> Can you identify these 2 prerequisite patches?
>> They are not in linux-next so I can't test this patch.
> 
> 
> Ahh, I'm sorry for not being clearer about this in the message.
> 
> The first (0f044e47a76450ebb4fe52dc60a6b2f79625bbff) is 2077ccb9baa2cbbbccf5f0d8c2196dd9d5e43399, i.e. https://patch.msgid.link/20260702150704.265282-1-cjd@cjdns.fr which is in (at least) next-20260827 but not in mips-next. I included it so I could verify PCIe works on the device.
> 
> 6380783b9da35b966b64c237b0ef50c31c7425d6 is the patch I mentioned: https://lore.kernel.org/linux-mips/20260815235109.666268-1-julianbraha@gmail.com/ which I applied to verify it works without needing the symbols that the goal was to remove.
> 
> That said, this should definitely build without either of these patches which is why I neglected to explain them in any more detail.

Ah, right you are. Thanks.

Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
