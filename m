Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975873;
	b=xq8Oo8OHhrwWl72FTFObS1hVQXCev7jq/Gk7Z8nWOF+5HJb2SdSZnw3jzJmu190xKnCh
	 nYlEb5TGiDRpDpB7SJDFKBPvb42OBz7BiEvkDodYaUHAou7bRmfhB5kLMk5kjzoAGxXAz
	 4wUf8qgys2j3NmAd/V8sK54MwiF8gTBYzKhMGYMe2GaO4Fn8ykXFGnhgiixi6fnyDbzol
	 hiGdJbDmCPb4iQTcncSbd5iu+KC9sUly4zw/Go8Wp3yBgv54eLuPPyePVYJ52ziXFLkWr
	 zROOgO47wBs1AIPdEvj6CmBS+6JX+SKEVv1pN5bTVVmj8CX4ppcQwdYsxhN69P4lVyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975873;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=8odmgBVd22pPGu2sG7ZQTX9nXKe1ESMaUHnCTy8zD7U=;
	b=a15xHu/bwDYyPuMn+mY18IT9f4aCmY4iTNuMTl9Jr9p/7e0+ivW8RsBsO2Zf5uVueqlN
	 bAVl+EkCCq5wLS6ZguSh0qUHbkX+xU6xwLxkoia2K0X4fqbP6q+vWuRETYB3Y3W6kifwN
	 xNoktxEXEZjvBUYC+4+Kgkty0eX1xJReyFOHBN41JBAKpgmq8c3BBXrfgkAXyPIYiWoRN
	 /vgsJqrEYkSjaJSviGOxCHau4ppbimwM4OlsPriBjwoDciQkmVnV/hVE16xoFbfieVpcH
	 ZLjvrLFSvB8mFgjOyNnGdGFam+FsXy2rh5Og8CHRmTSRFLGi5MUHK41NvONn8LMz12Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2527606D819;
	Fri,  6 Nov 2026 14:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2527606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <91b7fc2fd16f1089449701c002dd33e191894871.camel@crapouillou.net>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: ingenic: validate BCH error index
 in jz4725b_correct()
From: Paul Cercueil <paul@crapouillou.net>
To: Guanglei Zhu <zhugl3@xiaopeng.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>,  Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, 	linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, 	linux-kernel@vger.kernel.org, Weibin Liu
 <liuwb@xiaopeng.com>, Thomas Petazzoni	 <thomas.petazzoni@bootlin.com>
Date: Fri, 06 Nov 2026 15:37:47 +0100
In-Reply-To: <20261105042405.71352-1-zhugl3@xiaopeng.com>
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
	 <20261105042405.71352-1-zhugl3@xiaopeng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

Le jeudi 05 novembre 2026 =C3=A0 12:24 +0800, Guanglei Zhu a =C3=A9crit=C2=
=A0:
> From: Weibin Liu <liuwb@xiaopeng.com>
>=20
> The JZ4725B BCH controller reports each corrected bit error as an
> index into the codeword it was asked to decode, in the INDEX0/INDEX1
> fields of the BCH_BHERR registers. These fields are 13 bits wide, but
> nothing in jz4725b_correct() checks the reported index against the
> size of the data buffer being corrected:
>=20
> =C2=A0=C2=A0=C2=A0 buf[(bit >> 3)] ^=3D BIT(bit & 0x7);
>=20
> With data or ECC coming from an untrusted flash, the decoder can
> report an index that points past the end of the data buffer, and the
> above statement then flips a bit outside the buffer.
>=20
> Skip the correction when the reported index does not point into
> the data area.=C2=A0 A bitflip in the parity bytes does not affect the
> data, so rejecting the page for it would fail reads that are
> perfectly correctable, and an index beyond the codeword has no
> buffer to update in the first place.
>=20
> Fixes: 3e6ac2ad90b3 ("mtd: rawnand: ingenic: Add support for the JZ4725B"=
)
> Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
> ---
> Changes in v2: skip the correction for an index that does not point
> into the data area instead of failing the page with -EBADMSG.=C2=A0 A
> correctable bitflip in the ECC bytes leaves the data valid, and the
> early exit also dropped the error entries that followed it.=C2=A0 This
> matches how jz4740_ecc_correct() treats its indexes.
>=20
> Verified with a userspace replica of the correction loop: with
> params->size =3D 512, an index of 4099 (parity area) followed by a
> data-area index of 100 in the same BHERR register is now corrected
> (v1 returned -EBADMSG and left the data error unfixed), the field
> maximum (0x1fff) produces no write outside the buffer, and in-range
> indexes keep correcting as before.

What bothers me, and maybe it's just me not knowing NAND that well: wouldn'=
t a
bit-flip in the parity area cause a cascade of false-positives in the data =
too,
leading to BCH_BHINT_UNCOR? Because the ECC code is read from the parity re=
gion,
am I wrong?

Cheers,
-Paul
