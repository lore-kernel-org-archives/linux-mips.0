Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792862314;
	b=dUo22DnX+tMTxoAnExdkTKZAII1Pcc7E4QTD+8uLajKaUqm/fHXbeklVJMdAYvtWWOyy
	 5JAFESUzpwwfuUlkBH6BDAmE2pvuq18lExU0cK1zKJpEUjuPjsP0i/X1kTAGMeL6XAfmQ
	 g51+n1T1npZV2CMfF2KJWGpo/ZjXGct4mfLYGdGN7dtRybsVmBTuJBMc0SQRiGuqiKOTT
	 jrNLeNR5/KnOw794RGgxvYsFDbXdE4565cHfLZqdIaumsFcwlc1e7AC2rM3yeRFLfNEbl
	 oaB67CYw0xLrNkhPzRbZJSan1N2N8s3SkWi4LAUBKkLkxsoocxXfv6rP26kBXmsMZbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792862314;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=Sn3L1fW9Un8YAys8btQj05/QV4ZATfRQ5lpULs1uwGY=;
	b=T1TwdLqHIKuUFf+djVlkXNc8w5x2wE/tzMyBDzZyNnTnz/lhE0Eb7rNjR5pfQfkC9I1M
	 Us4EVjbTo4qPcRkA4QMMCmJkqtKuLUfnK4YFWP6am9WZsADe0eLeQnyhCh0/38gQBq7Qu
	 d0LoP7hG1wbYe5G6LxsflGVK7RfphmVj/ty7aO28znZZzvT9YUJyuTZd20SvmGOOm8cJ0
	 N9/dZvHRI50VyhjUKQ6OWyaWMA/Ey6Ukps3ChHzlA9YZ2XUL0yPva8XAMg3knTl1XV191
	 PFrOTG9S4Coa+jB1rfkI8A0tbFro2VVEpAwX1eMZr4p/+v5mOgi0DWImb0dX3p4QtaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QKZKHYVY;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=bxfvT8yV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.83
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FC1606A31B;
	Sat, 24 Oct 2026 17:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0FC1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QKZKHYVY;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=bxfvT8yV
ARC-Seal: i=1; a=rsa-sha256; t=1792862283; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=IpUA54sJNVTDc03yZLA/D1HILBu9XPoKZPyLo9+BDJI4OWQFzNgfdb9RC9J3wL5HGL
    DUvegRpnNMhRuZl8Kg8Om1ZKXNn1n6mhhqbRkmEkMFVBLaUaqe4xHLCPLGr1phe0GOGR
    Zn7WY26CK8+orkJYUAhkJiRG+3hznx62jl5tzu/0IOJDOB2xHutE9/iA5p3UqqALRmN0
    86vesocVjQzayR/S2P9l8yN4QTv2J7vj9r9Hv5leM3uHv600UwHY9NGJhV55su7k7kAu
    rtwOqp/9a8ugjBLdN4v3Lh/ZORMy3Ca8hTfAl84TCl6IbiuwWKtCpRoMnGWv2nL+nkD+
    5ysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792862283;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Sn3L1fW9Un8YAys8btQj05/QV4ZATfRQ5lpULs1uwGY=;
    b=m3rlmknb9+SyGZNrRSbYDW23vfgkiMfuuQLsH2eX00cw5XNkVXvxctkKnr97/H9ijk
    LVKoThjQCk2mmQNsF6g+KyzSWUKpUMx2SElJ9GKdrabOfws8eVoKA0UWVUV7dhTj4BCm
    Br0E8nJOR/Y+bjS4AgWzr13ScLg/wG3RO0//SHuyz/aEsrMPT78OWSGKAwiB9Epimz+a
    8S1ZoXWneHjYDqSm3RtOyhuoTOMtzma+SlMXKU8DGuplJYdRAZ8OqQc0C8perArxYuer
    SaDX4gXWJP4YshuOi0QUaQmxs5Fq4qX/XLfP8x8WmaymLWG9aPuoEm26stfoA5uv3Q0h
    fNtA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792862283;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Sn3L1fW9Un8YAys8btQj05/QV4ZATfRQ5lpULs1uwGY=;
    b=QKZKHYVYX/2mqrOv4jIlfXKRYYSqfrWmt2ElTcKfSAW/NHtuh+h1umXwRoYPCTvXu1
    2WQMx90vRZzD9R797o8u+PKFvXwYHYYAdPQ7wPhOsOB1eSOK2T9m47ixP/sPiWhUJAVH
    +3gHmVVfvtnAxK1L/KB7giuMuFXSiOB+zA1PvtPglyIQK/Ob0R8oQts/vqlkWCfw/ZUu
    kx+xQHqdUjrwW7ctr/F/duMqu4IiLTCmHRtNMZ9h/Rws1+CyhLYJV+Rp2++OvEu3KR/2
    UJX+VBEWmYAYfF2tF5to+B1EJfSHYgDDmlrE4PHj5dhwF56yns48eWEZlB2ZqUamJuiz
    j/Qw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792862283;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Sn3L1fW9Un8YAys8btQj05/QV4ZATfRQ5lpULs1uwGY=;
    b=bxfvT8yVJDxhAciVHHX9EHNzw69vQO70C0pAmAlZWpqZUCeh8HnlBvjxV3ZySyEtzd
    9W0tfR0xLgDRphYlUUBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2poKzsiNzptYNlV1C1yk7253raiyx+O3Hxli"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229OHI3wpt
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sat, 24 Oct 2026 19:18:03 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH] MIPS: cpu-probe: Recognise the XBurst core of the Ingenic
 X1600
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261023204205.48222-1-olivier@mgcrea.io>
Date: Sat, 24 Oct 2026 19:17:33 +0200
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Cercueil <paul@crapouillou.net>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Boddie <paul@boddie.org.uk>,
 Andreas Kemnade <akemnade@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F93B4D14-97DB-4F8E-988E-3C6803F5C850@goldelico.com>
