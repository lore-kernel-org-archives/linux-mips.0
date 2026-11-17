Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922665;
	b=1xD5Y5Y1Z2At5HOFYD7MyPdjbXhYeBFsGiXPw8pw11a0l2GZ/a9CEzFD+Y9ThQL4S0VX
	 V6QWosMBUNOr+tIDfdp9qY49lVKHaGvFVOh15/MMq7HSnqzF9A71cIxJxRa7bDEmfAyCt
	 OY1Hr7TeGEjombJDaPgIIUz09i8fowWBXlpFDFv8wZF77x4wRA/NLaE25Cuj6oOVqKimF
	 x34BgvbYRY5Pp4uT00nvWkEZqUEZoE9PnY/NB/cMoCHXLcZa2hri+gWLAL/GU08+OeOsN
	 iAenTldGu2+R3Z9M8wJc/mG4I8irfsbeupZRMng2Q3I/caa1FBjgc4XXLZ54zbKFypQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922665;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=rnB0xV40D7sFrEbhmOXs6h8oLu3ZRD0P5eWWboGxYiM=;
	b=k8oATC7QlvTttthcaD/2Kp+DlHJhq322Y2JWMOGlzCuUXF/OsN5UEneTGPYumfQR6vj5
	 skKPeGJqMG/cg8EOg1BBLunBu1iQJKOUaOLILaeHdjJO4XKyNytQDBYsgOCJw0Lnu/lXg
	 ZBBGS25AgeHPfEAAZZGStsNEa3B9Uu62O7lvtv9oc3/EYCw8yIELTptM2vk+ZH5YacPYy
	 mVszNZFvyogJdgCd7fPP5BOLzUg4u6aGBy4ehM+1JLyrCAyMjbYCTt6uNzHpCKrEP1uzK
	 UNe0Vw8kh++RjK7P76ouyvSviRxKmBjmZC3BwAKEqAzipZJhZmv3UUiW5Uu/J5ODLmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RyH6ZLwx;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7829606A323;
	Tue, 17 Nov 2026 13:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7829606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RyH6ZLwx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DC729C79A97;
	Tue, 17 Nov 2026 13:37:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77AAF5FC81;
	Tue, 17 Nov 2026 13:37:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 699A411BC0024;
	Tue, 17 Nov 2026 14:37:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rnB0xV40D7sFrEbhmOXs6h8oLu3ZRD0P5eWWboGxYiM=;
	b=RyH6ZLwxdVYvCSRenJ86aNLOsQnB5ocRCEdI9Q9aUJFAPjnYv8vO4b8b2eW93RjASqIzhu
	g9Sm7ISduvfnA1vaziz5XqZ9X6DPbnR1j1h+VDrQehW/qVRN0tVxJTq0FT+NBRN62OayRO
	SpyzTb8yrS/njFRR+HNVqlfKUiM+JrT/nESQfsCFvvaJ8K/rsOq7E+DLtRDI1J4nh3/kEf
	CcDxMy3W/Hc71rGIBkSEoA+qavUpI/KavKP6j1tXi9IrNbBQGxeEXNmnbjV1Rncv9TMfZJ
	OHn/efXYZYeDfXZuTAJANjvx/zbs8+3NorWi4pEQUiy5XvXwsICTWC1jvA1oPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 Simon Wunderlich <sw@simonwunderlich.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
 Hauke Mehrtens <hauke@hauke-m.de>, Aleksander Jan Bajkowski <olek2@wp.pl>, 
 John Crispin <john@phrozen.org>, Sebastien Decourriere <sebtx452@gmail.com>, 
 Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261114100608.3432120-1-sw@simonwunderlich.de>
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
Subject: Re: [PATCH 0/5] mtd: maps: lantiq-flash: support boot loaders
 using the EBU endianness swap
Message-Id: <179492265833.2237190.2315954934306792460.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:38 +0100
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 14 Nov 2026 11:06:02 +0100, Simon Wunderlich wrote:
> Some Lantiq boards, like the bintec elmeg RS123 and RS353, have a boot
> loader that enables the EBU's own endianness swapping for the NOR flash
> chip select. lantiq-flash then fails to probe the flash. Patch 4 lets
> such boards opt in to honouring that bit with a new
> "lantiq,ebu-swap-check" property. The bit only works on VR9 from
> revision 1.2 and on AR10, so the driver cannot rely on it on every SoC.
> The property follows Hauke's review of an earlier attempt at this fix
> in 2017 [1].
> 
> [...]

Applied to mtd/next, thanks!

[1/5] mtd: maps: lantiq-flash: fix NULL pointer dereference on probe
      commit: fd1cc5b1dc4f2f99917bc5c016a2593a951c2670
[2/5] dt-bindings: mtd: Add lantiq,nor
      (no commit info)
[3/5] mips: lantiq: xway: sysctrl: export ltq_ebu_membase
      (no commit info)
[4/5] mtd: maps: lantiq-flash: honour the EBU's own endianness swap
      (no commit info)
[5/5] mips: lantiq: danube: rename NOR node on EASY50712 reference board
      (no commit info)

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

