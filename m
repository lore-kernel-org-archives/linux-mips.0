Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.165
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794416510;
	b=MZZAqrNtk5M70AHExaoEJyIidqnjm4PCijQGrBRWzR4vZO8na3raCRMfXDbBY9E8SnGC
	 k8+kXh7hBRtUAMIQwkS2LrANMpwr7OQIEUvG5qjBBGCfdnj47y+TK9NwkTDeYfQSziyHs
	 RRag2VzhgvPLs9SDwWXYXOU1/nCF1/APWLgp/963CYdJEoFZZNwtiFFWLV4mrd2/EGQqy
	 dAdk+N055sfGjWleJF0017p29oOxAl0h1n9uZU+oVm9HZJYDOTSfNr/FoK+3pIRVZMCad
	 QISFwxrqSr02dcusdFmJe5SnOVmlOQ/8hpTSt7M98nlRqBCHivb3cws2D4dTdVfr+hA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416510;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=Xu2IziJbxEx8FYDyoQyVNAj5hzygFsW53R6oVXAp9jI=;
	b=DaFm+Cx7UgZmoCq8DocscuCodHq9izU/MMmpWm4Pd6V/KrtmnVtn7QPuH6t6DwulVJvZ
	 Qu2RLO99cP+zS3nDgFmloIguQLmXIwCSzGbha/Zu0gPDEN6pbkgd7n7PI1A7yWASaqHyZ
	 zVwD+0Q5ZnBr0VpKdfPIPCuoolZghgGtMLV1jhUIwLTPP4jLM0uKp42gPDCNwkzjH2XjD
	 fbIvI9j1iq6AiO/pL39er88oYClBpVvAi7sx/b/HWftda7j38o/rUtoYvbQVmb6N5Q6S2
	 eirxs5Hfnz8zxnsyRq6oU9U/Le94tblciBYXV7IELKjANeE6RdWouR/Mlq9G4P9+Qew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=gd5DE5+6;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=uqCplBgc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.165
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190EB606A31C;
	Wed, 11 Nov 2026 17:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190EB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=gd5DE5+6;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=uqCplBgc
