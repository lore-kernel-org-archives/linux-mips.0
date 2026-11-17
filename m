Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933946;
	b=eA3kavDCorSYuqN4/wWPxYNXHYhQlqg2CM9Gcrdz/pp1EcDl4e5jMLWQcVfWODCYaSNG
	 u7i9340yZAyiOzLWEyG2Ad2VSvqeLj1kjJ/TCX48YEi9MKYPuu/hEIQc4TuTL3lWK/RBU
	 Mvy1Rto6gvx9/dbV6H5dnohg9+cNkJpi/PePLt93uVU9T+onfCvYAUBo7H5u6qrzHLJBO
	 kvYwjPH+hYqu+U1jpGA10iJ09z4kW91rLFPGHljdq99X1m7shBzDVr1cpy6EnzR+GuQ6h
	 eJkFKD2PSWFa74MjHMR92jd8VvyAIoM5AHlrKl+Poj7poUHMmAv1f4uM8c7CZmtytbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933946;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=b7rA3f+5kZ4ohnzATtzU3IQFFAM5nwbvX+N6Ax6dlwg=;
	b=jlK1ge7NJY+HvdouJcmCsV84fxe9wqM28gg0YpCjBhw+hX9UawbtilEToNddHJL3B/O5
	 n50jfOzhUbHCD9AZRYqHl/IxFWViuSDDAYRf6OpQ0B/B9Ye5BwoXZT7aVjLhDP2tCbH1z
	 ZMYHQ0kxlFA0ep+0U9HkgJ8xgRwgjYMV1g4HKOf5eCuEdJ5Zpjfp/hCcyfpWSs5KMS8aW
	 QKYsILh76Be92GdcSkGUFDacMF5iryX3zkBK4rQiXAXopkEoBfUFfxaODnPVCYnk1fUq/
	 FEIozEfiBBWLF/chqWoExPWC/pTTYcHHsTiyeZ0lOH/qb6C6k46IW1e4HB1b3PfRVRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=Ko6SikcA;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D529606A31C;
	Tue, 17 Nov 2026 16:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D529606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=Ko6SikcA
Received: by mail.simonwunderlich.de (Postfix) id 7F3C0FA039;
	Tue, 17 Nov 2026 17:45:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794933937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7rA3f+5kZ4ohnzATtzU3IQFFAM5nwbvX+N6Ax6dlwg=;
	b=Ko6SikcAnFscPuvoOl+h9YTtyPLrjZi7kEEQLf3A0K+Imfmwfx22QXglwfosAAXMVs2uB+
	wATDpXH7/ggdyQl7iLTGzySpVWrVrrpEHIPzNwngA7mROUnuUHNR6TBAE2ergZLhyBnfVW
	RUVYgW5+9rqEMt8F1MWf8qwR7UUjv4mQEdYnwQYT1gK7bv8HgC6qGoQ5UE+JSqaMnV+9u/
	IFr7NZO8PUVfpea5ZWAqdymWRGwnyLYrrOZGIhfqvZhLgoQHt5WMGCeFgh6Ny4F+swoqAX
	TyByTHT9kqL2KHViMHVKIOlVjIHFY9/qRhncM3rENORPktp5RHmDX+NjrIgG+w==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Hauke Mehrtens <hauke@hauke-m.de>, Aleksander Jan Bajkowski <olek2@wp.pl>,
 John Crispin <john@phrozen.org>, Sebastien Decourriere <sebtx452@gmail.com>,
 Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: mtd: Add lantiq,nor
Date: Tue, 17 Nov 2026 17:45:36 +0100
Message-ID: <5155531.6YUMPnJmAY@prime>
In-Reply-To: <87fqwzn3tq.fsf@bootlin.com>
References:
 <20261114100608.3432120-1-sw@simonwunderlich.de>
 <20261114100608.3432120-3-sw@simonwunderlich.de> <87fqwzn3tq.fsf@bootlin.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, November 17, 2026 11:35:13=E2=80=AFAM Central European Standard=
 Time=20
Miquel Raynal wrote:
> Hi Simon,
>=20
> On 14/11/2026 at 11:06:04 +01, Simon Wunderlich <sw@simonwunderlich.de>=20
wrote:
> > The NOR flash on the External Bus Unit (EBU) of Lantiq SoCs is handled
> > by the lantiq-flash driver and used by danube_easy50712.dts, but its
> > binding was never documented.
> >=20
> > Add a schema for it, including a new optional lantiq,ebu-swap-check
> > property. Some boot loaders, like the BOSS bootmonitor on the bintec
> > elmeg RS123 and RS353, enable the EBU's own endianness swapping for the
> > flash chip select (EBU_BUSCON0 bit 30), and the flash then appears at
> > its unswapped addresses. Whether that bit can be trusted depends on the
> > SoC: it only works on VR9 (xRX200) from revision 1.2 and on AR10
> > (xRX300), and Falcon has no such register. A board property instead of
> > a list of SoC revisions in the driver was requested in the review of an
> > earlier attempt at this. The property does not state the bit's value,
> > so a board keeps working with either boot loader setting.
> >=20
> > Link:
> > https://lists.infradead.org/pipermail/linux-mtd/2017-January/071749.html
> > Link:
> > https://lists.infradead.org/pipermail/linux-mtd/2017-January/071818.html
> > Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
>=20
> Let's be honest, I am not very familiar with that MTD area and all the
> legacy content is has, but would it be a lot more work to add lantiq as
> a physmap variant? I don't like much the fact that you describe the
> flash without describing the EBU. Physmap versions typically are matched
> using the more specific compatible (lantiq,ebu?) and the cfi-flash
> fallback. All your tweaks are EBU/machine/integration details, not
> related to the flash itself.
>=20
> One consequence of not modeling the controller is your need for
> EXPORT_SYMBOL_GPL(ltq_ebu_membase) in patch 3/5, which is quite a hack.
>=20
> Thanks,
> Miqu=C3=A8l

Hi Miqu=C3=A8l,

thank you for applying patch 1!

About physmap: you were right, and this was actually a great hint. I tested=
 on=20
the my RS123: with the EBU swap that its boot loader enables, the flash is=
=20
simply a plain CFI flash. With compatible =3D "cfi-flash" and the generic p=
hysmap=20
driver, probing, reads (identical to what lantiq-flash reads, unaligned rea=
ds=20
included), erase and write all work. So this board needs no lantiq-flash ch=
ange=20
at all, and I'm dropping patches 2 to 5. There won't be a v2.

Turning lantiq-flash itself into a physmap variant for the boards with the=
=20
classic U-Boot setup would probably be the cleaner model, but I don't have=
=20
such a board to test it, so I'm leaving that alone for now.

Thank you again!
     Simon


