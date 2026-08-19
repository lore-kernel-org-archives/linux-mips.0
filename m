Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5535E3AAF60;
	Wed, 19 Aug 2026 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153561; cv=none; b=L2eC4QuXSyS4W69OQ/FaFkYXWjChSjFXxcQiaLVX2WC6tCtQF6OkCb4K0P+fBuDi3GWguZdoHdzJ8zZa0Ryo4+0S518348rlT1aSPSSc8FKNZYBpRVmuzCesi808v8G2V5aHxZcT9dsxyIiPSP79AiqFzQmc2Kdos4YtjwAjNx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153561; c=relaxed/simple;
	bh=vBS1LtDE6KL85Gl08pUX4noZxB1CakgG8ozNqVprQ3Q=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Z159OodyAcG5j8pt917gMcHKz43rTSND4ml0/Cc9lMuFXZtMj1QeF9OpXPatJQZjEaHl+t2BQtK+dlYQEKISIrP/PZmtZN9IWOQRzOf7j4ickcEn9yLAa5x6eO5TjNd/dQIcSceIFqE7D27Ffk84c/dYct0s/nWKHIiLZcAzhaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ROH52Q4s; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ROH52Q4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787153553; x=1787758353; i=markus.elfring@web.de;
	bh=vBS1LtDE6KL85Gl08pUX4noZxB1CakgG8ozNqVprQ3Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ROH52Q4sWq2fQ1wv/IfuYL5gjXK6FiaIYIrUu2SOo/g6djz0IMGKzBGdFPYhWRyn
	 TZDGHmqPKnoANZI+6lS3crUPa2R7FUrL3R5rnnAfOmpd9r1EyVMwti0MPusvS5+6H
	 roAwS5crjb/bwygQM5xOIjt9G6uNcKiUnbf1AEeVbrC2hgc6uBNXS5XkTRsVGLzKc
	 jjGwDdBSkeq0jXiFcqIgckwKFeDF4axdVxQFk971feMokV1k+aL26c6mC2BPutyyi
	 f5edai6XPtGm+nlxOYiFgBQdt+t7I00kxi+6O/3dBkpPQE/EPqSYs3HmeQ2OKqGGk
	 AiIWbkm9lD0oivvMZA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MAtsZ-1x7SrQ0Lqz-00GDJk; Wed, 19
 Aug 2026 17:32:33 +0200
Message-ID: <f2142acc-9d3a-4848-9a89-0494308bddc3@web.de>
Date: Wed, 19 Aug 2026 17:32:30 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: 1298662399@qq.com, dmaengine@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Frank Li <Frank.Li@kernel.org>
References: <tencent_BE00B17EBF2A95EADD8B80203B745B9C7609@qq.com>
Subject: Re: [PATCH] dma: jz4780: handle clk_prepare_enable() failure in probe
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_BE00B17EBF2A95EADD8B80203B745B9C7609@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i4fjGLXZNPWRqboVViglW5jNwJZdc4KUBzkj6GVZbl5gnbWA5rL
 5Is7r4+IB0cZGeSWslcXjN2zcvwYqkZA5gyek5JwLc2bGM6isebns0SlMPgdnDNaI/x1qLv
 3KZZMGnykQExhoSAM+36i7iKV0UvOMcR7hWMK+PJdkB3SOEleKzdhpt3GhPfoCXrTRaWzTb
 85zbFuTpKn1LRaO3P+ohA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IxhQwIGu7C0=;xmCAzlWsqlw6mEn/Rwkhz2wmfwd
 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
 PHF19zJ+rOWHVhpe6MykluNLyNZl0EDJ

=E2=80=A6
> Check the return value and propagate the error immediately, avoiding the
> erroneous cleanup.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.2#n145
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/stable-kernel-rules.rst?h=3Dv7.2#n34

Regards,
Markus
