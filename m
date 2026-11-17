Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913760;
	b=0M77zxeyywfZydOzaaz5phwU+Of39CgASk7OL96UAg9QJgNzQp9PqqLfwX8+zcoGpS0w
	 eeWRMZfwd5komJZ3TqwxYjD+yQKgL5q6aZTSDmX3drU6SuLWy5HPiFTaVTVPOoFEa88ME
	 9FTmumJi0YsOFKqnA/c5flT7b8EqEW2M+yqvzoBw3Y14gXj5P8VmdesaXAxvhR8iKeVd6
	 nFTaBKO8v7hcHCcPyO+lJYRiSOlj8ZnAOgr08z4awu5YRXFb/GykoCFJWysxIbyu35oID
	 3d+ClY/I2r9Ergr6/1HEUcvXZyVGj5u1S6kwi6NlFjCGE59lKdc6y+hRebQQs14Bc5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913760;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=GzIg+n+GrebkL3m4Ih6AgxOrmeWJM+7Ee6vjWj2bVJc=;
	b=XKSu9LJCoE2L0uPb/grRo4UO6aZwHtQj+TXiGRWHzoaC5v2JDd5Yfjn6UMVICsz+CVgc
	 kvr8k448r2IRbZPJnY1VkyLElvx/afzaFW7W5I3ITBOgz3xFYqLAQ3JCdA4EyQloWB1IT
	 L2TfuuogB4+9uOQqN2XfAJ18gBY+nsEFXWnf7rodIB9M0KACkJHxQJWLE1EJ06ef2/neV
	 C7ceqKn5P5nfLdKUYn8+6jUDd1wlQNEp8zqkN7FDlvNiK0Y7gwDcTkc/G90RxkXP1zQEm
	 aUB14WZj6QWUZEdM1VOdtO1klPMhsMlby5F5sdLbi9JfWNH6Z3knS80xQ55zZknKsFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=FnugIG8Z;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E27B606A331;
	Tue, 17 Nov 2026 11:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E27B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=FnugIG8Z
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF62D51BCA8;
	Tue, 17 Nov 2026 12:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794913756; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=GzIg+n+GrebkL3m4Ih6AgxOrmeWJM+7Ee6vjWj2bVJc=;
	b=FnugIG8ZXaFyjQBa6vwvEEnJMkQVmLKWSNZqov39LraN4HbwkXbDx62a+qk9GJa2ZO8O3a
	a81bFNRtNnzDQSukV1a2rIGTiGH5MDM4Y8iRFPXiY+JoJ6TyVmLVl0si3d24X/bjyJ1OKk
	aMh5947IKOjJWtDVT1vPx//KESpcVrgPA7lqVZvCl5yTNUThPHcGrnPbXHtOtd7Y+ZLEco
	JzWSCAGc7NrSyjCNDTOa/Y0u/MW/A+2Mpq4ov0qO/v7q+krzERWLdgsglYpxB86qqUjBZW
	BLRnoa3w8UL6vAPcXqOAv22DYYGgLD8oPW3dEJwx8KbAX0eCbkPgBCAt1S/Otw==
Message-ID: <dcf40947-942a-4bf3-823c-5e1613f46d76@cjdns.fr>
Date: Tue, 17 Nov 2026 12:09:11 +0100
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 2/3] irqchip/econet-en751221: Chain the handler to all
 parent interrupts
To: automobilehacks@gmail.com, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261115-en751221-intc-all-lines-v1-0-dc03a40f47f0@gmail.com>
 <20261115-en751221-intc-all-lines-v1-2-dc03a40f47f0@gmail.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20261115-en751221-intc-all-lines-v1-2-dc03a40f47f0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 15/11/2026 20:26, Akshat Singh via B4 Relay wrote:
