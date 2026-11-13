Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595425;
	b=Xnxs20PGk359dtJab8nqGeXDDwDqrrjHdfCldsw3VelNQJ2hSkofxrzrAo/jlVtBMfMK
	 lrHbxu1JgeLnZ0Ymrw2knSHxD2/Ni73YuB2wHag5Sg1jXxijwIIyq/979qZcwuR5A8mBT
	 KviPTcq0g5N8HxYTTv7C2LrheOxgiB+L5JZ1E7C3JgzWpGwMoszXbfN79BMwpccCdI3Nv
	 GwC+y4caN2zL/7DtCMZ6T4tKbkYNx8t38JsflrJ4AGjJnWzzPFnjO3fwp4BNSdxZfehCJ
	 ItYDD0JsbZd3r04/GFSzjXzYSsMpxgNg2p7QeL4Fz/LRZkPXTYkJ8uMwXIEQkmWR1mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=B2+DnKoed/3axURwhBA7JYRjlV0Q+DlCdWZGm6h7Zxg=;
	b=kygTPo1JH68EKH7AbLKdF55X69G3HbzjH8tbSktjk7aliqCFhV+oL3HEhjA6I2VF94bx
	 U+ocMg8pZHUV4DcSOT6EDxEn6am0r6yw4M0JsDyU6Zi05cNPm7AyXBJup3oZljTY1u/iy
	 Wc89TMo2zuhYc4AEmShFiO9CGdPnEYSzHbZukzQIc1TCiixRhaS6togyH7sMaVm6EJeA/
	 cb03PsSk8QKIL6YtF9SowYWdZShbdPGzNDiNIsWWG82ZdyCys+yXd60pX6Mc64314M2WP
	 8u9fBeh3jCY1Xra6MXp+t/+lYqgzHs6Tjnk+R6ywPVpjgohUS3gTR2CMdaD0xXYrrXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kh7xgRb1;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DD5606BDE8
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 18:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26DD5606BDE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kh7xgRb1
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so9014725ad.1
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 10:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595424; x=1795200224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2+DnKoed/3axURwhBA7JYRjlV0Q+DlCdWZGm6h7Zxg=;
        b=Kh7xgRb1QUKSAPrSkw9d5aIlc54rk65xgTssxlagqncf3mHLtIOy7FPS6tpXwVWRvO
         gB1XmzJJGAAGel5n9T7NXeEghD7gyFuku9yHizAKTRxYh4sP0nmem6wLMKIEnz/lL5C5
         T4/gTHkLlihdIp79czjJvLAeRhGS0IcU9scyERSXKhW3/U4yjaY2BBkhPy1wfI3+0Vkq
         XazFTO2s0RHn3w7AYA30fStEBSnw9lUt2y4DpoB68zDydqvkZ/ZdB0WJnxTOA4aF/XzB
         kABVT1/rwXQv6HzqOVVIpu/WW5CGmG2YWz/MMh4105NBKhGMHeG/zl3rkPJ7+oyxCMMP
         4bLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595424; x=1795200224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2+DnKoed/3axURwhBA7JYRjlV0Q+DlCdWZGm6h7Zxg=;
        b=Le/mUJl1wtrz+789LwJVjamErgRPnu67KNbGbkVj2ZbMHAzE4gmZGC5F2WcJOf7AX7
         dJK3Z8KSYN+3vOBz+8OdR+mQ2Z78iXYtm1h3INhyWutM0mXr5vdi383RrAk9oCpLYNeI
         dp8RC5ZPWkPoj4gDpQkT6rKpCiaJOO4UPf6NxTfu7tdj1dFVdddH1WfVnjp0ouNcnztg
         yIhEajJcxpkFWGppjXagDKd7Iqc0Se4mfIfUcjAQJG1Z7j6djGaTbtRUQ0AHFfPHtdDy
         HqlPyiMJr1QXMHrdQuusi/ZtGWU9PpkKD3R7iQHcNUjiBT5XGt6UeTGDqvdcx3N6tPlD
         RBTQ==
X-Gm-Message-State: APuU4Z/Li3uUvjcfEzYBItI7jjLM1i/p+Z8dioowvW/ke8yTSwiB9agf
	s+viMn2W+4RYAkvOCTqDBfbDTSBHcQNtSdZzTt7XEWiHOedfU6KMBngcJWgcjg==
X-Gm-Gg: AYBFou17+zbSJ7QPUJ52Pd09AveLnm5mmGIJfcv21cKEcxwybuan/yoaG1GRFKZy/83
	RwACj4054CE/BLqYlYXU7NZHBjVJl/Dm9Vo3xDxWbIZIS5YVceiDa4kBw+kenQB3mCd23zkBzQd
	eNF234Hj+iirMGDE6yVQXTfm1jnLjn7hJYLAg97qGPESWqOLmxTVUr3T0TVEivLAZrv4xn56Bxo
	7M6Xfk6rTwx9W3vGHBHDcbz+ni4w43YfPZ9j1plhmAYlC+6hx7JR1hSVZ4yDq3CgkGLBqsszAtk
	qeyvcOBlJGHRAY2KaWSASkT7yzlnfYb603A7LcN3AG1ZWaw3B+6hfujEhed6agmFLXBICCmCIHL
	MQhUKYalLeeLSprmNSEqN5WaUldB+SFq8H8C19tdf/UFAgA7gc07FontNuKsmEEYQg/8ygZMsrM
	KeIRItYH34JWJp5qfOugB3t+3Rg3i1KcCtWWiOhu0ny5eyTC/KkEHs5l5RpWWl/xSGXWdPbFJKn
	w+A3CHKtGwVaHBiV5rsOJ01tdMN4pzP3p4DZ0vxeOoyWBRzF0PBMEsrG48ki02bIatHxKn3WEPf
	/Gpep5n3MXRm3FV3Qoe1DSHEqFoZzNAX+G22kyPP3N5Of+u8c3wXAT0x
X-Received: by 2002:a17:903:3d0d:b0:2e9:734c:5027 with SMTP id d9443c01a7336-2ee0de41b52mr35325395ad.15.1794595424503;
        Fri, 13 Nov 2026 10:43:44 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa14f7esm13391505ad.70.2026.11.13.10.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:43:43 -0800 (PST)
Message-ID: <e068c222-eec8-4dcc-bf7e-d91ae2ef175b@gmail.com>
Date: Fri, 13 Nov 2026 10:43:42 -0800
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
Subject: Re: [PATCH v5 2/4] MIPS: Skip generic IPI setup for platform-specific
 callbacks
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261113184210.470320-1-f.fainelli@gmail.com>
 <20261113184210.470320-3-f.fainelli@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261113184210.470320-3-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 10:42, Florian Fainelli wrote:
> A generic MIPS kernel can select a platform SMP backend with direct IPI
> callbacks instead of an IPI IRQ domain. The XBurst backend uses CP0
> mailboxes, so generic IPI allocation would find no domain and BUG when
> more than one CPU is present.
> 
> Skip generic IPI initialization when neither selected send callback uses
> the generic implementation. Keep initialization when either callback
> uses generic IRQ IPIs, and retain the existing single-CPU shortcut.
> 
> Sashiko AI reported the XBurst integration issue; Codex assisted with
> the change and extracted-function/build checks.

Argh sorry I missed adding my Signed-off-by tag here..
-- 
Florian
