Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930909;
	b=odz23CoN8GsWuF6E+qruD09xu+a2Y+n2dUOPy839nI3qKZqfbhboFMckizfvkcmFe59E
	 E0/VV3ZS4emsXqwCHqSXUOGSI/HmVh094kaqz77YGYp27CvwRCWwRfqjX8UF/mp8p57KZ
	 z/vaD0iMiLgeo/ReyswU1YUmoUh6vhWkZNUaGAVwL2cX1lWuiG60BQlIfa4ub1m7eci8j
	 NiK9sDnW5M3U7uiIJFtQo6qlnkYNTzv2xxMv4vhvCLEvHI7A4s97wXmVqgDznkRbCRFrz
	 0dDhX9RZTlDCfPWYcJ0dxIfjnK37Ufiswns5V/9lJpzoIWA7uX7q9tFLP7puzvXbjZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930909;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:From:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=kmglfWXnGsBwlvJx+eKttRLK0WJ717Xi+gggE6CtDUk=;
	b=F1EVXKaI2eAFGpJtREUb7u2XLKHggRaumt14jMZaLvMdPipISA7DWUdjmdjtgalgG2h+
	 DdUUQj4qgUI2d3aPEHshak5FslGui0ofJR4/FDTCAEiRRQDZItrJDQdX2FGVG7ey1h+hH
	 2NHa730AMCIxZgYSmo+/B5C0n3brx1U3WPUxMDdWuDCRCxa2tkSuqLNKatJwQJoqxToh/
	 2xTOt1kVIK3oVinoF5llZCnwVHdosgxuT8qzftV9GP0N/f07SVyiv0g8HbDaAeeF5/PiD
	 WOJ9pfgpUVT/LtFtgEMcFySm6WqNoicNybpZniTJxgGkMwtswtymnSKepBHYjIy6p7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="f77/EHKC";
	arc=none smtp.remote-ip=95.215.58.26
Received: from mta1.migadu.com (out-26.mta1.migadu.com [95.215.58.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64285606A32C
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 15:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64285606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f77/EHKC
X-Envelope-To: linux-mips@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kmglfWXnGsBwlvJx+eKttRLK0WJ717Xi+gggE6CtDUk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794930905; v=1; x=1795535705;
 b=f77/EHKCSIXhu7qNxJAQ1Ac+HB42f08O3BZHa+d2JNUgS9er+C8sXn9BCGq5aYcOyurJJ7yi
 O4G2MK5+RxwSR8pp6lBSFiU/N9CMAvIvqmF/5BFwlvPgDPES9Co4tX72trubB6fMn44VPdk+f9s
 qOdlccPEqkL7m4l4KixAErFY=
X-Envelope-To: linux-mips@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3e6d1fb6a386ff54;
	Tue, 17 Nov 2026 15:55:05 +0000
X-Mizu-Trace-ID: 3e6d1fb6a386ff54
X-Migadu-Flow: FLOW_OUT
Message-ID: <fd9dd97c-3aa6-4f97-9868-47e762c9ae0f@linux.dev>
Date: Tue, 17 Nov 2026 23:54:56 +0800
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
To: tsbogend@alpha.franken.de
Cc: Thomas Gleixner <tglx@kernel.org>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: drivers/irqchip/irq-idt3243x.c has never been compiled?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thomas,

I noticed that irq-idt3243x.c seems to have never been compiled in mainline
since it was merged in commit 529ea3681811 ("irqchip: Add support for IDT
79rc3243x interrupt controller", 2021-04-22).

Its kconfig symbol (IRQ_IDT3243X) is a bare bool with no prompt and no
default, and nothing in-tree has ever selected it, so the symbol can never
become y and the driver is never built by any configuration.

Is this a dead driver?

Thanks,
Zenghui
