Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596924;
	b=CmxEY/Epj5/Sn2BZVI34nt27wTCVPI1WKahuKtC/Ij18xCdFEciLzZyZhclk9W7PRF8Q
	 ynKMIOEXAZkUNCugl7DvUmPg2UEX39D4lcVk5s7HvQ96KIXA5Px3zgzFEC+P+ivA9ZZXb
	 mXZltWWQARMfmD4KQJCHse6wntu9BECf4nUcivg8I1aY62Lg3X2uR6Jf2g4Qj9Ugq+3HH
	 zRpcrcJnUa5L9lo9q6ce4zq9nz7nQ7dsuMSCHA3cLBL4JEQjFtXlADS3t2uN1sEsEngIJ
	 eD0sRqhB08ej257DARvNAPeBkspz8G+zi8aOU2gjw6VP6RtxE3GxCbF8hoKi3lxLrUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3XKR4KyQ+ozPV5QSp1xG4V2JkW1Zm8NpJlTHghw5WZA=;
	b=DIsLyfAlqRT9pJPmPSkvm3gFJmZcZ1CRVhayiAPcE8ry/VU/2V6pptRngCxeiqY/MUta
	 mmUojwuUdcdILHryEVPmfLffbOBlzN7GN+d/Xye38RilDY/iAM8O2PFkpdzDYeAhe/5k7
	 na2iE0YvuY7NcelsUO+/3oIXSlf+0qRJF09UeyvFzC3Wa2SKl6iMr326A9Doy1PNp+BE6
	 /J4ppWa4Ib8TP5MumBvXk6LosuH1YygfB9vPDSTXeFQfrr5/GNwpbhXuwyUrvtNeQ2Ujd
	 OZxnG4o7/SVfFF6R5/FgWyViwao/F/+F74Hfx7Aj5m2cb/d0jGhwdMEo1oJ4xCkh02w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1GT6lkI;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9817860A263B
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 19:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9817860A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1GT6lkI
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso1731101eec.0
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 11:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596924; x=1795201724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XKR4KyQ+ozPV5QSp1xG4V2JkW1Zm8NpJlTHghw5WZA=;
        b=c1GT6lkIeEaVDry1XrkHExW4OiOorkGfGdECtwwnP7GxAVa8Ph1vHb7cWWaLhQPU8c
         egMQeISJRKAyadcCfJauQdAp9wkMmQeCiqSJInggJtHaHWr/wDQVPTdXeFKGSD9Sw3wV
         jxD6ArkkqZySAAzIbTZG4QlYB4NKpU8Z2mHTK/Fwif/BFHhG584U+c/uiVBHeGUq0Aqo
         I7Wv9z0Ukt1CprAgHnl4vA3rSqBa7A6tGcaCyMdp/y75Q326QY3K08IzwKlWYWpVA95N
         SZNP3b+vAHt0dNTKNA2uhR41sKhZOfUR8zULbtsEZGaNGCZwjVeuL6haPH7hBHAWTDJ1
         JuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596924; x=1795201724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XKR4KyQ+ozPV5QSp1xG4V2JkW1Zm8NpJlTHghw5WZA=;
        b=Bulgl0D04iGn07tMBfpVgUkuvvYX3ItZyaoMxtDo0CoLWfV/h2FCDtIPMoQYcztfHx
         hCtS5BoFmlmp0MoTG1aBamX2Qw7FEriqcUqD/dpev9skoLUn+QE0S4sY4VzItpIb/UC5
         LyWcpoUxHFlUuPHME1W0SkpFZVTrmIqEVDP4OmXAEGf2Dvu2hPLcM3z9tXUmHPPnAj45
         agxMMuyKhrFrAk5SLOUZaRHSCmMtS0xRus5NQlGSSl3mtQSS1VWbPQFSOEkKTVutp70J
         t9AFeg/zM0to12yzAh6rN0PUE9w715/q9RUuyLQB4C2+K6wPmfXUCSKSQlgZUgeNijte
         yCHw==
X-Gm-Message-State: APuU4Z8AkXvUi7JMvCuCzH25fU9jv54tcPrv9+296eB7BqVZ+XuxRBbk
	bih8eIE+9wDI3Rufd+gN3LuYKnzipbZe6KhdUxMUpVuTR9lbTynjyR8tJDsgug==
X-Gm-Gg: AYBFou1hYdZXpZNTNIoORv9s1PEmTNBCzKDYpulErAZhKLiCYtgg3fQcqp/qggya7Ke
	+pOAjLm2L0ifvgqLOZxrApr64qoJSphc6N6+nMrP0HPr3Z4nZZAFL1GwKMd/sQt6avQ2qr39vps
	35Jlril4RHY/Q/MAy7jyC4BJvMsfV9/ClzNo2vaZmATgZBXQ/AA4Vd5+5NO/d7E3JGSdjU0v189
	WCb7EiZ77XwyrHDPGo+NLepgxLAgb5/24lWlpdVtP3gAwpX/hyk00rKiikqPfegtOwYnJJolxXC
	GukzE+mg9Fi3opXhuq1rXl4NbAH7EqBLkP+JJ19+28sJp4vUWzD7YCNU0BHEJ46mg7O/OZWpFus
	f0YZ0jHiP9psA8ycp8O3bw/6I3ED07Xfdw6uDo0IyZdsLwC4HzmB4r+8zGTrtpRKL0iq4VosUqf
	879015uDdck5yme93Kuv9Zaj5Q/1AmDljn56veXOKMa2bTpPhLhMHrVC72YJ25WY44rNycLnx+R
	1XGoQ0nAUs8rHPq61KbSiUtiM7DHWVYB3h0b1x0Cudgk7RhxkVdvAW3Pd+oZH0HDCKWLSZfu/M7
	lBF6rjPV
X-Received: by 2002:a05:7301:a22:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-3797bb69cf2mr2548474eec.39.1794596923743;
        Fri, 13 Nov 2026 11:08:43 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:42 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v6 2/4] MIPS: Skip generic IPI setup for platform-specific callbacks
Date: Fri, 13 Nov 2026 11:08:34 -0800
Message-ID: <20261113190836.470937-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113190836.470937-1-f.fainelli@gmail.com>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A generic MIPS kernel can select a platform SMP backend with direct IPI
callbacks instead of an IPI IRQ domain. The XBurst backend uses CP0
mailboxes, so generic IPI allocation would find no domain and BUG when
more than one CPU is present.

Skip generic IPI initialization when neither selected send callback uses
the generic implementation. Keep initialization when either callback
uses generic IRQ IPIs, and retain the existing single-CPU shortcut.

Sashiko AI reported the XBurst integration issue; Codex assisted with
the change and extracted-function/build checks.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v6:

- addded missing Signed-off-by tag

Changes since previous posting:
- Split the generic IPI initialization guard out of the XBurst SMP patch
  as a prerequisite, as requested by Paul Cercueil.
- Add braces around the multi-line condition.

 arch/mips/kernel/smp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 0f28b4a62e72..086298146dd8 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -338,8 +338,12 @@ int mips_smp_ipi_free(const struct cpumask *mask)
 
 static int __init mips_smp_ipi_init(void)
 {
-	if (num_possible_cpus() == 1)
+	/* Platforms with their own IPI callbacks do not need an IRQ domain. */
+	if ((mp_ops->send_ipi_single != mips_smp_send_ipi_single &&
+	     mp_ops->send_ipi_mask != mips_smp_send_ipi_mask) ||
+	    num_possible_cpus() == 1) {
 		return 0;
+	}
 
 	mips_smp_ipi_allocate(cpu_possible_mask);
 
