Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.220
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792930543;
	b=Lu25OjxWpkwDUVWufvY8g6MpSOjoPQdz0ZhVLZOd8T4FbsxVUJxRPesRs3s4xauX0V9D
	 HOWE+XzOdq8dsHc7eSnGPe4TSP70wbM4MrhCFyp+MMsYs6MRhVLdxXt64KtzwnpRd+0Nl
	 4Ymw+u62NH8wk2H3Us8Dumhh+D4ddVtVIDqtgDWagEKjyYgx0ji/8JvZhcXqte8ES33Fj
	 5GkQBmC8Molk6z+/eEykRdoMz6gMOr9qwuwjkzHf5+C75SLchUIyy2BqGemweQdLfrvMw
	 l8jKesR4tTqQOt6askghPbI7kg8powrkk6/00NmicEBWt/+3Wm9aJLjiVLiFxqZB3Ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792930543;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=DWUOyR9KsBpu9dQNMM+lCZJjUu7cD6i8m+zvFAKRrUM=;
	b=XWK06gcL5PpBeHqmRU4JZhUgBDkQiagmsAFTEJMCIS1rHGh29EUFvtHDej6QjW8CPdFW
	 HROPDNvUQF2JSh6K2OyPHC27ZisyqvfDTR+u4m9deCxCflZtNcCnot4Nxta7lI/3/21Ax
	 mg26LqEqjbbmDj6Y+JMKHPExtvSlL+rrqRYGqU341ZNfbTXBJzByZEu7tlNiF9hXlyAYo
	 dBzDRzeR7zsSWzk6K99xCCh6YEEQ+yBd9wqNyZx2uSMF1/U6uVynss0ZafnFkX/CUHhiN
	 a5fVvOqmj+V5oK6kxWYSVCNJMBMXPMK/W6RPRFCeEEhtod0C9V8KlX8HQAUVqid/0FA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fZSp+9VO;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=CrRJjudP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.220
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E012606A31A
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 12:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E012606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fZSp+9VO;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=CrRJjudP
ARC-Seal: i=1; a=rsa-sha256; t=1792930517; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rFbU3bXNqEv1JqpUXgeL1/WKrBhdQC9eWgiYqqwvoMvKuFo6JNNvaYjm64oiQd9fsb
    Fkd1gbcfR59/v7mVRHT5b9huOEcf89NMDJGbZDP/hf2EwhcQ5BW45KFWMY5LDRhgvpEm
    dIomA9XtLprgDLW/20sYuaCQSF7cTwtTCI+0KDZAlCXjOg/Qu9njAXVxg0AY2IipvL6b
    8HwXXRhwMByiVgDNJfpVrt8810TwzfJLPDQt4ZztU6A/kCHV4p0rhpMEq1PFfnNWGKtv
    GE04AJq4vbSro5glVREWgQ1HR99kp3TjR+2tjJVSngDTwgaJndbCDQI1H+EmXfM1n3gL
    RwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792930517;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=DWUOyR9KsBpu9dQNMM+lCZJjUu7cD6i8m+zvFAKRrUM=;
    b=Usal8t38ysTnuGxXVGr5H0Gjy64/oZkTei/4JWq/umg81UjXaPUjJwHx4f6a74xFWf
    Snmaun9V90jQ4ysVRVsUwmEAVW/sA4IYMrGq2WAAp29k4Ex1DgDlAWSbfvToMumBljEx
    9wyolQmsfbcXb3/yz6/Gvw35TKvumvW7EgzliBhEJ+OZwwkVFnFa76yITYwc1gr6NcCi
    VdXvCPzd6aak3+cat5wHFyrnyPPVFRXFI2Wqo1yew2lSMRmN81aUmsEFLNqdgiHR1oDW
    zK8Jvw/Z1bHg2ds3toYu5AAgBgJfj8xRtlDfJGSbjtdl5ffLdD1MyGtgNhQVjHNBoKN7
    8nTA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792930517;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=DWUOyR9KsBpu9dQNMM+lCZJjUu7cD6i8m+zvFAKRrUM=;
    b=fZSp+9VOzsIG8+9Vsc9gW7H5pAFitJXRXaB5zGuGtrfQrDdW114I+O/9X+ZnezV1Gl
    Dklhjm9CKYj91DTrudk+v7qR1MtwOifnKWiahqDC4Inl3gMoZe0ZN03IhPI0ALLFjrw+
    bgMGGw4kgWHqDuUtKvx3KBa6Yug0+TfUicpm/AJN2OD4fnoAeu8M1LNetwPxoYgsuzz3
    mQ6d8R9WnuRlQpbo+NZZy4RZdZHvB39uNV2Lz0ppIK0+rYn8sSbprKcZoLakeofwICcx
    xbK0THLl5ms6snibvu51Q9Ays5bt6+GsWMJ6fHkvC9aB3JZA/B7LgE9PZzw1mgqF/8at
    o3Hg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792930517;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=DWUOyR9KsBpu9dQNMM+lCZJjUu7cD6i8m+zvFAKRrUM=;
    b=CrRJjudPBirfAnaii1p0eGGTII7KLB+JCb+pBqYMBTN3dNjoF9MFjEuk2YbboUfvSE
    kSzJuLoGOWTIlXR/6XDQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PCFHyd0
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 13:15:17 +0100 (CET)
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
Subject: Re: [PATCH] MIPS: cpu-probe: Recognise the XBurst core of the Ingenic
 X1600
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <00f33012e2f754e4dec0ec17a76d4285@boddie.org.uk>
Date: Sun, 25 Oct 2026 13:14:51 +0100
Cc: linux-mips@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Andreas Kemnade <akemnade@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <12ECACDC-2C60-4D0B-A124-D08380A2AA00@goldelico.com>
References: <20261023204205.48222-1-olivier@mgcrea.io>
 <F93B4D14-97DB-4F8E-988E-3C6803F5C850@goldelico.com>
 <alpine.DEB.2.21.2610250558190.42255@angie.orcam.me.uk>
 <00f33012e2f754e4dec0ec17a76d4285@boddie.org.uk>