ARC-Seal: i=1; a=rsa-sha256; t=1794416478; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=mak7jq2/8Rsk23FLQfCe+Mu8DsN61rdmuyTzA9vEnSCfwHrvaM0Gjw89r49TUn4wGZ
    PJ3T6dz37B9i0DdLoZS6KF/3hndQDCW+KcpIFr2cU2vvgHQA/j+yc3vnas4LMEXhxYL0
    5MtTSNZA6Aj8R3WnqlAcHD6hs1eDsc2FMwbT9bR1n2MK1R6oXRzFGSDJ7jtjM2F2GKoE
    K2VuAOSkLRRwFrjJ056659w7DunD9uYNT5jevrF/MGbo5BgEG3Y8BeCpMKlMGCKId7zt
    D77PQKb64Ahkm4SWlyyqAYMXuDMtnSYaGNgxZgRtxGx+qFHjaGSJ6Q1d6+1vkMaQk3mQ
    MbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794416478;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Xu2IziJbxEx8FYDyoQyVNAj5hzygFsW53R6oVXAp9jI=;
    b=de1VA6D9e+unLdPAyyTZqjwWUaltKanjD3fxrCkj7dupHUQUq9BST5izO3AJhtAqNV
    zZ4Xjbt+/g7mU9R3jAPzN5+6pYAtc6RTQkVqC3TQkhrahdQdGL8I3bWYyIS+iUG9yo/u
    etXIv90aS7cjaa6qTapoddj3Q065sgwgDCkB1YwkYSBanbBfWCunCya4CK4Nx5fboeqh
    BH3zU/rFs1RJkNc8cvbLLIfLGAhjU/nS5ZR5B4QlklmP/vjEVnmVBPrrakvyc8Oh3kRj
    VKwcEqykJI8qaiI6NlENZg/Q1eV0pdufDZft0mBPxijAJaE1NycTJ4tv1ZL7c94JHC2i
    W4eQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794416478;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Xu2IziJbxEx8FYDyoQyVNAj5hzygFsW53R6oVXAp9jI=;
    b=gd5DE5+66cCU5sdq3AMPaG0puSvSmGp3jHB2nfQDPJIWtHwr3kNa1Y9Qh7VWJLnkzz
    qulNJprf4gsTHgIBtczakuRFXDujIl/g8dM0nat7NqvdrnbzmK05Ycr3XFw5pDBvP02o
    YVfb8AD5XM6s2sWOVYprw+iwr81NFYWjvtlg1O6GO7zuoW3jLLLn8++l1vdjoBWCT1r7
    rPC87cvJYA6h5jWI1coKZOIrW1aFN/qX9WQmea9wsUsqYD9oa3bY8Bh1nA9K7fYSj9gy
    pm3m9JqWwcxAaeGTxE9cfpifOF5e0pLj4lwyc+iSE4R+ZAP4IjtCDLuSkqJXdNsQ6Wtt
    FiOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794416478;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Xu2IziJbxEx8FYDyoQyVNAj5hzygFsW53R6oVXAp9jI=;
    b=uqCplBgck3bT9FDPK9KopUAKaZTBMoPP9mAeRUmMnIxElv8/y97z6KnlwnD14b7v3c
    Qj0g83EcZmqoGLV3jjAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQjZoLz8iN2kucGv2N8YJDPry98OL4EAMbtbpe"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ABH1I8hR
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 11 Nov 2026 18:01:18 +0100 (CET)
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
Subject: Re: [PATCH] MIPS: ingenic: Let Config.VI tell whether the icache is
 virtual
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261110-mips-xburst-icache-vi-v1-1-efba689606dd@gmail.com>
Date: Wed, 11 Nov 2026 18:00:47 +0100
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>,
 Paul Boddie <paul@boddie.org.uk>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BA039439-3960-4865-B6D4-17B845BD77DB@goldelico.com>
References: <20261110-mips-xburst-icache-vi-v1-1-efba689606dd@gmail.com>
To: hunterlaux@gmail.com,
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi,

