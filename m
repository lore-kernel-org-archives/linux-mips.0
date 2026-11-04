Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781498;
	b=sjVwxfmW2cZ24M16MX1X7LSj2+Zu4Fdtkzd3ZluxjSQg+LoF4F0ImXPeedTqX2GRX2Bt
	 fZtB1H9vCI2V+Ad1nG2lbfHTAzABHQwdnFjYyDLygMLvvWxryQzpqEZOh6K4I6aLvEuO+
	 NRH8qROw+l5y3dlCi8PBVK/I3yTJIDVU/md4ZxMSNYz1KRTGmpgtAkjEMvJDN+Ort/j20
	 KxLyFJqqtDlPdI5cEtssrNmfuXD3OTrd6cvgd4X+lQdaIZ53btkC2j3kXZhjIQSBkxoai
	 JiP3T1W7XWr3lI44gPmZE+UYwRVSR4mDn51YXX4f1YEC4y2VE1SZPPB7f+8pTfrEYiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781498;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=u9aM0DNq25EEfmak0NV0wfOge7EWo+oCPkidJK9hcP4=;
	b=kIg/LGjjYf4ZrvE9u4kcdBB+59YJsjePiq/ka0vup9UfpmrvvHWbxhoHlHHLVCzaSPff
	 LnHv4ElrmEr2SJaAERbDAlu0pVBKipKJyo8TCUT8Zxka+Bsxn0aUkug2J6QU2UspT3ncw
	 nYdCUzH4elS1PDgJ5gmWYm1qawhlOUgS/TdlxnkMEh4UhZz9sANiJL9QiWSKG3zIDwXbj
	 jV2z6aUl8q+y+OTdiNzVvY+Fyhsjo//JzL1j095458vEptYKEQlEbHh8MvRWDC0nCbdZ7
	 IFLy8jwqUeuVzwy6zyZXg23koOJeLNd9tu75NdoMor1LJkZ1hEGxtN90mZit6gAT6HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA612606A328
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 08:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA612606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e96502e447so3586215ad.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 00:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781497; x=1794386297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u9aM0DNq25EEfmak0NV0wfOge7EWo+oCPkidJK9hcP4=;
        b=B/mDahI9g44MuZVMCZGCyNhBu42mV8KbtR8ElzoX9eDbLSuvT+xCoPQnDrVMDs5KV2
         pfoVM76VmCVVaXRqzLUIhjMWj/Vk4K0uJQfZHyBhSXkjH7p0zsMRyOpYgBAYB1aNK3t7
         6iASAL8Pdpam0xPt3r3sgFDUC1DgufrMwqgLOW6cS9gFT938TPHIzxldTszPtlzRvRn5
         xjMBu+9LqInrowrrtAAmiP3c7+D1ACb3glvEcxP8o09d3nEJdJPRbj+mOXGroX2/gzcL
         JWk9EUIuQDVvKoRqDlvMsL5iZdFKdZO3/TTEl4ALRFtM/p0g4sPZ+GVAnPdohRbuvP/p
         dsEg==
X-Forwarded-Encrypted: i=1; AKwUvByB20r0sD/h4NdHhEwDptM7SSbHiHuO4fx8xW0wlBMm0BiKjYyY4Fxw4r2C1DvgtwjKjIjcJ/fy+LrG@vger.kernel.org
X-Gm-Message-State: APuU4Z9cxitfNO9KXkwP69t/1LfT9Ipt9Mi2833OwJg6HnN4TodFX/Bz
	VfeH8HjTkL+HkMtKHc4aLV7SA1JdtlPrbXMPPjw8xxfmQjcVKQcW0YZVIPkAbFPB
X-Gm-Gg: AYBFou2cw/BVXQkPPHNsKcVglPuL7f6raLsyt8GeFnlRbSSdAgsuaTPgkuSi1pdalVK
	PgsYTTSaFZqxegxBYrOkn+D12v2p+EwJqEO3pwSPuZSZJq9S1UsYS0SeDTwdpBIppgLOg2UgrlQ
	5WbJIaLxkmarXOO7jqX2SPEW8aT2imGip/M4KBnBymK3gmYkUyJIehEenTg0pR3UWwa8SlB3yZI
	Cprfa477DPe13Uijf+cPZnAwi5o4l3uebqDJ+ihAJsHqEbE1aLs9CCg6dFMWQCK0Zgph5TW6zpS
	xTrxO5JprG19Fir7nQfPPq/K/akhLkmoavYvanNndOxzfo/45oj9cA59Nd2atDz9UUuFID3IxJd
	Acbv9eyclEBjsbKCDLs3P0dAZS/aRTo/qxRR9mmkMG6/PgxVBaVFFQkRJCfei3VestNmCV/FNkL
	w7JF3ZCKg6bSNK57L8SRNpme3rMhsfA/FjLxRDzzIR+T1qwpbM64RunfXmY+3gft1r2Dqz4lvZY
	eHdEC9vRKoGcIZB/JOc4v/aYcJI74mfyK5UFsf1nMA3kqJzRhm/PBTlRUicXY74r43yVOQW4U2G
	ZzxgcPwcCCDG5fovWgIuyNqTdEwwB582HG1Ck9ehEvbV9ZWXKY3xdO/zTR/2AlesmGxd856ZeIv
	itXkG0wI3NLSQEbCNpYOjnEnTF6UVVCSmUaXiy/7CP/AfRw==
X-Received: by 2002:a17:902:fda7:b0:2e9:c569:7050 with SMTP id d9443c01a7336-2eb365116demr149986075ad.47.1793781497115;
        Wed, 04 Nov 2026 00:38:17 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0906c514sm4863595ad.29.2026.11.04.00.38.16
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:38:16 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36d6765756fso17472eec.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 00:38:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxPY0S5X5xxqdu1Hp/t5qN2DvO2PMnq/VgGzmGUoP04iqoAT3DTj+X5GPnIds37FeuhycnrONnzzxFC@vger.kernel.org
X-Received: by 2002:a05:693c:69d5:b0:369:7c:bfce with SMTP id
 5a478bee46e88-36a423c6223mr23977690eec.14.1793781495997; Wed, 04 Nov 2026
 00:38:15 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev> <tjadgdqzbvjj7kn4ubibqonrk7nod2gxknzzvdtr5vzs5gv6n5@bvue2t5y4ks7>
In-Reply-To: <tjadgdqzbvjj7kn4ubibqonrk7nod2gxknzzvdtr5vzs5gv6n5@bvue2t5y4ks7>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:38:04 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ67=tJyiWYNf5UJWF98OUY5Ytq-kyjJKJs4FRseuy15ng@mail.gmail.com>
X-Gm-Features: AclHuK9iITvqHHty7IqgPcA0y5Bp8oR0AxaQXRkiXUsTXH1SHKpldLZV4qph5bo
Message-ID: <CAPY4CJ67=tJyiWYNf5UJWF98OUY5Ytq-kyjJKJs4FRseuy15ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

> Same comment as for the DT binding patch.

Will do.

> More common pattern is to retrieve the address of priv with
> gpiochip_get_data(). You already pass that address to
> devm_gpiochip_add_data().

Thanks for the review. v2 will use gpiochip_get_data(), drop both else
branches and add the blank line after the header comment.
