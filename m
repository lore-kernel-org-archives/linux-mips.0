Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593744;
	b=dSzofJKm+BTYuMu7DU+llLoYxyV6dSUM3yt06Ad33GtEDvKZ2exy+d9lf//4ttqzq48R
	 6ms0CM3Xyn5+VOA8Od3C9HSfjP51RbpkJdmHPdTPmqfkmsaUFF0ob0TlMiOXFHr+7Gojj
	 GJPerbciLNYuwbvWo4Zqs+mj63UnZRZAt5F4gXqi45iziGJqdhLmwXJCCDsRwARDQDmRN
	 yFfT55cR8DC5BHkSbvalWm2aOeu7cSFwq9ntRiNSxjn55arTJPPmjZjiWKmdLn06t5MZQ
	 6whzhytgSjKNWO20xIxI8NCkvvhmu6tU7jzxiXhhQR/acCJjNzTak0OgTBrrmbZdT2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Qb0UkJf0VrVHdKGXACE+JKh+6CxNNCz7RSuZaWY+rFc=;
	b=vgbTWxcu9dhjAZeS9S5CWa6w3/mwJiLVzZya5gVu/bMwbRGPPrBsDy+chuljjD36TP4i
	 9CfrOS4rLtguqPZRttsIyU4gP0fLX6Ohqm39RLueaxvcH07ScUfjy9KAklV8VK5Bd7QsM
	 N3Qaj8FfjmwQTGcS92EJAjflXlPn8x+9gdZcuEIQB2ACiFJPuN9/4g2EOFG50s+PQWVc3
	 CiPquPrjU/Ixombin4DTCbFz9fPgy9LKmKK6RX1u8zQ1bVR3a+kLi4mujC1bswvrLwi3V
	 FGzTiU8snv/xs7LHu4a/W3AgcrC2pxCsQaG5p1CDekUzI01q8SXOVqKynS6TLclh0lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTBcLH97;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF74606B505
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 18:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF74606B505
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTBcLH97
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdd89d84521so878572a12.1
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593743; x=1795198543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qb0UkJf0VrVHdKGXACE+JKh+6CxNNCz7RSuZaWY+rFc=;
        b=kTBcLH97rUrnJ4KURpQ1dhq3yExaNpCXKEffASOv9H47vMKspCGnaACNxMDNQw5951
         Dq+Lcn90SYUs/ohaGnBmt669QXi2WdG41vDvENc6ZPTZvPt9CnHL5+vG7rtwxU3ltH4K
         lGlOQbHZy84fitgauXGO2AOcVb+vaeGwHTSLI2k8D3sBppVN+chc1jekUcIJr8kUaZ9J
         /Cm1RT2l2UzMaD0dBgm1xy38IcVHz7cs5dMQqKv9yu8eIPdIUDmuq3rhhGrVj2N6G9DX
         isLUv0bCDHhBZnvjDBiTb1Nkqx/VBCsB6hPow7CZ0e9YOjthYYorGBq6y6aVuGOOaO7s
         R1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593743; x=1795198543;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qb0UkJf0VrVHdKGXACE+JKh+6CxNNCz7RSuZaWY+rFc=;
        b=oZywecMkfchx24DJUO4V8etTLBNzYm/r/WAJUT1SLyNVp39//4QcngOHmep5bVWGyD
         qrEjICYThg38AJMXgovqA09LgYd/4HOGO/71iuW0gEFmnNW/cE6ap0puV/caDQAVSW5g
         5YWkPQhK6P5wzR1aYXNeiHaRUe/m+AA2f6HO0vrzC0I2E/SwJajR2BeexWxe0j4ji4yB
         fHm9OQ4C2CqjcmmR27k3PKE4gIYgyWzAgyxmDAUJu04eIws5TsmNWZcdPfVrSLr2JyCJ
         T2i2g7PUa+tLE++R/bICZ+MIobwVYb0CIbUbUWfRrOKKeVqtCASV2TG6g/7GV0iKz+1R
         gVow==
