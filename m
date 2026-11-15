Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762093;
	b=aOk1Ddg4JUXLoGwK3DC0NcHSZw+2TZFUJyVGwi+MxqD9EJWhijlPVncBE1IOEQighdRj
	 Sm0ndEkPCciPUY8ao+ChyA4TuJSWGD1+te5o6gl6ZOqhi5P/dnU+teFEgtpUvfEHmzNlI
	 SL4T9GGHsN8mIxOcm+ZoOFsZuUr4cdevqG4nIJs1fr+H/2CBRWay9StOISaRZroVYRukl
	 bxQIRSyxU5oM5hR9yVmK5Gtzjh1I+0esc2mLa5FSctqAsXdZi5ugjwLsE5cf0ny7KSeD8
	 xO9hBBsWnwDHWJeR7Ht/7iMr9QPxRFXgsm9reVFfUochgPcjxdBhObR3bjtyMzOLwkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t9j4Z9jjdISER0didX48taVrQrUdGTsKLLy0sIN8/W0=;
	b=fzclGhonL2p+ZenfwBx5fscemAQrKzvkWb3pHP6rV/pEqv3wlBBwLKXJ5Fy7NZoEGikY
	 /4wFRT8K+Y3PnlQSvEMFRN5w0JUYTQIcbld1jKrR6HVI8T4PcF9gofyEswUgMFwkzEI+c
	 veTj/l3H4ec/MAws224Y2Re62SgdJJvnXtVhly6RsIBi+ZJbYH1FFqpowxh3B5kXO2FG3
	 ngLflCo6qzDNH9PPOlKjho2eOuUwr2A32En4+yYIf2DE0hAT4x6gJ/sOzyUIEcbgbkWsE
	 i/7ba0QJ0YWO6Y5nt8lCrwgt0dLsSRiNc3lGQKPADC3UeXZxsgMSlLNykbx+HmywDvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=Y+OHNB4T;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE037606A31D
	for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 17:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE037606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=Y+OHNB4T
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so27930795e9.3
        for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 09:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762091; x=1795366891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9j4Z9jjdISER0didX48taVrQrUdGTsKLLy0sIN8/W0=;
        b=Y+OHNB4TSwPMLnLH0QkR6V4WpuyWuQndY3o08arrujumeBFYSQ46bPNGm4rbMVF1Bo
         QTgFuX9COxXcM8bb0ZVlIPJxt03awbva/nTU+8XvTPS2kuExDNqWux4PKk7Pae5gLhzU
         35l77iXebl1veGfNMOZ22wk9o/Z06tKx3qfXZvW/9SUAlt/ESdRBZLKoV0vS414Eusz8
         VsUHqp5HY/zmpDGh4A9za+/8eGUIkPCaaqghBCx3cxJok/0hKX04WPpp/YAJukV6Xzw2
         8lR3JH2jzobkxS6FLUl9s9hhsSV8Hzqbh4GnKzYUzr53Xmu3xKHNcuBVc+RYjrjv94Mh
         YGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762091; x=1795366891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t9j4Z9jjdISER0didX48taVrQrUdGTsKLLy0sIN8/W0=;
        b=wnq0/jDWP71d+dHpuPrJLUActc6L/obNcdkUndqYrZs4shAjnAQ1UlsFcredSxWULq
         0zvFbhYZVEp3J4Cp/oRAefalAt59N9Oa8hHq30xJDXAFxD1uNvEUHDQX04/4+Z3yfNQv
         Tc6myLoIl/aKkjwneqNCDSxkwrexDEeV0lM4A8A+Sy3L3rFn8lRuikLpnzalsLy8EvDJ
         Vi+k8RDq0AqLOMedIrnQTfasGy+QIl3j8ccdco+fajno97IwUjjPx/w0XOzX395jUuYM
         ul8ln/hUBgyHzEnIUE4boPCc2NYIOdP67pPCpHGm52jv+7OrPoGceYGiqbDFujuVd2Od
         smaQ==
X-Forwarded-Encrypted: i=1; AL+hErFJiUsvZTiuM/Jond9CfEOw+HOmIrwGt1WRp8f2yHtQTIwQE2zDWZZ2/dx+8J5fPrVC5FcDKdSHkqYd@vger.kernel.org
X-Gm-Message-State: APuU4Z+OXwDPXYmNqC6+BmnAeMC+hMo2iYkSJAxr0djlE2bmOt+CzpmS
	6nSPJ9xYL6fqkPQfHevNL4GIk/LQ+VQYsPPr76cm67jyOsEb3cQUJfr26Vpz50LJ5S4=
X-Gm-Gg: AYBFou2Naz40eVBi9a1HlpEXWNlZ8GglNWzTmUYRL/JKLyDi/M96t3++bG9MBCP21nj
	QbW5ewVT4wrBjYKrGNoSGdw2Pmd9913rcjboLtJII0foGIaPKfUyEGnPgo8rVoZK1QRQBQ5v/ri
	nPP/ObrPTkqRwf0HpodmxKOYQloulUCxLIYV3HdP0O5q/1teO36Hb1Nrvqhw1TOg4e08VBymSJG
	XKoFRa+XX0rzHn5Trm1ZH6W4f2DIx0N5/02Nj84BlbGjgocPaPNdBoSsG7LVBTQZHfCZ2fQYVQH
	bzSNchtiJtfP3LyKoGiSme3k+u+9U4n+lQK7bXRIL6G7NamzbURhttXOCQ+ia87mJ7k4Eq7Fexv
	BtkxRFm8CHKhtFpKFCLeuvWsrIvzyeu8leqD2VFbvFpY9jFm5k25ePuPLPsc/0ut7R0sq/tAxBQ
	gtr8WzCA6Zfy4TpfB01byPw9rLDS/mxAiy4HDXWRDYRTOvb39iBKn3lnP1DPpVO/19F9f2scl9h
	VyzXj+DuCHPy9/xNP5oIswi0U6ki2LcD5Cs1qRHoQMY5IoamAV7YLRPiloksNMH+a4rKMrk+46f
	pUTPW40BEXqqPO3Q41fYDzbR2u1RGIr/RjNImBwJNdOG9CmOiQxYqiUFAZq0Ind4VZ0SnkuhAiH
	xcqXq2J4=
X-Received: by 2002:a05:600c:8b47:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4bb55a7b9damr183311235e9.22.1794762091028;
        Sun, 15 Nov 2026 09:01:31 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm18132756f8f.52.2026.11.15.09.01.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:01:30 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Boddie <paul@boddie.org.uk>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org
Subject: Re: [PATCH v2] MIPS: cpu-probe: Recognise the XBurst core of the Ingenic X1600
Date: Sun, 15 Nov 2026 18:01:29 +0100
Message-ID: <20261115170129.24594-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025073146.25326-1-olivier@mgcrea.io>
References: <20261025073146.25326-1-olivier@mgcrea.io>
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

Hi Thomas,

On Sun, Oct 25, 2026 at 08:31:46AM +0100, Olivier Louvignes wrote:
> Add implementation 0 as PRID_IMP_XBURST and handle it as
> PRID_IMP_XBURST_REV2, as for the X1830, which also reports company D0:
> write-combine through the WA bit, and none of the REV1 workarounds.

Please drop this one. Nikolaus' v2 5/9 adds the same PRID_IMP_XBURST
for the X1600:
https://lore.kernel.org/all/2e21dc4889ec55bf210dfc205bfadb57acb93eda.1794471031.git.hns@goldelico.com/

As agreed with him in October, his series carries it from now on, and
the write-combine choice is discussed there.

Thanks,
Olivier
