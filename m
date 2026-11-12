Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492572;
	b=4BY7JmLUEycollND7PksBxB00AzenePmuJYPWaY3DYwdTkOreua481OBAQbtVBMJEXqk
	 UKOdIDtq2fg44k1NA6xKnSK+XIxW/xJKoMKRJXk2F66giCj4prdrnInF+LC2Mydgbf7g5
	 9uTnfFthYoa3BmLPA/zHT054XbDQFdTjoX2ZfTIOsA812EAq6I3r+fDChLlasEeEl3vio
	 LyCbuu3Wco35zMPeGjmLDc9Omi4+WaZtOdm5HLbQNtp10h9KrHC1YGo3vnVpWt5SVfM9G
	 1Y1c9RB6wwtoaQRZdmT+X/m0TMB2Rcwt4X7sk7NHkfnLj7j3u5LaiWgXIWHWkrdUvOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492572;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4FoQu+zc856j9cM6Owz0Qq1DtZ9bdH2J+suDVuWBlo4=;
	b=VUi7kAdzyWlLF0C8F5lCVc/jqnzE1bglSRBZ2X1UHVKkWfN8yyMCiCcfYPbqhwfc2w3K
	 TYYhjF+3MDhoFXI3wFvZSxMQbmskObOp0MucXtHvbaqnZEHlMurjdgRFEcZveHj1VsKwC
	 awUSl/zfD0KjtbGpfXaNXNqLmI4+upVD/13f6JUagAgi6adR9mAoT8/TBay7u+aPUoWyF
	 YBaq4g6CLYiKXdr3GnOHh7jvvMqy2uneP5QcVnd/7Sncu+WzkhYdBQkIESFRUxcWixw2O
	 BRU+KKQcx2Rrvbomq9poKxsc4p9yL7Vl2yHPYP4Gf+0ftqkPBHzXIBhwngVxGZ30KvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84AC606A323;
	Thu, 12 Nov 2026 14:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D84AC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <0ec3716fb00fe25b3b03a7abc45348901fee05dd.camel@crapouillou.net>
Subject: Re: [PATCH v2 6/9] MIPS: generic: Add MACH_INGENIC type and
 compatible for X1600 and X2600
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Thomas Bogendoerfer	
 <tsbogend@alpha.franken.de>, Paul Burton <paulburton@kernel.org>, "Maciej
 W. Rozycki" <macro@orcam.me.uk>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 "Christophe Leroy, David Heidelberg" <david@ixit.cz>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>,  Janusz
 Krzysztofik	 <jmkrzyszt@gmail.com>, Paul Boddie <paul@boddie.org.uk>,
 Olivier Louvignes	 <olivier@mgcrea.io>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	letux-kernel@openphoenux.org
Date: Thu, 12 Nov 2026 15:09:26 +0100
In-Reply-To: <87a3ba40389df599efe30af922ba1564813be8f6.1794471031.git.hns@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
	 <87a3ba40389df599efe30af922ba1564813be8f6.1794471031.git.hns@goldelico.com>
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

Hi Nikolaus,

Le jeudi 12 novembre 2026 =C3=A0 09:10 +0100, H. Nikolaus Schaller a =C3=A9=
crit=C2=A0:
> Add support for the Ingenic/Lumissil X1600 and X2600 SoC by introducing
> new machine types.
>=20
> Update the system type string mapping and add the "ingenic,x1600" and
> "ingenic,x2600" compatible strings to the DT match table in the generic
> Ingenic board support.
>=20
> Note that we do not separate between e.g. X1600, X1600E, X1600H since
> they differ only in built-in memory size which can be handled by the
> boot loader.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 Note that there is no bindings document for any of the=
 compatible values
