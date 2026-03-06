Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873D234BA24
	for <linux-mips@vger.kernel.org>; Fri,  6 Mar 2026 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772790818; cv=none; b=s6aRMa5HZZNH90FadoA6WOVtFsYphFSJUuKrNLmmHv+rf+fTaxnFnbye59AH6qfomFl1bA0BlJArE4S/MzvIv/QibG1es2vHTdHXw0CsevkNaFExnTmTIRfCtVV0DN8S3yUM7HKmPAaOMiBaMqwsw8zgjjO/e07m6gcLWegFODY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772790818; c=relaxed/simple;
	bh=MGscHgx6g0Kyjb/Dbg7zd1PKMmnGEYmPerQWSUJ4YSw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=H0t+l50yrYjEP663pP9udPvOnjsySIdggnzImGVp2vuOyIWRd4IOWluT7fOlbSWPXTac/WEUBzZkVmRKFp2xP0gwn9+IqvB3NUXPoH2Xjml9gWhxGOPcAwrgHnhAq2eFnEM5jeVclJTfw+pujoduf6HjATn/E67gL0almQQxt6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I4rHZx4z; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I4rHZx4z"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0FF9B1A2D21;
	Fri,  6 Mar 2026 09:53:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD9DC5FF92;
	Fri,  6 Mar 2026 09:53:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76EE0103686D3;
	Fri,  6 Mar 2026 10:53:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772790814; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5RJBgtzNyxvtnzocOQgo9J2Pq7huKj3drCoezVGyEt0=;
	b=I4rHZx4zGkNwJX3sRziLW8/w48B7XzfTTIdpDtB9Z/DVZ0Qkzw7VFGCNFFfMN5GMhvVQT/
	UAWgtlf9Lh77mCcTwttMWQXMmcbBVGjgYuJ/kwV0N9wIkzW+uGcRC5vl66xy16DxnxnROA
	6vpf5SV7c6/w2V7/RKwuE4J2Gv8FXh2EQK1+fhskQ2rqVyPo72Gh5FcTzY8uMDI0jDyNpD
	HAZyMCQQlpsliKjhdIBgaSWX2xeryvcWRoznyPLj1wnP3wL8Go53J3aZ/lNAESLP/tbgnm
	p0qVN/N1Y63MR1jbTPX9EOrYU2kDo9P0wqK1R9BDDBijEA1Ty3hbyCIuS+kkqA==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 10:53:30 +0100
Message-Id: <DGVLW7BWVMKI.2VNIVUKG4DAUA@bootlin.com>
Subject: Re: [PATCH v7 2/2] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Cc: "Vinod Koul" <vkoul@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, <linux-phy@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
To: "Vladimir Oltean" <olteanv@gmail.com>, =?utf-8?q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260225-macb-phy-v7-0-e5211a61db56@bootlin.com>
 <20260225-macb-phy-v7-0-e5211a61db56@bootlin.com>
 <20260225-macb-phy-v7-2-e5211a61db56@bootlin.com>
 <20260225-macb-phy-v7-2-e5211a61db56@bootlin.com>
 <20260227171446.mqygrv35s5jdae46@skbuf>
In-Reply-To: <20260227171446.mqygrv35s5jdae46@skbuf>
X-Last-TLS-Session-Version: TLSv1.3

Hello Vladimir,

On Fri Feb 27, 2026 at 6:14 PM CET, Vladimir Oltean wrote:
> On Wed, Feb 25, 2026 at 05:54:41PM +0100, Th=C3=A9o Lebrun wrote:
>> +static int eq5_phy_set_mode(struct phy *phy, enum phy_mode mode, int su=
bmode)
>> +{
>> +	struct eq5_phy_inst *inst =3D phy_get_drvdata(phy);
>> +
>> +	if (eq5_phy_validate(phy, mode, submode, NULL))
>> +		return -EOPNOTSUPP;
>
> Propagate the phy_validate() return code, don't generate your own.
> -EINVAL should be preferable to -EOPNOTSUPP, so that callers can
> distinguish between "phy_set_mode() not implemented" and "phy_set_mode()
> failed".

ACK. I had made the decision to explicitely override the return value
but indeed EOPNOTSUPP isn't the cleverest option. Will fix.

> (yeah, phy_set_mode() was made optional a while ago, IMO incorrectly,
> but that's another story)
>
>> +
>> +	if (submode =3D=3D inst->phy_interface)
>> +		return 0;
>
> I think this simple comparison fails to serve its intended purpose
> (avoid PHY reset when not changing modes) for RGMII modes, of which
> there exist 4 variants.

Yes!

> Maybe:
> 	if ((phy_interface_mode_is_rgmii(submode) &&
> 	     phy_interface_mode_is_rgmii(inst->phy_interface)) ||
> 	    submode =3D=3D inst->phy_interface)
> 		return 0;
>
> Does the EyeQ5 platform support internal RGMII delays? If yes, which
> layer enables them? The Generic PHY?

You are on point. We shouldn't care about the RGMII delays inside the
generic PHY driver. What we deal with here is a wrapper to the actual
net PHY behind the scenes. The net PHY is dealing with delays, we can
ignore them in the generic PHY driver.

Will fix, either with your solution or with a custom two state enum that
can do SGMII or RGMII (will represent all RGMII delay variants). I'll
experiment with both and send what looks better.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

