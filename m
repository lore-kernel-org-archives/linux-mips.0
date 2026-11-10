Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304724;
	b=g3Dea8xjwoXLOeXaSnbKMb06+jiXGVfrH/e4jHYZTwoIYwCH9zhRCVIik8ZkaJ73u9gC
	 QrXjFukWRVSLjWe7GMJ4u0h0hjpkgIoLggDTzz0f71I8JN5ID82rPs/HwEhTJ9kUUrnZm
	 gkZolP4iZwGbef3i4Prg7lr00x1Zc/3rRoVGQzqn+iXAz3aty46nDtAgXlFfVpTbKlQvT
	 N3Wz2q/hhlhidgEO6iQrOfsv8OamCo2wdxVisIuwHRCdUv3ULrVs579ticswwmpckHcRv
	 fv0uRXiz3LyehjbE4QyrRAXqDc9fo6CwDer1ez/kNf7Ene/8gayG7RQwcUOcjpIZa8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304724;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=W8NrUTXS+LrVl+4LNXtC4XbJICo4rp0FZcarwaw4bxg=;
	b=PEPtBrn3GcX0F/6zHoXLPu4YzvWhAHRE2vV6Rwbgb8OZIuhN4AAfiXKx539ck0Dklxgb
	 MSkN9F3Qqd8Yn/HXz9GY+Qjc5uvXWoCmGg93dLrK4pwqbnrWFD/76fYyzEBCOKny0ysZE
	 IibBCPccs6gNASpdrF++QJi2c9pwoW8iVIz88N1AKQYx51uTxpF4RWqG/3GgiUbGvbNAf
	 zcQoP9CPYAQqyhLqk7xoZNdicSiqxg1wbD1P6H3f2XXxLEqHRSWQPNMCVhm94HaYO/4Z9
	 WUT+4OAeDz9Il+fr8/8VEJ/cUa7zd9km5N4EyS5icYvycoX1r4TZYb+1NXZQSQbX8vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8wYpWD3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEEF60A2628;
	Tue, 10 Nov 2026 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8wYpWD3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0E41F008A1;
	Tue, 10 Nov 2026 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794304724;
	bh=W8NrUTXS+LrVl+4LNXtC4XbJICo4rp0FZcarwaw4bxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D8wYpWD3mKltGhr/pqNpRPsnGHAwSeCy5CN1sj2sgX9wDCzOJCaA9BreQcDOTvZTu
	 DrPaGRMF4jfQfwOg3YGiyXv5sXX4dv3qydwZQiBL9AqYlfgQyd2fj5H2fgmbAuzqua
	 PxXRf/9IwelanbJxeJuHcLnw67PwjLisOy/+oUjRyBiKWeyZsP7yIfdrYY46hrLaXr
	 73qiA5xGedxg5TdwBMPXPTV0yy96FefrAMOQtW9LnM0c4wNnD9xsCC0lJcA5cNAm5x
	 NDGpoW+RhSsWRiNdUCOdH4sYz2CP/8bsmqXDSPXwfJwDmA8Yhvk0ftVKAhK5YZqmyO
	 Ek0nM7aEhKHyg==
Date: Tue, 10 Nov 2026 10:58:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	"H . Nikolaus Schaller" <hns@goldelico.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: display: Add the Ingenic X1600
 display controller
Message-ID: <20261110-annoying-classy-chinchilla-67cde0@quoll>
References: <20261109174640.96951-1-olivier@mgcrea.io>
 <20261109174640.96951-3-olivier@mgcrea.io>
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
In-Reply-To: <20261109174640.96951-3-olivier@mgcrea.io>

On Mon, Nov 09, 2026 at 06:46:37PM +0100, Olivier Louvignes wrote:
> The X1600's display controller fetches frames through descriptors and
> keeps its interface and timings in register blocks of their own (X1600
> programming manual, chapter 10), so it shares nothing with the
> controllers ingenic,lcd.yaml describes. Its registers are those of the
> X2000's display controller without the composer, which the X2000 and
> X2600 manuals call the DPU, as the X1600 manual does in its register and
> clock names: hence ingenic,x1600-dpu, which an X2000 binding can extend.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
>  .../bindings/display/ingenic,x1600-dpu.yaml   | 61 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

