Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794573262;
	b=vkZrLq3H25VDt9biRxrx/Qk9SGkKTtTZxHRNbYaplDcGL4kN/xesHiaE9JJ1GYLBx14J
	 PD51P5AQQr+kzYmlvuFqVSn7PW7zk/Jgq24UYR49FpRJuHspxjeSbehHFjt/9DTFc/qAE
	 GNa3VmfIWiirzaxIswkvFyChOMGZJFKTwJeUcyZcnbvhu9zeZFoNk4MSe2xBOTLbkKKGL
	 UOMZgAJi5UdrunbhU/eRuOJ/9N57F0howpaGOM9QynLoqh9NbScLD311v0mYL8OoTes22
	 JBNZIp7eew+H/3f9jlDsqwGrLuJMsE5j71nKR7z+RtUPXM0GUlcMC7hD7uhtB2gyiOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573262;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=o1oE6vxk9h9z2LQK48DVMJ62sicjZCTdBUSKLRc7HkE=;
	b=iaM8GHQ3GqzYM0HFy+o9wORT/mEaz5IAI9FiRux8gEo+8FngSvvR3OdANYeIHwcQlJKV
	 Dj85Kwo9SgpTV6q42dmOq1zzsHPwc9sx2xuZGW1xgWCoWJKq8wO2Dz6qaAlJmMwLZFTgS
	 gDx91BgOfosWqULBZ671XiDhBRoY5jYcdpdx1Iv38m8KmfbfFy2WNISue7hFZmhIN2/7b
	 +mREa3OYM2264ZjPIAoM3bafNbq0nF3lq/qRcvgZnwhZdUT4srXFlNtSdJ3a/ktSW3Dc1
	 jEnF8SU9b5HmL0fT9ecG+nbXrd7yvh2ZEn+EyH+qMv0qsVkNNPzNArBL6s94lmggWmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QEKZAJhY;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=VaUuWToB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF364606A899;
	Fri, 13 Nov 2026 12:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF364606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QEKZAJhY;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=VaUuWToB
ARC-Seal: i=1; a=rsa-sha256; t=1794573236; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=DuIPRE9O/YnflkbSywKk+eUf71Vq1P05CkDg80482YRtC3ZKhAOY5X3PFYDDWBZgsK
    YEIDLxq01NsEnPFQq5m1JLCxmUPnnKONNi81DGnTpQ7iNKGSVExekEdSFEsdqvNsS2DB
    nSv2Y0lSpNEoqlRz3vJs2t+1K4Z9ja2CnUbiJJh4GEnivLpdiVytlOzyUGxiO8uA9vOR
    gUB3LP6jhVW0wEOw5yFFcDXqjN1e0mtn3UoPgIm26FNCPMlBJh34gio7KOc7AVa6HnJv
    0e8/JZkiqIhg0IHCGUbh+Yh87YxvLAxqlEhZ1MkgmaPaXPMfZYKaTY4gY1eibUS2TezM
    YXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794573236;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=o1oE6vxk9h9z2LQK48DVMJ62sicjZCTdBUSKLRc7HkE=;
    b=SFvetpeqkM00zK/SBNUHMIdcRIONenbc/6fmX1wU85tTzPyndRWgi2605ak5qdG4cb
    BBfgLiURdYUSi34Uxdmnn42uMLRAKiWFZkxjOveTg+d5WRXc7cXzxvvDoXPQNGSGCVBi
    /ZqIm2xugjvpgsKIb0TEcIx8WKF4OAJiXQa0MTioi7eR8mxBMJ6nEmLiAY7VHzTx74ZV
    ZwGAMuPfKKC1zNIfhBoPTOHNtsdlr0Sp9/EHSdPo/e/OjN4lTfJKACQtUAjuL12plqkV
    ploOO1ACR0RRHRGw4R5cmMhv3ydURzsJf5KyHW954qL275rf+fOlPjHrYAwTKG6vYnds
    DUkw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794573236;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=o1oE6vxk9h9z2LQK48DVMJ62sicjZCTdBUSKLRc7HkE=;
    b=QEKZAJhYuF4dH7/mmMPb2abUMLHiHNH0qRyMSGJbWLdu0NO2COHlY4eVzO1sPLhLc3
    O9pZmxqh6s9Zg+9GChT5B8aKAzZr/aS1khtfiTIkE0Cs2Q79JJVLcGRe1UsU0S/5tP9T
    49kHQKYMY0WJQWjSaWM8iFUbPlRpJ5+6XMpDYhk+BXDpJX9Xc3NsgrfZRtxxFPVkE2/Z
    5J9cbJW/ZwKfIPVo3svfq6VGUeoNfaWgclXpio4oFNpNTz3yyf/omDMZeOjedtt2Vc7w
    8J5Ft+blrvUCPsZ0oH549z7y0V4rYI1hlHXKYWXhLR5Lj3FnrV9zSXyKrDqEVshVl+fI
    iB9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794573236;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=o1oE6vxk9h9z2LQK48DVMJ62sicjZCTdBUSKLRc7HkE=;
    b=VaUuWToBrHJ6WDwKfJvDqWVkXoeLXCfkRBC/l6noRageCAkvoEFwty1Kp8OmxGWtv0
    cF0RzxRUrm5NcsthBvBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2ZoHmMiNHYIZPrro6QPZGBqKLoYar6phQmxG"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ADCXsGcj
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 13 Nov 2026 13:33:54 +0100 (CET)
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
In-Reply-To: <8da96916856e73c3ed368eeb8d28891750206a71.camel@crapouillou.net>
Date: Fri, 13 Nov 2026 13:33:23 +0100
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
Message-Id: <7FF80C33-895A-40AD-8149-70A7F5B42E54@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
 <2e21dc4889ec55bf210dfc205bfadb57acb93eda.1794471031.git.hns@goldelico.com>
 <f91a0c53b35ff28bed26622f46d562b5a6150008.camel@crapouillou.net>
 <3892D527-E3F1-49CA-8557-2C62E2C015C4@goldelico.com>
 <8da96916856e73c3ed368eeb8d28891750206a71.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Paul,

