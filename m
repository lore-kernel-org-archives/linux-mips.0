Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D1939FCB1;
	Thu, 13 Aug 2026 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786617785; cv=none; b=mOMo/Mv8/c11miPG3R3wGbc+gmwCJzqa+7VGlMbGPNgrY80OOwQ7vak12SE+S+5+wHoZenMzT6pAnhuvs9yYIEjkHYkxIBbAVKD3cmCHnfAfQYKpVMwwF9zq51uyqkVHOOi6OnNU4mPuUr3CGGVIl+pll3zbZC7+wCzNB2Iw/IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786617785; c=relaxed/simple;
	bh=2hYCHuL6D9CS0Dbfo6SVKPxBWITSOW46xLzdO4HFKHQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=MZtJbHLTQDY9AeO6nSHHlsx2sHtezvgkvKywGIja/nbcKITRUZUT9YGBDYc7QN4nYCuA0xMEiLRXOBBxiJ93g3s87spu6M6xUytZWzxKWefsPnO6Kaem+DpdeD/W8l4ijLzMTJ7ZFlwoDXp+qNKfCBjYniLj2IXuQ2vePnX0+x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=GNZdno8G; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="GNZdno8G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1786617780; x=1787222580; i=markus.elfring@web.de;
	bh=2hYCHuL6D9CS0Dbfo6SVKPxBWITSOW46xLzdO4HFKHQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GNZdno8GUsBXCjlMuPdU1yPz/T6tn0KNq5RpTGz5H3B8D3gcURi+OfjpDV1jmWUI
	 6wJu5kC7XGFW+saKx/MSxTWWOXwaWEGdQ2asQoXs7cpX/UyVr7DkeF79vwMbCEpPg
	 UT2PIEoiyNPk7z8PmyGn2mnr6eIpjgm0/NJY97tO2SwPtzLs+rRNN37cin3O/fjtZ
	 VRYllmVXqifJODCAaRaOh3pc2Nb3slfDE4/5b0J3ZUvc5SWA8St10gdKq3OKHkT/m
	 rv5fXDsISwDfz6HIxc0feAM/t+n/HxtfzIyrqulwMlD5N1rGXB1Ok+zRFupZ5bPcM
	 TaCjHOkoOHQOMF8Gvw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWQyl-1wNogJ2SCp-00IxMG; Thu, 13
 Aug 2026 12:43:00 +0200
Message-ID: <afa61611-efe9-4795-bca2-4f823c3e30ce@web.de>
Date: Thu, 13 Aug 2026 12:42:58 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rosen Penev <rosenp@gmail.com>, linux-mips@vger.kernel.org,
 =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20260811183515.24596-1-rosenp@gmail.com>
Subject: Re: [PATCH] mips: rb532: use devm_platform_ioremap_resource in gpio
 probe
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260811183515.24596-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WScz1LASdhHLFpjOTDnDbBQ8j5YqGYnqydFYOBOhn0bLPabQGGA
 +QQRrHtpVSSvJ0bT29JQ/OZKsfWa9kwjtZyelzgKgD0xaEJa43AZDbzICXO+SzfPZslEwdI
 bF/PxNwW/XjwHLyMK7E/nZIM8fKeKvRZh/hnq1uiIiCb25QpASrS8hq+EcOLDIkX358CTrb
 B6mC/mRtaSJjnM8YjxKXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LqWJ0ltIxzk=;gDUMzv+7WfGXdgKjXfHr6E776X6
 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

> Replace the platform_get_resource()/devm_ioremap_resource() pair with
> the devm_platform_ioremap_resource() helper and drop the now-unused
> struct resource pointer and NULL check.
>=20
> Assisted-by: opencode:deepseek-v4-flash-free

Would it be helpful to mention that a wrapper function is available since
the commit 7945f929f1a77a1c8887a97ca07f87626858ff42 ("drivers:
provide devm_platform_ioremap_resource()")?

Regards,
Markus
