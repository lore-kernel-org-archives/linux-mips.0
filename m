Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823032;
	b=k7S3SwKGmtWdsrKvmbn/XDWRmPEnJFZ9Zn+ml3YBMSxd2yGpblYieC0uwqiv9XOZjY8O
	 Q2XkNZdvSbVnSIHkwd4vPhsMRs9bqxph9Nv2uICh0sYZb40ttcuir8VKvIfc+26sS2MWP
	 7Zhnrwt0rIXyZ5DQHr49R/uWyMI06nO9FW6+KPsEAhS8ROtp01435XE2Do+SJuyJNaIvv
	 AzE8zM/p6C5ngx6VqH0lo/bffh154idYy24xrMLNIpgJ46tLAbGkOqq6pvNGv9p6xjOfP
	 dzto4fFhxNkGOWfJpo5D16o/Ypb84tzD5b407f+ZbWxms1rW3LLrcZ3mFganFkbHtrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823032;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=jAzcbpxGxlJz+yxpkYcjDqzUxEzlIqSdDP9I0n3QAvE=;
	b=1B6B9UMfARkEYytXma/awFc/Ec4/4FfkHP3KJxPDoRz5EPAZKXbFUGHNVFdtDFCiTnDl
	 vSnXGpGYo1Ip061rNon1wXUxmlADl0rZV47yq06pqthIIRb3v42QDHjG+O4kVU+1L40eH
	 dvow2YMultlI9XFIQTb3lm1qa0JAO6X3CYquAg0+T8EEIC/OANT1IpmBu/uPSX5YpKqkE
	 94VGP5C7vEKRnbdVK3OKh4QeClo/j/c1m2jphKMBtssinkjgIxgw+/qBGUyUq2K+YCqJ4
	 3sSjiz8XozBTbkSQfdqyeuDKm80ZWDTdk+cSXYPKWhTbSIcQeyrmtIa7ngQZhPa8Hvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E049F6070F1B
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 20:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E049F6070F1B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso545959a12.2
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 12:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823031; x=1794427831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jAzcbpxGxlJz+yxpkYcjDqzUxEzlIqSdDP9I0n3QAvE=;
        b=k5UGe9X3aWqmZmmyLLJOoAmrC9cv044T4A81ajzTF3TJIYStP/T1YYzQ/GNnlNgvfy
         Xk7lNc9gDwKS8LG61JkcykBdIW1KrWtLt8sucAjWaHyHrYNPbkEGgxM9RdRwHHfgXH3G
         LWjw6vRumxUviomOSJG9Q+zbodnoZ4JfWYOXnG0nO885fe+e4+8/o3ogxC2cTkgi1omy
         MaMF5xDvDbOfhHTEpvgmtyx2MC2AmEgAbOcrpBXVtmBNyAOs4F3CsUMWdfav4wqjO9z0
         GE3LTbZkIPWFC13H3Rxa3Aa55tr0RyObhZ3pUgcw9LcMHhKR1NJGbzydxJ4dRiM+niem
         FRgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWD5UC7SS7dRzc1AfxpGzdcOD7f0xWRdPTmKEiU7zcodP3+A8L+K8E+4n3mJp/Z86RVkFko/nFVgXl@vger.kernel.org
X-Gm-Message-State: APuU4Z+3sv3X0LxyNK0uznuC8spmsat/qdyAXw6JqvKEZkOewYVCJ9FD
	clpwKQX3Hg/uZn4z+QaiN7Oz0evv1BzP5IjnJ0oZijD3WROpkOcuFqGAt4gJEpkE
X-Gm-Gg: AYBFou0amN06SWtmRlP/PEbSpue4+WUgHES+8LjDg5Cz2X3j6hvzrBqi/zHbW1M5Vm5
	3OyjXrn+8z5koLtQnz9Z2cVzSNK8gsI4rjFzGDHDt0FD+g6wAsDupEqTfSHhG21uo18YHwngPGX
	fXXbIrFj/qOblnIl+BzJFmq2KPaU5ycOigTdSrkk1keuH4vAvRBvjayWV9UZQFDhXySv/nLZp0Z
	XzfDOxdxb0s0whqFae1sjv9B9WA+CRwJ5QOKcG342aD5AvX80Li8cQM+DIOwhyqV1jibPNW0xOn
	Dpt636qUwaRgZlP12wHFNhFg5cycoDvoPEvm9hnkbomzNHCz1w8eDIon+GM36ZEIIOVrxzORjse
	6dFER2blgYZHuFWTdcYiXqrV+NmBu7Mw+XYc2oXoNk5eb7PA8dyC9GP/oGmPiMxIy83TKxkXKZz
	WOwKkjs6lY9CRugCw8BC/CvrALEbnMdy064XWDqdfwtLd5VfsTe2O8cF5PODkV9Scu6xBrNWlqM
	LqwnyOgOTWELcE5XWRS4GAQPyaefbxcfCsuVdXll4Vyul1hy9v0tC7ifAT1msR/zq03vF1qcCyI
	53SfL0OQsK++J+4N08U5o9Ep5HPnKN3LCWXIU0oXDKA/BxYGxESaXD5nhdi+Pdlb13t89O4hDh7
	kFb/WIrCJAIO24+1vBtS/vlxUy9mXRKXJ1tuYmiIYQ/c=
X-Received: by 2002:a17:90b:45:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b0a3eb78bfmr1449417a91.10.1793823031057;
        Wed, 04 Nov 2026 12:10:31 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3131f8csm470518a91.2.2026.11.04.12.10.29
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:10:30 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2504343eec.0
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 12:10:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBygDKVwmfMrGFOB/FCBpJacV4c+p1ianjm/csDw6VBtuZEwdFVCscyi8aOEIjmlHYcaHPfN5HLM01fJ@vger.kernel.org
X-Received: by 2002:a05:693c:88ce:20b0:36a:1f8:a5a4 with SMTP id
 5a478bee46e88-36a4241f808mr25514235eec.38.1793823029345; Wed, 04 Nov 2026
 12:10:29 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
 <CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com>
In-Reply-To: <CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 15:10:18 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4zbB2P1qSihNYJ0j9Z8qL_21S+bQZKAKt6W5Baqzg6jA@mail.gmail.com>
X-Gm-Features: AclHuK9y6rKZ3LjTVpypr_d_uuxBPp6tSISF5kZ9UZgLTLqFDDhVhOAbPmN46Wo
Message-ID: <CAPY4CJ4zbB2P1qSihNYJ0j9Z8qL_21S+bQZKAKt6W5Baqzg6jA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> These are reset lines from the same IP block for different clock domains.
> They have to be asserted together even though there are two lines.
> [...]
> The gmac lines are for two sides of the same async axi bridge.
> Asserting them separately causes a bus lockup.

Thanks. v2 will explain it in the commit
message and keep one reset per group.
