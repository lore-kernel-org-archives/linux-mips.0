Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848803;
	b=d0fWb8TUtC/QF79VBdeEb3jc3Ihghxt8kkACiBeVa2qHD3TUJCBKOpP6usmI05vDCmXy
	 AUJ/roqf9whuUFJdpkcCfPgTf9vhREV5poK4ZsDy/ItKWD1QDOWoOxldSbPsvDbEVXlCp
	 WrTKZwsDwylIflwFgRdgKpRSPYhkfkd/LS+0cwsazeXPJ6jJOkS7CEZBwLABgL1QBASzT
	 h9r+IDixFaH9xXQ1UfdzZztJKFnQJykk72EJGGlQVW+hksSl5PgQ49yQy+95Kmma/omMu
	 0Qm/it7QipVhOGnslkpcAw5Nq0pQ4BQo97ZQqC6H0C77voTvnly+OadO7QJe3JiX3MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848803;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=3rTrpfe0/Ho6gwSbR93fpkaq+6QWwt36pGp47oud6ak=;
	b=bd1x8YAgV2629YgYa1uP4IKF0sVeP1F0JpjDlSmIBlrCt/gSV5+JQTq29gf28X6roi3k
	 nQdhVMIHhfibGOqsbDpP94EDUvCPOhC94VwSekK1OwQi1WbjeKiNrduVu7kPh78h/H0z3
	 uSoEbIkE92+s23iu+EKPPx8h2uKfaUVAu4ItJYzPtqVcxzGt/B6zzgndeX47RlrFV3D7m
	 lweQ8qUT9wfgGW1BSgcJt5K6+boPy3iU7/r6OF2Eq63Oy5TA9jQAxAbVTkw0yh3BCBbi4
	 eJebWEFe79+I17NUDEZZLcmT/0jR6akEe5qU0gwXd1JIXkaqc7f5IF4GGm9ZR8qWTlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=a5ORgj1a;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C38606A322;
	Mon, 16 Nov 2026 17:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C38606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=a5ORgj1a
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2B0C64E415F7;
	Mon, 16 Nov 2026 17:06:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9C226023F;
	Mon, 16 Nov 2026 17:06:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A36E11BC0870;
	Mon, 16 Nov 2026 18:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794848795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3rTrpfe0/Ho6gwSbR93fpkaq+6QWwt36pGp47oud6ak=;
	b=a5ORgj1amuq6POasQBkp1fP4QeSNIkHbk7rIccltiJA/iQkZU4WRjSFmhDU5cH0cPzbIve
	9ZzbpHP1PtdSAcH5/eXen38Gh9JCiIX1rhQQuczCh7XG8OsYOTM9JFyKi8niSFOJfD96hu
	mGqMuvG+GC3EsOF45kOuQV92NAWl+btrEysHIAx/FqfgeH7XxGjEcgVAYuuhrXbRYqz0q2
	SlhmA44K5n2ob+MKVoPGI0uzfyHaug0Zip4Boq6rny5em+6i4bJeWlbFhyHtiPwqDpIjqu
	kxBqUn8nLi1UXNMYa8/BzolJ5tqDajSNzU6VBjXTiipLUPhGqMS9LIwIeDrwDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Guanglei Zhu <zhugl3@xiaopeng.com>,  Harvey Hunt
 <harveyhuntnexus@gmail.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mips@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Weibin Liu
 <liuwb@xiaopeng.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: ingenic: validate BCH error index
 in jz4725b_correct()
In-Reply-To: <91b7fc2fd16f1089449701c002dd33e191894871.camel@crapouillou.net>
	(Paul Cercueil's message of "Fri, 06 Nov 2026 15:37:47 +0100")
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
	<20261105042405.71352-1-zhugl3@xiaopeng.com>
	<91b7fc2fd16f1089449701c002dd33e191894871.camel@crapouillou.net>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 18:06:30 +0100
Message-ID: <87h5hgpuy1.fsf@bootlin.com>
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

On 06/11/2026 at 15:37:47 +01, Paul Cercueil <paul@crapouillou.net> wrote:

> Hi,
>
> Le jeudi 05 novembre 2026 =C3=A0 12:24 +0800, Guanglei Zhu a =C3=A9crit=
=C2=A0:
>> From: Weibin Liu <liuwb@xiaopeng.com>
>>=20
>> The JZ4725B BCH controller reports each corrected bit error as an
>> index into the codeword it was asked to decode, in the INDEX0/INDEX1
>> fields of the BCH_BHERR registers. These fields are 13 bits wide, but
>> nothing in jz4725b_correct() checks the reported index against the
>> size of the data buffer being corrected:
>>=20
>> =C2=A0=C2=A0=C2=A0 buf[(bit >> 3)] ^=3D BIT(bit & 0x7);
>>=20
>> With data or ECC coming from an untrusted flash, the decoder can
>> report an index that points past the end of the data buffer, and the
>> above statement then flips a bit outside the buffer.
>>=20
>> Skip the correction when the reported index does not point into
>> the data area.=C2=A0 A bitflip in the parity bytes does not affect the
>> data, so rejecting the page for it would fail reads that are
>> perfectly correctable, and an index beyond the codeword has no
>> buffer to update in the first place.
>>=20
>> Fixes: 3e6ac2ad90b3 ("mtd: rawnand: ingenic: Add support for the JZ4725B=
")
>> Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
>> ---
>> Changes in v2: skip the correction for an index that does not point
>> into the data area instead of failing the page with -EBADMSG.=C2=A0 A
>> correctable bitflip in the ECC bytes leaves the data valid, and the
>> early exit also dropped the error entries that followed it.=C2=A0 This
>> matches how jz4740_ecc_correct() treats its indexes.
>>=20
>> Verified with a userspace replica of the correction loop: with
>> params->size =3D 512, an index of 4099 (parity area) followed by a
>> data-area index of 100 in the same BHERR register is now corrected
>> (v1 returned -EBADMSG and left the data error unfixed), the field
>> maximum (0x1fff) produces no write outside the buffer, and in-range
>> indexes keep correcting as before.
>
> What bothers me, and maybe it's just me not knowing NAND that well: would=
n't a
> bit-flip in the parity area cause a cascade of false-positives in the
> data too,

No, because the data vs. parity split only exist because our human
brains prefer when the room is tidy, data with data, parity with
parity. But in practice bitflips can happen anywhere in the data or in
the so called parity area, it's the same pool of bits for the
algorithm. It does not matter where bitflips are as long as the
threshold is not exceeded.

If I remember well, in the hamming software ECC implementation (under
lib/), we do not even bother fixing the bitflips in the parity area.

Thanks,
Miqu=C3=A8l
