Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3E3A5995
	for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2026 17:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260169; cv=none; b=HrMKPXlVXl+TrDxfZDahiaXpQPPXwhbifGiq/SoSdMGx0U3PCRCNX0zFO9n8Q5b3YWUsDSZ4Q0hXRJeUWNgfWqd/4PHO0x0djgkcLZ7tc/TEzAnJZZ5dpVe7PJOcDTk1ho/5SyKDgYvH/K7ELJk+eSYgRzMjuItvDtBd4+mIZXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260169; c=relaxed/simple;
	bh=6fnGMJKXTa8pPYjcZnJU/3fj+4iKUkUy+tYS3B6pXaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5dtXcK3Rc1AXYQzfhXu3dh4mawPBex1dEPSw4dsLg4VHiFwGzdiglyfANBhKv4FWX13mBd7GCa8L4pWCVfhyOVp8t18yUHnpJyrBLwhXWvq2QVvCqgUko8NujnLIim4PlLSontQKPeh+uQY1tusbcV7X2TMJSWXjL6i08mfMuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Npgxs9HM; arc=none smtp.client-ip=209.85.160.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Npgxs9HM"
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-51c21495722so431671cf.3
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2026 10:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260166; x=1785864966;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XYN+MWoB45b0XFF8uhtfviKg9BKAiTaAm42bln7lBx8=;
        b=ne0yteyJjzaAEizlfofGwX/OqWzeBjYqOrMG3dAzKuqriXyQcGVyaxOS2c9x8TlCMK
         Vitgncd3plvL+FVK2f9l+NHt4Jl2maEaVtTuIrW6kU9wSaOkuhFpDNko81ITClbpCzrk
         482Hv85ayBjdP3/wIp/CHSLkIUIbmY8tiVmWwnTnh8LO1HKt5oiM0gTOwcewepgBk77G
         rZ6neSTkNIyXNwG0AWH8hTlZo2XnRzkb9ySPh9affKeYO8fd+Mr/3ueWlWVyJ2WSNjvx
         J8i95wkcOdpw+dgFjCohoA44gQ8bPIyO64Oqlvae1VMA5X72iq7V5vHI/+bL0+Y1GZM3
         Bnuw==
X-Forwarded-Encrypted: i=1; AHgh+RoGFbEcp30dQB05zJRPrQN6yZ0l62G7ZbtTYzyrEJ0+6+ZxZByhN+UnBpkYRphehJb82oaQ5FDiN5a3@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ8KHUXtoSrqqU9FJ5NFNy4KRR0/xwEN1m1mAniUP2HHIYzpzn
	onVQ69K9+8r+cSdLzw3wUqTSNU90DcBqlbDy0/O2uYIgQywaWre7EbLpEsJCnpIQWP3tQPxdYkl
	gfvvhE9i2RejJyQA4Mku86Xaat4wkXPDfGEDlyySbol7eLtSqkGsO0UMJP/og7Qig1UvKQ+8dcu
	t+SeYl4JOE/CQ00mzSYROPTxv+fGDQN2mM0V7cE11MDDSKbExEdAI6Hpv25bYmAihHghROJ+5Ws
	We+T8lVnHoNz+oe8ISnOA==
X-Gm-Gg: AR+sD11xvkB8bDYfsfIHq1hhzn26KTIQd/WP0AMMSBAEMwIz2WbDO1MXXFT03bYDdFG
	oaxVlIcBGdO+rQKsW8Pnhrnikr51izYl4hggJqOnD0dSB0FZnkLWWgkJLHUa5BeW4HtaoPwSf7S
	TFFfOLbwKCvDSLgAZFzHm13+01tj4QZIcfkwc0qc1Jq7EXls1hwhnxboK/FoFYjumZzpWKE8B2A
	EsCYtb99hv1cXRR5VSl6QnpVw2+N8kretPtVYvaDunXOfsyLAndNv6Z98IcsSY2Nf9aDNAOwL1H
	6ZJLuUmo8OumnmPEHImhd8r9LTwHSnsIbO2YzyZCXYg5Ck/3QytMi7joFGe78ph0eb99HsDnhVX
	o65ivpeuBqOGjsz9OzRDRJSL/EOwawpQyyr983oF/k4PACMJLrB2sGVHlunZskovSNBDpYFl8w0
	Qh7HFyzKdtnCgL0sLcr8/RBaUz8HWkTVHUipovMTV0
X-Received: by 2002:a05:622a:2515:b0:51c:8dd6:c3c1 with SMTP id d75a77b69052e-529d719eefamr30999111cf.82.1785260166214;
        Tue, 28 Jul 2026 10:36:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-529e29b3f3asm101331cf.0.2026.07.28.10.36.05
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 10:36:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so125311a91.1
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2026 10:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785260165; x=1785864965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYN+MWoB45b0XFF8uhtfviKg9BKAiTaAm42bln7lBx8=;
        b=Npgxs9HMy62OvuhQbWxvOMzT7DPs+pZhrWpeZshQf5KkwTJYuteZdR/SzbEEOpntKV
         WL9GxRwwcnASN0Q3+4rsch4Brngb1+Vee2fqCGC0Z0P+o7c6p+LHmF31VL8O1u9kc3gg
         XT5HNrjTj32QTdfOMGZiG2Zy3Ywf0vkrOwrkw=
