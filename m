Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794497912;
	b=RupPx4rXBeZtt4SM6/w9Ro7JwmdSdKj3FmvT8bvGapnQ9RREktbdo3e4+Ps4/UVzgkWe
	 7lYJBaHWWa3OJD+EHTc2du5IsG6vqMJj8VuGvwAb2jdia2dE966w+17I7+VfVEtodJK01
	 y+fd53mazvRjIjQXAmTqZOSk9W45vW6gSdfyqx4iPtR7RJcuzSrBVeu7ntbDNvi53F7VM
	 1Go7y8Za8F90bfUpYVM6gHlW06Z5y4cw4yF9haeJHoU3dM+WX4tYHDkAd6AZbnpxnBysi
	 KLJoqoT2V648VmE1v02NLPLKykOETIGR/aeV+kG8aOIWALjYs22X0zhYaDnvkbSahtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497912;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=pKhdkOg4+OQGspY1LZu+s7JqzDxc8ChrBM982ubKraY=;
	b=Eev4a2ZXbW17hW0/i4198d+YpKtnJH8l8bmmltxYofaZdETqc9kenITTPeGBFsYei5My
	 7BNxFH33W73aJOvBdd7rNmKf+I5tVQdwR4oJ/8BlA5z8NkdmMR9v1IfZ37vrz9Og7/Az1
	 mLWPCJ/++vCPFxOHClsbCNZ2camuAJEUa+0Dzcl205EbmL5eRaJY75B64icgaEnrWonQk
	 GoScW7fvOSnXEWYUhuBm+Wp6Gv/NFs73oCPzPM+Q3DOBkjICL0/XQl7lfsG7Sj/ReaIX6
	 TtO+X0SnLOx8UNm4qTwBx+4ddatszVWHaQ3rVao3ZtaMgaYOe+4zTo8zlW2f27pdbgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=mCo1QkN1;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=3z861lLU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.169
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA51606A323;
	Thu, 12 Nov 2026 15:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA51606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=mCo1QkN1;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=3z861lLU
ARC-Seal: i=1; a=rsa-sha256; t=1794497901; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MTvARN8eftGDYMs/FNrMR5MOHqe0CJxYamgmZLJ8H9Qa/hAtt6tMb1iaJzWmuKIa28
    x6DmbEK/eUEAT4FgCklljoqy4kNawaVOgLd51Znzomt9O9vOzroLw32QHt5OcxfiFwMX
    xEHYFQELMMZVGjwjAnytC+hYArVTFj1m5uL9tLyKdTNQAwgJiTM80u/1JTT/6dehmhvp
    CyvBjopFrjIOI7U/a8iBQhO5srjnbIr9ZvboogbNv5Qc8gkXl+i7EBXtPa53Sgh+mW4t
    DWVqHOJIJ84L2TlPwM+S2lKcjDMmDU+UeOVAQYkKr9YrnvoSggRFI4n/0I8BnmNfW99A
    R3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794497900;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=pKhdkOg4+OQGspY1LZu+s7JqzDxc8ChrBM982ubKraY=;
    b=ihu6jzpzalHlXiOXcw/ZRHaoH2rkzPbPm/j2nlyzLCTLFPE0Mw3UHIVJxjyUnW/O7p
    K1v7gdJs+n1ljPa2tUSlLDYtdlOaZ8bGHiWejpcOXHugt6ogi3VgmZOpVYwhKHzyyh2s
    eWu1hvm6gH1qncduN4EOemILC+jiJBOloIdaIxUyTW2bcPYhcUpBkfDa2JCmGXx97xxk
    igtH/B+Tp42VV4KEYrd5RI92Q0fO5AluZzsLU87WmqnSt7+f4fWDSH1qrzX8fpmYJUuw
    +JEaQsbRC7Djsi81aQc2DDLTwNNIs7LfI6GEgSU2+sQ0rhsjoaNg6ElVrRZCcD8MrdNy
    y+6Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794497900;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=pKhdkOg4+OQGspY1LZu+s7JqzDxc8ChrBM982ubKraY=;
    b=mCo1QkN1kOQIqoaUadHZP/8fS/JHWqwIgPnFl4OkXsIjqzhukWTHY7r35FSSj3oPRS
    Ea8TjobwA3NmZX4eMPxZnCmOKU8Va19Q+sDX18c4jw9uNkKL71LlcYU/l5B98eFFDYKn
    bkMFyKNBVOadbAlNtJ5T4f4Ns6VlwvgIbeox7fh/yGYR04GA75Y9wsyJsMLrF811oTUM
    mcUouI561Su034cWf0k3Q0wJB58eVM8Ul09dDuaJeUPSXOvx3qqrj7IZlewvu59sIv/j
    vvBewHqRY3CSLQAVQxm/ybnhgbD17mu1RILbsBmLUKEKftIgoU5l3VbItVWXGHMAuDjJ
    2Gqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794497900;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=pKhdkOg4+OQGspY1LZu+s7JqzDxc8ChrBM982ubKraY=;
    b=3z861lLUdCKVsY54z0FQ+MyHg1ZZZzmT/Dt09u1bAC0CBpiSq3ivNz0kzVr2SD6EDq
    s5z9ulp34+OdqNbpb4DQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ACFcKD1N
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 12 Nov 2026 16:38:20 +0100 (CET)
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
Subject: Re: [PATCH v2 5/9] MIPS: Ingenic: Update Ingenic XBurst
 implementation IDs
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <f91a0c53b35ff28bed26622f46d562b5a6150008.camel@crapouillou.net>
Date: Thu, 12 Nov 2026 16:37:49 +0100
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
Message-Id: <3892D527-E3F1-49CA-8557-2C62E2C015C4@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
 <2e21dc4889ec55bf210dfc205bfadb57acb93eda.1794471031.git.hns@goldelico.com>
 <f91a0c53b35ff28bed26622f46d562b5a6150008.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Paul,

