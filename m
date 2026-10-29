Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259316;
	b=qGsZRZ7JoNKzhrHA4N/Mco06Yf/7uthAwPKy+wxVgWy8QhY+KvXE9ncz9+HO42Ivz7y3
	 PtLXj/jRiZGD0fdqjvH/TbACVfX00/f8OMHHh4DNuKDSDSiqwP0fftD7m/WU4lHHVHTp+
	 br3YCRoef9KegGG8vR7xsaup6Zihlhu38cSgVTgLibts3THOeZ8cVfNR8a8hBnEigETZq
	 Iy8pKYTTyt0mTxLPKL7ImTdUJ5aebFxd85or9Sw51k2HJrd+jBF5pl4LEr2Px5CGEbcyr
	 jtfdew3eqjYTXP3zAmhF2hBU1HHQE4p860tLHqScdHPPQXndPY4Bo/Fr5/2C9afiElg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259316;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+jXDd/GS0z0ToNdtXu970MbuBomRW4+5l+rF/BVbHZY=;
	b=Of0tymduXZYNb/ciwgumHzqgzU3erN+tt3p8gpJHc8OIC8H7RLDGWo2WefhOWcqdFvcr
	 nsFwMOJBV9v1svLAUF+NZuFYaMfhtBDY8z+n7KZqPSkauCkdgdbR44WgpNz49D/hF/3tE
	 6A+h0JZCu3ujIrHvgNNkzH7fkLo5pdQDYy/27/iexuwO6cab/BguwrN4hDgDj9wIrx85c
	 2FLwmOuDnNZ7SpBBwME83mY/+Z9De9wXoG26SaOUP2t4J2Ttz5KWknKVVNh6GjRxsHjj3
	 KyQGoCn9Jzz6hO6b7l2CpY5XxsT+5+JHa7CKzymWBTiL4hp0ld8nNGHOD6vhVEYh2XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZZgYT79W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392A3606A31A;
	Thu, 29 Oct 2026 07:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZZgYT79W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D636E1F01825;
	Thu, 29 Oct 2026 07:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793259315;
	bh=+jXDd/GS0z0ToNdtXu970MbuBomRW4+5l+rF/BVbHZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZZgYT79WN4lYYJgg+hfo99SifcxE2htdu4A45hB8F1UrA1ql4UKWhxDYBKQBqCL67
	 rlXXzsQ8qcxTslcUsk1kDc9/LkBtu4oj7d+FAft75yqCpNODRsUkSWGn7RZHyRv2Ez
	 8IN9T7/+QqwXusTQkt3yXojKHpBWBDuL4d8MDosMb6pJUgO8LTmikvSHO+77wlaVPJ
	 /dSF75nDxL0/QZ43C3fsdAfu1eKTb0Pv3U1UwufDzzFAhsW/tUN7lazI+o8UeEAApn
	 VIArWwTG7O0dgnQHCrE+A2vMO0/5mcuDHL9mBYTWn5g/LJJqwWsg/iTJyG4mcgll/N
	 LD8095Mmaa1Ng==
Date: Thu, 29 Oct 2026 08:35:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: add Mobileye
 EyeQ5 PCIe MSI controller
Message-ID: <20261029-positive-unbreakable-zebu-d4484c@quoll>
References: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
 <20261028-eyeq5_msi-v1-1-c464752fb55f@bootlin.com>
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
In-Reply-To: <20261028-eyeq5_msi-v1-1-c464752fb55f@bootlin.com>

On Wed, Oct 28, 2026 at 04:58:48PM +0100, Gregory CLEMENT wrote:
> Add binding for the Mobileye EyeQ5 PCIe MSI controller.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../interrupt-controller/mobileye,eyeq5-msi.yaml   | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)
> 

There are some build/check failures here, so limited review.

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
> new file mode 100644
> index 0000000000000..919af55fc8a60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/mobileye,eyeq5-msi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mobileye EyeQ5 PCIe MSI controller
> +
> +maintainers:
> +  - Gregory CLEMENT <gregory.clement@bootlin.com>
> +
> +description: |
> +  The Mobileye EyeQ5 PCIe MSI controller snoops the MSI write TLPs of a
> +  PCIe port. The controller signals the parent interrupt controller when a
> +  vector is pending. The memory-region property gives the base address of
> +  the doorbell window. A port supports a maximum of 4 MSI vectors.
> +
> +  This node is both an MSI parent for the PCIe port and a chained interrupt
> +  controller.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: mobileye,eyeq5-msi
> +
> +  reg:
> +    items:
> +      - description: GCSR block of the PCIe port
> +      - description: MSI vector control block
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  msi-controller: true
> +
> +  '#msi-cells':
> +    const: 0
> +
> +  label:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Name of the MSI domain. If omitted, the node name is used.
> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Reserved-memory region. The hardware uses its base address as the MSI
> +      doorbell window.
> +
> +  num-vectors:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of MSI vectors that the port supports.
> +    minimum: 1
> +    maximum: 4

So your SoC has multiple blocks with different number of vectors?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - msi-controller
> +  - '#msi-cells'
> +  - memory-region
> +  - num-vectors
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +

From here...

> +    / {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        gic: interrupt-controller {
> +            compatible = "mti,cpu-interrupt-controller";
> +            interrupt-controller;
> +            #interrupt-cells = <3>;
> +        };
> +
> +        reserved-memory {
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +
> +            pci0_msi_reserved: pci0-msi@806000000 {
> +                reg = <0x8 0x06000000 0x0 0x100000>;
> +            };
> +        };
> +

.. to here drop everything. This causes warnings.

> +        soc {
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +
> +            msi0: msi-controller@5840000 {

Drop unused DT label.

> +                compatible = "mobileye,eyeq5-msi";
> +                reg = <0x0 0x05840000 0x0 0x10>,
> +                      <0x0 0x05840040 0x0 0x20>;
> +                label = "port0-msi";
> +                interrupt-parent = <&gic>;
> +                interrupts = <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-controller;
> +                #interrupt-cells = <1>;
> +                msi-controller;
> +                #msi-cells = <0>;
> +                memory-region = <&pci0_msi_reserved>;
> +                num-vectors = <4>;
> +            };
> +        };
> +    };
> 
> -- 
> 2.53.0
> 
