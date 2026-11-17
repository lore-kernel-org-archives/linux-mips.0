Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955620;
	b=TP0WLlXdY3rQjCG+lMMkaqj5l6kUr++visk89uimiM1+O/P1ocbvioPt9S6ZqitSLIct
	 nGbV4o7266/Z8e9PU5BvBnV19Yn0/H+63XwtkaaoOn3XJz57jLBYCYtrZpcomSbE+pKoO
	 xoHRijbF+B4WO49h2rm6qYwTeR2Vi7grtt+UaYurvK7vDLCZypiFyZXPKjbsQEWuRYLk6
	 xMX244+Ip59vZ7T/U+yccvP9zRVM1RDOKy0ChwTHo+cXpruafK9oMlF/bl01tr8Owo3fy
	 giwcoMaQHt0HFNoiVsH5GIejSE1tNrHCGvSxE+fYOruUNlnHxNJFboqEbY/1N5sO7Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955620;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TxUFMRMYx3DJ6yj47nz6z8REqInSZBHxjQaoTXnZX/c=;
	b=ldjEMFm7rPc1Z2ijmZ8MRk+kGWuIULt5oM05zrcoWBAdzrpHRIb+N0A0UU/9f2vJT/nr
	 ktqFnOtPU8aFw/c1Z6XSldDDLbyQ9Bs9nwCj8RnVz9Omd7zqND/ATjUCAgJiW5oifovLg
	 pCps1ZxEkkTEeoA+sMqlh330VoQSFfWDNg0X7BHDhqXSj9C8j1PfPBoHtv4Y53TneLMPq
	 ml8O69bE7k0bxMpXW72yy7RzscInTXCVQj6tCGMrrVf6gOoZGM4YCoSfVI5O3156j2D8Z
	 HIC/X401NBACcMrWmtyCNH3Ul67Vjic0SnIox16mGhGyQzrzUwxohaRYYcZ4C2GamgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I59gx9Qj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98928606A881;
	Tue, 17 Nov 2026 22:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I59gx9Qj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7C81F000C5;
	Tue, 17 Nov 2026 22:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794955620;
	bh=TxUFMRMYx3DJ6yj47nz6z8REqInSZBHxjQaoTXnZX/c=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=I59gx9QjhYIJYFa39a/lPSud0wDNSXu+myYH/WcHpvn9sUFqpCjch29DAXsJBrOpm
	 9t5nnZJNyi/9LVF9nwXu8gSu0mzUCPcUYY3HSFePp8/TQhKgI8h7O0EYzFzAfBH+4H
	 l9nyIwBBmSJ/oWvntSGlvWBpfXHMjz4TmGeNmXDGYWfE5k+sAvzd7An7tXv6aZFP+4
	 b/d0Xw6y3yq6CohzJpNJ8cQ7YqaU9Joo1bzp77hi49jzbfkYAl1jaKVALo7qR8wxhj
	 sHM8fkGu2nxtKQWh/RQ7NFVt2+Vg1pDDAM7wIfcQdtUOO9HbxmyuThsIcg6Nh3Rnkv
	 bmXN72OiatgKA==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/2] ASoC: jz4740-i2s: Add support for the X1600
From: Mark Brown <broonie@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "H . Nikolaus Schaller" <hns@goldelico.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org
In-Reply-To: <20261024214438.33342-3-olivier@mgcrea.io>
References: <20261024214438.33342-1-olivier@mgcrea.io>
 <20261024214438.33342-3-olivier@mgcrea.io>
Date: Tue, 17 Nov 2026 22:46:17 +0000
Message-Id: <179495557744.2707353.8222109296948133350.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=640; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7cP4yHLtdpsCFF/6HyshCAsYCHoaRqR/0z0xThzsvmg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+3ExoN7jSGXP4aVd3llf4kbRL0jKS78yuNS6furpG7
 6Loz9iXHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZiIsRvDf3dXDdVzt/L+qkru
 ml9j38/bxv51w9alUov51HIMkiZ2TGL478E+z84xTTN6ldBvziMhSh2VIVanXzh231uW/cd89yU
 uTgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The X1600's AIC is the X1000's, with two differences.

> @@ -389,6 +408,16 @@ static const struct i2s_soc_info x1000_i2s_soc_info = {
>  	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
>  };
>  
> +static const struct i2s_soc_info x1600_i2s_soc_info = {
> +	.dai = &jz4740_i2s_dai,
> +	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
> +	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
> +	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),

In the v2 thread Nikolaus said that there are separate TX and RX
dividers, is that the case?

-- 
Mark Brown <broonie@kernel.org>
