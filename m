Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823178;
	b=R57b36Og903pB2XrzJYSuGsqhH2PzxERmW4H7eGVWqBrv8RTrY260Bwal58N7QmC8Uwz
	 l3I1mBS/M8Ct2ifvhaNslRjUQhErcLG1WCbLkpsoV+afyEITbHt17qgA8Q/Pzxx3+dWiG
	 8MOzM+rBCMSDca5MDbLmFMEg63GbKP3d1u/89PU8fjUl8wXCg522byXmQncIeDseWTpMk
	 0GAOk3ovhrDQ2tOkJa1UNgu/m0Jo/CMG2trUrORiNPNpwEKD3B4UhJ3XFyPyA4lkCJnWs
	 ubV3TFHsGgvtfteH7Hc9qcH7mauIkvKZNmKNLR2OE2GC8zS1qY+3Xsu80e+Lep6ukdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823178;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ZxXu9zhPw8w9HM4Z494ZQ0afNqUzJO/nyo7WE4RsLKQ=;
	b=QpaGxsJHVF5iNmdcN325EjZ7Wqb9qxHCyCJIjv6Tq8YbWfz9m/U+jeVhijQKOxtRUoOq
	 dK0QLuh1syhz73O8yK2ND1a2xaHFauUI/1oqRPBfNJn8DCgM3KnGjXaMHrNXpUCwU5Qmx
	 RIzsIGbSVVRnXqnKg7EQG+7oqWKM8IVKe0kyKCmt6mSn5w105CgInWQLe2XbU2FamR+vB
	 grHcIC+mx7YZK/6WIR/48PlQJJjOunBwG6S7GYrm6NBMmJuRvpjsCPU/h7+omJ8iDjec3
	 P4aSMPl6MIRwYJ/q/mKiKMLV7+FnxzU7Qi2aH2DBg2hqFbXrGMl45+2NjhTtkLbw0sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FBD6080797
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 20:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92FBD6080797
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so793774a91.0
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 12:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823178; x=1794427978;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZxXu9zhPw8w9HM4Z494ZQ0afNqUzJO/nyo7WE4RsLKQ=;
        b=Aat1B9u71jRWOUWAfYcOj024Na2p4AqmOVg5rkZns6WHbDu06ADMWVPZu6Gw1Sih84
         a/VD+/jvaKFCKFfQZnH6DieK4SFdapdiRmlO1bRNPhKdM+OWjmIXtITnFHtdqD5tEV/h
         USdInxa4UaXk/1TSM69PQcRGMEzzFCADwbx2kaP55hfbmENo7C/l2k2fEfeIw5zTMT1W
         T0RCDl9ytl3hrA5s2odTrwupO91UlszXOD0AzGZJmqxnFh8sKZYMxnyOhrE8nExxzmXy
         a48zUN72XCGnqfjCkPVFuJUVzI3ov8/rISugEynmDosR/zO6XeeOmAMcE9E3mgCds7uu
         yVbA==
X-Forwarded-Encrypted: i=1; AKwUvBx2jmhtwaOp1ZqK44JXkKPoeMcnjiUKpbPdtsnRqo2YfiqtdAwigqedx45q/KW7QBVsUwFe47FNWVvV@vger.kernel.org
X-Gm-Message-State: APuU4Z/DC69gz8+cEpbxlQmznNOLwwEP/utHJSJ+l/81mJStvwP36PCU
	D0Gr60XmZSZIV7oJXMUWt5mTCHYtxZTtyLw8RsGo7zw76kkw6Kz8nxRa5wOM/F6Q
X-Gm-Gg: AYBFou2drxMfb2EocuI6MsTF+HhID4arYfOLPOL7UN/qALWqaldLXrmbnqW+P6zFMLu
	0wxcoebsJdIxkxD4IjbwxmWEXWNd9iXz2ScORcmaNXdl/SWZqZ4crjoow8tGaRpx+e/JA8Bnypp
	YDVzqfFeUjrbTTk+bhViYvNBlndU6lxSRlh88pV0cLXshN5alV1tWFqSwwVdYG2MeQPwq0nGrzg
	/l1lqKvgAw0knUSoodwvF+L95YbQK5+ngWvFEyI6ZHDGQYUECQ+ZeEFuPhS2+Jdifi6J9Xi1Vta
	XAb8wN1Lyn261SZ7ot7uwCiKk5Og7M61uBfyxbEd/SZcX6TyAy2SQha67Pkz/RgMEbrZR38Iqbv
	x1KXjfYXIzqP+xxn7yeFcDIoFxwd/JvUg3J6G6XZR+48tfGBciwOAh3tmhADd9PRFa+igziIHn3
	rQMnf83KfVtKfUKVCP/E5Ju+IH6i02Pg+RgYxIrKZ3Jbv0eEB0NCHxAms1ggGFMx+z3S/GK6XwD
	gWSUANOgQ1dQfbO+ih1F/2r9FzClbrd3zVfnhpYlCTrimRiKK57d8v08KAdpLOi2+LhWqrfTi1R
	cRuU4uxrRP/ELb/meTuJGqO1g2TH6U8AQMKddHF5JF5dL26rhz4zgNIexA/4BuLunXCPALnt6p6
	I6teqt+umU1ZVM+CT4tLvIWIK6yEcngKt3dEJnbqij0x+M1fkQxn2x795DfOE
X-Received: by 2002:a17:90b:4b90:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3ae89851099mr14163987a91.52.1793823177866;
        Wed, 04 Nov 2026 12:12:57 -0800 (PST)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com. [74.125.82.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32baf86sm373246a91.17.2026.11.04.12.12.57
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:12:57 -0800 (PST)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1313080c88.0
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 12:12:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwzN+CB2ERsp3CQ7W1GxoWDYtR391vJukcwBycOV4m0gcpbsPQv9JPa3w/WTbo5GT45GXqfsRTvVpqe@vger.kernel.org
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id
 a92af1059eb24-1b0f0f5e3b5mr18258532c88.34.1793823176925; Wed, 04 Nov 2026
 12:12:56 -0800 (PST)
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
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <CAJsYDVJ+FWHJ9AaJCmQwwfdsVJJC5mPw-fXzr2n6OAsZFHJbEA@mail.gmail.com>
In-Reply-To: <CAJsYDVJ+FWHJ9AaJCmQwwfdsVJJC5mPw-fXzr2n6OAsZFHJbEA@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 15:12:44 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4eJ0Pa1iowGEO9qe4E7zyFoGp8TdjB=O0ws9FKUUGiRw@mail.gmail.com>
X-Gm-Features: AclHuK_90z-X_G7lwJns7lB_5N2ZLz7CerbTGbvWSwHLWG_G7heWWc43q7AWu_U
Message-ID: <CAPY4CJ4eJ0Pa1iowGEO9qe4E7zyFoGp8TdjB=O0ws9FKUUGiRw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Why? This block is one used repeatedly inside this SoC and SF21,
> I think a generic binding with clock & reset description in dt makes it
> reusable without further changes and also results in a shorter driver
> without a table.

I moved them because writing-bindings.rst asks not to put in properties
what the compatible implies ("DON'T add properties to avoid a specific
compatible"), and each block's gate and reset bits looked like that to
me. SF21 support would then add its compatibles and tables.

Either works for the driver, and I'd like the DT maintainers' view before
v2: a compatible per block with the bits in the driver, or one compatible
with the bits described in DT?
