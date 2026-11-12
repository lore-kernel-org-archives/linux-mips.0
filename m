Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492220;
	b=Yin8uGlVOikzYIsYrpX1HYfEva1vkLvQa+a64FDGlW2MFV84dos6BhGMhxOppkN9WUhY
	 xuRFcZF1DEk1jMGHB+RpXau6dPzjZ6P0SS3ErnQj0DBLGu23XyS+/RVmneHyArv3HRJPv
	 WRgL6F6vLkmuWN57ch/EP80RpG7QNykgLsxs2NQ2PLQvz8KG8T6xhR1xUl2Gv+gFtVCAz
	 w6Xrzg52oQE7VkVBUnL79/RKHGEC4i8L5jdrZeciBpQQ/O45b/6pHkV0nZx6c4dnqJZAZ
	 EbuWioEKLetS1SrTlIcF7cx1l/VVr4sES14M15C0xmf2J1OyLfK/L0pMVC6ccXHhbYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492220;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=d0d6nm0QMna74OqqEofCs8RvWrgIS/w4CLAon4Pe7PU=;
	b=dg/zV4hrbnL4TSNlsdZvLZttMKaZpgo+WjYJV82/uJ7rxC2jgXjWWwbFDAi6wgz0CJQa
	 rfIIeFOSmwBmxRetPhSek3cCO6Efti/DJZkfnqebMYd3LD1QFd4nIvZo+I/JOxIQPvLfB
	 4Kge+VhiN1dFFxM6B9TN+8Efj6ixKKNCxDCxDmGzMj6gbtp9YuFJPR1jLKVZ2iCzZoY/Q
	 q+k5xo6JC5+uncBygky8QmMnbyNRuCw5D0rU8x6m1FxjE1p5SDnACZBclt8rcO1/tOiQZ
	 NXssRlEc1k8LyOMLZcjuTKd1E/f7rnFCPOGKhcIYPCKvyVdSYlQ5xQH1Cknd0q6d6bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F46960A261C;
	Thu, 12 Nov 2026 14:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F46960A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <f91a0c53b35ff28bed26622f46d562b5a6150008.camel@crapouillou.net>
Subject: Re: [PATCH v2 5/9] MIPS: Ingenic: Update Ingenic XBurst
 implementation IDs
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
Date: Thu, 12 Nov 2026 15:03:34 +0100
In-Reply-To: <2e21dc4889ec55bf210dfc205bfadb57acb93eda.1794471031.git.hns@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
	 <2e21dc4889ec55bf210dfc205bfadb57acb93eda.1794471031.git.hns@goldelico.com>
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
> Add PRID implementation constants for Ingenic XBurst and XBurst II
> processors and handle the corresponding implementation IDs in
> cpu_probe_ingenic().
>=20
> The PRID table is updated based on Programming Manuals and hardware tests=
:
> - jz4780: 0x3ee1024f (confirmed on CI20 board)
> - x1000:=C2=A0 0x2ed1024f (unconfirmed)
> - x1600:=C2=A0 0x00d00000 (confirmed on LX16 board)
> - X1830:=C2=A0 0x00d00100 (unconfirmed)
> - X2000:=C2=A0 0x00132000 (read out from LX20 board)
> - X2600:=C2=A0 0x001320xx (confirmed 0x00132000 on LX26 board)
>=20
> Additionally, clean up extra spaces in the comments for
> PRID_IMP_XBURST_REV2 and PRID_IMP_XBURST2.
>=20
> Distinguish XBurst1 implementations with different SIMD ISA revisions
> and identify XBurst II processors using PRID_IMP_XBURST2.
> The XBurst II classification follows the Ingenic vendor kernel.
>=20
> Keep the existing writecombine handling unchanged, since no
> independent evidence justifies changing the cache attribute for
> XBurst II.
>=20
> Public references:
> - Ingenic Community, public SoC datasheets and programming manuals:
> =C2=A0 https://github.com/Ingenic-community/datasheets/tree/main/X
> =C2=A0 Includes the X1600 programming manual (X1600_PM_20220117.pdf)
> =C2=A0 and documentation for other X-series SoCs, including X1000,
> =C2=A0 X1830 and X2000.
> - Ingenic, XBurst1 CPU Core Programming Manual:
> =C2=A0 https://cdn.hackaday.io/files/1855627939084608/XBurst1_Core_PM.pdf
> =C2=A0 Documents the XBurst1 core architecture and CP0 configuration.
> - Ingenic, XBurst Instruction Set Architecture Programming Manual:
> =C2=A0 https://www.setphaserstostun.org/ci20/X1000_M200_XBurst_ISA_MXU_PM=
.pdf
> =C2=A0 Documents the original XBurst SIMD instruction set.
> - Ingenic, XBurst2 CPU Core Programming Manual:
> =C2=A0 https://www.manualslib.com/manual/2646351/Ingenic-Xburst-2-Cpu-Cor=
e.html
> =C2=A0 Documents the XBurst2 core architecture.
> - Ingenic, MIPS-LINUX toolchain R6.0.0 release notes:
> =C2=A0 https://www.ingenic.com.cn/news-detail/nid-343.html
> =C2=A0 Distinguishes MSA, MXA and MXU/MXU2 support in the toolchain.
> - Ingenic, MIPS-LINUX toolchain R6.2.1 release notes:
> =C2=A0 https://www.ingenic.com.cn/news-detail/nid-348.html
> =C2=A0 Documents MXU3 support and identifies X2000 as an MSA target.
>=20
> The public references document the available CPU, SoC and ISA
> information. The PRID implementation handling follows the Ingenic
> vendor kernel.
>=20
> AI assistance: ChatGPT was used to help review the PRID definitions,
> compare the Ingenic vendor implementation with the upstream code,
> and draft the commit message with public references. The code changes,
> hardware observations, and final patch were reviewed by the authors.
>=20
> Co-developed-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 Changes in V2:
> =C2=A0=C2=A0=C2=A0 - removed the PRID_IMP_XBURST2_R2 definition and hints=
 for an x2100 as
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 there is no public reference
> =C2=A0=C2=A0=C2=A0 - merged into single commit changing the PRID definiti=
ons and code
> =C2=A0=C2=A0=C2=A0 - reviewed details and rewrote commit message
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 Open Issue:
> =C2=A0=C2=A0=C2=A0 Olivier Louvignes <olivier@mgcrea.io> pointed out that=
 he has
