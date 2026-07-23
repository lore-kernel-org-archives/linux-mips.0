Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47C7431E4A;
	Thu, 23 Jul 2026 11:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805510; cv=none; b=Efrczu/JM2wHB+21eFQQoEXzJbwj3odxaIrX4jmHp7P92FPQdgyNoVe+LwLVGvv2pFonaSi9uzA0Ka5WIKFnOrKm1FQVYINAWcY33Vmxa+lwEzX0r2YrWvqPMJtO+rerSfU3I2pxbAc3wxB367YlbK/cQ3h+Y5Sb7uRxUT3LCM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805510; c=relaxed/simple;
	bh=E4Gw6L78ji0gZE4XGzfLnbX9DBdo/ZkgQjwopcQPSbU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DIyWoG3+aHVqHcYMfVeKlyb/hdcl2A2aH+YPdfnEpI0D2ESD+4ttG5uGvxdgRJZy53KyuPGXPh3rBle+hcc9rarguSm+IXEfoA5Ta2Zkvf0B13GxldiyK6z5M0pHL7CptjmN4fOojjzBspxtMfPg29YVcFAET2390E0vS/DmF2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=yDVSRscb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RdLkfRSe; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="yDVSRscb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RdLkfRSe"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id DA533EC00BE;
	Thu, 23 Jul 2026 07:18:23 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 23 Jul 2026 07:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784805503;
	 x=1784891903; bh=E4Gw6L78ji0gZE4XGzfLnbX9DBdo/ZkgQjwopcQPSbU=; b=
	yDVSRscb8fCvdrvRFyF0ujAcrE3Dtq5LPZl1bZzvlLs/gEz47ro9LlO0e8iXG4jZ
	iu4+9GxQWWK1B5Q51Nw+hd/Nsjph39ETNN5geayQtA9rhEvHLYbrPuOEr6yt6WtA
	nFQWKzTgeqd0EbM8OEEiTdNsCV95q8Aqnn5j0FInWxxR2fCiTRRgMHgkKtxo7v/I
	9jnG3NoorVasgudBVcIOrcFiK++5R0xE/zPkEY9wMHWE6cN+DjEby/sW1DsH9AtQ
	11jwniaiPx1vWCzcV3XqHOV16oGNWz6rPc9j9+ldQtm9QZVtnLV/PIRQgU0g7tD9
	uQFUceqQJyxBVU/uCqYsYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784805503; x=
	1784891903; bh=E4Gw6L78ji0gZE4XGzfLnbX9DBdo/ZkgQjwopcQPSbU=; b=R
	dLkfRSe9oVwll51Wy5jyggF5pD2H5V19Evf1NnQB1LOV7Fjhpa5gFiMuke1FvNfR
	OqFRDPPU+pSdBVd/HsznYwgiKPzy+H3NMQC4jmFmw98kVYD8OluG98/VkiHVLg4b
	iAYjag2uzpdXf1llGsTNTWTiGbKt3v3ehh5QqJKAVX5PunAUaSVUD41E//V5TJVo
	7ULM+CfopLOropuea0+ZOWM4Y8tCwWsvjF9xIInAKJamvdPu02wNsLwhOG88RO/+
	mNpinNizX6tnTNpwyCuPmvgZ+XUSqLCXDtp22i1Y76mIAD0xCmvvUoBaeDkTiDb5
	eKjOuMpHYhDesDIlzoTFQ==
X-ME-Sender: <xms:f_hhagLPunOs4sYOIPEx7AA8irDuIo9KtdGY0PcmJO0m4d5jKFbLmA>
    <xme:f_hhaq_D7Iney3yKkudhD5ThQE-17I3xS1FCjDgPoEHgNeU1T8eUxVL5Uw6uPVxp1
    Y-yp9w_Ery03ndMQFVzsEJ3Oxbb1nQXpJgq-sOx7Z0H1KqjI1eS5w>
X-ME-Proxy-Cause: dmFkZTGNesZXNvqamxgx+HeR6KJd8wPCXWeiyZ7rsj7Zi7phJLmdLeC46UaGlbE1LHMW4z
    TACsa+o9MRtrYjbKC3PjPpAbvQB0ZGi9I8BJXfCodP4hxgK+x2F2M8WJEeKOnLf/ws7x7K
    f8j78B5+mKdhI5FpK/8IhL98JWZUwWWy9MAFDdUE6DcFItjT0sJ3ZBKwXjYWTN9lcFgnLi
    EfJFP5lU5exNN0GA0+f++5NtqJXbHHyUG0+1ufONGO5yJ9Tl1xSJao7TwYQHPTzmeQFovP
    VXmOYUb5l7x16/6xvCd/v5VeC1KzCrWUthZ2yw4YUq2aKrMedKW8nSIsPqUjryDj6ghZVy
    +rXUGqTv+4dnPTL6x30ERPQf5QTkTNu8vqS8aQwgAHqABLWOkN5o9A2oJR1BUZq5YG+3hI
    Mfs6VjOWmHERv0ijd8g1MP6NiXV8jVnJKiH5Sf8vaiymDV10ly10j67fRRhh9u2og3pYts
    NYgHN6Zkhr/aKxSYUYGm06Cbya6CJsnxauQ6nAswa32OFIwypQ/La9C2lJdQJ6GLmuioQp
    3DeYliZHMJwn4+vGWZdEqy+mPaiTUt1faaQhTVB7xcLjDtdvLSADzbp435Cp0kGdEytBTV
    e2jKvDmYn+efJlIG872Aen9h8DaSPZyZ+Z/4LgCNrV/Ajuh3v41bo8OneD8Q
X-ME-Proxy: <xmx:f_hhap2ScCFh52xVOl23VuXBWtfh1PqrK_C5ZQoXVCu-XIR3R31Fug>
    <xmx:f_hham9hkMq3ln8BjTQYXC-CCnQnsOx5-vP-zEUFljyC239WUKYmQw>
    <xmx:f_hhaiPJaa5-xSlX51AykgiLdH1PkGwanayGrwgzAx9qTAFSunaVfg>
    <xmx:f_hhaidApZluYDmo1N_FmEQlgSO47i89QX-7RuNEh_nm-Cl4RCNmMg>
    <xmx:f_hhaqP--L8pCkx4V2jgbVWSzux3qEr5PJV3lIlgHADS0qIKP0HPLhzu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 29C7D1820082; Thu, 23 Jul 2026 07:18:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A-PqwUqgqKgZ
Date: Thu, 23 Jul 2026 13:16:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <8736edd1-7f7a-4c91-90b7-66f6ea5417c9@app.fastmail.com>
In-Reply-To: <20260723104933.117413-1-julianbraha@gmail.com>
References: <20260723104933.117413-1-julianbraha@gmail.com>
Subject: Re: [PATCH] mips: remove dead select
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 23, 2026, at 12:49, Julian Braha wrote:
> 'select' does not work on config options in a 'choice', so the current
> 'select CPU_BIG_ENDIAN' does nothing (dead code).
>
> However, ECONET already also selects SYS_SUPPORTS_BIG_ENDIAN so this
> means that CPU_BIG_ENDIAN will always be set.
>
> Let's remove the unnecessary 'select CPU_BIG_ENDIAN'.
>
> This dead select was found by kconfirm, a static analysis tool for
> Kconfig.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
