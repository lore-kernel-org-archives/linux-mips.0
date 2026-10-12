Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE7347B436
	for <linux-mips@vger.kernel.org>; Tue, 13 Oct 2026 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914165; cv=none; b=nTKzB77J0M12emMKdTw8G0+8ySqYEwX3fS/8kKQMN5Ol09CQ+Panb7uEN8doqKoMDXTvuC2xFjQpK0nMMgl8VgFGj3HK1AgNp75WlUPBrLGJME7e7vgCxYcdiXGJ6X41ant1gphMm0vyAFCCu62jk1hH9RDbml8iMTwug9Ft0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914165; c=relaxed/simple;
	bh=IXy9DdQ8dX8X4dJokEbVSO5P1A9Fal8nKRSa4Y5lE9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rEEnlHoOi2XjaTw6Wmu8JosptHuHgQzm/JvLSk2qmDItzWLpqgNgEQJzITiY2ne8VW5Ljk1WR1RVm79TWH1R/0UFRzxflzIl7+5eRgnYFAdC9sz5M0ur83ItuV5u5mX5fSLyq/zHe1d+cnQ6XzDWosC5K6ZCIk2XG9bfiKJTtxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kAayTUDx; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kAayTUDx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AE1571A1219
	for <linux-mips@vger.kernel.org>; Tue, 13 Oct 2026 17:56:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8276660362
	for <linux-mips@vger.kernel.org>; Tue, 13 Oct 2026 17:56:02 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 120A311D718C7; Tue, 13 Oct 2026 19:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914162; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IXy9DdQ8dX8X4dJokEbVSO5P1A9Fal8nKRSa4Y5lE9I=;
	b=kAayTUDxKwL7FBS9TSE2AD7JyE/y8s16wRmSotR7LtfY3SWviDuPqyD/0QIkLvKaALhnyk
	w5MVdTABa2i8kO1ScRIT5kp/XJaw76Hcy4FDsX0e64VEQ//1gW3Ul1BPFg8cDT1kkF9zm1
	h1/SeplyIs054u9CvHF8ag3Sm5JcTNZE4U2CiidpOYXbyrEJOG0oqq9CnR3VB8WvadOmrx
	g9yjSFeVZueUM+EW2s58oV2wFpZOchwhqOIuIRDYoqx5MXb2CCdsPTyf/DPYVxHJ4XFDpR
	MHJj6BwZRomxiD50T/4v28q4RH/rrcbYejHa3tJyPHUZkUaP/ulszFvzTSY5eg==
Authentication-Results: mail.galae.net;
	none
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Aleksandar Rikalo <arikalo@gmail.com>, Paul Burton <paulburton@kernel.org>,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 Chao-ying Fu <cfu@wavecomp.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 0/5] MIPS: GIC clocksource/irqchip improvements and fixes for
 multi-cluster systems
Date: Mon, 12 Oct 2026 16:02:41 +0200
Message-ID: <Phq99rR9S2iy7CfTiYmYpQ@bootlin.com>
X-KMail-Identity: 1879870109
X-KMail-Transport: 829653360
X-KMail-Fcc: 154
X-KMail-Identity-Name: =?UTF-8?B?QmVub8OudA==?= Monin (bootlin.com)
X-KMail-Transport-Name: SMTP (benoit.monin@bootlin.com - galae)
In-Reply-To: <4619ced8-b385-42e6-9c9e-0745a68c62c7@oss.qualcomm.com>
References:
 <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
 <4619ced8-b385-42e6-9c9e-0745a68c62c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 120A311D718C7
X-Spamd-Result: default: False [-0.37 / 30.00];
	BAYES_HAM(-1.27)[83.22%];
	DATE_IN_PAST(1.00)[27];
	MIME_GOOD(-0.10)[text/plain];
	BCC(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[alpha.franken.de,kernel.org,rendec.net,gmail.com,syrmia.com,wavecomp.com,oss.qualcomm.com];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:url,localhost:rdns,localhost:helo];
	TO_DN_SOME(0.00)[]

On Friday, 2 October 2026 at 12:02:29 CEST, Daniel Lezcano wrote:
> On 9/29/26 14:14, Beno=C3=AEt Monin wrote:
>=20
> [ ... ]
>=20
> > Although I am posting this as a single series since the patches
> > are all related to the GIC, the changes to the irqchip driver and
> > to the clocksource driver are independent from each other and can be
> > merged in different trees. I can split the series in two if it helps
> > reviewing/merging.
> >=20
> > Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> > ---
> Applied, patch 4 & 5
>=20
Thanks for the merge, Daniel!

Any takers for the first 3 patches to the GIC irqchip driver?

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