> =C2=A0=C2=A0=C2=A0 simply reused the definition of the X1830 for the X160=
0. This
> =C2=A0=C2=A0=C2=A0 sets c->writecombine differently (_CACHE_CACHABLE_WA) =
from
> =C2=A0=C2=A0=C2=A0 _CACHE_UNCACHED_ACCELERATED as we do here.
> =C2=A0=C2=A0=C2=A0 Both settings appear to work but it needs expert comme=
nt which
> =C2=A0=C2=A0=C2=A0 is the right/better one.
>=20
> =C2=A0arch/mips/include/asm/cpu.h=C2=A0 | 9 +++++----
> =C2=A0arch/mips/kernel/cpu-probe.c | 7 +++++++
> =C2=A02 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index add26f08e8029..79fd9a0747cf2 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -47,7 +47,7 @@
> =C2=A0#define PRID_COMP_CAVIUM	0x0d0000
> =C2=A0#define PRID_COMP_LOONGSON	0x140000
> =C2=A0#define PRID_COMP_INGENIC_13	0x130000	/* X2000, X2100 */
> -#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4730, JZ4740, JZ4750,
> JZ4755, JZ4760, X1830 */
> +#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4730, JZ4740, JZ4750,
> JZ4755, JZ4760, X1830, X1600 */
> =C2=A0#define PRID_COMP_INGENIC_D1	0xd10000	/* JZ4770, JZ4775, X1000 */
> =C2=A0#define PRID_COMP_INGENIC_E1	0xe10000	/* JZ4780 */
> =C2=A0
> @@ -186,9 +186,10 @@
> =C2=A0 * These are the PRID's for when 23:16 =3D=3D PRID_COMP_INGENIC_*
> =C2=A0 */
> =C2=A0
> -#define PRID_IMP_XBURST_REV1	0x0200	/* XBurst=C2=AE1 with MXU1.0/MXU1.1 =
SIMD
> ISA	*/
> -#define PRID_IMP_XBURST_REV2	0x0100	/* XBurst=C2=AE1 with MXU2.0 SIMD
> ISA		*/
> -#define PRID_IMP_XBURST2		0x2000	/* XBurst=C2=AE2 with MXU2.1 SIMD
> ISA		*/
> +#define PRID_IMP_XBURST		0x0000	/* XBurst1 */
> +#define PRID_IMP_XBURST_REV1	0x0200	/* XBurst1 with MXU1.0/MXU1.1 SIMD
> ISA */
> +#define PRID_IMP_XBURST_REV2	0x0100	/* XBurst1 with MXU2.0 SIMD ISA */
> +#define PRID_IMP_XBURST2	0x2000	/* XBurst2 with MXU2.1 SIMD ISA */
> =C2=A0
> =C2=A0/*
> =C2=A0 * These are the PRID's for when 23:16 =3D=3D PRID_COMP_NETLOGIC
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 489612ed9d498..69b68d00b66f7 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1768,6 +1768,13 @@ static inline void cpu_probe_ingenic(struct
> cpuinfo_mips *c, unsigned int cpu)
> =C2=A0
> =C2=A0	switch (c->processor_id & PRID_IMP_MASK) {
> =C2=A0
> +	/* XBurst=C2=AE1 with ISA */
> +	case PRID_IMP_XBURST:
> +		c->cputype =3D CPU_XBURST;
> +		c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
> +		__cpu_name[cpu] =3D "Ingenic XBurst";
> +		break;

What SoCs actually use PRID_IMP_XBURST? The JZ4730?

If it's really used somewhere, you'll also need to add a compatible string =
for
it in Documentation/devicetree/bindings/mips/cpus.yaml. I guess just
"ingenic,xburst".

Cheers,
-Paul