References: <20261023204205.48222-1-olivier@mgcrea.io>
To: Olivier Louvignes <olivier@mgcrea.io>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi,

> Am 23.10.2026 um 22:42 schrieb Olivier Louvignes <olivier@mgcrea.io>:
>=20
> The X1600 reports PRId 0x00d00000: company Ingenic D0, implementation =
0,
> which cpu_probe_ingenic() rejects with "Unknown Ingenic Processor ID!"
> before any console exists. It is an XBurst1 core like the X1830's, =
which
> shares the D0 company ID, so handle it the same way.
>=20
> Tested on a HiBy R1 (X1600), which boots v7.3 with this.
>=20
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
> arch/mips/include/asm/cpu.h  | 1 +
> arch/mips/kernel/cpu-probe.c | 1 +
> 2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index 0fd9f9bbd21f..ff7b63587daa 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -186,6 +186,7 @@
>  * These are the PRID's for when 23:16 =3D=3D PRID_COMP_INGENIC_*
>  */
>=20
> +#define PRID_IMP_XBURST_X1600 0x0000 /* XBurst=C2=AE1 in the X1600 =
(PRId 0x00d00000) */

Well, XBURST is an MIPS CPU architecture and not a SoC. So there should =
be no X1600 in
this macro name, especially if this ends up in a non-SoC-specific =
arch/mips/include.

Basically this matches what we have added in our LetuxOS kernel, but not =
only for the X1600:

	https://github.com/goldelico/letux-kernel/commit/ee3e4e8baeb6d8

So please take our patch and amend it if you think it needs to and add a =
Co-developed-By:
Or if you can wait a little we can submit it.

> #define PRID_IMP_XBURST_REV1 0x0200 /* XBurst=C2=AE1 with =
MXU1.0/MXU1.1 SIMD ISA */
> #define PRID_IMP_XBURST_REV2 0x0100 /* XBurst=C2=AE1 with MXU2.0 SIMD =
ISA */
> #define PRID_IMP_XBURST2 0x2000 /* XBurst=C2=AE2 with MXU2.1 SIMD ISA =
*/
> diff --git a/arch/mips/kernel/cpu-probe.c b/
> index 489612ed9d49..e3b547307c77 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1769,6 +1769,7 @@ static inline void cpu_probe_ingenic(struct =
cpuinfo_mips *c, unsigned int cpu)
> switch (c->processor_id & PRID_IMP_MASK) {
>=20
> /* XBurst=C2=AE1 with MXU1.0/MXU1.1 SIMD ISA */
> + case PRID_IMP_XBURST_X1600:
> case PRID_IMP_XBURST_REV1:

Here, we also add XBURST2_R2 and set the __cpu_name fields, agnostic of =
the
SoC name "X1600":

https://github.com/goldelico/letux-kernel/commit/b799b9a5e4d3e1

>=20
> /*
>=20
> base-commit: bfe97f12a0a64c3682be21a02404238e3b91e945
> --=20
> 2.39.5
>=20
>=20

BR and thanks, H. Nikolaus Schaller <hns@goldelico.com>
