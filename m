Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5162034B40F;
	Fri,  6 Feb 2026 08:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770367179; cv=none; b=JOzuyavDBTcDtzDLQWZWVoY5X8HoluAu5hLdJ5TNfsEnbImRMdYAOhv69N4b1ruEqqBoXJsrGh3actOxL5/lhYcbb9D27ydrchKK177fyefUq//EoFvRdGHY7B/Jn0U7eJU6vEJQPDxPjPPRznBkC9um2dcwYXEWgpdQQ9ltOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770367179; c=relaxed/simple;
	bh=6EG2ZVse5t3N1h+fCLwoJA9mlaHFTyS2C7DbVA4PTBc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZvLlBFTRO1Y62bm5HqBaqum/AlT30jAsO0iI2DbbmVYsYqlR+BrMDif2PKkxnirmj8jRPboQ/GdPPXFKyRcZIwCBrR2dt6hOpK4xuxfyanTN8lxsSHP+LJQFNyw2OMyqE59xHVndUfuDVFhpxXPp5OB5liHqgj5rnbBVepiUeGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lt1/V6TF; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lt1/V6TF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CCD424E42431;
	Fri,  6 Feb 2026 08:39:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F45D60729;
	Fri,  6 Feb 2026 08:39:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78C7E119D1A2E;
	Fri,  6 Feb 2026 09:39:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770367176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8LWtPgYkehUGPg1kNULPv7XLbPo8VdSlKcb1ubBGmLY=;
	b=lt1/V6TFv0RaFaLo1BBv5MPCB1/Pg1vDhdhTeQmBR/CHZzrV4o6SofEN4uk1HeqVFcqLM5
	LyGTyx+O50Zm6mL6DQHX6SKls3zIlWaRAg7GnsutG9HeIl2FTWF/S04Rjnhdr+SeqWkLKQ
	i35XYjVF6SXWkxmWdbZ+pKM01HKDDLVaO8SbIYgO0SDcLCVLpEOLSciHYuRLX7xwuTCKl5
	lSYnqc3suWJuzP41tjL8CQsWSKrpeI9QHvO6hgMkp2hofBo6HgcFGBLWAckeT72Xi1R3xT
	/uIeP11Wub99K4QBPiF6pBU2UgF5F2m87g78P/mI5nI1E9k/Plo5lZ1BcJ410g==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 09:39:31 +0100
Message-Id: <DG7QSB0600QO.1QHM7ULNVL3Q2@bootlin.com>
Subject: Re: [PATCH v6 2/8] phy: sort Kconfig and Makefile
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Neil Armstrong" <neil.armstrong@linaro.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
 <20260127-macb-phy-v6-2-cdd840588188@bootlin.com>
In-Reply-To: <20260127-macb-phy-v6-2-cdd840588188@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Jan 27, 2026 at 6:09 PM CET, Th=C3=A9o Lebrun wrote:
> Neither Kconfig nor Makefile are sorted; reorder them.
>
> $ diff -U100 <(grep ^config drivers/phy/Kconfig) \
>              <(grep ^config drivers/phy/Kconfig | sort)
>
> $ diff -U100 <(grep ^obj-\\$ drivers/phy/Makefile) \
>              <(grep ^obj-\\$ drivers/phy/Makefile | sort)
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
