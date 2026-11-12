Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794498132;
	b=hdRs78jFrBQ0E9Bv7kbxPLKKDS+xUNx2/tRYxy7y7YV1d4wxFdhOaWLc19QljzoHqvgt
	 j/elcJq2506wErpWLrxKEJgBKI5qpekHjlNhA9POvcDq+/EoDwwOTnNNEk1ITlkGhk16q
	 L3h1IBou0mjoeXuiU3TzfyEW+aVyK+aFbJFligv0QFtVTYWRC9ffXJd97VToY/VWtCfMv
	 NyOlLREjiCG8ZYcHRfXuNKm3EtAxsS4uSFxPZ0hgwl/EN0vcEpMRNcM+v30yruBG3+MnM
	 x5Pe0JKBw7WAmfDVuDXhw/pbrnkNGSD2kfAXmaRwPUVMnIsEZUSvtKdzM4JWvE7HoQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498132;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=XuivvrA2ar/UEY5NnSXd6bET7k/G9HVfYGjVrGY7O7s=;
	b=M3+hnRD98UfXV655T5VKTKYju5rSIFR0oc9Fst6blzgpUdSRlX4f3rav/5jzKKPTP5a7
	 1FIc57FI8yuVoIBPDSPDDcia0EvbpBfkSQwOZnYHpuAVrTpTbVJlVRlgxld6uqKBUV5UZ
	 XrgGKoFQW9Ue8n730VAiyMzOAQXdN4BM01RAnFpJFRhfFKP+egvr+wJ+11b3rIPnuYZKO
	 p2JC216YFST5LqzYaU1GzuQYUCT00lhcuegQt3OIabmWY3fgfuJtpjytuI9Mjc4IxhwsD
	 x1Ef7xMGLHIZ3k3av3QRwoBoiA1uo8s4aqxiaN6o8bS3JAYtQqDakiWEi6vckMuwkLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=FSQq34Cu;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=720RcazJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.170
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6E606A339;
	Thu, 12 Nov 2026 15:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C6E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=FSQq34Cu;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=720RcazJ
