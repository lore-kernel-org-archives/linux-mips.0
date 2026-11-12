Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.82
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794498529;
	b=xmx/iDHBV6WztX+rZUsCITy8V6B8YVJwgucLhCJrAMwjUIegchDIjVztAJQ5vvpFANr3
	 i5bGyyi25D8ZrxDHRzyKVf3o7s5KOiNMbUj7TwZ2Tbr7v38VQgj9+AAqhnWIhUgKqUQtl
	 p3e+6JZ1jZCtK21H8oCyGB8QKxOi+3qz2Ku9slnFXbcBg17G6vf62fhQIHpWeouozTtm1
	 +uvzxJXJC3ZiPaMdM/lRPfUHCbI4xia0aSQyT51yQ8K/Alw4Gn5bqdi2EdBqI3FWCht75
	 Awi3NqwxhNZNJ+lXU5rg1iu+KuG/7M5nmnWFI5FsUx57uT00WuqypyqwSY50KlH2ROg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498529;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=fgw5BhbzyfegbuedZOXHCoF+Z54btuowGOL63wOGrJA=;
	b=ey37JYSoH9YAQX5h84Zm46Mxdf6QenhEWVBiCe8bNFnXBeR8eYAfrUwK6xZAu0GX+Qlz
	 j8NxMztI0NeQgK0eVxPjoM/UeGJKbjB/HryXGRw+UF9DVZGo0Yd1ImaxIpSlHi7syqKwL
	 4TeNckgBL7ticrjj3ex4AR6FI67IFRaUfTdIYFecjHE5y9WcZnsNdf13G+BQpy5EGH+aV
	 sS3qcmD/9pl5MCJmEzE6RhR5qHTEEvXPizmt3skyWDu5fVSaFak7xDVo7oJ2kR4iGwFFA
	 eiV2ZSbMBy7sY7oDM+s6+YsA9k+2qjwkrBt5te3N97juREOfa3SlN559jH4hnx/SXvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RurjjU8H;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=4R2YqJwx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.82
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DEE606A323;
	Thu, 12 Nov 2026 15:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7DEE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RurjjU8H;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=4R2YqJwx
ARC-Seal: i=1; a=rsa-sha256; t=1794498524; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=flokDZcFH/ui4a/ZWM4e6N/TpOte/paDwRRnQXCHP+/DLBVeP57q+6YlCO9mtQya+i
    yspnGrqlj3rNPSEcdp1xyPHVCP6XiRz3rZT7RbJuLXpAbU7TpFIQ70ZDJqV2TY0tBfrY
    7Ttp34ZIt2Xgcou1mQwJDobVCMLpYo+zpToamBhMSi7vml6um2cZBDKUqz7yBzfP3LlM
    ht7Ect5ZXvY91tm+caN/tbW80zi8IR6rN2WDTN3PMY/iHrE/XFE7KnIl7naUhp7ZuQmG
    5JCNQqW3yvwg89MuDC3Upc67jvNmHJ/WcvpiCBqI825qTuIm66QnZ1b89ecXSREf6oPj
    ZObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794498524;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=fgw5BhbzyfegbuedZOXHCoF+Z54btuowGOL63wOGrJA=;
    b=d2uU87dKXZc16pMIiU/oRIJYcnjgw+PB6hklqyeO4QmR5ddpcn71uCtJhK/n/Lh/WQ
    KeKndUOyGODZRt/l3Q5RJ/e7CT56ZEEQD7n69UIU7MKQ0FsvH4618kPJe4CgUMERVfc0
    F+Ml8WatSBOTqCH/n/ENckJluLgxKkKQTMZBzkljdHfa6x5nC7jX64buQkxlCueZn6yP
    AjBbrUY9zW9DYKPwJcZik5qqxsQ1hGHxveC5riSJpXGVp1q+WfjJupYEz9wHFI6VJS4T
    G9O8zcmG46Fsad9UPrCobCm6GFXmtRCbocbOHa29hvszTAAR9l7UBwy/QdtzlZ18uh1b
    aU5g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794498524;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=fgw5BhbzyfegbuedZOXHCoF+Z54btuowGOL63wOGrJA=;
    b=RurjjU8HmVfVfyQn8QkSe1sxiGThJ9Eq16jnF9YCia6rgVk9a8zCECEsn/1L1A5yZy
    vuZamKG3yAk5EIVgD+F6EYmaW3Uh8J8/ROTl4emvcP4pB/15aUH5AuSrkf41vqpe8N5J
    Nh46FwSbJG19eVnLUlo7YZOb/BgrDGy+32DylnIUxDEkdLKzYM91NC9dpV5991iS7xub
    6MtzZD9rbnFU5c1u4xKC3M0r8A+JdacUss9+oanB7HzjVJmmxnt2LlmQJqrYtbK1h4XL
    hiIOVMe8x5JIRvgzWnOTKvNPnvQ4YZFXSl7IY4e6rdSPmgvOEvgrSQ6z4O2f/4Yvsh4E
    r1Aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794498524;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=fgw5BhbzyfegbuedZOXHCoF+Z54btuowGOL63wOGrJA=;
    b=4R2YqJwxqQfIHssSagBdgZr96JMMbvKT+Qp+jC+UQeDnDP1r/VIcP6vHAqBLfZXTwN
    GBQKiyLDLi3u6z2jzcBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ACFmhD47
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 12 Nov 2026 16:48:43 +0100 (CET)
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
Subject: Re: [PATCH v2 7/9] MIPS: Ingenic: Expand Kconfig for X1600, X2000,
 and X2600 SoCs
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <26336f36c7ed09bcf64fcc2ae2d8aa1e0c1b7d23.camel@crapouillou.net>
Date: Thu, 12 Nov 2026 16:48:13 +0100
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
Message-Id: <BE31F647-6DDB-4B84-AD79-64BAEAB7AFC6@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
 <4cbb6412d3e7713d6c464051a107db19feef1278.1794471031.git.hns@goldelico.com>
 <26336f36c7ed09bcf64fcc2ae2d8aa1e0c1b7d23.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)