> Am 12.11.2026 um 16:49 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Le jeudi 12 novembre 2026 =C3=A0 16:37 +0100, H. Nikolaus Schaller a =
=C3=A9crit :
>> Hi Paul,
>>=20
>>> Am 12.11.2026 um 15:03 schrieb Paul Cercueil <paul@crapouillou.net>:
>>>=20
>>> Hi Nikolaus,
>>>=20
>>> Le jeudi 12 novembre 2026 =C3=A0 09:10 +0100, H. Nikolaus Schaller a =
=C3=A9crit :
>>>> Add PRID implementation constants for Ingenic XBurst and XBurst II
>>>> processors and handle the corresponding implementation IDs in
>>>> cpu_probe_ingenic().
>>>>=20
>>>> The PRID table is updated based on Programming Manuals and hardware =
tests:
>>>> - jz4780: 0x3ee1024f (confirmed on CI20 board)
>>>> - x1000:  0x2ed1024f (unconfirmed)
>>>> - x1600:  0x00d00000 (confirmed on LX16 board)
>>>> - X1830:  0x00d00100 (unconfirmed)
>>>> - X2000:  0x00132000 (read out from LX20 board)
>>>> - X2600:  0x001320xx (confirmed 0x00132000 on LX26 board)
>>>>=20
>>>> Additionally, clean up extra spaces in the comments for
>>>> PRID_IMP_XBURST_REV2 and PRID_IMP_XBURST2.
>>>>=20
>>>> Distinguish XBurst1 implementations with different SIMD ISA =
revisions
>>>> and identify XBurst II processors using PRID_IMP_XBURST2.
>>>> The XBurst II classification follows the Ingenic vendor kernel.
>>>>=20
>>>> Keep the existing writecombine handling unchanged, since no
>>>> independent evidence justifies changing the cache attribute for
>>>> XBurst II.
>>>>=20
>>>> Public references:
>>>> - Ingenic Community, public SoC datasheets and programming manuals:
>>>>   https://github.com/Ingenic-community/datasheets/tree/main/X
>>>>   Includes the X1600 programming manual (X1600_PM_20220117.pdf)
>>>>   and documentation for other X-series SoCs, including X1000,
>>>>   X1830 and X2000.
>>>> - Ingenic, XBurst1 CPU Core Programming Manual:
>>>>   =
https://cdn.hackaday.io/files/1855627939084608/XBurst1_Core_PM.pdf
>>>>   Documents the XBurst1 core architecture and CP0 configuration.
>>>> - Ingenic, XBurst Instruction Set Architecture Programming Manual:
>>>>   =
https://www.setphaserstostun.org/ci20/X1000_M200_XBurst_ISA_MXU_PM.pdf
>>>>   Documents the original XBurst SIMD instruction set.
>>>> - Ingenic, XBurst2 CPU Core Programming Manual:
>>>>   =
https://www.manualslib.com/manual/2646351/Ingenic-Xburst-2-Cpu-Core.html
>>>>   Documents the XBurst2 core architecture.
>>>> - Ingenic, MIPS-LINUX toolchain R6.0.0 release notes:
>>>>   https://www.ingenic.com.cn/news-detail/nid-343.html
>>>>   Distinguishes MSA, MXA and MXU/MXU2 support in the toolchain.
>>>> - Ingenic, MIPS-LINUX toolchain R6.2.1 release notes:
>>>>   https://www.ingenic.com.cn/news-detail/nid-348.html
>>>>   Documents MXU3 support and identifies X2000 as an MSA target.
>>>>=20
>>>> The public references document the available CPU, SoC and ISA
>>>> information. The PRID implementation handling follows the Ingenic
>>>> vendor kernel.
>>>>=20
>>>> AI assistance: ChatGPT was used to help review the PRID =
definitions,
>>>> compare the Ingenic vendor implementation with the upstream code,
>>>> and draft the commit message with public references. The code =
changes,
>>>> hardware observations, and final patch were reviewed by the =
authors.
>>>>=20
>>>> Co-developed-by: Paul Boddie <paul@boddie.org.uk>
>>>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>> ---
>>>>=20
>>>> Notes:
>>>>     Changes in V2:
>>>>     - removed the PRID_IMP_XBURST2_R2 definition and hints for an =
x2100 as
>>>>       there is no public reference
>>>>     - merged into single commit changing the PRID definitions and =
code
>>>>     - reviewed details and rewrote commit message
>>>>    =20
>>>>     Open Issue:
>>>>     Olivier Louvignes <olivier@mgcrea.io> pointed out that he has
>>>>     simply reused the definition of the X1830 for the X1600. This
>>>>     sets c->writecombine differently (_CACHE_CACHABLE_WA) from
>>>>     _CACHE_UNCACHED_ACCELERATED as we do here.
>>>>     Both settings appear to work but it needs expert comment which
>>>>     is the right/better one.
>>>>=20
>>>>  arch/mips/include/asm/cpu.h  | 9 +++++----
>>>>  arch/mips/kernel/cpu-probe.c | 7 +++++++
>>>>  2 files changed, 12 insertions(+), 4 deletions(-)
>>>>=20
>>>> diff --git a/arch/mips/include/asm/cpu.h =
b/arch/mips/include/asm/cpu.h
>>>> index add26f08e8029..79fd9a0747cf2 100644
>>>> --- a/arch/mips/include/asm/cpu.h
>>>> +++ b/arch/mips/include/asm/cpu.h
>>>> @@ -47,7 +47,7 @@
>>>>  #define PRID_COMP_CAVIUM 0x0d0000
>>>>  #define PRID_COMP_LOONGSON 0x140000
>>>>  #define PRID_COMP_INGENIC_13 0x130000 /* X2000, X2100 */
>>>> -#define PRID_COMP_INGENIC_D0 0xd00000 /* JZ4730, JZ4740, JZ4750,
>>>> JZ4755, JZ4760, X1830 */
>>>> +#define PRID_COMP_INGENIC_D0 0xd00000 /* JZ4730, JZ4740, JZ4750,
>>>> JZ4755, JZ4760, X1830, X1600 */
>>>>  #define PRID_COMP_INGENIC_D1 0xd10000 /* JZ4770, JZ4775, X1000 */
>>>>  #define PRID_COMP_INGENIC_E1 0xe10000 /* JZ4780 */
>>>> =20
>>>> @@ -186,9 +186,10 @@
>>>>   * These are the PRID's for when 23:16 =3D=3D PRID_COMP_INGENIC_*
>>>>   */
>>>> =20
>>>> -#define PRID_IMP_XBURST_REV1 0x0200 /* XBurst=C2=AE1 with =
MXU1.0/MXU1.1 SIMD
>>>> ISA */
>>>> -#define PRID_IMP_XBURST_REV2 0x0100 /* XBurst=C2=AE1 with MXU2.0 =
SIMD
>>>> ISA */
>>>> -#define PRID_IMP_XBURST2 0x2000 /* XBurst=C2=AE2 with MXU2.1 SIMD
>>>> ISA */
>>>> +#define PRID_IMP_XBURST 0x0000 /* XBurst1 */
>>>> +#define PRID_IMP_XBURST_REV1 0x0200 /* XBurst1 with MXU1.0/MXU1.1 =
SIMD
>>>> ISA */
>>>> +#define PRID_IMP_XBURST_REV2 0x0100 /* XBurst1 with MXU2.0 SIMD =
ISA */
>>>> +#define PRID_IMP_XBURST2 0x2000 /* XBurst2 with MXU2.1 SIMD ISA */
>>>> =20
>>>>  /*
>>>>   * These are the PRID's for when 23:16 =3D=3D PRID_COMP_NETLOGIC
>>>> diff --git a/arch/mips/kernel/cpu-probe.c =
b/arch/mips/kernel/cpu-probe.c
>>>> index 489612ed9d498..69b68d00b66f7 100644
>>>> --- a/arch/mips/kernel/cpu-probe.c
>>>> +++ b/arch/mips/kernel/cpu-probe.c
>>>> @@ -1768,6 +1768,13 @@ static inline void cpu_probe_ingenic(struct
>>>> cpuinfo_mips *c, unsigned int cpu)
>>>> =20
>>>>   switch (c->processor_id & PRID_IMP_MASK) {
>>>> =20
>>>> + /* XBurst=C2=AE1 with ISA */
>>>> + case PRID_IMP_XBURST:
>>>> + c->cputype =3D CPU_XBURST;
>>>> + c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
>>>> + __cpu_name[cpu] =3D "Ingenic XBurst";
>>>> + break;
>>>=20
>>> What SoCs actually use PRID_IMP_XBURST? The JZ4730?
>>=20
>> The x1600 has a PRID of 0x00d00000.
>>=20
>> It is a little confusing how these numbers have been assigned over =
time.
>>=20
>> +#define PRID_IMP_XBURST 0x0000 /* XBurst1 */
>> +#define PRID_IMP_XBURST_REV1 0x0200 /* XBurst1 with MXU1.0/MXU1.1 =
SIMD ISA */
>> +#define PRID_IMP_XBURST_REV2 0x0100 /* XBurst1 with MXU2.0 SIMD ISA =
*/
>>=20
>> Obviously the x1600 is newer than X1830 (likely PRID_IMP_XBURST_REV2)
>=20
> Obviously? ;)