ARC-Seal: i=1; a=rsa-sha256; t=1794498121; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=c5/XJXRFmT90Z5bDvFSOAYPAp27gVl4tGP7mXzTMcDCAjvuWlHO2AeVJ7qmPGl6oLe
    4ESaS6RTUaFImoXYmtxOTfJA0o/h+x4BFT7u91IjmxcIGvW8AwCchevKpahWBiHAA8+5
    ABNAy2f/MNAW9g07EwTyLtGnCOH4eC1dKnEHWkPaM5hi1T+3fWOgJz9u1RQ8/cMVaz3y
    shAJrUnrTXUMqMMmKNODXYoJmFnSIjx5CC4poMNORi7FVATXOwdjSSaQKUBFaVaGEKlD
    PEXS3ZJ2YR+8pfxD7DfbV/oshtpLpvC3OA5CxmkSj5f+EWFA+LOloAlI0ftVun8uKEk2
    PMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794498121;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=XuivvrA2ar/UEY5NnSXd6bET7k/G9HVfYGjVrGY7O7s=;
    b=iSBHchM8Lqjx7U7DTKimfV8gEjoZ1QKx0unG0Pawk/Km02skTJdZg98ZjsSwZEDINE
    Hh3f4MOS/w5ZHVXSvFS6aF3BFndv7xDpF1CgSATJdjHekn/UKZ+5J9BLBpoXMOrlF9ns
    e1mEJk1upfv0n7ISQ0yHrqEmm+VLNTLKLqhLrSGnX25Yh2eQCo6DSeZ6FDMD9h3Vfkmt
    LDYkJ0LaS5ScjnOsbfQ6z1zG3N1Muix0HFfvMXm3i/bCxj+oeNglfbGH1DtR4KC0cQ/p
    vdvzr48SFVy2l7+5Y1TtUe+V1Aw3sZgFyVlUtecDLl/G56X562Gur6U9tijtHyVcD5NW
    R+ZA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794498121;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=XuivvrA2ar/UEY5NnSXd6bET7k/G9HVfYGjVrGY7O7s=;
    b=FSQq34CuBFk5KGPRLjeZwUxLADtdmp+bgbkxoyuDkszJ9aN3LYZA3cuFXkSgyFgAa9
    gU1FUfZ8x8Cbm4akeS0OGsDByF26bfNs7bp8WiG/hKk64yaYJe6FQUNwhl2NQkslgilY
    svm+9v4/9STyODW6HLwAKU1z3nY16PW7iElRumVYNDT/8CNze+CavR6STt90ZXmEH/zC
    UOfCNXRaDsR8H8rYXHhub5rrAw4llqhbUpSXjYtQ4T2Jz+tM+0ADxu9s+Mh2DJrmoZ00
    4TX2OMJ40BvIFxFERpAUaeGxmTxjXAXwCOT+qESToR0RDExWbdeA6cz40TL4mZWTnlD3
    pBvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794498121;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=XuivvrA2ar/UEY5NnSXd6bET7k/G9HVfYGjVrGY7O7s=;
    b=720RcazJKwMGwIf7hzEywy3mCg7x9QZo245TjOZsncYPnlxS5eFViOAQU0OgBtuGRG
    RT3IJGmt2rBhX5FZE2CA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ACFg1D2R
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 12 Nov 2026 16:42:01 +0100 (CET)
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
Subject: Re: [PATCH v2 6/9] MIPS: generic: Add MACH_INGENIC type and
 compatible for X1600 and X2600
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <0ec3716fb00fe25b3b03a7abc45348901fee05dd.camel@crapouillou.net>
Date: Thu, 12 Nov 2026 16:41:30 +0100
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>,
 "Christophe Leroy, David Heidelberg" <david@ixit.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Paul Boddie <paul@boddie.org.uk>,
 Olivier Louvignes <olivier@mgcrea.io>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <834D5794-64D1-4659-99B2-2ADD2AACA7A8@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
 <87a3ba40389df599efe30af922ba1564813be8f6.1794471031.git.hns@goldelico.com>
 <0ec3716fb00fe25b3b03a7abc45348901fee05dd.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Paul,


