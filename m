Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491863;
	b=07ayUU03iREWHjyL+/OStWAT2PshNaTUYlHQ+LkuEWJZjCQC00lpRm9cIYpgQIBB5jVk
	 XPb600th9U1t2HjabDCFxETWR6NwblYmvTYhjOKqRJ6VZ66IR0YTwCWSPlJEFKgfqVcL+
	 HuqdleTMBu5kcprfJZqaAHVbufD1HGolpSaSDIgUwPHoGqS5J6AnYHSS7ytJIZGF+B8ww
	 b6baLWq3CA3AX+KdpoJ0/Av96g0iID9wGoUm1xU5+R53jr25ZhT+IIzFqRmz++kpqnV/l
	 UUKfp/o+XNte+GX+acEsqd8XFqDyvYdLk1rIvkrS89/1RtQuFSiZ1EngvFPvoLzZoYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491863;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=hJ1vQm3IllUiPCr6qBuNnx6AtdlXwu0bIhx9h/gO/+U=;
	b=igdgowXf3TaB11V6ffkEa5cE0R5GPqBH0HhgNJeDXOJb9uRF6yQOG4hE6fjN1x15Nv2s
	 AHmaXPwZqglcFFATqOfp9bGONbtsfWSfoYGzgqLMgJz4hrsviqkT07BT2+5GCN8THT53N
	 W8Cr2qAPkqprVCd+QrHBL2egZ8MDpjc7tGEJar35wWflJxGDAq47Bon2riBSNoQFLVHWw
	 RS3WYOTV+phP30HXjFwBIfWa/RQE9lb37Zrb10JldEwyDlR9Ba083Qx8d0p4bOTEJSckW
	 0PU/R7iQLE37FzLpBvqtgm+ZrLRHg/n9H+LosUDZSdPmt+AIWlXr+naxsxg/j4G6Q2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A3A606A323;
	Thu, 12 Nov 2026 13:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A3A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <60065a2feb73f81a8e9e919940e0a96b18bc0423.camel@crapouillou.net>
Subject: Re: [PATCH v2 3/9] MIPS: Ingenic: Do not force BUILTIN_DTB in
 Kconfig
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
Date: Thu, 12 Nov 2026 14:57:35 +0100
In-Reply-To: <fdc48b799f3c2f43a70236ef4d68bf1527facc9c.1794471031.git.hns@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
	 <fdc48b799f3c2f43a70236ef4d68bf1527facc9c.1794471031.git.hns@goldelico.com>
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
> Remove the unconditional selection of BUILTIN_DTB for MACH_INGENIC
> when MIPS_NO_APPENDED_DTB is enabled.
>=20
> The current Kconfig logic selects BUILTIN_DTB when
> MIPS_NO_APPENDED_DTB is set, although this configuration is intended
> to prevent the kernel from appending a DTB to the kernel image.
>=20
> While the kernel gives precedence to a DTB supplied by the boot loader,
> selecting BUILTIN_DTB still triggers additional build steps and may
> add unnecessary code to the resulting uImage.
>=20
> Note that BUILTIN_DTB controls the build process, not necessarily
> whether a DTB is actually embedded in the kernel image. For example,
> CONFIG_BUILTIN_DTB=3Dy with CONFIG_BUILTIN_DTB_NAME=3D"" still triggers
> the generation of .builtin-dtbs.S, but does not embed a DTB.
>=20
> The goal is to allow a configuration in which no .builtin-dtbs.S
> is generated and no DTB is appended to or built into the zImage/uImage.
>=20
> Fixes: f0f4a753079c ("MIPS: generic: Add support for Ingenic SoCs")
> Fixes: 15205fc05482 ("MIPS: ingenic: Add support for appended devicetree"=
)

I don't think you can have two Fixes: tags...

Cheers,
-Paul

> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> =C2=A0arch/mips/Kconfig | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 92bca520cd5ae..2135a69f9962c 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -127,7 +127,6 @@ config MACH_INGENIC
> =C2=A0	select GPIOLIB
> =C2=A0	select COMMON_CLK
> =C2=A0	select GENERIC_IRQ_CHIP
> -	select BUILTIN_DTB if MIPS_NO_APPENDED_DTB
> =C2=A0	select USE_OF
> =C2=A0	select CPU_SUPPORTS_CPUFREQ
> =C2=A0	select MIPS_EXTERNAL_TIMER
