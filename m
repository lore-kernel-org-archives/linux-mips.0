Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830804;
	b=Dzh44QYv0/a8ma2jv2jo03o0xb2qX+GEF3dFYg7pqVxodIXxbO7o62/aRCSPRuYIGcr8
	 iLBj0AVYh2jVKBX7uafoOq3ZBmQtBUymqrm8SwD82wA+S4qbJa/BIGBfo17qufjaCqe8/
	 2zVTG+wFs1apQPPhNR4BvSiEBT6QaCFmrN71QudfBernFhxCXRon8JHeM8XvmrKN2GdOL
	 LYdyB7RBK5o9KP8CiYwFGEDSo+wl6Gm/sM4oMWGrtxeQhHyEgP3oRQdNfGLclxHXjwsjb
	 xnkapjPJvuGO/jArYv+vuf3st1odJKYuryedgvQFT5ew0Xv3DxEev/l0OUq5UAOM4lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830804;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=EuVZ/U8iXB5qoqQB2mOa7sPSxLd+TMbAJUrNPXzT9Uo=;
	b=B2q40pB7xjnK28jsV4z9dXNjf6Htv532fCAe8DVNQAQfzQ6cmEjhoy7yH3GBUyw+8t0V
	 kcNp369uZprKz2oxzXorArnPAYKgkz0DHA3p8TapduIrqgGS5IByqj+oe+4+hnZH9lnxn
	 9PwAyldH1NANWJtCpkcbN3RAc9ThMtTNMUbJAs/QjwMTlO9hLY0zUu+R3bXcyiDSIwS+o
	 Pa7k3UvOuCt8PI178xFe5RDl8ktnSMhxGpoHjS2Xyjc9qze876p0SVgTLolLOPtjvUDvm
	 s9AVGWWYQa0QoowYWOWmdrqA2m5SGqFTUOKGyFxwIcIicObXO+UNQBm9cI4PKI4DBGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987ED606AC14
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 22:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 987ED606AC14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso528674a12.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 14:20:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830803; x=1794435603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EuVZ/U8iXB5qoqQB2mOa7sPSxLd+TMbAJUrNPXzT9Uo=;
        b=qKxRXE8Cq/cSNFB71to+CEORrD4h7tEzTzzBuy8uOVt3xeEJUnThZnSP/5VpCf8N3E
         CNSUaTvxS72OHdufn+V/jYYHZz5uvXEB1anjWxBwqCQgK5OVNrT0e25PWq6jcBVuQgKl
         Usk0MMlFMf1Xv0ggNsamgoKUVWj9xUAtGuBOUuJUWuvd/0VQTjDq128RuySrW+W6Wo6j
         JfTXg+dXwRCFVXYQNfXkKBSdPv6W/l2TXfoFL6xRcmyeGnUe+Dokz8kWDUo9oCT+sGBd
         FwAmq1LZZjYKWcXTIcqq/tSOl+OTmrszI7zMhCMrTGT8D7eydmyRuSSXnlnu150yZsY1
         8mRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzbDfLsAmALwFMoCJ73ct+S2yVKnDDF8DmPfDK5e4YJFibke7GjLoe+nYhk2Mdq4AhpzrzppfzY0Ke@vger.kernel.org
X-Gm-Message-State: APuU4Z8CBOAdmZExbcof+Bw3VH5ke7UNATwNJUFt/Imd++P8nkDjmGty
	i7xjuMcM8TWXQHH+CbTG/7cOIrBrHcZiDEqtgx/3PgGun006udgaGDJfrBHgiNAA
X-Gm-Gg: AYBFou36ANKLd9ha7RC6VmfiavHBrQ+huptX8Lh01UDObn/f8ljVl3t1nULPxxcGoEh
	IpjUU7IaGc174G+WDq4+s2/GtPSEFUB+IWo6kwneHlH7VNB4UNrhXUDrbcPp/crJnDGXvbt8QU3
	oaIIIlPDsorhI2mAkBft3n8onzJQBIkBbgRG7fvuKSgzOJ8JJTPWD4AduZLPVALLsB3OeXhV9p0
	GD0PtieikdEPxbIhMBbCxGL0XT2dKWrSrtoK3dXdtycuZBn/7dK3a9d+ErB5P2vVeZjyDsPVh8c
	QOiTXoTTplH4GT8PT2RKWE64tYAjnbzSNOhKms3+BShi4P7zSn/UYjQYSVAWzbQjm6W4mkY3qx+
	ZPUjzadu8iNR5BXPdRM7fVzwX46a4hiL9wynS/95kjPICLsuH33D0woe+1Z9qvQqsS4DfNsl+nO
	QyFVVEdNhpdaci8cfMR7Qa73ted5TdW62V/sed2kPvslm1IgpBNi5b07WfoCrIHb8x/wEaTIc6I
	6vfCB7lqcJfOaXK/bm2CPZNwByj8zwmVX4a63v87vVvfmEXx/pYcDnijtFeUOZryZ5DMH9PDEeH
	BCeSQFEy2AKEjSWhVDs49mFP3aOzmhnzudDxoiWi2PGa+AiFADjCD/V20sQvVm2AT7bDfcFn2dw
	0KkLzVeANrDlKM0pipTBWFtBFWsNzUd7pWqja8DrSlRG0H4IutocNW2Bcwwnt6beA
X-Received: by 2002:a17:90a:e7c5:b0:3ad:5c64:c7ae with SMTP id 98e67ed59e1d1-3ae897b67cfmr14507702a91.57.1793830802853;
        Wed, 04 Nov 2026 14:20:02 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cf4b6sm694123a91.14.2026.11.04.14.20.02
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:20:02 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36cad25b8b0so1842496eec.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 14:20:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxJ+TdxUC8sR6rYAJC+32OYwr8XfeCD83Hd93Ngf6BnpqigoIDOo6Ntba+5XD82xXQeb6zsNKS8UdcA@vger.kernel.org
X-Received: by 2002:a05:7300:e9d3:20b0:369:fe81:a575 with SMTP id
 5a478bee46e88-36a4243ab94mr30254394eec.35.1793830801788; Wed, 04 Nov 2026
 14:20:01 -0800 (PST)
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
 <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev> <ba345fce-e88a-4aac-b9a4-59c500f80247@lunn.ch>
In-Reply-To: <ba345fce-e88a-4aac-b9a4-59c500f80247@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 17:19:50 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ73NCpxXWWD+HTVXctWCbOutbW+FHT83fGB+ar=Hu+vsQ@mail.gmail.com>
X-Gm-Features: AclHuK9bkkUrD9f9kOIMS4d2kgzS-vT8Hn9jZFXbBFoDFm8RqLepOJdYmZqvzqI
Message-ID: <CAPY4CJ73NCpxXWWD+HTVXctWCbOutbW+FHT83fGB+ar=Hu+vsQ@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: Add Siflower SF19A2890 glue
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

> What does SF19A2890_GMAC_RX_DELAY_EN do? By default rx is 0, so the
> delay is not enabled. Is that any different to actually enabling it
> with SF19A2890_GMAC_RX_DELAY set to 0?

RX_DELAY_EN switches the RX delay line in; with it clear the line is
bypassed. I checked on the board: with it clear, the link passes
traffic at every RX_DELAY value, including 40 and 80 steps, which fail
with it set; with it set, RX_DELAY applies as measured in the sweep.

With RX_DELAY at 0, enabled and bypassed both pass traffic, so any
difference between them is too small to show at 1000 Mb/s. v2 will
explain this in a comment.