To: Paul Boddie <paul@boddie.org.uk>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
X-Mailer: Apple Mail (2.3826.700.81.1.10)



> Am 25.10.2026 um 12:06 schrieb Paul Boddie <paul@boddie.org.uk>:
>=20
> On 2026-10-25 06:00, Maciej W. Rozycki wrote:
>> On Sat, 24 Oct 2026, H. Nikolaus Schaller wrote:
>>> Well, XBURST is an MIPS CPU architecture and not a SoC. So there =
should be no X1600 in
>>> this macro name, especially if this ends up in a non-SoC-specific =
arch/mips/include.
>> Is there a documentation reference available for this value of PrID?
>=20
> =46rom the X1600 Programming Manual:
>=20
> "2.2 PRID of X1600-CPU
> Processor ID register (CP0 Register 15, select 0) in XBurst CPUs is a =
read-only register being
> used to identify implementation detail of each SOC's CPU. Please refer =
to the programming
> manual of XBurst CPU for detail of the register. For X1600, its value =
is 0x00D0000"

This seems to be a typo as it has only 7 digits. I have read from the =
chip:=20

PRID table (as known from Programming Manuals)
jz4780 0x3ee1024f (confirmed 0x3ee1024f on CI20 board)
x1000 0x2ed1024f  (unconfimed)
x1600 0x00d00000  (confirmed 0x00d00000 on LX16 board)
X1830 0x00d00100  (unconfirmed)
X2000 0x00132000  (read out from LX20 board)
X2600 0x001320xx  (confirmed 0x00132000 on LX26 board)


>=20
> As previously noted, see:
>=20
> https://github.com/Ingenic-community/datasheets/tree/main/X
>=20
> Paul

BR,
Nikolaus=