Well,
if REV1 is encoded as 0x02, and REV2 as 0x01, then 0x00 must be REV3 :)

>=20
> I thought that their SoC versions were ordered, with the only =
exception being
> the JZ4725B being newer than the JZ4740 as a sort-of beta JZ4750.
>=20
>> or jz4780 and x1000 being PRID_IMP_XBURST_REV1.
>>=20
>> So it may or may not be a PRID_IMP_XBURST_REV3? But we don't know.
>=20
> Can you check if the X1600 supports MXU? A IMP value of 0 might mean a =
Xburst
> CPU with no XMU support, maybe?

The Programing Manual of the X1600 only mentions MXU as missing in the =
auxiliary MCU.

X1600: mentions only as missing in the auxiliary MCU
X1000: Enhanced MXU implements XBurst SIMD instruction set release I and =
release II
X1830: The MXU2.0(SIMD128) instruction set has been implemented by =
XBurst=C2=AE engine, and is one part of the CPU
X2000: mentions only as missing in the auxiliary MCU
	but Ingenic SIMD instruction set architecture: 128bit MXA
X2600: same
JZ4780: Media Extension Unit (MXU) Ingenic SIMD instruction set II fully =
pipelined

So MXU is only available in X1000 and X1830. If the data sheet is right.

Is there some runtime check? Hardware capabilities register to look =
into?
The PRID values are known but not their exact meaning.

