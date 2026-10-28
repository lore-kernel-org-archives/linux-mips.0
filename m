Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793174066;
	b=GcHNTS/0frer4Q8dDOCUnl9fUCC9FnSfh3CrrYseljChuSiHlGDqvqNhXPjyyWBUEYfo
	 5iCiW3rJcakhhP0LDhQhcz9JCNnd6ZDRg15s/yCkzzIv+8yeA68rV+LhYg6pBOIj5qMmW
	 cyoZ41WO7Hz4aHgPTujMDHNCxLGoRTcumegiPXJAIvENZ0meWf/MseCqt1fSy5HfKeDZV
	 nmFwJ0GHVkPxKEFxom5tACafP/qhtPb7CjPVd01GHXX684beue13NkymcGbgS3qM2Twnq
	 XmWpmEoRclFW5ZbwGNmvLCqV2Lk85K27u/fYik8C44jwQZo2temOOxhIbHCvSA53l9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174066;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=KJx6BcmEV1tIJp5/fThVmRGj444L6tF3gP2AUIIXUNE=;
	b=xCUxH7HtGCMammhZUI29SifY2b2MbV/strhHdwbX5tkINlX1TxI2yKVABBSfXpk8RADo
	 oJu9wxjKIJMijCryv2fqMmxOJgg7em2T1lxB3wtNcJySFX/jqs4MJZh+AP3B4goTT8tFv
	 nw573KYTg5HncRSKriQ0REgSF6cRbe8YjvZkViTm2n5ftylJtr/cizfMRmseJikwwdX/N
	 FXH42b092KxdxkIzVtBsvAvC7B7vxAkJzquBDxfAQaPLFSq9QE2GUu8XCdVNVL3yqimbs
	 kmdU1xczcTW+Nl42gdqZv6oVOvaXl15ADeeRZEW2YpO5gaQqPPAqsSJ7KtnJuJA7y9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=YrtaeSUZ;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=HsYoRumw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.54
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80168606A31A;
	Wed, 28 Oct 2026 07:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80168606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=YrtaeSUZ;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=HsYoRumw
