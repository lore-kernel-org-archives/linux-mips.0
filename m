Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3EA3F1065;
	Thu, 27 Aug 2026 23:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874497; cv=none; b=kPaim/bRJnEXbVdIBpdHMEhcAb383iv5ao3lFMgHH7UsStJVocXHy9BC3akQUQ/zK0U8RcswGmKXatXjlmD6690+hEZoGotWcOE4oAQF4PF+2/eUvKUjnMcIan1loB8Tlth9EvkavT3JuXvcotlCxQCsFl2ZIY3yJYfimsRawh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874497; c=relaxed/simple;
	bh=79Ppe89qsYq40c+DjqrR7Kiv7DFxwdoetJ9eL0V6bD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWPRjxKA/b2RO2YG1zDpCjLvKfZhXAjnV8hvVPU77IJukD0yZdqm5YIHJOfiPdRO5e4TfgrgZVphsuBk5C1nYGuMlMU8Vp2mN8wkTGbq6prPeXFyxr1wEgQhozlVMm5+nTSlcuUhs8ets6vCeKDJbD7pmNUCKE4O6opOf3CsCRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sOiEYcWR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sOiEYcWR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=WbrA5H4Yvk57EOsBNWlV0ekpieSDSLCMYYWZTClSrEA=; b=sOiEYcWRvCSxRASVuNIzInC47i
	zNErCUzEMfXUGe0/SHQHaSCS6dB+wMNihofRUzgJpMfPm1xlgGmlDApET+ujz9oKz0qr0Lm0e65fv
	gJuIGjg6P8vAREnZELW3c7qIs4vS5iQ8YP1ix6Fy6TS4S8SzWVziYYpfbw3W+YfkjIQk1i0AwDByL
	mngleurW924PpzgIEnqId4llZUwhECm8TP4gIVKxO10MQ2a4qE2UkUjRPGJXlEDZczTRzCTA4mscp
	tPFUGksNR5nn/tVEHedLSjEk2tR5tSxNXqCZzVckNM7s/VPY7WJMLucXfA8261xYtmynDIor2bjm9
	TaSgwyMA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjpL-00000004vYb-1Jb0;
	Thu, 27 Aug 2026 23:48:11 +0000
Message-ID: <6bd84489-88e4-4b72-b1f8-af5e1866a37e@infradead.org>
Date: Thu, 27 Aug 2026 16:48:10 -0700
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
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260817220344.2931634-1-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/17/26 3:03 PM, Caleb James DeLisle wrote:
> Add config based on OpenWrt for EN751221 boards.
> Of note: EcoNet bootloader has a 7.2MB kernel size limit so
> ZBOOT is assumed to be needed in all cases.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
> Updated to work after SERIAL_8250 and SERIAL_OF_PLATFORM removed
> from Kconfig.
> Link: https://lore.kernel.org/linux-mips/20260815235109.666268-1-julianbraha@gmail.com/
> ---
>  MAINTAINERS                                 |   1 +
>  arch/mips/configs/econet_en751221_defconfig | 264 ++++++++++++++++++++
>  2 files changed, 265 insertions(+)
>  create mode 100644 arch/mips/configs/econet_en751221_defconfig
> 
...
> 
> base-commit: 3b7711be02612845e44b5e9ef7c0b9f203cf29b6
> prerequisite-patch-id: 0f044e47a76450ebb4fe52dc60a6b2f79625bbff
> prerequisite-patch-id: 6380783b9da35b966b64c237b0ef50c31c7425d6

Hi,
Can you identify these 2 prerequisite patches?
They are not in linux-next so I can't test this patch.

thanks.
-- 
~Randy

