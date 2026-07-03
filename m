Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4B837BE7E;
	Fri,  3 Jul 2026 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072213; cv=none; b=lBYUpu7fVj34G7HeeUAFCVH+LQe3UlGvFxjCbt5cWS9JFbuugSbtEgSrjHeKb6NKjHM4lnJjfRoUBmlfkhaQ9mFmO8VD0TVzgXC2etgyXNS7Zf2NI6XtqhemYWrEoxlMzjymUYBsoiiXswMikx7BpS1SvgJVPmGgOF2YrgLLiPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072213; c=relaxed/simple;
	bh=ufRecVSV+JE0qQD7isMLU8mIJw42cegMtl7sZKPT/zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DW9h8Ptt3ziOyz7OIGL6Qq6Pb00JM+x2lzHCo91cTulvGKhsbA7ZR2aJmU8WAxhNIi+DCt841ky/V7Iqm2tElEewGj/t7e1k3cgr9Khk1Wi9CqpqxxOHfSttD6W+bjwK8fbwsd0es77Uydiu8gR8x8S25s8ZJWs6Ou3Hm19eNuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TllbTe6x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TllbTe6x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D57B1F000E9;
	Fri,  3 Jul 2026 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072212;
	bh=6zbs2nl9od7I1T2ffBTn68VoP6XSrys9MBKuxIewGoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TllbTe6xsh/9Ddy7ZRigiW679DaqTkVAzIA/4I7zVp3f667uy7VNqPLGMvOF8HVYH
	 BtJLZWE5IulcJbo1LQCiSQtafvfFtzKfDi8Oqt2B/69baT+5Eq/0ZdlajUOM50OfkT
	 GXuPZU4E9I9739YbSzCIAaKD4rzrct8rGjtkLi0jmNstp4ceCQSmqj2eBC6Zwmweu5
	 jrjougxJLV64hUcCivoGh4eviLXNWB6UiT1At0H+RhZjwMBnHUfs+L/t9Jtlkc8fsR
	 yGm66EqO3gSObIKg5uCT2RnJ2gA7fjMgdS0CGBTUgDXwNi/mm+QPoaU8MyXDlc1QRh
	 JjPgIFmxgnNyA==
Date: Fri, 3 Jul 2026 11:50:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: microchip,pic32mzda-dmt: Convert
 to DT schema
Message-ID: <20260703-inscrutable-boobook-of-strength-e2f2c1@quoll>
References: <20260701171917.263050-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701171917.263050-1-challauday369@gmail.com>

On Wed, Jul 01, 2026 at 10:49:17PM +0530, Udaya Kiran Challa wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/clock/microchip,pic32-clock.h>
> +
> +    watchdog@1f800a00 {
> +        compatible = "microchip,pic32mzda-dmt";
> +        reg = <0x1f800a00 0x80>;
> +        clocks = <&rootclk PB7CLK>;
> +       };

Misaligned indentation, probably not worth sending new version. Maybe
could be fixed up when applying, but not that big deal:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

