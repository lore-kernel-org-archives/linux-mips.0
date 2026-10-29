Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259366;
	b=tYrblb8JsWZU1+jZxSLqUrJyEjHzZf+7hPWIFJH4XEwk84UHRAVbWQz0mkqBD546ozPY
	 pCvfxP3Zb4UEIOW5F8x+NrLmfckErGjtfIDe4XPW3ccSSQV1LjJi/PwnNxcb5N/2UFROI
	 DMQkF+6rC4gb/kFbQpJJIgSyiP+AFMlam+b/Cx67b9tKM8YS/V+zP8SHlWz//XF2lzJpl
	 U8nrqG3eqe848BSclLe1aAZSQxu3NYyGThV2auLDZdXo0WmspvLZOPy/0UR5CBKYhLpXt
	 gtZ8/S0dXAJrJ9N7sIIdgOOHhLBnHeaNu/auaFNH84B5U3VhUYjQrwzFbTQH+p4tZew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259366;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9dgPrzh36HQtv2U6nKZiCZt5EekKbvtdQUbtKRXTdTM=;
	b=q9hmrtawHYYW97s9EmUl3+Slmz0fNS1WlVUrEn1ybSN0TJ2egu6ZnZKvUeE5kVmOqpPH
	 GminU5KPvbg5baqvrJHYm+ZgqmEiosZK8kuNMvsl2fF9+0RhmxjRHs9uAeu3+wAv/TeVb
	 c+kbI8ECLzG0EAYHKaKYl4MpWVHDjHv3gT9ZQhBGTTpKnEjaTj5UKNThUgjUJ9oBz0N6i
	 2T6IkGzorbCsYv4+90KfTq0WMMX4RdM95SUj0vo10+5YQ+ZvFDyUCXw+5KYDakxovXgUi
	 YraRej/4ppprY9f6W4KM+Vl7hCTdJ4C7RpVVlerPgDbqkILAGhga4LIyUSpb3jaefmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RlniipXP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F66A606A31A;
	Thu, 29 Oct 2026 07:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RlniipXP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF691F01828;
	Thu, 29 Oct 2026 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793259366;
	bh=9dgPrzh36HQtv2U6nKZiCZt5EekKbvtdQUbtKRXTdTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RlniipXPmaOyUi70du+qvaRbwBOIswMw3dOa4xGE/Vt01/p2tKyD45/C9VClVCD4G
	 u5iWY38pC3Rgo+3UKvhRsYZxxiLmbmxFQvNYghBCjWBNRUCyIg3zLCGX/ccA7wnFMY
	 N/H7muFCIAwdYbrEvubfmseVYUQRDEzF8RftBZj8CtseBzMIlX0Ebd0Dd3rpk4EsVl
	 gExY+cRrOiqKcB3yMiFvoT3LrE4UghOHC3B8aD+4YM/KNhk5gny0gDOys9RVrfWeS8
	 OScVqm2GwuCqYiBVzKLBSb4pLhPi+/ZzInFaJxSpg+ANittbziepEsF2ZPZThPprkp
	 gogFu+44UA0mQ==
Date: Thu, 29 Oct 2026 08:36:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] MIPS: dts: eyeq5: add MSI controllers
Message-ID: <20261029-guan-of-radical-reverence-6346b4@quoll>
References: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
 <20261028-eyeq5_msi-v1-3-c464752fb55f@bootlin.com>
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
In-Reply-To: <20261028-eyeq5_msi-v1-3-c464752fb55f@bootlin.com>

On Wed, Oct 28, 2026 at 04:58:50PM +0100, Gregory CLEMENT wrote:
> Add the two EyeQ5 MSI controllers. They use reserved-memory regions as
> their doorbell windows.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
> index cec5ad8752285..be5239d890239 100644
> --- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
> +++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
> @@ -309,6 +309,36 @@ gpio1: gpio@1500000 {
>  			resets = <&olb 0 26>;
>  		};
>  
> +		msi0: msi-controller@5840000 {
> +			compatible = "mobileye,eyeq5-msi";
> +			reg =	<0x0 0x05840000 0x0 0x10>,
> +				<0x0 0x05840040 0x0 0x20>;
> +			label = "port0-msi";
> +			interrupt-parent = <&gic>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			msi-controller;
> +			#msi-cells = <0>;
> +			interrupts =  <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
> +			memory-region =	<&pci0_msi_reserved>;
> +			num-vectors = <4>;
> +		};
> +
> +		msi1: msi-controller@5840010 {
> +			compatible = "mobileye,eyeq5-msi";
> +			reg = <0x0 0x05840010 0x0 0x10>,
> +				<0x0 0x05840060 0x0 0x20>;
> +			label = "port1-msi";
> +			interrupt-parent = <&gic>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			msi-controller;
> +			#msi-cells = <0>;
> +			interrupts =  <GIC_SHARED 48 IRQ_TYPE_LEVEL_HIGH>;
> +			memory-region =	<&pci1_msi_reserved>;
> +			num-vectors = <4>;

Continuing my question from the binding - all of the devices have four
vectors, so why do you need the property?

Best regards,
Krzysztof

