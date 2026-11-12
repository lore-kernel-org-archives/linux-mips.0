Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493009;
	b=5by4jZK8+ZjT62LPIwtnqjHlC/m25JtXYgtRJ7SAu+Jn5N0IdJ8IHhV+DoBfCHHCoXIb
	 xMG1byWsj8je99acJae5wN6fni7tUPzSd07hLXfxbkxejaRcgGa/r4LFul7vdorzcLEhu
	 uX5C0fSBTwVuclR46DkvCb7nSDM0rqOhZuJjhGPvG1eliLWmeHISBRINnqkq10P7FE0ff
	 Sulp5WH5H79ux9YR8stCSMhWS2rOHjWIMuSv9VVTOnlDY3uWjLHEMueq6gVNpzkupBQQd
	 tt9GXw8jM7k1g0EBWPLZUaCfYbQScL3EE8fbZ7vkyL258v5n+A0Xyb3caGKqnv0Ziog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493009;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=GJrAPV8Hu/wtUOrR2oclkClaFgK4tBROJq09MMMd9Jc=;
	b=AJjkN/bZeDlFCaOgK8OOl0HtTbAQQarZ8yz4Vz0axAS/ILGQd7mwmnpwdD+O80jXP9Dy
	 Fp/f8x1cmZWjzDjTIeHPKohwbpK1XzKdvGVIIW6yzsYbsdvjBswhbKv9IdA5sOMTlg3MR
	 oSnKjC6Wk/HsvxZiChdKOlTthZNGNgXd9fj8e4oKUGSWW27mAtkPW1MFbtjilhbpupmYN
	 HVL8/WcWhl8F0vuadruUUy6D13hu+ilFtp094xkt5XIbCJh9vIz4LANyeESIUqX/HuQug
	 WPTuNt6C1JircgsrzPHZ5Jag6nMgan8ZoLVoTGKH0txdN8LivWqoONoeaI40xd5voKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4162F606A32E;
	Thu, 12 Nov 2026 14:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4162F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <26336f36c7ed09bcf64fcc2ae2d8aa1e0c1b7d23.camel@crapouillou.net>
Subject: Re: [PATCH v2 7/9] MIPS: Ingenic: Expand Kconfig for X1600, X2000,
 and X2600 SoCs
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
Date: Thu, 12 Nov 2026 15:16:44 +0100
In-Reply-To: <4cbb6412d3e7713d6c464051a107db19feef1278.1794471031.git.hns@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
	 <4cbb6412d3e7713d6c464051a107db19feef1278.1794471031.git.hns@goldelico.com>
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

Le jeudi 12 novembre 2026 =C3=A0 09:10 +0100, H. Nikolaus Schaller a =C3=A9=
crit=C2=A0:
> Expand MACH_INGENIC_GENERIC to select all existing and newly added
> machine variants (including JZ4750/55/60/75, X1500, X1600, X2000,
> X2100, and X2600).
>=20
> Introduce individual Kconfig blocks for the following SoCs:
> - MACH_X1600: Selects MIPS32_R2 and HIGHMEM.
> - MACH_X2000 / MACH_X2600: Selects MIPS32_R5, SMP support, broadcast
> =C2=A0 clockevents, O32 FP64 support, and weak ordering optimizations.
>=20
> In parts developed by Reimu NotMoe <reimu@sudomaker.com>

Co-developed-by? (+ his Sob)

> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> =C2=A0arch/mips/ingenic/Kconfig | 38 ++++++++++++++++++++++++++++++++++++=
++
> =C2=A01 file changed, 38 insertions(+)
>=20
> diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
> index f595b339a4b84..5d351b42bbc9b 100644
> --- a/arch/mips/ingenic/Kconfig
> +++ b/arch/mips/ingenic/Kconfig
> @@ -5,10 +5,19 @@ config MACH_INGENIC_GENERIC
> =C2=A0	select MACH_INGENIC
> =C2=A0	select MACH_JZ4740
> =C2=A0	select MACH_JZ4725B
> +	select MACH_JZ4750
> +	select MACH_JZ4755
> +	select MACH_JZ4760
> =C2=A0	select MACH_JZ4770
> +	select MACH_JZ4775
> =C2=A0	select MACH_JZ4780
> =C2=A0	select MACH_X1000
> +	select MACH_X1500

You select MACH_X1500 but there's no CONFIG_MACH_X1500 symbol. No entry in =
enum
ingenic_machine_type either, or compatible string for it.

Your patch didn't add a CONFIG_MACH_X2100 either.

> +	select MACH_X1600
> =C2=A0	select MACH_X1830
> +	select MACH_X2000
> +	select MACH_X2100
> +	select MACH_X2600
> =C2=A0
> =C2=A0choice
> =C2=A0	prompt "Machine type"
> @@ -62,8 +71,10 @@ config MACH_JZ4770
> =C2=A0config MACH_JZ4780
> =C2=A0	bool
> =C2=A0	select MIPS_CPU_SCACHE
> +	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
> =C2=A0	select SYS_HAS_CPU_MIPS32_R2
> =C2=A0	select SYS_SUPPORTS_HIGHMEM
> +	select SYS_SUPPORTS_SMP
> =C2=A0
> =C2=A0config MACH_X1000
> =C2=A0	bool
> @@ -71,8 +82,35 @@ config MACH_X1000
> =C2=A0	select SYS_HAS_CPU_MIPS32_R2
> =C2=A0	select SYS_SUPPORTS_HIGHMEM
> =C2=A0
> +config MACH_X1600
> +	bool
> +	select SYS_HAS_CPU_MIPS32_R2
> +	select SYS_SUPPORTS_HIGHMEM
> +
> =C2=A0config MACH_X1830
> =C2=A0	bool
> =C2=A0	select MIPS_CPU_SCACHE
> =C2=A0	select SYS_HAS_CPU_MIPS32_R2
> =C2=A0	select SYS_SUPPORTS_HIGHMEM
> +
> +config MACH_X2000
> +	bool
> +	select MIPS_CPU_SCACHE
> +	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
> +	select SYS_HAS_CPU_MIPS32_R5
> +	select SYS_SUPPORTS_HIGHMEM
> +	select SYS_SUPPORTS_SMP
> +	select MIPS_O32_FP64_SUPPORT

I know MIPS_O32_FP64_SUPPORT was supported on the JZ4770, and most likely o=
n the
JZ4760 too (the first one with a FPU AFAIK). So this could probably be move=
d to
CONFIG_MACH_INGENIC.

Cheers,
-Paul

> +	select WEAK_ORDERING
> +	select WEAK_REORDERING_BEYOND_LLSC
> +
> +config MACH_X2600
> +	bool
> +	select MIPS_CPU_SCACHE
> +	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
> +	select SYS_HAS_CPU_MIPS32_R5
> +	select SYS_SUPPORTS_HIGHMEM
> +	select SYS_SUPPORTS_SMP
> +	select MIPS_O32_FP64_SUPPORT
> +	select WEAK_ORDERING
> +	select WEAK_REORDERING_BEYOND_LLSC