ARC-Seal: i=1; a=rsa-sha256; t=1793174043; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=QEROafXO7EkB1NgajBC1qiQZ3+JwfvvJf/Vxhm3dHpaGicq6fBlYOW1xs9xB+3Ahh0
    JidhsathV85RxH+1m7hD+4Qfbh+Dtk4I9EK7l8cg9tu2fU7sIBbiqnznKwokGld0Crcv
    OCrwsEtolAjpW3HiVHbpyaSl4/xA/dqbHb097HD1eVOXXusUl42R3FYVlbnfXkV3mXnC
    MC6Gq7tF875/jc4WRK1i5ct6JQgFthSRhomFw9LDSTNVsbi2DEmDEYY4WbUpUgeR8eep
    0WW+kKV8T0tvJeGl62qn090FPPwXhnAnirerdBz5Emo44uhvaN5JV1wWQ7m1UW2YZzRo
    msSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793174043;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=KJx6BcmEV1tIJp5/fThVmRGj444L6tF3gP2AUIIXUNE=;
    b=dcs7KfpwkPQGX7aZcGP47FsCQUwqTib3nTyNT/qHDfMU3HvbjyTOaI05y4Rb/VENxt
    9ozX6UDvFYWtSxgGHaIC/eNFBmASPlP+1S6ueo4aNiqwkwlg5KKs3o4/9i+XZZ8FWSmH
    +Vqdw8FXGPF40ZnUzqZMCLvDlQQMQgXV9UfWgQD62Tz+3aMsCU08639om9GLxkqAeNG8
    fn9kkZHkz+PA2/P+iolk0QQl8FldnIquNofb/HkK6QHpwnXH1HbeX1SkzNWDJH/71HWA
    ctif2/5kjSXVAYr1L2FEh9LE/v0Re8DtKZJOpRz5OPUcpKxBNBEgg3dTADbfGOh6FlJg
    lR0A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793174043;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=KJx6BcmEV1tIJp5/fThVmRGj444L6tF3gP2AUIIXUNE=;
    b=YrtaeSUZbF7NtCYcwVDCCJlPb0BkCzK9tAR4+y1JhjxrbK98sDgBO3FfVAcsx9t1ee
    pKBUpi2sZe9zkyY9v7Kqtp8aYBAYnVw1FvyrV3MvsOb56N5afYHoVfi8QUbPSNG7S5S0
    o0eK/DkYa4r65jWksjMDbebbjA5i83m2WDZZap4sUXhd6dbpoD9TrBUvFfPlkGsxkS+E
    W0zGpYXKtarpj1Xc4eXKMzkFdo4YklHZOkSicu4/veeJUU/BefTyuKL4zGGj703hKvQ9
    47jH8mkTbVXxc585yckTMjtXVVtjg9DRoVbx9BkCcOVJV5PbLNp97fmZIMtm7dkiXsNy
    ajyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793174043;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=KJx6BcmEV1tIJp5/fThVmRGj444L6tF3gP2AUIIXUNE=;
    b=HsYoRumwIQQiQ4zeOPPpps9EZsuoO0yup73s5LYGEuyMxEgxiqk4TWr0XADlOtYEAe
    CkrH3O6FL7yG75jX1fDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrTj5oHnsiN8oToSJQKZjl88YAGFDRn84+aVUM="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229S7s3B5i
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 28 Oct 2026 08:54:03 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH 0/6] MIPS: Ingenic: Add XBurst / XBurst II infrastructure
 and SoC support
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261027210821.21612-1-olivier@mgcrea.io>
Date: Wed, 28 Oct 2026 08:53:32 +0100
Cc: Paul Cercueil <paul@crapouillou.net>,
 Paul Burton <paulburton@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org,
 kernel@pyra-handheld.com
Content-Transfer-Encoding: 7bit
Message-Id: <8F150A92-1C7F-4F5E-A02D-2730ADA5C917@goldelico.com>
References: <cover.1792956055.git.hns@goldelico.com>
 <20261027210821.21612-1-olivier@mgcrea.io>
To: Olivier Louvignes <olivier@mgcrea.io>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Boddie <paul@boddie.org.uk>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Olivier, Thomas,

> Am 27.10.2026 um 22:08 schrieb Olivier Louvignes <olivier@mgcrea.io>:
> 
> Hi Nikolaus, Thomas,
> 
> Patches 2 and 3 overlap my cpu-probe v2, sent the same day with
> Nikolaus' Co-developed-by:
> https://lore.kernel.org/all/20261025073146.25326-1-olivier@mgcrea.io/
> 
> Both add PRID_IMP_XBURST (0x0000), so only one of them can be applied
> as it is.
> 
> They also handle the X1600 differently. Mine puts PRID_IMP_XBURST on
> the PRID_IMP_XBURST_REV2 path (write-combine through
> _CACHE_CACHABLE_WA, as for the X1830), as the Letux commits
> ee3e4e8baeb6 and b799b9a5e4d3 do. Patch 3 here gives it a case of its
> own with _CACHE_UNCACHED_ACCELERATED.

and in addition presents a different __cpu_name.

I am not sure yet which one is better and more correct regarding the
_CACHE handling. Maybe Paul Boddie can comment?

> 
> Tested on a HiBy R1 (X1600) with the REV2 path: it reports "00d00000
> (Ingenic XBurst)" and boots to userspace.
> 
> Nikolaus, which handling do you want for the X1600? If it is yours, I
> will drop my patch.

I am currently working in the feedback that we have received and
the plan is to submit a V2 soon.

The same is planned for the CGU series where I want to also include
jz4730/x2000/x2600 patches.

Best regards,
Nikolaus