> Am 11.11.2026 um 05:09 schrieb Hunter Laux via B4 Relay =
<devnull+hunterlaux.gmail.com@kernel.org>:
>=20
> From: Hunter Laux <hunterlaux@gmail.com>
>=20
> The Ingenic CPU support treats every XBurst instruction cache as
> virtually tagged: the feature overrides fix cpu_has_vtag_icache to 1,
> and the probe sets MIPS_CACHE_VTAG. The setting came in with the =
JZ4740
> feature overrides in commit 83ccf69d8f11 ("MIPS: JZ4740: Add base
> support for Ingenic JZ4740 System-on-a-Chip") without a stated reason,
> and Ingenic's own kernels treat the icache as physically tagged.
>=20
> Neither XBurst1 nor XBurst II has a virtually tagged icache. Both
> programming manuals describe a physically tagged one and hardwire
> Config.VI to 0, which the cache probe already reads. On the X2600, =
code
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
> ---
> Lars, the override came with your JZ4740 support in 2010. On the off
> chance you remember a reason for setting cpu_has_vtag_icache to 1,
> I'd like to hear it.
> ---
> arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h | 1 -
> arch/mips/kernel/cpu-probe.c                               | 3 ---
> 2 files changed, 4 deletions(-)
>=20
> diff --git =
a/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h =
b/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
> index 7ace50127f..71c03f1dd4 100644
> --- a/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
> +++ b/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
> @@ -27,7 +27,6 @@
> #define cpu_has_mips3d 0
> #define cpu_has_smartmips 0
> #define kernel_uses_llsc 1
> -#define cpu_has_vtag_icache 1
> #define cpu_has_dc_aliases 0
> #define cpu_has_ic_fills_f_dc 0
> #define cpu_has_pindexed_dcache 0
> diff --git a/arch/mips/kernel/cpu-probe.c =
b/arch/mips/kernel/cpu-probe.c
> index 489612ed9d..bef92e6cd6 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1763,9 +1763,6 @@ static inline void cpu_probe_ingenic(struct =
cpuinfo_mips *c, unsigned int cpu)
> c->options &=3D ~MIPS_CPU_COUNTER;
> BUG_ON(__builtin_constant_p(cpu_has_counter) && cpu_has_counter);
>=20
> - /* XBurst has virtually tagged icache */
> - c->icache.flags |=3D MIPS_CACHE_VTAG;
> -
> switch (c->processor_id & PRID_IMP_MASK) {
>=20
> /* XBurst=C2=AE1 with MXU1.0/MXU1.1 SIMD ISA */
>=20
> ---
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
> change-id: 20261110-mips-xburst-icache-vi-db10a8d03dd6
>=20
> Best regards,
> --=20
> Hunter Laux <hunterlaux@gmail.com>

it appears that this looks quite similar to what had been sent to us by =
=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
5 years ago for testing and we integrated it into our out-of-tree kernel =
but it never
arrived upstream (attached as plain text just for review).

So it is likely the right way to go to solve such an old bug if =
independently suggested
and did work for us for such a long time...

Please compare and verify, as I am not an expert for MIPS cache.

BR and thanks,
Nikolaus


See also: https://github.com/goldelico/letux-kernel/commit/ff0761012124d

commit ff0761012124d0d06a9fc01c644c52399b7dc1f4
Author: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) =
<zhouyanjie@wanyeetech.com>
Date:   Tue Jun 22 23:20:22 2021 +0800

   MIPS: Ingenic: Fix the wrong cpu features.
        1.Ingenic SoCs have never had a instruction cache with virtual =
tag,
     so the "cpu_has_vtag_icache" in cpu-feature-overrides.h should be
     0, and the flag in cpu-probe.c should also be removed.
   2.Ingenic XBurst=C2=AE1 CPU does not implement the UserLocal register =
but
     XBurst=C2=AE2 CPU does, so remove the "#define cpu_has_userlocal 0" =
and
     detect whether the processor supports UserLocal register through
     "cpu_probe_ingenic()".
        Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) =
<zhouyanjie@wanyeetech.com>

diff --git a/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h =
b/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
index 7ace50127f5aa..24d6157ed6da6 100644
--- a/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
@@ -27,7 +27,7 @@
#define cpu_has_mips3d 0
#define cpu_has_smartmips 0
#define kernel_uses_llsc       1
-#define cpu_has_vtag_icache    1
+#define cpu_has_vtag_icache    0
#define cpu_has_dc_aliases     0
#define cpu_has_ic_fills_f_dc  0
#define cpu_has_pindexed_dcache 0
@@ -37,7 +37,6 @@
#define cpu_has_dsp            0
#define cpu_has_dsp2           0
#define cpu_has_mipsmt         0
-#define cpu_has_userlocal      0
#define cpu_has_nofpuex 0
#define cpu_has_64bits         0
#define cpu_has_64bit_zero_reg 0
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 489612ed9d498..bef92e6cd6950 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1763,9 +1763,6 @@ static inline void cpu_probe_ingenic(struct =
cpuinfo_mips *c, unsigned int cpu)
       c->options &=3D ~MIPS_CPU_COUNTER;
       BUG_ON(__builtin_constant_p(cpu_has_counter) && cpu_has_counter);
-       /* XBurst has virtually tagged icache */
-       c->icache.flags |=3D MIPS_CACHE_VTAG;
-
       switch (c->processor_id & PRID_IMP_MASK) {
         /* XBurst=C2=AE1 with MXU1.0/MXU1.1 SIMD ISA */