But if we take these as MXU-Flags we would have:

- jz4780: 0x02 (confirmed on CI20 board)
- x1000:  0x02 (unconfirmed)
- x1600:  0x00 (confirmed on LX16 board)
- X1830:  0x01 (unconfirmed)
- X2000:  0x20 (confirmed and read out from LX20 board)
- X2600:  0x20 (confirmed 0x00132000 on LX26 board)

So the lower 4 bits could indeed encode the MXU revision
and the upper 4 bits the XBurst revision.

x1600:		0x00	none		XBURST
jz4780/x1000:	0x02	MXU2.0		XBURST_REV1	(REV has been =
swapped?)
x1830:		0x01	MXU1.0		XBURST_REV2 	(REV has been =
swapped?)
x2000/2600:	0x20	MXA/XBURST2	XBURST2

IMHO, in that case defining PRID_IMP_XBURST =3D 0x0000 would be correct.
Maybe the _REV is misleading and should be _MXU_REV?

But that is quite some speculation.

Any thoughts?

BR,
Nikolaus


>=20
>>>=20
>>> If it's really used somewhere, you'll also need to add a compatible =
string
>>> for
>>> it in Documentation/devicetree/bindings/mips/cpus.yaml. I guess just
>>> "ingenic,xburst".
>>=20
>> Ok, will check.
>=20
> "ingenic,xburst" if it does not support MXU, I should clarify.
>=20
> Cheers,
> -Paul
>=20

