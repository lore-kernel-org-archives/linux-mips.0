Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098814;
	b=QoEpAOl2DS/mxF+BJCf9nDaV855H7o/nQZtALMP1Yk1RjOktEnHmYHdfpXbwFR4HCl39
	 Bv3tdJazSefT9lZ8SX5dtMGpoRrDTsNGRJZBL5/7iAy5Usbg5Zu/upTYjdmdWGyBeS4Gz
	 Y6JxNMQfqORgaCR12aIH34oEttX3j4Vl3MWXWLrd9p7EzU8AN8nqFfnD1ooPjk08Qewl1
	 axkwsKR7X/elOdfwpTam1uWsfuV5p4jW5eNCP3ySxYXqT37DL2VpllD/6PjGbWuAfk27C
	 LtwLdrGCaHK/Z/NMQrgxoqs4NEvW3CBUnuOeHHseofVuS7U6Wxrm+lLSpFaF6dPBQ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098814;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SWXAoeNX30DTt8Lwb9xNTpNWhLrvEfMFFNzLFwCHSRg=;
	b=U2CROxYS62s2tONXvRTW7dTBWZrN469gImFtZHPl7YbrmkHhI3uff+zXdf2AKGjNH7xM
	 XUGDwh9+HCD2OFo9AmHT9vZvEk6YmeiWEcAuyLFF8JxmgpxGCusHI6aThVmwSB8c/4gqj
	 lInDYRScnyaQQjdlS39fEfI8o6H8Ny9OolENPio53c/hIU+Dbv1cs2zM7ukgmQjPNkOkz
	 QJ6kGxhKSqYyvMeq+zJgiHZW5QGXD8ayEqukHhnCJXHHECPc4qV/yqBKXlQUJt+N5C2LS
	 0DmBiFP1KEqk820vwlXJhKfnCQAg9ItWytjHk5EM6VFGyfw4K9abnokcGbJIHHgZv4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G5zwOaWg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B196606A31A;
	Tue, 27 Oct 2026 11:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G5zwOaWg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608D01F01828;
	Tue, 27 Oct 2026 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793098814;
	bh=SWXAoeNX30DTt8Lwb9xNTpNWhLrvEfMFFNzLFwCHSRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G5zwOaWgTw5opPtN1sFkyh3X9BzzzLQYrTGEWmh7NFV3Nu312WAVVI91cg1lii5Bp
	 +uPnmatGkX5FFvlJNhPrXjPc4eTTnptaDr6kHGhun24wMacEnnEym40NT/624rJWlq
	 6Rj4VjiT1ykvhvMq8zJFpFIPQMLhM1mksLa/+kbUWxW/elMaguKtTpJd29WQV09nNT
	 C+Q93fPrGriFNrrqDl/RhtXjZfDw41xRX/ghz044xVs5RugrNwFW8BeBHYBRYeZmnR
	 QB9/gpnmXaOL+OmapM/wsTKHoQ6jTBreTVB2+RRAogk3Mf1GK1vBFJrhWxbG9zyFwE
	 pajhuEss+u3iQ==
Date: Tue, 27 Oct 2026 12:00:10 +0100
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
Subject: Re: [PATCH v2 2/5] dt-bindings: display: Add the Ingenic X1600 LCD
 controller
Message-ID: <20261027-hospitable-apricot-scallop-166448@quoll>
References: <20261025191640.13592-1-olivier@mgcrea.io>
 <20261025191640.13592-3-olivier@mgcrea.io>
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
In-Reply-To: <20261025191640.13592-3-olivier@mgcrea.io>

On Sun, Oct 25, 2026 at 08:16:37PM +0100, Olivier Louvignes wrote:
> The X1600's display controller fetches frames through descriptors and
> keeps its interface and timings in register blocks of their own (X1600
> programming manual, chapter 10), so it shares nothing with the
> controllers ingenic,lcd.yaml describes. Its registers are those of the
> X2000's display controller without the composer.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
>  .../bindings/display/ingenic,x1600-lcd.yaml   | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml b/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
> new file mode 100644
> index 000000000000..171536c78f4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic,x1600-lcd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic X1600 LCD controller
> +
> +maintainers:
> +  - Olivier Louvignes <olivier@mgcrea.io>
> +
> +description:
> +  The display controller of the Ingenic X1600 SoC. It fetches frames through
> +  descriptors in memory and drives a parallel RGB panel or a smart panel;
> +  its registers have nothing in common with the controllers described in
> +  ingenic,lcd.yaml.
> +
> +properties:
> +  $nodename:
> +    pattern: "^lcd-controller@[0-9a-f]+$"

Individual device schemas do not need to enforce naming, you can drop
nodename.

> +
> +  compatible:
> +    const: ingenic,x1600-lcd
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The pixel clock, whose gate also gates the controller
> +
> +  clock-names:
> +    items:
> +      - const: lcd

... and drop clock-names, since it is the same as device name.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: The output, to the panel or bridge.

No port for IPU?

Best regards,
Krzysztof

