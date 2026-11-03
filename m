Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743950;
	b=jSr+EvbTjgihLk15Qz+iwkluO4+9ozN3xQYfd6i247a7X1hW75A1L8ORuV2/OJEytkyH
	 MC0zltcMtTCTOjHigGGMB6BdXvCkxMmnOCnfFP/vHhTIKgx20LgvUdLRo2XKDWauhhdv6
	 I4EbIcM1IUXqv5EEFrCAJzYH9QTH0re2U2xYnDbQiCt4+5NcTPOhORE1IWGR+UCgjNTS6
	 WYBKP0mUmoo49SgZJ1ZOt2X2PqhK4ueQhYx/xpNyCWNXsdTejBe7m9yMqlWpA3CvlbV/j
	 DtWEcahrPTgbhGmDNA8fw86i98htbCZaLTa/finlbX8T+L3IjbWdKtorNxEUt5MyinQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743950;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:X-Google-Original-From:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=vtZnMJF2vZlZg027D24VbqVYv+QbjJx2DNalcemb7hE=;
	b=HsLht1d992qZTYOGl1siqTvzwHJc3/Dyjl3tpOr3fgpAK6xdfLHHaSM7a3nIhB5u2b5f
	 Zeb2VrN3lRf4+V07rTcXNYbNaLJz4reNaW5iC7oMneAD4LoB2shTXsRXF3he1CY7XSlo2
	 kzgY/zH0lD8Geb2JJSaUFiL58DNYN9D3n9IqMys/whL568ak2AbOn/eaKcNiuy63E6x8L
	 nja7RyAo6OdCXfSG9hmWVxlepjlzj6FW0ol80w+K5k67BlACd4BI58ZdkQQMM84CchoVt
	 sNGpTKbY0LNqZWQ+Y/oYMlzgpJ5UkdhMNaJSHEl/ESa89jcse9JGB9Vjuj8XLG9MMAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K57+C3L2;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65AD606A31B
	for <linux-mips@vger.kernel.org>; Tue,  3 Nov 2026 22:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65AD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K57+C3L2
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so44395a12.3
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 14:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743948; x=1794348748;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:dkim-signature:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtZnMJF2vZlZg027D24VbqVYv+QbjJx2DNalcemb7hE=;
        b=IWgmmrkJIT1S5WiiK44EKyIxd4VTcj63cemfrPpdloxH8b4Vhh5oqAM14+LlBg7V8C
         FwMfqXg8HTSN0soDDRKisHQH40vK7Ft+2O4mp3tjuf/BROwDX2wI5NKlEFSTeP95ZzyK
         tuIjehi/Sc5pzSpizFr+pk/EB49ogj+U5RV7c+GdFPjHIIdA1yg+vFZUfgS9dQxaV1rM
         QWdtTjR8LeJ731qCOEP1Mc3D+Y2cCoEiszL9LQaEuElgSt+kFX+1oQftN0m/Mbgaf8Gb
         gfPNYy/q5STjtHNgx3dl2SeRZ/FHHFscvWWcZNjmaiBBvtSjtSbkCDLSgDQPucvYNiyA
         uuBA==
X-Forwarded-Encrypted: i=1; AKwUvBz/SG3A+sMfAiL0TfOHcDX9x5qkzmFWktUPYpRthPR2AmohSa3MCRvRp3WACr1260Vxv1eRPWIaxHBj@vger.kernel.org
X-Gm-Message-State: APuU4Z923Z14QFHfcoaeKejQF2IXTtkZUaBtNeTGqRBCGggtTs7+FEWg
	VlukqB253SyoWSiXTYKEN6xbtwgZmu56oRtJha/6AMtLwnPEJJWY2acKQNs9R9S6oUZ3CHbm5Xl
	HbBJbBCXkqpbYfl/dV5llzv+joPMnuHDwqwJrn5HG2u1OqDHIICQs0hcPZ47N9olPNovt7VfWel
	gnTNl/1DasiAmtjX+Jkey5Jc0wz56F4pAjL9Phe+W/dbtPeqnRPqHRpbrpxG3+yxlSeWWf7o+9k
	qDahN+8hTyIacykthXSc3Fq
X-Gm-Gg: AYBFou1HMJXp8IUiAsXJkLVfU/NiQ2xtSM4wZDtxcQtOBKfGuGeXI/IrnT2+PgSEB/b
	th75BQyHY6gjXNr6E47zgYEZllBmRX6sqKRZibA6VWx7z6sQTGheEj1gym/YAzV8txSsPYfy2wC
	wD+V83oVzG44SNonsL+UyXMClq/1+wMy0O09Mxxsb+01qSlSejOML3IVyaC0bo/LgKOyzC9Ft6J
	sahfTXQn8vSIuiXH9/VVIyit5j2nkLgd8Mq0L7SBLuLfZiPNoUROBsrCumqf/Vr4xSsHxhoq3RQ
	pXn9EgPIM4GF82M+js30pj/crPwqQMF+tSKTk42G8RxhYqkhJFJQrrrdsMkPIZUHcdxFpzJO6ej
	+a9788VpEePQpBI1S25oTxIwNs4sEw+7BDeoCYqNSgQlF/b2yaPAbmYN9Jo3pIOs8N98flYQMYd
	1TGJpUstqW3/sa66ejJYqElqUc3Q2QfQNV9ceQ9Vta