> Am 12.11.2026 um 15:09 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le jeudi 12 novembre 2026 =C3=A0 09:10 +0100, H. Nikolaus Schaller a =
=C3=A9crit :
>> Add support for the Ingenic/Lumissil X1600 and X2600 SoC by =
introducing
>> new machine types.
>>=20
>> Update the system type string mapping and add the "ingenic,x1600" and
>> "ingenic,x2600" compatible strings to the DT match table in the =
generic
>> Ingenic board support.
>>=20
>> Note that we do not separate between e.g. X1600, X1600E, X1600H since
>> they differ only in built-in memory size which can be handled by the
>> boot loader.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>=20
>> Notes:
>>     Note that there is no bindings document for any of the compatible =
values
>>     so we don't add them.
>>=20
>>  arch/mips/generic/board-ingenic.c | 8 +++++++-
>>  arch/mips/include/asm/bootinfo.h  | 2 ++
>>  2 files changed, 9 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/mips/generic/board-ingenic.c =
b/arch/mips/generic/board-
>> ingenic.c
>> index 1f4906875e7bc..5840293913977 100644
>> --- a/arch/mips/generic/board-ingenic.c
>> +++ b/arch/mips/generic/board-ingenic.c
>> @@ -24,6 +24,8 @@
>>  static __init char *ingenic_get_system_type(unsigned long machtype)
>>  {
>>   switch (machtype) {
>> + case MACH_INGENIC_X2600:
>> + return "X2600";
>>   case MACH_INGENIC_X2100:
>>   return "X2100";
>>   case MACH_INGENIC_X2000H:
>> @@ -34,6 +36,8 @@ static __init char =
*ingenic_get_system_type(unsigned long
>> machtype)
>>   return "X2000";
>>   case MACH_INGENIC_X1830:
>>   return "X1830";
>> + case MACH_INGENIC_X1600:
>> + return "X1600";
>>   case MACH_INGENIC_X1000E:
>>   return "X1000E";
>>   case MACH_INGENIC_X1000:
>> @@ -146,11 +150,13 @@ static const struct of_device_id =
ingenic_of_match[]
>> __initconst =3D {
>>   { .compatible =3D "ingenic,jz4780", .data =3D (void =
*)MACH_INGENIC_JZ4780
>> },
>>   { .compatible =3D "ingenic,x1000", .data =3D (void =
*)MACH_INGENIC_X1000
>> },
>>   { .compatible =3D "ingenic,x1000e", .data =3D (void =
*)MACH_INGENIC_X1000E
>> },
>> + { .compatible =3D "ingenic,x1600", .data =3D (void =
*)MACH_INGENIC_X1600
>> },
>>   { .compatible =3D "ingenic,x1830", .data =3D (void =
*)MACH_INGENIC_X1830
>> },
>>   { .compatible =3D "ingenic,x2000", .data =3D (void =
*)MACH_INGENIC_X2000
>> },
>>   { .compatible =3D "ingenic,x2000e", .data =3D (void =
*)MACH_INGENIC_X2000E
>> },
>>   { .compatible =3D "ingenic,x2000h", .data =3D (void =
*)MACH_INGENIC_X2000H
>> },
>>   { .compatible =3D "ingenic,x2100", .data =3D (void =
*)MACH_INGENIC_X2100
>> },
>> + { .compatible =3D "ingenic,x2600", .data =3D (void =
*)MACH_INGENIC_X2600
>> },
>=20
> I was going to say that if you add compatibles here you'll also need =
to add them
> to the bindings documentation, but it seems we don't have one?

Indeed... Checkpatch even reported about.

I added that to the Notes section of the commit that we have no bindings =
doc.

>=20
> We have Documentation/devicetree/bindings/mips/ingenic/devices.yaml =
for boards
> but most SoCs listed here don't have an accompanying board.
>=20
> Given that it's not your mess I'm OK with the patch, but we should =
really fix
> this at some point.

Agreed. Should not be too complex, I guess.

BR and thanks,
Nikolaus

>=20
> Cheers,
> -Paul
>=20
>>   {}
>>  };
>> =20
>> @@ -188,7 +194,7 @@ static const struct platform_suspend_ops =
ingenic_pm_ops =3D
>> {
>> =20
>>  static int __init ingenic_pm_init(void)
>>  {
>> - if (boot_cpu_type() =3D=3D CPU_XBURST) {
>> + if (boot_cpu_type() =3D=3D CPU_XBURST || boot_cpu_type() =3D=3D =
CPU_XBURST2)
>> {
>>   if (IS_ENABLED(CONFIG_PM_SLEEP))
>>   suspend_set_ops(&ingenic_pm_ops);
>>   _machine_halt =3D ingenic_halt;
>> diff --git a/arch/mips/include/asm/bootinfo.h
>> b/arch/mips/include/asm/bootinfo.h
>> index 2128ba9033911..f6ae983577f6f 100644
>> --- a/arch/mips/include/asm/bootinfo.h
>> +++ b/arch/mips/include/asm/bootinfo.h
>> @@ -81,11 +81,13 @@ enum ingenic_machine_type {
>>   MACH_INGENIC_JZ4780,
>>   MACH_INGENIC_X1000,
>>   MACH_INGENIC_X1000E,
>> + MACH_INGENIC_X1600,
>>   MACH_INGENIC_X1830,
>>   MACH_INGENIC_X2000,
>>   MACH_INGENIC_X2000E,
>>   MACH_INGENIC_X2000H,
>>   MACH_INGENIC_X2100,
>> + MACH_INGENIC_X2600,
>>  };
>> =20
>>  extern char *system_type;