> =C2=A0=C2=A0=C2=A0 so we don't add them.
>=20
> =C2=A0arch/mips/generic/board-ingenic.c | 8 +++++++-
> =C2=A0arch/mips/include/asm/bootinfo.h=C2=A0 | 2 ++
> =C2=A02 files changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/generic/board-ingenic.c b/arch/mips/generic/board-
> ingenic.c
> index 1f4906875e7bc..5840293913977 100644
> --- a/arch/mips/generic/board-ingenic.c
> +++ b/arch/mips/generic/board-ingenic.c
> @@ -24,6 +24,8 @@
> =C2=A0static __init char *ingenic_get_system_type(unsigned long machtype)
> =C2=A0{
> =C2=A0	switch (machtype) {
> +	case MACH_INGENIC_X2600:
> +		return "X2600";
> =C2=A0	case MACH_INGENIC_X2100:
> =C2=A0		return "X2100";
> =C2=A0	case MACH_INGENIC_X2000H:
> @@ -34,6 +36,8 @@ static __init char *ingenic_get_system_type(unsigned lo=
ng
> machtype)
> =C2=A0		return "X2000";
> =C2=A0	case MACH_INGENIC_X1830:
> =C2=A0		return "X1830";
> +	case MACH_INGENIC_X1600:
> +		return "X1600";
> =C2=A0	case MACH_INGENIC_X1000E:
> =C2=A0		return "X1000E";
> =C2=A0	case MACH_INGENIC_X1000:
> @@ -146,11 +150,13 @@ static const struct of_device_id ingenic_of_match[]
> __initconst =3D {
> =C2=A0	{ .compatible =3D "ingenic,jz4780", .data =3D (void *)MACH_INGENIC=
_JZ4780
> },
> =C2=A0	{ .compatible =3D "ingenic,x1000", .data =3D (void *)MACH_INGENIC_=
X1000
> },
> =C2=A0	{ .compatible =3D "ingenic,x1000e", .data =3D (void *)MACH_INGENIC=
_X1000E
> },
> +	{ .compatible =3D "ingenic,x1600", .data =3D (void *)MACH_INGENIC_X1600
> },
> =C2=A0	{ .compatible =3D "ingenic,x1830", .data =3D (void *)MACH_INGENIC_=
X1830
> },
> =C2=A0	{ .compatible =3D "ingenic,x2000", .data =3D (void *)MACH_INGENIC_=
X2000
> },
> =C2=A0	{ .compatible =3D "ingenic,x2000e", .data =3D (void *)MACH_INGENIC=
_X2000E
> },
> =C2=A0	{ .compatible =3D "ingenic,x2000h", .data =3D (void *)MACH_INGENIC=
_X2000H
> },
> =C2=A0	{ .compatible =3D "ingenic,x2100", .data =3D (void *)MACH_INGENIC_=
X2100
> },
> +	{ .compatible =3D "ingenic,x2600", .data =3D (void *)MACH_INGENIC_X2600
> },

I was going to say that if you add compatibles here you'll also need to add=
 them
to the bindings documentation, but it seems we don't have one?

We have Documentation/devicetree/bindings/mips/ingenic/devices.yaml for boa=
rds
but most SoCs listed here don't have an accompanying board.

Given that it's not your mess I'm OK with the patch, but we should really f=
ix
this at some point.

Cheers,
-Paul

> =C2=A0	{}
> =C2=A0};
> =C2=A0
> @@ -188,7 +194,7 @@ static const struct platform_suspend_ops ingenic_pm_o=
ps =3D
> {
> =C2=A0
> =C2=A0static int __init ingenic_pm_init(void)
> =C2=A0{
> -	if (boot_cpu_type() =3D=3D CPU_XBURST) {
> +	if (boot_cpu_type() =3D=3D CPU_XBURST || boot_cpu_type() =3D=3D CPU_XBU=
RST2)
> {
> =C2=A0		if (IS_ENABLED(CONFIG_PM_SLEEP))
> =C2=A0			suspend_set_ops(&ingenic_pm_ops);
> =C2=A0		_machine_halt =3D ingenic_halt;
> diff --git a/arch/mips/include/asm/bootinfo.h
> b/arch/mips/include/asm/bootinfo.h
> index 2128ba9033911..f6ae983577f6f 100644
> --- a/arch/mips/include/asm/bootinfo.h
> +++ b/arch/mips/include/asm/bootinfo.h
> @@ -81,11 +81,13 @@ enum ingenic_machine_type {
> =C2=A0	MACH_INGENIC_JZ4780,
> =C2=A0	MACH_INGENIC_X1000,
> =C2=A0	MACH_INGENIC_X1000E,
> +	MACH_INGENIC_X1600,
> =C2=A0	MACH_INGENIC_X1830,
> =C2=A0	MACH_INGENIC_X2000,
> =C2=A0	MACH_INGENIC_X2000E,
> =C2=A0	MACH_INGENIC_X2000H,
> =C2=A0	MACH_INGENIC_X2100,
> +	MACH_INGENIC_X2600,
> =C2=A0};
> =C2=A0
> =C2=A0extern char *system_type;