X-Forwarded-Encrypted: i=1; AL+hErEGNYQMvrpTxmgB2B/9I8mmKx7WHKkIjjD97/IVURWYMsgN71YUoyYN6fhLNnHKdgqxbf1pwg3PFeTf@vger.kernel.org
X-Gm-Message-State: APuU4Z/NajQWYnYl/HfXWrdDFeq3gjUNjFfABRD4M/s7qJQa/OJWddfR
	dhM5Wuj3v5yYN5wrmQ50Gx8J5UowHISQUwEKEF/cQMqN6QUM6CroO2tz
X-Gm-Gg: AYBFou23Ta00LHtyXbZSgIWoGT5iq1uTR1pvDbQJcvDJ/5EmxbyQ0+/1ksyavPoC99h
	OzqqfaZMvC4suhCpZx99LTah1sB2DhN9/JL2ghCIWT+qHCwiVIKVw9XHYheojM+75L9y//9emej
	NhX2is6gIvWcBv7IJxkupLO+ZmZj1uqBlyKJ1ihNetkc7uSBQ7Mgi5LzUX5bx1PjJSIFoxATeOa
	ULZix8Ja2xvInSTK4hqoy4/7N4fUGI7q+NCUEqLLYVM234VGkM4CjLCdcJQ99c5xLaHrq6rpt+V
	auj3Y12Hu6MVH0jk5l7EHw8dXhVjcTQuSkKy0NCEryGJMqQAlsoaCFetItZs69lEXp0431v8C5k
	oIIz9XaPoCucTIyIrnZZYxOQC88IqO97jomge6X9ZHtSlmWk72sgJr/Ec01LZuhnZTh1VO1JADq
	sSWRpPRzRw2MhPNURaOGDqk6cLos2EH3rjo/o7Ff62jwfqLScK8QZF1th4MNK8bkLRyE8uNCkH3
	RMvFl7g0RT2fEX6dVai9jcv0GibjfK7aNEOjeEhPxjI9oGIhUNKAjS/RSmpl4YqfehX92OIvH3B
	7Lpz7oXvtig+uOTKUU+mZU/C3wXXPkFRzYHsc1Jdgz9EOfdNWaTSQUs6
X-Received: by 2002:a17:90b:4f41:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b1b0ccfbfcmr1844303a91.31.1794593743599;
        Fri, 13 Nov 2026 10:15:43 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm5421608a91.6.2026.11.13.10.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:15:42 -0800 (PST)
Message-ID: <85af50eb-9fe3-4327-b05d-18eda5993446@gmail.com>
Date: Fri, 13 Nov 2026 10:15:41 -0800
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
Subject: Re: [PATCH v4 2/3] MIPS: Ingenic: Add XBurst SMP support
From: Florian Fainelli <f.fainelli@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
Cc: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261112184441.3724150-1-f.fainelli@gmail.com>
 <20261112184441.3724150-3-f.fainelli@gmail.com>
 <ea78059f26aa3e25822665a1a462951695bd1e80.camel@crapouillou.net>
 <18bc9378-3f8c-4212-98cb-40e876bf996b@gmail.com>
Content-Language: en-US, fr-FR
In-Reply-To: <18bc9378-3f8c-4212-98cb-40e876bf996b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 10:07, Florian Fainelli wrote:
>> Drop the macro guards:
>> .cpu_disable = IF_PTR(IS_ENABLED(CONFIG_HOTPLUG_CPU), 
>> xburst_cpu_disable),
> 
> OK.

On that suggestion specifically, the member cpu_disable does not exist 
when CONFIG_HOTPLUG_CPU is not defined, so although PTR_IF() evaluates 
to NULL, we are still trying to assign to a non-existent member, which 
won't work. I did make the callback always defined and used 
__maybe_unused instead.
-- 
Florian
