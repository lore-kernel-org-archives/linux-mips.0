Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098699;
	b=HmOlxhr55jDfRnCuIqmgKIa9ugSl2piJOkPNjNoxwx9hjrRTEMpyyqp+/clxuNH2IrWY
	 hwkMb4A9FakzfgMktwyGzEWYV64LKaaoyvBo2NeJZD9rjeFMdzEtyaJp78AbPwBRM4ZCN
	 scl1fXLmm6onBVvqnsP97B9aur0CQ+mh2ZZ20z5LwfUDARtBgW+RqCFPHKAzH34doLc4k
	 L2mcp98cs95OpC3jceKdvvBKOi8P8yfAre0sFyzMnoQ8dv+QJ6Obxn3FYIYWnbIDtxfiO
	 LpLbGtLNghbm3bzJvOBTu133186nTEsvddUCXdDX7Ha/HX8ywH0DAillReW8ExEh/6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098699;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=t2rRGjis0tX3mVaRPFtnMjzTG3I2WSVMvjKzLMjEe8o=;
	b=Lm5lmhlYMIy2NBADRyF/nIIOMB9YzZFkU9n2nWKtF8UklH64sxGYw9PMAOr4RiwgRmZe
	 FJ0bw8FYnyPdIr0MOuBGB2iRULDQOV1c6WuJrglQgvqG+a2+Tv+oZ3GOwMCcmr7RlHPqM
	 pFKKxmDOW9w6lDUOy6daZSkJEixswXeiVvmoqr1nkQxzF5Q29/7iQ8JJMM8rRS/wyUIMD
	 wYx2h1ZJjfx2YenFEtdIzVhPZD+z/XBhaLrB/GWv/RB+PVdbjbH3C2Ppf39B6HQjLEw9B
	 pxOKZ3AA5vvkkNNOcMYKLTg/dM11KXJZc0xKs9Cckv3PfS3fcVe5KQDKNiEgpCYyklg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fsJE9jML;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1DE606A32A;
	Tue, 27 Oct 2026 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fsJE9jML
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16AD01F01825;
	Tue, 27 Oct 2026 10:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793098698;
	bh=t2rRGjis0tX3mVaRPFtnMjzTG3I2WSVMvjKzLMjEe8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fsJE9jMLq8OFD4KXLiAX+9c4xeC8pJCmA0DcxoyOE0E/vIUAdOGjHE/oC7pYCZj7z
	 GlfD2yaO7j1Fm/xru2hu+VOCINZQk3tqcX16kriIRn2utAQwFvbtkhXw1d4UqLwFp4
	 u6IPkNYa+vuk/FUKW+XrELP21x604V54XY/NNq1OR4h0Oi4/BEjf5sYuUr6RRnepZT
	 X8bU2lucOR3altcjmmBPEAh6ZX4xC2IGJ53ZuEuGtWsvspjhgW8u891VRLhDccuCCR
	 cpiuGVOM3lF90FzL2xc+yWTVtttmND3Fgt/Id4IIPPb6zPN3WEK34My1421KPNxyWb
	 WzVvReZAaqwyA==
Date: Tue, 27 Oct 2026 11:58:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	"H . Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: vendor-prefixes: Add HiBy
Message-ID: <20261027-controversial-astute-leopard-5b353d@quoll>
References: <20261025191640.13592-1-olivier@mgcrea.io>
 <20261025191640.13592-2-olivier@mgcrea.io>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261025191640.13592-2-olivier@mgcrea.io>

On Sun, Oct 25, 2026 at 08:16:36PM +0100, Olivier Louvignes wrote:
> HiBy makes digital audio players, among them the R1.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