> Am 12.11.2026 um 15:03 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le jeudi 12 novembre 2026 =C3=A0 09:10 +0100, H. Nikolaus Schaller a =
=C3=A9crit :
>> Add PRID implementation constants for Ingenic XBurst and XBurst II
>> processors and handle the corresponding implementation IDs in
>> cpu_probe_ingenic().
>>=20
>> The PRID table is updated based on Programming Manuals and hardware =
tests:
>> - jz4780: 0x3ee1024f (confirmed on CI20 board)
>> - x1000:  0x2ed1024f (unconfirmed)
>> - x1600:  0x00d00000 (confirmed on LX16 board)
>> - X1830:  0x00d00100 (unconfirmed)
>> - X2000:  0x00132000 (read out from LX20 board)
>> - X2600:  0x001320xx (confirmed 0x00132000 on LX26 board)
>>=20
>> Additionally, clean up extra spaces in the comments for
>> PRID_IMP_XBURST_REV2 and PRID_IMP_XBURST2.
>>=20
>> Distinguish XBurst1 implementations with different SIMD ISA revisions
>> and identify XBurst II processors using PRID_IMP_XBURST2.
>> The XBurst II classification follows the Ingenic vendor kernel.
>>=20
>> Keep the existing writecombine handling unchanged, since no
>> independent evidence justifies changing the cache attribute for
>> XBurst II.
>>=20
>> Public references:
>> - Ingenic Community, public SoC datasheets and programming manuals:
>>   https://github.com/Ingenic-community/datasheets/tree/main/X
>>   Includes the X1600 programming manual (X1600_PM_20220117.pdf)
>>   and documentation for other X-series SoCs, including X1000,
>>   X1830 and X2000.
>> - Ingenic, XBurst1 CPU Core Programming Manual:
>>   https://cdn.hackaday.io/files/1855627939084608/XBurst1_Core_PM.pdf
>>   Documents the XBurst1 core architecture and CP0 configuration.
>> - Ingenic, XBurst Instruction Set Architecture Programming Manual:
>>   =
https://www.setphaserstostun.org/ci20/X1000_M200_XBurst_ISA_MXU_PM.pdf
>>   Documents the original XBurst SIMD instruction set.
>> - Ingenic, XBurst2 CPU Core Programming Manual:
>>   =
https://www.manualslib.com/manual/2646351/Ingenic-Xburst-2-Cpu-Core.html
>>   Documents the XBurst2 core architecture.
>> - Ingenic, MIPS-LINUX toolchain R6.0.0 release notes:
>>   https://www.ingenic.com.cn/news-detail/nid-343.html
>>   Distinguishes MSA, MXA and MXU/MXU2 support in the toolchain.
>> - Ingenic, MIPS-LINUX toolchain R6.2.1 release notes:
>>   https://www.ingenic.com.cn/news-detail/nid-348.html
>>   Documents MXU3 support and identifies X2000 as an MSA target.
>>=20
>> The public references document the available CPU, SoC and ISA
>> information. The PRID implementation handling follows the Ingenic
>> vendor kernel.
>>=20
>> AI assistance: ChatGPT was used to help review the PRID definitions,
>> compare the Ingenic vendor implementation with the upstream code,
>> and draft the commit message with public references. The code =
changes,
>> hardware observations, and final patch were reviewed by the authors.
>>=20
>> Co-developed-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>=20
>> Notes:
>>     Changes in V2:
>>     - removed the PRID_IMP_XBURST2_R2 definition and hints for an =
x2100 as
>>       there is no public reference
>>     - merged into single commit changing the PRID definitions and =
code
>>     - reviewed details and rewrote commit message
>>    =20
>>     Open Issue:
>>     Olivier Louvignes <olivier@mgcrea.io> pointed out that he has
>>     simply reused the definition of the X1830 for the X1600. This
>>     sets c->writecombine differently (_CACHE_CACHABLE_WA) from
>>     _CACHE_UNCACHED_ACCELERATED as we do here.
>>     Both settings appear to work but it needs expert comment which
>>     is the right/better one.
>>=20
>>  arch/mips/include/asm/cpu.h  | 9 +++++----
>>  arch/mips/kernel/cpu-probe.c | 7 +++++++
>>  2 files changed, 12 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/mips/include/asm/cpu.h =
b/arch/mips/include/asm/cpu.h
>> index add26f08e8029..79fd9a0747cf2 100644
>> --- a/arch/mips/include/asm/cpu.h
>> +++ b/arch/mips/include/asm/cpu.h
>> @@ -47,7 +47,7 @@
>>  #define PRID_COMP_CAVIUM 0x0d0000
>>  #define PRID_COMP_LOONGSON 0x140000
>>  #define PRID_COMP_INGENIC_13 0x130000 /* X2000, X2100 */
>> -#define PRID_COMP_INGENIC_D0 0xd00000 /* JZ4730, JZ4740, JZ4750,
>> JZ4755, JZ4760, X1830 */
>> +#define PRID_COMP_INGENIC_D0 0xd00000 /* JZ4730, JZ4740, JZ4750,
>> JZ4755, JZ4760, X1830, X1600 */
>>  #define PRID_COMP_INGENIC_D1 0xd10000 /* JZ4770, JZ4775, X1000 */
>>  #define PRID_COMP_INGENIC_E1 0xe10000 /* JZ4780 */
>> =20
>> @@ -186,9 +186,10 @@
>>   * These are the PRID's for when 23:16 =3D=3D PRID_COMP_INGENIC_*
>>   */
>> =20
>> -#define PRID_IMP_XBURST_REV1 0x0200 /* XBurst=C2=AE1 with =
MXU1.0/MXU1.1 SIMD
>> ISA */
>> -#define PRID_IMP_XBURST_REV2 0x0100 /* XBurst=C2=AE1 with MXU2.0 =
SIMD
>> ISA */
>> -#define PRID_IMP_XBURST2 0x2000 /* XBurst=C2=AE2 with MXU2.1 SIMD
>> ISA */
>> +#define PRID_IMP_XBURST 0x0000 /* XBurst1 */
>> +#define PRID_IMP_XBURST_REV1 0x0200 /* XBurst1 with MXU1.0/MXU1.1 =
SIMD
>> ISA */
>> +#define PRID_IMP_XBURST_REV2 0x0100 /* XBurst1 with MXU2.0 SIMD ISA =
*/
>> +#define PRID_IMP_XBURST2 0x2000 /* XBurst2 with MXU2.1 SIMD ISA */
>> =20
>>  /*
>>   * These are the PRID's for when 23:16 =3D=3D PRID_COMP_NETLOGIC
>> diff --git a/arch/mips/kernel/cpu-probe.c =
b/arch/mips/kernel/cpu-probe.c
>> index 489612ed9d498..69b68d00b66f7 100644
>> --- a/arch/mips/kernel/cpu-probe.c
>> +++ b/arch/mips/kernel/cpu-probe.c
>> @@ -1768,6 +1768,13 @@ static inline void cpu_probe_ingenic(struct
>> cpuinfo_mips *c, unsigned int cpu)
>> =20
>>   switch (c->processor_id & PRID_IMP_MASK) {
>> =20
>> + /* XBurst=C2=AE1 with ISA */
>> + case PRID_IMP_XBURST:
>> + c->cputype =3D CPU_XBURST;
>> + c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
>> + __cpu_name[cpu] =3D "Ingenic XBurst";
>> + break;
>=20
> What SoCs actually use PRID_IMP_XBURST? The JZ4730?

The x1600 has a PRID of 0x00d00000.

It is a little confusing how these numbers have been assigned over time.

+#define PRID_IMP_XBURST 0x0000 /* XBurst1 */
+#define PRID_IMP_XBURST_REV1 0x0200 /* XBurst1 with MXU1.0/MXU1.1 SIMD =
ISA */
+#define PRID_IMP_XBURST_REV2 0x0100 /* XBurst1 with MXU2.0 SIMD ISA */

Obviously the x1600 is newer than X1830 (likely PRID_IMP_XBURST_REV2)
or jz4780 and x1000 being PRID_IMP_XBURST_REV1.

So it may or may not be a PRID_IMP_XBURST_REV3? But we don't know.

>=20
> If it's really used somewhere, you'll also need to add a compatible =
string for
> it in Documentation/devicetree/bindings/mips/cpus.yaml. I guess just
> "ingenic,xburst".

Ok, will check.

BR and thanks,
Nikolaus

