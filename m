Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925337;
	b=st0qWeQ3aoFiD6+sO50jzMMP8Ir8au9Tj8Da2OZzgpbMT9q+aZ4DIyGbfM3YZ0749r7u
	 5wmOp77KBaRttVHO+8bDdp3SyLJdxLcTyRtQDb12kQsMy3asFpL4UCzXyame4PsOhYTPD
	 0DjWjrDpcUisYJ7qdWfpMJUVrATrwlWOa17/gvvS++VuNE1203/Jdqw2/oMyj+GgJQvAM
	 QVnFSJW7o/fsBDYx5vqqWKaPFEtzQvzzsT6gnBtiw3PygbawueBs0aeU7ItvIXaS8mHqy
	 YQytnnnklkRn27nQ8W9JoR1kxMeX0HynwKR60zunRxqiDq7Qw9ulA0YAFMdWGAKoNyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925337;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=t4Lr+xw8BXAic1q2UWR4BTuRWiCebSTt4zHhFSbqjLw=;
	b=kuM3WAct+z1ijoBiJTyKRoyKw3h0e8xL8mC8KW0Fa3KBEzQGzQ5LTtwl+3g2p6SEAGb6
	 iFI9Rh28rvQ08SF8OT3P9trl8FWITjDHd7H4GpCvdNMJkazvhOHqJ5Lohtn1jEK6pyaMR
	 xSFM6vKGNrzQEAbkd0UzURakmdfUC7oYDfPghORUAKTsUMru7qHNvnzJ10/1mUND0QdXi
	 drzu/pY22pSFhRCz/WN/TB+n0TlrWZU98QaFi900VUikpewvD7IN+uo6BwHPzvbwRyrdm
	 0P4yytgxuwMd7ijj4JLV9owZ0SRe9XJNdUg/BN1Y7184jWva6eCl3/AijmbBXxBRLkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6294B606A32C;
	Tue, 17 Nov 2026 14:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6294B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <80f1ef9dd605d16df2add0a9dbdcdd5f9f508174.camel@crapouillou.net>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: ingenic: validate BCH error index
 in jz4780_correct()
From: Paul Cercueil <paul@crapouillou.net>
To: Guanglei Zhu <zhugl3@xiaopeng.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>,  Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, 	linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, 	linux-kernel@vger.kernel.org, Weibin Liu
 <liuwb@xiaopeng.com>
Date: Tue, 17 Nov 2026 15:22:10 +0100
In-Reply-To: <20261105042405.71352-2-zhugl3@xiaopeng.com>
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
	 <20261105042405.71352-1-zhugl3@xiaopeng.com>
	 <20261105042405.71352-2-zhugl3@xiaopeng.com>
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

Hi Zhu,

Le jeudi 05 novembre 2026 =C3=A0 12:24 +0800, Guanglei Zhu a =C3=A9crit=C2=
=A0:
> From: Weibin Liu <liuwb@xiaopeng.com>
>=20
> The JZ4780 BCH controller reports each corrected bit error as a byte
> pair index, in the INDEX field of the BCH_BHERR registers. The field
> is 11 bits wide, but nothing in jz4780_correct() checks the reported
> index against the size of the data buffer being corrected:
>=20
> =C2=A0=C2=A0=C2=A0 buf[(index * 2) + 0] ^=3D mask;
> =C2=A0=C2=A0=C2=A0 buf[(index * 2) + 1] ^=3D mask >> 8;
>=20
> With data or ECC coming from an untrusted flash, the decoder can
> report an index that points past the end of the data buffer, and the
> above statements then flip bits outside the buffer.
>=20
> Skip the correction when the reported index does not point into
> the data area.=C2=A0 A bitflip in the parity bytes does not affect the
> data, so rejecting the page for it would fail reads that are
> perfectly correctable, and an index beyond the codeword has no
> buffer to update in the first place.
>=20
> Fixes: ae02ab00aa3c ("mtd: nand: jz4780: driver for NAND devices on JZ478=
0
> SoCs")
> Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>

Since you have a Fixes: tag, you also need to Cc: stable@vger.kernel.org

You also need to add your own Signed-off-by alongside Liu's, since you sent=
 the
patch.

The change looks good to me, so you can add my:
Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Please send a v3 with the Cc: line, your own Signed-off-by, and my Reviewed=
-by.

Cheers,
-Paul

> ---
> Changes in v2: skip the correction for an index that does not point
> into the data area instead of failing the page with -EBADMSG.=C2=A0 A
> correctable bitflip in the ECC bytes leaves the data valid, and the
> early exit also dropped the error entries that followed it.=C2=A0 This
> matches how jz4740_ecc_correct() treats its indexes.
>=20
> Verified with a userspace replica of the correction loop: with
> params->size =3D 512, an index of 256 (first parity word) or at the
> field maximum (0x7ff) produces no write outside the data buffer,
> and in-range indexes keep correcting as before.
>=20
> =C2=A0drivers/mtd/nand/raw/ingenic/jz4780_bch.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> index 12b5b0484fe9..3a4c5d6e7f8a 100644
> --- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> +++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> @@ -216,6 +216,10 @@ static int jz4780_correct(struct ingenic_ecc *bch,
> =C2=A0						BCH_BHERR_MASK_SHIFT;
> =C2=A0			index =3D (reg & BCH_BHERR_INDEX_MASK) >>
> =C2=A0						BCH_BHERR_INDEX_SHIFT;
> +			/* Skip indexes outside the data area. */
> +			if ((index * 2) + 1 >=3D params->size)
> +				continue;
> +
> =C2=A0			buf[(index * 2) + 0] ^=3D mask;
> =C2=A0			buf[(index * 2) + 1] ^=3D mask >> 8;
> =C2=A0		}
