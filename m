Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912279;
	b=ZWF2z1dty9PBSPCAzyBE1dV8mXrkgO44Voluhq4oGsKFBAj1UYI9BN4M1lmH6VPOBvuy
	 8wY7kvSOdyWJoh5tsFuectfGY/k46HOUejjY5QVIF7WtPaNpPB1f17Vuml+Ufw6c9SJ5l
	 RyS0dTY2rQSI+g2BBunX77aFWSN8e6GhqQS92JrQCDpabWL34HKK4U5TU46so8taKmgjm
	 IS9xd/kdZ9PeUc3CRD/XtCjzIzubrqnSkz/a4qT5597OmK9zJJrYYW5E8HhVX0jjC8WVq
	 Sxq5J/NPb4G9Bg6+HHgvCDvkNQ7Sm4zwPDf+FtCQzBrE6DsdgEDvLpQ9BOxjJZYrqJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912279;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=y3OwD37SrGJresbxUK3F5nIZp/tIcgjb7IQgtuSfY9s=;
	b=wbbzW2LpV9nyIIbTo6dkG2JZFVX4bpBctQenh1NZw1lrAePjj6jupZ8b2iFlKvW7ZCEA
	 fGKu58qyE4YsTm2OpHEZNDByonkQ3aLtO409ZgJu0lSnS8sRR5NXYgDOUOgOI6fjncbrS
	 R+4csFcrlirA0j440BLdWyy2GiSzV/1z/i5sAzKH1aSMpLQPPFxqG8ZznSyydkiIs5xc0
	 +mzz2RabRoBt/xLim6GYia5+ETCnTl/LfZW3NT9lsx4oae9j5ck+8RIxOUUWusUDiE5D8
	 Lhnuqld3SdBZQZVImx9gbJMbNKkqGCzyfL07Ebmb9VN2IV32GA8hVlBUOo0CDRS9+GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E6E606A326
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 20:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E6E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1799695a91.1
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 12:57:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912278; x=1794517078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y3OwD37SrGJresbxUK3F5nIZp/tIcgjb7IQgtuSfY9s=;
        b=bEEpbCNZ3T0u7jWcyxekVy6c+4RdITuMljKyE8C0NlKO8T63qE0qUJRvffJ04lYkwL
         ZzpspkYA0LQ9bbNrUczA1BMCxlCQ2H8EhF+0tz7EwPVG6ylZKFbuhNUSvXoPdcdDUWN6
         z5lVxBJe1NNnl3jlA9l3HQzEtmJWR18kSjkbv4YpjWFdo/KQpB5Fw1QOSVNd6Jq+5tm0
         dRCnEU6jZ87i/ADO0RC0TZOkwc27oKoMLviAfsjXuuo1ea8GqYoIv3nEtpN6F9GN/5B2
         /ff6zne4MkT4gyXnYXxVQ1f8PdVSZxsqmxA+hMSHMHhJHvqDE3y98pZMlVvmSubJsCJe
         w+wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwu2alpPiHbDlcBtlrSuOXveMCp2cZPH5KBeIR+tUMqT84Uw95HLIfZL1QSxaqsHD1XmdWkq8osD912@vger.kernel.org
X-Gm-Message-State: APuU4Z+hrn8H2FY/qXV2c10ygdweS615Zd9fDiwpfBja8t5+ZjwQ5uXu
	sDzoclP2nZQjQJgaRyDIxzq48T9RYYBSP07d/BNa1oWEnfRdzDc2SAyrnlPHE4d1
X-Gm-Gg: AYBFou2wdmu7qznvPozGJKoFQoWKJVblmJZVY35jNAey0XkBb8bRvsitiKwGuLABi4A
	9dKvUfvZ2gRO94U2ReBT+2I4HNn3+wLedGxl/80Ey91ATtQSrszMQoF0kdhFCot05a83/B0O9Mk
	d3zYP82AnRa5nIIe4SLxZ0yUXs6R6fEVKyyf03T0kkoJiu+jzcqMoVhPiN/zcux1NKSUzk7hHRt
	pfTyAg5RaRw4MrWTBx9knh1PqSvwhljnuiFVl/OFh9rIiVQY1MEducqw9SkEleemveNR0VVBEP3
	wQFo9Pd0VX6EYi24nkYykD3LvBEHWNo0VJvUfnFPGODNsll/M03wcZacohTIcumLHzZgiQh79lN
	Fac1OEmDDMq4qGr3tMOrntFF/EIOPIuDfOLmivFMr0jW9h29sPl7l2FqZtRt8Hs1AdQPvH1zY1F
	75TtepGZFFBq9pzn5DHFkw0VoxP6da1/bW9juXvRpeKyq+RUXKGNONLJ7l5+DgIpVOnA4azQjHo
	5gilf3qtGWA42CM/4U61HWPoTzS+WMCgGaqCxri72Pngvx3501FQcjR3gdsmTrWi7NdoUX/QCNr
	G1TdrfG5Qbpl7ulF5bUga1Mnq71mBfo1/ketev8zYLEZQXW6jc6nvT9Uelp8YILWlfsc48FbX99
	bbaieMUD170fGxnPOYbm58sGrdfnNzwLvtNs8Ff0HNSQ=
X-Received: by 2002:a17:90b:1a91:b0:3b0:ae41:2707 with SMTP id 98e67ed59e1d1-3b0db6fe133mr216018a91.45.1793912278337;
        Thu, 05 Nov 2026 12:57:58 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8ff96sm625289a91.13.2026.11.05.12.57.57
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 12:57:57 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36d6765756fso3048965eec.1
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 12:57:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwpKy4DhXYcZ+Ihf7x0fVvanhWnpwgbfzrj+UaWp79MVNfQ4G12qS7VaIV/tscHZmuRlh6nDn1ao8yb@vger.kernel.org
X-Received: by 2002:a05:7300:ea91:b0:36a:6d52:e16c with SMTP id
 5a478bee46e88-36f75253924mr438929eec.12.1793912277153; Thu, 05 Nov 2026
 12:57:57 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com> <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch>
In-Reply-To: <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 15:57:45 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
X-Gm-Features: AclHuK9hGSAdRKsJYKbyzOuaSV6hdi58LXaj_oUeX5Eo9bGiXxx_BR0j2WjKwyM
Message-ID: <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Do you have access to another board which has a PHY connected, not a
> switch?

No. The GL-SFT1200 is the only SF19A2890 board I have, and the only
other one I know of, the vendor's evaluation board in OpenWrt, also has
a fixed-link on this port.

> There are unexplained delays here. Is it the switch, this MAC, or the
> PCB?
>
> We need to understand if tx-internal-delay 0 really means 0, or it
> actually means 1065ps.

I can't tell that from this board. The sweeps measure the sum of the
MAC's delay line, the switch and the PCB, and I have no documentation
of the line's own delay at step 0.

What they do show, in the MAC's steps: the windows repeat every 8 ns,
which puts the start of both eyes about 4 steps (0.2 ns) below 0. TX
ends at step 51 and RX at step 28. So with every delay at 0 the link
works, but right at the early edge of both eyes.

Until that is known, how would you like v2 to describe this board?