X-Forwarded-Encrypted: i=1; AHgh+RorJPUSlrzUdAuxqiXBJsgu4aFC5FMiMHgx5EpDzCfd2q8Ho85vFVAmKflVJPGVVjYZcQ+4NMk28wJ8@vger.kernel.org
X-Received: by 2002:a17:90b:3b41:b0:389:8f6c:4d70 with SMTP id 98e67ed59e1d1-38f6a4716aemr3632518a91.28.1785260164843;
        Tue, 28 Jul 2026 10:36:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3b41:b0:389:8f6c:4d70 with SMTP id 98e67ed59e1d1-38f6a4716aemr3632479a91.28.1785260164236;
        Tue, 28 Jul 2026 10:36:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d3250asm687356eec.20.2026.07.28.10.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 10:36:03 -0700 (PDT)
Message-ID: <1393e77c-a197-4ce6-b0d3-f96206145ab1@broadcom.com>
Date: Tue, 28 Jul 2026 10:36:02 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] irqchip/bcm7038-l1: clean up init failure paths
To: Haofeng Li <920484857@qq.com>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>,
 Haofeng Li <lihaofeng@kylinos.cn>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Kevin Cernekee
 <cernekee@gmail.com>, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <20260714132453.3302672-1-920484857@qq.com>
 <tencent_4839362F248901E45E50D9AEF6823DFA4007@qq.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <tencent_4839362F248901E45E50D9AEF6823DFA4007@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 7/14/26 06:24, Haofeng Li wrote:
> From: Haofeng Li <lihaofeng@kylinos.cn>
> 
> bcm7038_l1_init_one() stores the allocated CPU object in
> intc->cpus[idx] before mapping its registers and parent interrupt.
> Failures after that allocation leak the CPU object and possibly its
> MMIO mapping.
> 
> A later IRQ domain allocation failure also frees intc while leaving
> parent mappings and chained handlers installed for CPUs initialized
> successfully. Those handlers retain intc as their data and can access
> freed memory.
> 
> Free the current CPU object on local failures. Remember every parent
> IRQ so the common error path can disable wake when it was enabled,
> remove the chained handler, dispose the mapping, unmap the registers,
> and free the CPU object before freeing intc.
> 
> Fixes: 5f7f0317ed28 ("IRQCHIP: Add new driver for BCM7038-style level 1 interrupt controllers")
> 
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> ---
>   drivers/irqchip/irq-bcm7038-l1.c | 24 ++++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
> index 54a8557ef557..b42c4f4df6bf 100644
> --- a/drivers/irqchip/irq-bcm7038-l1.c
> +++ b/drivers/irqchip/irq-bcm7038-l1.c
> @@ -49,6 +49,8 @@ struct bcm7038_l1_chip {
>   
>   struct bcm7038_l1_cpu {
>   	void __iomem		*map_base;
> +	unsigned int		parent_irq;
> +	bool			wake_enabled;
>   	u32			mask_cache[];
>   };
>   
> @@ -247,8 +249,11 @@ static int bcm7038_l1_init_one(struct device_node *dn, unsigned int idx,
>   		return -ENOMEM;
>   
>   	cpu->map_base = ioremap(res.start, sz);
> -	if (!cpu->map_base)
> +	if (!cpu->map_base) {
> +		kfree(cpu);
> +		intc->cpus[idx] = NULL;

This pattern repeats below, consider creating a new label, that would do 
the 'cpu' variable freeing and assigng intc->cpus[idx] to NULL?

>   		return -ENOMEM;
> +	}
>   
>   	for (i = 0; i < n_words; i++) {
>   		l1_writel(~intc->irq_fwd_mask[i],
> @@ -261,12 +266,17 @@ static int bcm7038_l1_init_one(struct device_node *dn, unsigned int idx,
>   	parent_irq = irq_of_parse_and_map(dn, idx);
>   	if (!parent_irq) {
>   		pr_err("failed to map parent interrupt %d\n", parent_irq);
> +		iounmap(cpu->map_base);

And this would belong to a new label as well

> +		kfree(cpu);
> +		intc->cpus[idx] = NULL;

That new label would be used here.

>   		return -EINVAL;
>   	}
>   
> -	if (of_property_read_bool(dn, "brcm,irq-can-wake"))
> -		enable_irq_wake(parent_irq);
> +	if (of_property_read_bool(dn, "brcm,irq-can-wake") &&
> +	    !enable_irq_wake(parent_irq))
> +		cpu->wake_enabled = true;
>   
> +	cpu->parent_irq = parent_irq;
>   	irq_set_chained_handler_and_data(parent_irq, bcm7038_l1_irq_handle,
>   					 intc);
>   
> @@ -408,7 +418,7 @@ static int bcm7038_l1_probe(struct platform_device *pdev, struct device_node *pa
>   			if (idx)
>   				break;
>   			pr_err("failed to remap intc L1 registers\n");
> -			goto out_free;
> +			goto out_unmap;
>   		}
>   	}
>   
> @@ -440,6 +450,12 @@ static int bcm7038_l1_probe(struct platform_device *pdev, struct device_node *pa
>   		struct bcm7038_l1_cpu *cpu = intc->cpus[idx];
>   
>   		if (cpu) {
> +			if (cpu->parent_irq) {
> +				if (cpu->wake_enabled)
> +					disable_irq_wake(cpu->parent_irq);
> +				irq_set_chained_handler_and_data(cpu->parent_irq, NULL, NULL);
> +				irq_dispose_mapping(cpu->parent_irq);
> +			}
>   			if (cpu->map_base)
>   				iounmap(cpu->map_base);
>   			kfree(cpu);

-- 
Florian

