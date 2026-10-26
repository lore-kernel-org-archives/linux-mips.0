Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008888;
	b=fQYCozwvbmHV08/gemXarMDcPWAXSB0khMQqNMqv/UGwt8IKDNkfzeYcUzExWaNO5ls3
	 hw8wr7OPspSL91nHDLgljmsY+z2x/a7iX+iqzKrKcyer/Cc5Z4yOJoiXfkYzemk9IdKEb
	 epDDRTXB20a03O2vlh4I1PivfRt4BzdnbHy6higXE6wxlSTjEAypmrznrnzfO+U3f/rel
	 xfL//FCUq2oNunaP4cI+mZ+cGDOjOJc+yu6TQQKrSJfX7VWgEyNI2ux4hQZqJyUiNJ7Oa
	 bnrvQe+4VRlLlNU8bEHWio/WPegcxUJ1BM9/8cxJsr9+L7xekCuQ/AZybuDDuiiAUQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008888;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yV8U1WQuVwNR9ttlFpr9ElMNXGoBnxlWn9NPj4Y56Zo=;
	b=sfX/tIaFGQGQ633D4VwB6XE0lcwpaa8llgUxZ84HVIwpXw/KQTs+cdOX1pkXeezpTtSR
	 n+zQWNPwwldd7Ihl0U+Wt5YVKbaQLuz7C5T+gAYGlWygiJZp3wsIrOaAkygbUtThH3fkS
	 ED7RbaWxhuXJPekXjaRTivyEb2bReDySATbRNVEe95HNs9lWd593SiIAYCtyC3MdgRdEj
	 vegUMsU6hf6oaaKcoXYj/dHdZgPT693Bc3DpHBj4C/vRbwQQ+9XpjJ+zEFcGl+7RLc/R2
	 ZrFt5zrYeV+5JuaIgmaWHG0wmjcNSddPA75ULulTPXzPhMWOwt7loMiWbhcVZbtgPkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUAisVRI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414CA606A31A;
	Mon, 26 Oct 2026 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUAisVRI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36B51F01825;
	Mon, 26 Oct 2026 10:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793008887;
	bh=yV8U1WQuVwNR9ttlFpr9ElMNXGoBnxlWn9NPj4Y56Zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FUAisVRIjRLrpI8YvO2Gm3MftdgzRzF0i74T4LAuRXhz8ref375A43VwnQp+jr3pM
	 o5AY+4HijNsJy6sV2CM6qbQ0H272r+HHaa84/nM02AqWgOB5Zy+fKLLGuyWsBeZzWD
	 rfvDeszEmCMfku84fWcMErV26vaz9ywPakO+9x2FYLi4U27RNrdYDigEGUvrVJ9Jdg
	 /10FxIIgSpIo8McQ7MoENpIwjZchZPPER025BCKbLOAGdljS811+Pg4V0hPBckuN2r
	 Id4fHaAMrm6W8jnMFUtogWGs1xivjUnsE2BIKLQ3nZwZZTvi72JSfd0BVVa8WMLzoT
	 LoY6/KWlyLYBQ==
Date: Mon, 26 Oct 2026 11:01:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: ingenic,aic: Add the X1600
Message-ID: <20261026-magnetic-turtle-of-reading-c64ebe@quoll>
References: <20261023152011.85407-1-olivier@mgcrea.io>
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
In-Reply-To: <20261023152011.85407-1-olivier@mgcrea.io>

On Fri, Oct 23, 2026 at 05:20:10PM +0200, Olivier Louvignes wrote:
> The X1600's AIC is the X1000's, but its bit clock divider register
> differs (see the next patch). Give it its own compatible, with no
> fallback.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
> Changes in v2: none, resent with 2/2.
> 
>  Documentation/devicetree/bindings/sound/ingenic,aic.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

