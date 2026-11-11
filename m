Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414224;
	b=cnmZA6Z1krb2RvyKaL+4bOnH3E3TU21nDbmTkbgNoUAFVUsqx3PIcjgDUKx4NVqOhLl/
	 sp2z8xNfhd7+EzRXBaLWBqqGbssGqHgwblpxxHb8rPv7vHQrrWYbLstLClHXYHlD+1mTQ
	 LKoqQvMa4cAFAAtoUdWNMjGNvvAgpS0AczDhe2F39b59EbBl40JMuSSrhT8dO4XDvYbe2
	 bz/I8JXOi9hX73Mz5z4ureGoW4KfIBRAMNYmoUDeM/8dmHN2d0PhTWKkXPSsnA5d/1J+K
	 CeVe2Rx0Z3c4veT1jFGq0f/7fEebTqA5bLS89MMA6yotEaQCKuJ3J899xfybJs5z5zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414224;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=/pMmLBrxhKWmNP6kQgz/inj5Id8oSVba33IusqNJ12k=;
	b=u8eeJeHR9jjigvy2ELm7AV59XUNHowGIzgKRro7LSB2i3kxTQsvxm+LOesW8Xxf2GqhA
	 KCM1rZOLyEj2xBNPkEb5x6dYLFqDAhYQ2OgNUhszJagu6sQvpiAaxstpwXyDfFf8AgISa
	 PM1PIQFWh7xHdqDJnYeJ/7YQQjPGaxTjy70PSRrVwfaocINc8UZlEbiS5IMBZ2tgjrcIf
	 /ThlDfH13FXragKJCXuc3gu48TPClVB9stMUq/6sNFJM4qOB5QmpF+0/BDosGes6OtWJu
	 u+j1Q9P2NVdOtqOzQvUOgFxR4UVRKpV5hFie5MNMujxNSSjhJG2e7h5Nn3Ng8x/Idrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DDF606A321;
	Wed, 11 Nov 2026 16:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27DDF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <1a6aac61cb167ce0eea611afe73e8c87782edd43.camel@crapouillou.net>
Subject: Re: [PATCH] MIPS: ingenic: Let Config.VI tell whether the icache is
 virtual
From: Paul Cercueil <paul@crapouillou.net>
To: hunterlaux@gmail.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>
Date: Wed, 11 Nov 2026 17:23:31 +0100
In-Reply-To: <20261110-mips-xburst-icache-vi-v1-1-efba689606dd@gmail.com>
References: <20261110-mips-xburst-icache-vi-v1-1-efba689606dd@gmail.com>
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

Hi Hunter,

Le mardi 10 novembre 2026 =C3=A0 21:09 -0700, Hunter Laux via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Hunter Laux <hunterlaux@gmail.com>
>=20
> The Ingenic CPU support treats every XBurst instruction cache as
> virtually tagged: the feature overrides fix cpu_has_vtag_icache to 1,
> and the probe sets MIPS_CACHE_VTAG. The setting came in with the JZ4740
> feature overrides in commit 83ccf69d8f11 ("MIPS: JZ4740: Add base
> support for Ingenic JZ4740 System-on-a-Chip") without a stated reason,
> and Ingenic's own kernels treat the icache as physically tagged.
>=20
> Neither XBurst1 nor XBurst II has a virtually tagged icache. Both
> programming manuals describe a physically tagged one and hardwire
> Config.VI to 0, which the cache probe already reads. On the X2600, code
> at a virtual address remapped to another page through the TLB alone
> runs the new page, while the old line is still in the icache. XBurst1
> has not been tested. Treating the icache as virtually tagged is
> incorrect and costs needless icache flushes.
>=20
> Drop both and leave it to Config.VI.
>=20
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Hunter Laux <hunterlaux@gmail.com>

The docs I have do say that both caches are "virtually indexed, physically
tagged". So the patch looks good.

If anything it's missing a Fixes: tag (with stable@vger.kernel.org in Cc).

> ---
> Lars, the override came with your JZ4740 support in 2010. On the off
> chance you remember a reason for setting cpu_has_vtag_icache to 1,
> I'd like to hear it.
> ---
> =C2=A0arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h | 1 -
> =C2=A0arch/mips/kernel/cpu-probe.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ---
> =C2=A02 files changed, 4 deletions(-)
>=20
> diff --git a/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
> b/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
> index 7ace50127f..71c03f1dd4 100644
> --- a/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
> +++ b/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
> @@ -27,7 +27,6 @@
> =C2=A0#define cpu_has_mips3d 0
> =C2=A0#define cpu_has_smartmips 0
> =C2=A0#define kernel_uses_llsc	1
> -#define cpu_has_vtag_icache	1

Don't remove it, set it to 0.

Cheers,
-Paul

> =C2=A0#define cpu_has_dc_aliases	0
> =C2=A0#define cpu_has_ic_fills_f_dc	0
> =C2=A0#define cpu_has_pindexed_dcache 0
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 489612ed9d..bef92e6cd6 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1763,9 +1763,6 @@ static inline void cpu_probe_ingenic(struct cpuinfo=
_mips
> *c, unsigned int cpu)
> =C2=A0	c->options &=3D ~MIPS_CPU_COUNTER;
> =C2=A0	BUG_ON(__builtin_constant_p(cpu_has_counter) && cpu_has_counter);
> =C2=A0
> -	/* XBurst has virtually tagged icache */
> -	c->icache.flags |=3D MIPS_CACHE_VTAG;
> -
> =C2=A0	switch (c->processor_id & PRID_IMP_MASK) {
> =C2=A0
> =C2=A0	/* XBurst=C2=AE1 with MXU1.0/MXU1.1 SIMD ISA */
>=20
> ---
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
> change-id: 20261110-mips-xburst-icache-vi-db10a8d03dd6
>=20
> Best regards,
