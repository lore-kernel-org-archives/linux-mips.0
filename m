Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3895D3C0A13;
	Sat, 25 Jul 2026 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784998571; cv=none; b=Wak2YKZMIg51lVy/SfnrpmqFQ/bC2cOX+DI40zeIZT4iikKjVuEkIKNNQcKLEdH2OhqGffwuJgj0rj2pTJRhRX3yqZlRu5csHZSLGAO1c3jTTgVccQmXZuo7/qujhgMOJ3jQirUhE7mQJZNE8pGLMG+wO+mHhtNV4dOsb1zYEoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784998571; c=relaxed/simple;
	bh=dmwBme5roGvmc30dWzUvR1loQyhDmDAsYjX0JgoiAes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qnnKhpic98gDHXAISBvD6pNReaSDRnQhbnk/YrJNNbKNYH3z6yr8Ct33m4QRyEUcRM5tNkicti5AGdsQG9Ug62GRppm778D8C/0P4E4u3iVC+rSi6QotPrq3JFdF88eyi/zm1w5QHo6cUeuhLEU21z2nKtnZs1Uq7ZvRFQ2OF2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jc0tqgJF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc0tqgJF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D5D1F000E9;
	Sat, 25 Jul 2026 16:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784998569;
	bh=2dBr3EsswmTNnYNlD2hpSW0wMC9hIF0+MlfJNpNxXdI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jc0tqgJFNXc28sOq46nR4XCpKuq5axjG7KRJRlHDxQsCHJh6h2b2nTbDGjBIyFek/
	 OLF3UtGTkosViQX2JO5Oyl/4R8s3gUNyfW3RR+e+rFu4mEwHbG/ChnZG0baxO6r5ps
	 WoTbmcBa/alwBFsjFRnY+LsmujsCPNKpWdXGc1jpkBz7NPdkOYDITLB+1IbjQToKoD
	 GhnHSpBwS7GqJ6LRnuDX+kjj3M8qT8RQrXKpQ+seFYhYsUpTHU/i/fWS3P2VWVGEiZ
	 2JzAXJm0t9dj5oHvpTEK5V0CuAysV/9bzxYifqm5BvgT8hMuFyROusHoYoeGZ4AWFX
	 T1fAot/qzD3Dg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>, 
 Miles Krause <mileskrause5200@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260711-jz4780-nemc-dev-err-probe-v1-1-afb6f6a82752@gmail.com>
References: <20260711-jz4780-nemc-dev-err-probe-v1-1-afb6f6a82752@gmail.com>
Subject: Re: [PATCH] memory: jz4780-nemc: Use dev_err_probe() for clock
 error
Message-Id: <178499856796.111792.6143968867119058199.b4-ty@b4>
Date: Sat, 25 Jul 2026 18:56:07 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 11 Jul 2026 22:56:14 -0400, Miles Krause wrote:
> Use dev_err_probe() to simplify clock acquisition error handling and
> avoid logging probe deferral as an error.
> 
> No functional change.

Applied, thanks!

[1/1] memory: jz4780-nemc: Use dev_err_probe() for clock error
      https://git.kernel.org/krzk/linux-mem-ctrl/c/96aa6902ff2bf81b9b8e0fa228494595dc2374a9

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

