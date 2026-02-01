Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24E3E54B;
	Sun,  1 Feb 2026 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769962542; cv=none; b=HlI8IQX7Tbl0UhhrVsEDnOgGP0oba+cHwmNHyJrJ0pDytcEJcuMJGAeNzNuu7CNucwiZU2zl0AM/KDY797rMOG5ChGqtD6Q77OBcxsFkX0xZLqQ92yztDniNQ/tocEMgVun1iol6ugEcegrDns1xTEgcbKASip9bKMyTWrO7gLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769962542; c=relaxed/simple;
	bh=cLzGD9sdsvpwyHLRrDRC5yaEXhS8tzFUTpvdiV9QuIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Arh0Dn2NhqD3bTe4JRgF/2k15ebFYlSIJjscTx3pnmbuE1OZ8BQT3mN37/+AU1iRqPQbMp5AJ1YpKd/pMw3arShVxFg3u+ZYH3usNY9vo73iJDJ7LXQKcG68mWS5CDlNV/wudOePQyKLgrVShPUcPbAib0yc5Xvm9mAifwfxxVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwzE1vTe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwzE1vTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93580C4CEF7;
	Sun,  1 Feb 2026 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769962542;
	bh=cLzGD9sdsvpwyHLRrDRC5yaEXhS8tzFUTpvdiV9QuIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZwzE1vTeJPWaDOhZzKxRbSXpKk2zSUB8cEmrqRZ++1j0izS0u2NaBcuonww5nHpGr
	 HkjuJpuuPrDpx4xZsbDbhqsoeCncJFicIEUS7VpkJ+dHrMKp0XKpVrvxxN5prlQASV
	 UTZnllC0twxXngviTJ3dRl7cDCw+ODERbAhqTbOdZD1d+0wyY6E/qMsn1gJoKfQXJr
	 EFOeVzLbnnpPmX126ZNA8/7Cy068NIgfAVlFnNe6JCLnlkLkSOsZ1Kec5zY5Zl8pAG
	 qahd3iBFb+WG1TbwBP/p3kr+iNF00z5LeZtO9U3ewAPXS6tymlvRmD4edX+aM4S7GM
	 NGkzwx2x8tgCA==
From: Thomas Gleixner <tglx@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 3/8] irqchip/loongson-pch-lpc: extract non-ACPI-related
 code from ACPI init
In-Reply-To: <20260131094547.455916-4-zhengxingda@iscas.ac.cn>
References: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
 <20260131094547.455916-4-zhengxingda@iscas.ac.cn>
Date: Sun, 01 Feb 2026 17:15:38 +0100
Message-ID: <871pj4h239.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jan 31 2026 at 17:45, Icenowy Zheng wrote:
> A lot of code could be shared between the current ACPI init flow with

s/could/can/

> the possible OF init flow.
>
> Extract them to a dedicated function.

Extract it ..

> The re-ordering of parent IRQ acquisition requires the arch code to

of the parent interrupt acquisition ... the architecture code ...

> reserve legacy IRQs from dynirq allocation via

... legacy interrupts from the dynamic allocation by overriding

> overriding arch_dynirq_lower_bound(), otherwise the parent of LPC

of the LPC ... allocated at the ...

> irqchip will be allocated to the intended static range of LPC IRQs,

LPC interrupts

> which leads to allocation failure of LPC IRQs.

LPC interrupts

Please use proper sentences and words. This is not an acronym competition.

> +static int __init pch_lpc_init(phys_addr_t addr, unsigned long size,
> +				struct fwnode_handle *irq_handle,
> +				int parent_irq)

Avoid extensive line breaks. You have 100 characters

> +int __init pch_lpc_acpi_init(struct irq_domain *parent,
> +					struct acpi_madt_lpc_pic *acpi_pchlpc)

Either avoid the line break or align the second line argument with the
first argument. 

> +{
> +	int parent_irq;
> +	struct pch_lpc *priv;
> +	struct irq_fwspec fwspec;
> +	struct fwnode_handle *irq_handle;
> +	int ret;

 https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

Thanks,

        tglx