> From: Akshat Singh <automobilehacks@gmail.com>
>
> The EN751221 interrupt controller does not drive one CPU interrupt line
> per source. It presents the number of the pending interrupt plus one, in
> binary, on the CPU interrupt lines IP2-IP7. In VEIC mode the CPU takes
> that number as the vector, but without VEIC the driver chains its handler
> to the first parent interrupt only, IP2 in the existing device trees. An
> odd-numbered interrupt then never interrupts the CPU by itself: it is
> handled only when an even-numbered one happens to run the handler, which
> on an idle system is the next timer interrupt. That covers the frame
> engine's QDMA (21), xHCI (17) and the first PCIe port (23).
>
> On a Nokia G-140W-C, whose 34Kc does not report VEIC, this delayed
> received packets by up to 10 ms, and ping round-trip times to the device
> cycled through 1-11 ms.
>
> Without VEIC, chain the handler to every parent interrupt listed in the
> device tree. One interrupt usually raises several lines, so the later
> runs of the handler find nothing pending; don't count those as spurious.
>
> VEIC mode is unchanged.
>
> Signed-off-by: Akshat Singh <automobilehacks@gmail.com>


I tested and confirm that hardware indeed behaves as described.


Tested-by: Caleb James DeLisle <cjd@cjdns.fr>


> ---
>   drivers/irqchip/irq-econet-en751221.c | 33 ++++++++++++++++++++++++++++++---
>   1 file changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-econet-en751221.c
> index 2ca5d9018..5930c67c3 100644
> --- a/drivers/irqchip/irq-econet-en751221.c
> +++ b/drivers/irqchip/irq-econet-en751221.c
> @@ -18,6 +18,15 @@
>    * When VPE#1 requests IRQ 30, the driver manipulates the mask bit for IRQ 29,
>    * telling the hardware to mask VPE#1's view of IRQ 30.
>    *
> + * The controller does not give each source its own CPU interrupt line. It
> + * presents the number of the pending interrupt plus one, in binary, on the
> + * CPU interrupt lines IP2-IP7, which a CPU in VEIC mode takes as the vector.
> + * Without VEIC, IRQ 21, for example, shows up as 22 = 0b010110 on IP3, IP4
> + * and IP6, so the controller is chained to every CPU line listed in its
> + * "interrupts" property. Chained to IP2 alone, it would see the odd-numbered
> + * IRQs only when an even-numbered one, such as the timer, happened to run
> + * the handler.
> + *
>    * Copyright (C) 2025 Caleb James DeLisle <cjd@cjdns.fr>
>    */
>   
> @@ -145,9 +154,12 @@ static void econet_intc_from_parent(struct irq_desc *desc)
>   	pending0 = ioread32(econet_intc.membase + REG_PENDING0);
>   	pending1 = ioread32(econet_intc.membase + REG_PENDING1);
>   
> -	if (unlikely(!(pending0 | pending1))) {
> -		spurious_interrupt();
> -	} else {
> +	/*
> +	 * An interrupt usually raises several CPU lines. It is handled when
> +	 * the first of them runs this function, and the others find nothing
> +	 * pending.
> +	 */
> +	if (pending0 | pending1) {
>   		domain = irq_desc_get_handler_data(desc);
>   		econet_intc_handle_pending(domain, pending0, 0);
>   		econet_intc_handle_pending(domain, pending1, 32);
> @@ -461,7 +473,22 @@ static int __init econet_intc_of_init(struct device_node *node, struct device_no
>   		if (ret)
>   			return ret;
>   	} else {
> +		int nr_parents = of_irq_count(node);
> +
>   		irq_set_chained_handler_and_data(irq, econet_intc_from_parent, domain);
> +
> +		for (int i = 1; i < nr_parents; i++) {
> +			int parent = irq_of_parse_and_map(node, i);
> +
> +			if (!parent) {
> +				pr_warn("%pOF: DT: Failed to get IRQ %d from 'interrupts'\n",
> +					node, i);
> +				continue;
> +			}
> +
> +			irq_set_chained_handler_and_data(parent, econet_intc_from_parent,
> +							 domain);
> +		}
>   	}
>   
>   	econet_intc.domain = domain;
>
