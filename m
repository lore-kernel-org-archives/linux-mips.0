Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229610;
	b=A1T2oxvrt5F92W0BoUjy8v5DrTUWnikp1vlosFO+8+r/GhYTFS8iAVW8gKI7R9Bz7zpO
	 LqygJ0Kw0wRi7t+UYMbFSj6Rg+mAkHKwsS/syQaIsINkRGcRoYlEJRHBsWaj2XllIUQWR
	 OLhHG+3SOAjTZ2UveQ6AwqW6+is+Ii4vkxgb0Wc5xYddvmqESckp+wB7K9YKW1u5Yl5eR
	 xkC+QECgksQZMi61x/yguTQvUj146PyUmu40eJVguEH0Ak13O33J7StS9ymEW8wuMEceT
	 mKg0XaaSuOnNLpDTK26tl7ZIT7l+CeV8ir8cwLVy9E20QxG5kmtAgbbljP1zVNVtkcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229610;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PybyCgFEOeMpgfEWJUHsfZ6hT1qaKHfrzLW0wrSobIo=;
	b=azIwrKfQS94ZtzEyXpiJtpmpdnI4+4J3Md3nbuDIH5RE79bQQ2aOTlPKTXgDL4tJ7TCc
	 pYknIAvw1YZK5hWWj6lZEudntiSSiRp/9582dOltWSUv3GnYTVeLne0l+V1O4CfAx3HD+
	 H++6Iop0a1FMTMX8zKThPH39w0x7b74vMYM4+Z6ZVthWfFCBIeuEammjeu93Neibe1C6R
	 U7WhYyII+rraoPHBuUjcs822iR5I96GGDjEbMp7rcxCinyN59gmR/0AAs8h0JcyYvCleE
	 C35W+pyal9q0YUC61A519ecLERZmwyoeiTn1TLKvdj6m06zYgqEhsJB5aIp1QB+WqhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKHNJIA6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AD6606A31C;
	Mon,  9 Nov 2026 13:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKHNJIA6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F34F1F0089F;
	Mon,  9 Nov 2026 13:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794229609;
	bh=PybyCgFEOeMpgfEWJUHsfZ6hT1qaKHfrzLW0wrSobIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cKHNJIA6y0axtxTpwfhLsliNXEsub8xL1Dvi02wF1h4C2yrVtX0kCzpslRusewXsn
	 21Bc4MqQPdT5arJDyFLOabXkCAO7E97pndV0iL61vLoh6hwsI0UcLqHfvCzeAY0oTi
	 OXDd6XWd99b9GY+ytWON1/bh9BKBr9+Y5Dh+GMEEUAu52ZKeEq3KbSdC3sK4o2mIpP
	 ccTYSdnS37ZS2il3Dxj/qCR4ScYajyo9/bl0jjO24ycLUq8Pad5BZtNnHP3O143crI
	 EjDqJyrUplBrm/FhD7iJDFb+bhpF6lQDTcjga6cNWiR+VyYyqC3EVfi9Ua+z2F2jWk
	 ELdoEpge5EGug==
Date: Mon, 9 Nov 2026 14:06:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Alban Bedel <albeu@free.fr>, Radu Rendec <radu@rendec.net>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: interrupt-controller:
 qca,ar7100-cpu-intc: allow shared write buffer interrupts
Message-ID: <20261109-binturong-of-subtle-discourse-f06daa@quoll>
References: <20261108215738.113582-1-rosenp@gmail.com>
 <20261108215738.113582-2-rosenp@gmail.com>
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
In-Reply-To: <20261108215738.113582-2-rosenp@gmail.com>

On Sun, Nov 08, 2026 at 01:57:36PM -0800, Rosen Penev wrote:
> On AR934x and QCA953x, the WMAC and the PCIe root complex share CPU
> interrupt 2, but write to DDR through different write buffers. Document
> that such an interrupt is listed once for each write buffer, and that
> all of them are flushed.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml   | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

