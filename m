Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098936;
	b=2xuXG4ZA52Y+/Gvk2C373b9r1IQGJqrM0fJDbAxfXDoYQA4WWuFqqw5EsbrDeWAeILps
	 zyk/XAqzVn3YscCvCzGW+3FKlYv8PS8BSX+ntKFErzsoSsWO5ZQ4mPV/cHi6zLH9vtD0z
	 uYkn2ceqr9EerCYgLqk2y7AE5gIb80cNmQ6YlXSiVEc5tIp08EZooWtAwlSI6p67GiR9R
	 ZHPnNqQwFUEdN+DoU7P1fO7IqmhEi0dXRfRAE/Achs9sDkrblg6pwCQ5vgYXoTuZrHxYr
	 sw6j2tlT6QSFYewEnK5wafuU3VOLYqQSPoxJmRv38ag9JH/JDufR3BIPS4vClFrTNzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098936;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NeX946K4TovpHq6cvKf+kSZW7DusOcdomhCYwOiNghs=;
	b=aYDcHbjC9EhI9pxsWuy8Px6iEazSQyPlOQaibEIvye0Qpyn0ynw3eD8MHsGosT2A/LaO
	 T14LSgVP24CVomNo97hXfBniDK7Eft80EDgtmfnKse0vva4QIwIXvZPFeyt8QNqMsaUVr
	 WaKDMMSfYC86o+88qWDasgd82olkPV5cP4TmLML99r+az3StNRYLHHbzZgvKR2AKZFwMc
	 3MzOIWLlyVYd0EVYy10gXyKEAXL10Q8gXNo1eipHg4diic1Ke/HmAEHpKGDNyjpJ40myE
	 F0rRgxi9w+ZkTSHTnEbJqjb8UHAH832bs2WSZreBBvjQ05dEZkmwOpLW+i44KlWS3+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c47MLzqb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D0E606A31A;
	Tue, 27 Oct 2026 11:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c47MLzqb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FD81F01825;
	Tue, 27 Oct 2026 11:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793098936;
	bh=NeX946K4TovpHq6cvKf+kSZW7DusOcdomhCYwOiNghs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c47MLzqbd+R2j+VqREUhJgalqhlDMO/699bEQCQG/CbWtd4YFxVUn3sXtT9w1ulDz
	 FStIWSJmalijxLBskQS99YlYQaayrfpH9cRhX0VN35/18t2HwlrvuzrcGomfoZREBU
	 DGP6dlCm6nMYCoS2IJLGnPjhYPg5YlnnBVd4wIsrFUE2PKGgSCPnxQtrs+DHjQB48x
	 Ngutq9wPSMjI0bDHc+TR4nEO4WdVpA1xOFoeZLQH9ZSRlt9r2t/lu0WF+p9kdj1iiy
	 JNtvnOS/ltAaIWCrokao2QvRYSeZVy83jT6p6U2f7YFJf7Coaw/cUGmNV1Dl6huNfL
	 dTHkOGBluGaHg==
Date: Tue, 27 Oct 2026 12:02:12 +0100
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
Subject: Re: [PATCH v2 4/5] dt-bindings: display: panel: Add the HiBy LG35583
Message-ID: <20261027-silent-tough-tortoise-815dca@quoll>
References: <20261025191640.13592-1-olivier@mgcrea.io>
 <20261025191640.13592-5-olivier@mgcrea.io>
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
In-Reply-To: <20261025191640.13592-5-olivier@mgcrea.io>

On Sun, Oct 25, 2026 at 08:16:39PM +0100, Olivier Louvignes wrote:
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: hiby,lg35583
> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description: Panel power supply
> +
> +  vccio-supply:
> +    description: I/O power supply
> +
> +  reset-gpios: true
> +  backlight: true
> +  port: true

Drop all these three, already provided by panel-common.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