> Am 12.11.2026 um 15:16 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Le jeudi 12 novembre 2026 =C3=A0 09:10 +0100, H. Nikolaus Schaller a =
=C3=A9crit :
>> Expand MACH_INGENIC_GENERIC to select all existing and newly added
>> machine variants (including JZ4750/55/60/75, X1500, X1600, X2000,
>> X2100, and X2600).
>>=20
>> Introduce individual Kconfig blocks for the following SoCs:
>> - MACH_X1600: Selects MIPS32_R2 and HIGHMEM.
>> - MACH_X2000 / MACH_X2600: Selects MIPS32_R5, SMP support, broadcast
>>   clockevents, O32 FP64 support, and weak ordering optimizations.
>>=20
>> In parts developed by Reimu NotMoe <reimu@sudomaker.com>
>=20
> Co-developed-by? (+ his Sob)

I have to check what he really has developed. I think we did take this =
from
his github tree (https://github.com/Ingenic-community/linux/tree/v6.1.y) =
but
were never in contact with him. So I am not sure if we can get a SoB:.

>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  arch/mips/ingenic/Kconfig | 38 =
++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>=20
>> diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
>> index f595b339a4b84..5d351b42bbc9b 100644
>> --- a/arch/mips/ingenic/Kconfig
>> +++ b/arch/mips/ingenic/Kconfig
>> @@ -5,10 +5,19 @@ config MACH_INGENIC_GENERIC
>>   select MACH_INGENIC
>>   select MACH_JZ4740
>>   select MACH_JZ4725B
>> + select MACH_JZ4750
>> + select MACH_JZ4755
>> + select MACH_JZ4760
>>   select MACH_JZ4770
>> + select MACH_JZ4775
>>   select MACH_JZ4780
>>   select MACH_X1000
>> + select MACH_X1500
>=20
> You select MACH_X1500 but there's no CONFIG_MACH_X1500 symbol. No =
entry in enum
> ingenic_machine_type either, or compatible string for it.
>=20
> Your patch didn't add a CONFIG_MACH_X2100 either.

Ok, that may be from taking the Reimu NotMoe patch without =
cross-checking.

Will be removed in V3.

>=20
>> + select MACH_X1600
>>   select MACH_X1830
>> + select MACH_X2000
>> + select MACH_X2100
>> + select MACH_X2600
>> =20
>>  choice
>>   prompt "Machine type"
>> @@ -62,8 +71,10 @@ config MACH_JZ4770
>>  config MACH_JZ4780
>>   bool
>>   select MIPS_CPU_SCACHE
>> + select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>>   select SYS_HAS_CPU_MIPS32_R2
>>   select SYS_SUPPORTS_HIGHMEM
>> + select SYS_SUPPORTS_SMP
>> =20
>>  config MACH_X1000
>>   bool
>> @@ -71,8 +82,35 @@ config MACH_X1000
>>   select SYS_HAS_CPU_MIPS32_R2
>>   select SYS_SUPPORTS_HIGHMEM
>> =20
>> +config MACH_X1600
>> + bool
>> + select SYS_HAS_CPU_MIPS32_R2
>> + select SYS_SUPPORTS_HIGHMEM
>> +
>>  config MACH_X1830
>>   bool
>>   select MIPS_CPU_SCACHE
>>   select SYS_HAS_CPU_MIPS32_R2
>>   select SYS_SUPPORTS_HIGHMEM
>> +
>> +config MACH_X2000
>> + bool
>> + select MIPS_CPU_SCACHE
>> + select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>> + select SYS_HAS_CPU_MIPS32_R5
>> + select SYS_SUPPORTS_HIGHMEM
>> + select SYS_SUPPORTS_SMP
>> + select MIPS_O32_FP64_SUPPORT
>=20
> I know MIPS_O32_FP64_SUPPORT was supported on the JZ4770, and most =
likely on the
> JZ4760 too (the first one with a FPU AFAIK). So this could probably be =
moved to
> CONFIG_MACH_INGENIC.

That should be clearly checked. If I find a little time I can add it
or it can be done later.

BR and thanks,
Nikolaus

>=20
> Cheers,
> -Paul
>=20
>> + select WEAK_ORDERING
>> + select WEAK_REORDERING_BEYOND_LLSC
>> +
>> +config MACH_X2600
>> + bool
>> + select MIPS_CPU_SCACHE
>> + select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>> + select SYS_HAS_CPU_MIPS32_R5
>> + select SYS_SUPPORTS_HIGHMEM
>> + select SYS_SUPPORTS_SMP
>> + select MIPS_O32_FP64_SUPPORT
>> + select WEAK_ORDERING
>> + select WEAK_REORDERING_BEYOND_LLSC

