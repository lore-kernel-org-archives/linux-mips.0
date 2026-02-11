Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFF0308F1A;
	Wed, 11 Feb 2026 22:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770847696; cv=none; b=SGXVNp8zT7O+cvg4dRFqM8GoqbLiMLJceRAHuvN9lBwQoJ7cqGsvqg7Ba/8+WmxlXaZJL9dkh5fTn/73C3w3ZBXvCxltjwTcqqEgOf5cpxDvNIsDeC5u7ihnOOfWDKGJFvwCBtMLegPmUSEpEbZfBFASNMs+ivBW0gCm2M7k9KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770847696; c=relaxed/simple;
	bh=90fBW/H4wp0k88p21TdnKnQ12WODzNCLXK2y9QiZ8DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jh3KGc3POS3tA1Pri9FwZVIEGuqHp+QMhgjG0zWZQKJpUuFz4GpAOUPEiHOuhYEIiX1YdIy0xSAfTjZM4sXwlR8VCghQU8Sk/3nIDeokjTCSL/6gkqdRUFNfRv2B/Xn1GVtkkppbfg+BZG2u5qEy7Ig1VprSJS6G89hxs6EW1VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7Cnw6Cb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7Cnw6Cb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B7EC4CEF7;
	Wed, 11 Feb 2026 22:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770847696;
	bh=90fBW/H4wp0k88p21TdnKnQ12WODzNCLXK2y9QiZ8DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7Cnw6CbnsDv2iMpH59C3TScYW+Mw9H3hUHB8L4ykQmqIkyzrMFIH1zS5Vue8h2xv
	 rFZ7d5DLhaXO+k8afMN5sYohj4vOKMbZMzC7GnX+NrPjJdAgMLlctHPwX5tE3TM7br
	 5sJcOiITbQuMM+FXGWhGbNuGZDOTJduZJMTQ/8PyKBVHvPFJAyH3uasy3gDenMc+fq
	 k/feXHrOWwwWun6bTuBPhnbXQ4uGWq27YEZidBF1praQ9GZo57nO6xnfnsjvqjkqQX
	 nomKWx0VP438Sh37MUQeZRvXCdYlOAWHF/mGzAvEMJptDoPk8SyOYqAtVkprytp3kn
	 l/O2u3cESqQng==
Date: Wed, 11 Feb 2026 16:08:15 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Yao Zi <me@ziyao.cc>, Thomas Gleixner <tglx@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: interrupt-controller: add LS7A PCH
 LPC
Message-ID: <177084769455.3975088.12862789175815996383.robh@kernel.org>
References: <20260211094408.3463916-1-zhengxingda@iscas.ac.cn>
 <20260211094408.3463916-3-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211094408.3463916-3-zhengxingda@iscas.ac.cn>


On Wed, 11 Feb 2026 17:44:03 +0800, Icenowy Zheng wrote:
> Loongson 7A series PCH contains an LPC controller with an interrupt
> controller.
> 
> Add the device tree binding for the interrupt controller.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../loongson,pch-lpc.yaml                     | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