X-Received: by 2002:a17:90b:5847:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3ae89773f17mr10953613a91.19.1793743948024;
        Tue, 03 Nov 2026 14:12:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b09453d7f1sm408836a91.4.2026.11.03.14.12.27
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:12:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91bebff9fcaso3401246d6.2
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 14:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793743947; x=1794348747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtZnMJF2vZlZg027D24VbqVYv+QbjJx2DNalcemb7hE=;
        b=K57+C3L22hgw4U+Q4/70yUZil/8/Ps+3bw3smGfhKxKi81uoeP0wbtmQBhLIrt+hLT
         f5gvsabfFkyou9OvrQZiaPm1M77d5NhYNP0dbABz7Jokt+Js8kwZkoHLQkTRbVOwb+RU
         MlildZELpoBkjLqUwNURvdgV6NXJYcFSxFq+s=
X-Forwarded-Encrypted: i=1; AKwUvBydaBFDWXtSWZ9+zLLUg/jLxp7GzZ19UIfEPkJextT9QeOgZimahAwpd1Vj/9GAeqra0ki2OFFmhLlf@vger.kernel.org
X-Received: by 2002:a05:622a:412:b0:535:7b01:1ac7 with SMTP id d75a77b69052e-542b3979c2dmr236984571cf.6.1793743946721;
        Tue, 03 Nov 2026 14:12:26 -0800 (PST)
X-Received: by 2002:a05:622a:412:b0:535:7b01:1ac7 with SMTP id d75a77b69052e-542b3979c2dmr236984191cf.6.1793743946136;
        Tue, 03 Nov 2026 14:12:26 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e012f9dsm1985446d6.25.2026.11.03.14.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:12:25 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
X-Google-Original-From: Florian Fainelli <fainelli@broadcom.com>
Message-ID: <3c034e89-7e17-42c5-9471-159962897a7c@broadcom.com>
Date: Tue, 3 Nov 2026 14:12:22 -0800
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] Revert "drivers: convert sbd_duart.map_guard from
 atomic_t to refcount_t"
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Elena Reshetova <elena.reshetova@intel.com>,
 David Windsor <dwindsor@gmail.com>, Kees Cook <kees@kernel.org>,
 Hans Liljestrand <ishkamiel@gmail.com>, linux-mips@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2605241602220.1450@angie.orcam.me.uk>
 <alpine.DEB.2.21.2605241628110.1450@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
Autocrypt: addr=fainelli@broadcom.com; keydata=
 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
In-Reply-To: <alpine.DEB.2.21.2605241628110.1450@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 5/24/26 16:12, Maciej W. Rozycki wrote:
> Revert commit 22a33651a56f ("drivers: convert sbd_duart.map_guard from
> atomic_t to refcount_t"), which broke perfectly valid code:
> 
>    ------------[ cut here ]------------
>    WARNING: CPU: 1 PID: 1 at lib/refcount.c:114 sbd_request_port+0x54/0x140
>    refcount_t: increment on 0; use-after-free.
>    CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.11.0-rc2+ #34
>    Stack : 0000000014001fe0 0000000000000000 ffffffff80830000 0000000000000000
>            ffffffff8127bc7a ffffffff8016fe08 ffffffff808d0000 ffffffff808d0000
>            ffffffff807aa828 ffffffff80822337 ffffffff808ce188 a8000001860b0000
>            0000000000000001 0000000000000001 00000000000001c8 ffffffff808a3090
>            00000000000000bb ffffffff801b09d4 a80000018609bb68 ffffffff801231cc
>            ffffffff812a0000 ffffffff80171388 0000000000001000 ffffffff807aa828
>            0000000000000001 0000000000000001 0000000000000000 0000000000000000
>            0000000000000000 a80000018609bab0 0000000000000000 ffffffff803c47cc
>            0000000000000000 0000000000000000 0000000000000000 0000000000000000
>            ffffffff807cb648 ffffffff8010bff8 0000000014001fe1 ffffffff803c47cc
>            ...
>    Call Trace:
>    [<ffffffff8010bff8>] show_stack+0x28/0x88
>    [<ffffffff803c47cc>] dump_stack+0x8c/0xc0
>    [<ffffffff801aff5c>] __warn+0xe0/0x114
>    [<ffffffff801233f0>] warn_slowpath_fmt+0x40/0x50
>    [<ffffffff80455bcc>] sbd_request_port+0x54/0x140
>    [<ffffffff804563a4>] sbd_config_port+0x2c/0x68
>    ---[ end trace f666d696412caa3e ]---
> 
> (report at the offending commit) -- sbd_request_port() is called twice
> per DUART instance, to reserve a resource holding the control register
> block shared between the two channels, so there's no slightest chance
> for an overflow.  Also this doesn't stop the driver from working and
> it's just the reservation that is missing as a result, i.e.:
> 
> 10060100-100601ff : sb1250-duart
> 10060200-100602ff : sb1250-duart
> 
> as from the offending change, vs:
> 
> 10060100-100601ff : sb1250-duart
> 10060200-100602ff : sb1250-duart
> 10060300-100603ff : sb1250-duart
> 
> beforehand, which is surely why the breakage has gone so long unnoticed.
> 
> "If it ain't broke, don't fix it," so just revert the broken commit.
> 
> Fixes: 22a33651a56f ("drivers: convert sbd_duart.map_guard from atomic_t to refcount_t")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>

Tested-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
