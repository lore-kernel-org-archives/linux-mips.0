Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888ED20E025;
	Sun,  1 Feb 2026 16:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769962789; cv=none; b=NpaEMVYrz4SGtpGe+cgI6l1q/dWJt/sv88J5ZvO2DIcPXvMx1JvlHn+snoXqz3thQRIFN7Pp1JJ2VnbDT+mr3WjO6Jy7MYUHYoD3VquQ2l1GVHsMd/P8r5LgdQ5Fc05mlaifZjQcICWjuPEmvYeizcW1q6/tvDOsGpwcWZOaspg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769962789; c=relaxed/simple;
	bh=+/ZYbLgXXiNhzmv0QiFeghXcN5vpfxmjlp+iHQdnir0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pq9ZTfV8LRWWLaMnWM28/+MsZKQYSq+5YdWYY7ja/s8vCmsXRrLplvtjFo0xIrbpvCXo3IftjRwjT5hQ1lVu5uzlcug0FHlPb+LMUa375G8Z0V7pfBqFQjIRHgvr0E5qnQZNF6QyBzSnxB23G9ksVUupteFgzlAoDAnGYIg2NhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EX9I/ppY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EX9I/ppY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57ED3C4CEF7;
	Sun,  1 Feb 2026 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769962789;
	bh=+/ZYbLgXXiNhzmv0QiFeghXcN5vpfxmjlp+iHQdnir0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EX9I/ppYHxw2UBbuVxa+hGZjsJn1i7Qo8CBwIKzUCqIn8MFlzIZMpJ8ZnutTJzf+z
	 CUHfdoysZ4b5HkpP62Uq7LEV5A+JcyqzxYzXQUlcUcOCtEkOLHTxo9xTkWl1kDqu/C
	 HUL2pcRGUKwbges4nllxDoOEAGB1noF81ZS9C8RjDPS3cVCt1lUKw7eU23BHDakynE
	 E6xho9DyC9K+hMBugPCR9csbNCmmnkALfAxSMxXnq+nvSgHdAcEORWj4OQIJ/lANuF
	 /LDuBQ3kMUeZ33lvFptNcONWSZ/pbskfHho9LeHhUfSF2ME81j967nkdZfIi6Avdvz
	 ikS/7v+HDQ9QA==
From: Thomas Gleixner <tglx@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 5/8] irqchip/loongson-pch-lpc: add OF init code
In-Reply-To: <20260131094547.455916-6-zhengxingda@iscas.ac.cn>
References: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
 <20260131094547.455916-6-zhengxingda@iscas.ac.cn>
Date: Sun, 01 Feb 2026 17:19:45 +0100
Message-ID: <87v7ggfnby.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jan 31 2026 at 17:45, Icenowy Zheng wrote:

> As the (kernel-internally) OF-based MIPS Loongson-3 systems can also

What are kernel-internally systems?

> have PCH LPC interrupt controller, add OF-based initialization code for

have a ... controller.

Add OF ....

> +#ifdef CONFIG_OF
> +static int pch_lpc_of_init(struct device_node *node,
> +				struct device_node *parent)

No line break required.

> +{
> +	int parent_irq;
> +	struct fwnode_handle *irq_handle;
> +	struct resource res;

Variable ordering.

> +	if (of_address_to_resource(node, 0, &res))
> +		return -EINVAL;
> +
> +	parent_irq = irq_of_parse_and_map(node, 0);
> +	if (!parent_irq) {
> +		pr_err("Failed to get the parent IRQ for LPC IRQs\n");
> +		return -EINVAL;
> +	}
> +
> +	irq_handle = of_fwnode_handle(node);
> +
> +	return pch_lpc_init(res.start, resource_size(&res), irq_handle,
> +			    parent_irq);

If pch_lpc_init() fails the parent interrupt mapping is leaked, no?

Thanks,

        tglx
