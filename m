Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519479;
	b=vaGFeUAGFSif5smx9feuf4IhLPfnAwvspoJ5mgGOpe+sQ7Pu71vPcOBmC60frH3L4dWD
	 g6W4NCDJldRg/d+KX1ZD49odzG7+BT5cbwLnpbaQAHZ+8msvly/ZFSLxC9G7i3CfipAMi
	 2Zak4H3siusOG16PHtDKh9JiLYrLV8/QoYaC88K79ujqa4e5mXcCBnfhH4Ig4Xcc/sfjb
	 7SWehmAqZVD48KJ2/gZSfyQTILSSfd56w/Zcx006NgKAGgFWurGT9Bu7H1e3lZ9jDyl/3
	 +1wtoOvV2F983YUjVPp7mKAuOCuq0/unBQNEvBDd09fr4SHicWTW3uk/fuJwYdevWmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519479;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=oZdcJRMUxxlk1z+2TXuUtGeoqWVbfR50Qnwl3g1KkFc=;
	b=5bolBsQh3clvvFvCqWMb4G+Hbb35zpB9ork0TFhWEtdeBqxtUocm0R1avohmq+Hyqye6
	 lDfjcO2mJlNtmAqd5xpLDtohDlSaQHcJ438BFKc07zbmCbq36qHeRYM0FOiIyp2c3o0LL
	 Krp9XmcYFPSi4ttLpw+c06PN2N3o3+L8wxR888nf8bSZZuWlEC7d6btoUQlgJi1gtF2F4
	 U/CeTWLIfHG57mrmpnHDk9UoMdlboTIZkUtZTIPHDhDgZ6KWDUl/WTn6axxWJkuAqRfe+
	 +vRpxZAOc0UpTaP6GYlC4xdu0tdVN4bnRoFH95KwHYWvitqjljR4DAkXdW7/4rKVFOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB97F606A321
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 21:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB97F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso274089a91.1
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 13:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519478; x=1795124278;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oZdcJRMUxxlk1z+2TXuUtGeoqWVbfR50Qnwl3g1KkFc=;
        b=bRKheVU2MZHCx+kVTYvBfkXfFhMT+0r5z1MABhc0QE/SQAfUYZMp9hv54ht7faLu1g
         e+5so5F/8Jwbsy2j4jzjgIOfUtgfH5I+orJ/QduakVU+3Et0V2mnxd929VS2PyAihNmR
         KmoTxA6Va5ia+GgdiKEKPyzOwJllJSUG1qiqKcU37vSPz4aS9bJ+tsHcmTONBel5inYP
         rnzfjLVMV8CpA0NvcUrbEAs9W+ZRTrtSMYdXrUm+LGYSL9m/kBFnSb0NhM8QW6x0IDPk
         Lg5LVx4QKKumxzNtYGdxb1Hq4qb7nD+HJdH8hg58pzZg6ddt4O4dN4vlh8oc2SJrMT7w
         P/+g==
X-Forwarded-Encrypted: i=1; AL+hErGbmgj9FwFmeXh+tQuwlbdDNhk1jiXNKQ3dojWJ1XD8nj+/xUNhDdNZQW/o0Da2yXukZWeGHIkaH5XY@vger.kernel.org
X-Gm-Message-State: APuU4Z/4J2vGPnVDJvoX6ycVUyZiKo2srK8LbYJCdAfWFwmqVi3jGK54
	gaUc5JIEXjVWJKmsEcBq6TbebWJbVvGclqcx9pOq2A4SX7f73yjdjXqaxmmKkpuE
X-Gm-Gg: AYBFou1//PDwlHfz6Isc3q/U1zzO5nofcATLzzggUTYQ5pZEbhRkhjKZLZTAfSyT4ve
	hnM79qT72kNvEGQ9BIHYYu2lzvv9RH7PzpiQ2Szz0MPrhknC1bir8YHxQzyRMQhp80YUagp/JOl
	wo3aXoNLAdFjMe4J8HFu2YbeiARh466ftqj0ydBWw6Ww1lCFxEzh68qr4jrjhO1crUoq8nGSw8G
	q+O9oEGZOutjbPvfGB8dyzcuIZLW8YdNWz/bDTqGXmgFRWsM5bUeOV5DKbURzZOxGvgbO7Yq49E
	jzXBmYWbbNXkL597xHgpTACXup3zkMeGQ+A48T9sPh7Z9PrAKJ0+445pSg6mbT1fQqpNBhP1BYA
	KF2ol3VB09hBIlhExJaO5qG3XSwDmkLT2E6QIoLVn6r3beWxgWTYnNb68FmBMoafyvuTPg2kWjV
	Ae5dN7uKOdRJMhTbnyG+hyTx119jI/hOKhEMbsPP1XdQKuQ4q+Se+pVkGB0t2JqPuISKqUNgiyC
	f+ro2v7bRc4DQW1c2RNm3TN0TLLiUXNXRtap+KbIgR4Q8+r56tsx6A8BsF/daebAcBdMbnyu+Dg
	ZCZZU3hmwD2c1DbyH2SzTQjfbUG0r6fLmRhKcSc3/9DEsY1eWq/2SZjzfUfr1So6u1yuHQCvG0J
	JCFTwBGu0+/X8vBAvLgZsik/UP/R1vDPProE2sq6PRkH5
X-Received: by 2002:a17:90b:2d88:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b1b0ba38d1mr289634a91.30.1794519478100;
        Thu, 12 Nov 2026 13:37:58 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec66f4csm1082760a91.14.2026.11.12.13.37.57
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 13:37:57 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3791619605cso683777eec.0
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 13:37:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHTJr5Dxz11tBrO145fwnvJ3IRDKPmlqKO9KqoJvG9S7xHRv1TyvSZMA7bmhW2HXGUUOUnoM9C6m5hN@vger.kernel.org
X-Received: by 2002:a05:693c:6383:20b0:379:8df3:d2c9 with SMTP id
 5a478bee46e88-3798df3d361mr53568eec.13.1794519476959; Thu, 12 Nov 2026
 13:37:56 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
 <20261111-sf19a2890-sysm-v2-1-d2fcb723e4f1@telaak.dev> <179444699398.1126566.18079369824329437583.b4-review@b4>
In-Reply-To: <179444699398.1126566.18079369824329437583.b4-review@b4>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 12 Nov 2026 16:37:45 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ79fUPUGG4g+bZYcaMXJHXVh_89NL55MXNkhppMEYDD6A@mail.gmail.com>
X-Gm-Features: AclHuK-qYQ4QvhuWcFcAv5sXFh2xbA3gQD3BM89Iz_DI_n7EaCswO7U9VivUGq0
Message-ID: <CAPY4CJ79fUPUGG4g+bZYcaMXJHXVh_89NL55MXNkhppMEYDD6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Add Siflower SF19A2890 clock manager
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>
> The license is different compared to siflower,sf19a2890-clk.yaml. Is that
> expected?

Yes. The header is Chuanhong's, and it keeps the license he gave it,
with only the identifier updated from GPL-2.0 to GPL-2.0-only. The
binding is mine, under the usual GPL-2.0-only OR BSD-2-Clause. Both
licenses let non-GPL device trees use the header.

> > +#define CLK_MUXDIV_NPU_PE_CLK 20
>
> This is the only one that has a suffix of _CLK. Can that be dropped for
> consistency?

Sure, v3 names it CLK_MUXDIV_NPU_PE. No device tree uses it yet.

Thanks,
Joseph
