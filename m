Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911723;
	b=ry+nRVeSwNRBAOTTm3XIx3fbIbd42np+ZXvNBLnN5ZSLpn3HtkVHVqrhLQWbJFFgFGNK
	 3t4SUoBteQXYIftK+FKfh6Kxv2w/W+ryRFuY314Piw6I0bTM/j24PQ7AiQUuMWnFRHI44
	 n5eTiSBvTGVgWmnMIhyTPrS21WI7CTWQPctoAKXqX1Ns98jntmua73JajeEQS6eLTCBdM
	 0yNK3zYC61B7ndQgN8V933GHk6X8YEtkS38A5t03L8mgWJUFr8HH9RXSQivPNFJ16VfF6
	 I47MwIwCau6n74upPZp1seKI4sUCrPZEEDcH1fwCWJRex43n0AszI54jPU3fXiPw1HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911723;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=ozaSRCF3ns3TdfwuqLcS/RvJouUC669txRlTVKR2W6g=;
	b=UPrgTs7TTKqP83qMHt0Y91/oUeq+02xAZ+XtmwsT7BUoDyWYF440Tj/OfntSv/akhNGM
	 XeYNqGzbsjFgCn02eGdRBMJfKfjxaeBBMDM43AyANcZGkUj7y65LrCgngHBWHK+XEUKKk
	 sjHnT0A8uIP6BawCNgnEWUmYHIPf5Yn8+Tp2alMrzsuv077eQb1UP+Y+6nUkhM4njKGgg
	 j2rd65M1vjm3z4GcumdEqMJd2U6sxzdtLunaJzmXOSOKnoF6iaON9kxLaj3Nmh6prGjgn
	 XUvKzEIIpoNxlVqh1anzvJIK9e+rFwckXfkCdL5L5+EYeUqfAzymO9wmVepKPbI7xvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QxWe2OfE;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B305D606A31C
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 10:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B305D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QxWe2OfE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 85522C4CBCB;
	Tue, 17 Nov 2026 10:35:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22AF95FC81;
	Tue, 17 Nov 2026 10:35:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EFD811BC0617;
	Tue, 17 Nov 2026 11:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794911719; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ozaSRCF3ns3TdfwuqLcS/RvJouUC669txRlTVKR2W6g=;
	b=QxWe2OfEZduMRFK8iuJ33wTHUQ31LgA/8plpVXIdkJj9bJfw1hlcJqXj/gpxFHc4L6QGib
	qBT8M8dB+F8A3trB+m9QhZMc7lOUi8iQ4U48NwGMllM7kRHJJJOXX83M5MB8BLTVIXoPQN
	5ykuzy6jHRSrt61HMhQc/4IPwp+L6B1R5lDh94vanFbnT+J9hip+hSjzMRx1+SJ/1j6Wkz
	v1L3Zl96OQtHZGuOEioBMNev/Lok6dlt5D59cctVeNvMfkT3iYzEhlW8hBxJ4WeFfXJQia
	1pBAcP2svtfVac06AUvQ5AOqR33SBOB9+zWsgeoRpaEUCvF5vWh6zHBTiNZrkQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  devicetree@vger.kernel.org,  Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  linux-mips@vger.kernel.org,
  Hauke Mehrtens <hauke@hauke-m.de>,  Aleksander Jan Bajkowski
 <olek2@wp.pl>,  John Crispin <john@phrozen.org>,  Sebastien Decourriere
 <sebtx452@gmail.com>,  Yangtao Li <frank.li@vivo.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: mtd: Add lantiq,nor
In-Reply-To: <20261114100608.3432120-3-sw@simonwunderlich.de> (Simon
	Wunderlich's message of "Sat, 14 Nov 2026 11:06:04 +0100")
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
	<20261114100608.3432120-3-sw@simonwunderlich.de>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 11:35:13 +0100
Message-ID: <87fqwzn3tq.fsf@bootlin.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Simon,

On 14/11/2026 at 11:06:04 +01, Simon Wunderlich <sw@simonwunderlich.de> wro=
te:

> The NOR flash on the External Bus Unit (EBU) of Lantiq SoCs is handled
> by the lantiq-flash driver and used by danube_easy50712.dts, but its
> binding was never documented.
>
> Add a schema for it, including a new optional lantiq,ebu-swap-check
> property. Some boot loaders, like the BOSS bootmonitor on the bintec
> elmeg RS123 and RS353, enable the EBU's own endianness swapping for the
> flash chip select (EBU_BUSCON0 bit 30), and the flash then appears at
> its unswapped addresses. Whether that bit can be trusted depends on the
> SoC: it only works on VR9 (xRX200) from revision 1.2 and on AR10
> (xRX300), and Falcon has no such register. A board property instead of
> a list of SoC revisions in the driver was requested in the review of an
> earlier attempt at this. The property does not state the bit's value,
> so a board keeps working with either boot loader setting.
>
> Link: https://lists.infradead.org/pipermail/linux-mtd/2017-January/071749=
.html
> Link: https://lists.infradead.org/pipermail/linux-mtd/2017-January/071818=
.html
> Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>

Let's be honest, I am not very familiar with that MTD area and all the
legacy content is has, but would it be a lot more work to add lantiq as
a physmap variant? I don't like much the fact that you describe the
flash without describing the EBU. Physmap versions typically are matched
using the more specific compatible (lantiq,ebu?) and the cfi-flash
fallback. All your tweaks are EBU/machine/integration details, not
related to the flash itself.

One consequence of not modeling the controller is your need for
EXPORT_SYMBOL_GPL(ltq_ebu_membase) in patch 3/5, which is quite a hack.

Thanks,
Miqu=C3=A8l
