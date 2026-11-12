Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459675;
	b=HrybKBcreh/7sd1JtAwKN73amtI6AzOpBUVez/NOJ1i8B4uC1Sj8gUgCQrK4WtmLMCr2
	 YulaJK3UCMXZoQ4P7mgH7o11+WO+zSy7DRaIl608TR9c4m6dq8IhOvK/8B29Pj5tE2xHw
	 UJQchgJnwCoeLhzk1c8r+A6PsPODMVnPbanU9HRPx5xZjMjv5FWZr72CcOLHvgCkFnFRd
	 G7UqZAy02nbUhQiNGBdtbYV/731XijhCpIAw9BDHGpdUTpC7nFRglTqy0ZweVet12pxZn
	 wxS0fM7xJQr10aDJC9aJn5gvXi8s/J47JkQlSD91TZV6lPhLMNYItOSa3RD/neCr8Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XOtS0jZSJLnbuCUHqHGLiVmcLs9rLHyD3/gIICXW7CQ=;
	b=2Ri1vJiNHNYohvpseewXrv9cdVAhtotkdWvqudurNRjMzEWRLhtVjbdbhwqpN+yxxO4B
	 dLLinaBA7ueoPa12gCDauguqKHEkCKhi+846IJxJrEpeQHJoVvXP9Ro2UcJtBE2LfZx1a
	 01KsesWNW4EeZUQw14VDBF+MFh+/qdODeqr+51sRryLSPAin03LSBktbjSpLjC9q6OzA4
	 0BYk5BTh/3uZ9U4zI5EyYwYn+5+ydHEQUpEMw7yRuwq5/2Y5+gLMAbiT+5qmfSQN8mRaA
	 d5cYMIJV8EVspJNpFkqKMYeHcE5lw8ynl4jNV3HC8BgLZGHowb4pNewg9I5gXc7P9ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSPzFsAP;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F98606A32D
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 05:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F98606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSPzFsAP
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-843cf077f10so4850698a34.1
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 21:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459673; x=1795064473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOtS0jZSJLnbuCUHqHGLiVmcLs9rLHyD3/gIICXW7CQ=;
        b=mSPzFsAPaT9tym6cizOY3groV50kh2tvVRiY5Aos5AwFH91/B/LfpKc9wRotRxoK3A
         lux/SjtbyrknH8jgKwOYE8eoEevdS3OUBb469kaGVzAcWLChw2NUe8gJnMngt1X/szW/
         pTq2FiiIH3RRLnW5sT0lrdAC3gx3hXyKMZKgjkYqmCmUrjd8FzwJL1Mq4htzuzDWeBet
         Nz28SXlGj6QjdnLSlQx3b6fUCr61dREGOS+9PlxfXN8LkbDXJ8y0pbjhv8/K9qQLOaC1
         xtvPT0tbhqOloKMb9LNjNKV/N4FOO09b5IxggtakChrL/Lf8Rgd9zA+Qatc5G2hxAGgm
         zubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459673; x=1795064473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOtS0jZSJLnbuCUHqHGLiVmcLs9rLHyD3/gIICXW7CQ=;
        b=UvhflqLnx36lBGsgoLRZU+g9LBCdu+Ha+ZCjFJGESDiO8b7/L/MjG9fw0wbjURsGYS
         X+x/tv7fjqbtyXPoTg4r1DM9yKA3hnmLZFQxgcAVvtGYUHO+e5kSIcw6iMMRNZJ0l5Y1
         tR8n2cZgCHejSdJ9bO/cVMqgAl6kNpr1WvpEnrbDowx55jmi++LnzD5xNZpWN5FkjfNb
         p62QxKykogK03KNtiHyuniVfC9xcFd1L70ca8lh9LbRkMVFAJVZCzK3Krz15YnGH76Hx
         bx5as8ME+bx4G3g/1sGIhjIXSltVy08ezleqZzxSsCTNM364xMGimef7A5fl8e/baora
         KhTw==
X-Gm-Message-State: APuU4Z9QQGDSQFWvOUlec+04S9Eo8cn+y8QkRlrIRhaZLN2oQw5k+tuk
	6XAWQicyTYXRCVXfNRBLgdgfFb7OiHNebNeZwwCCy5kA6apVbd72RYIrRASvoA==
X-Gm-Gg: AYBFou3XmNTYSG43yNpwTZoLrgJ6aYV5wEoTHJoWRLCP0hb6EWt2ax5WH42AKEV5r0u
	cCMEUfGEbZBFg9YhOtttsRsWqQcv152p4K4iZYFaGUtbobGUR+sHhF2zpay9u1vNiQh3jkPpmh9
	3YetvxdqM1yjG64zMUs3PYsugDMfUO+9t49t1yvrAHvdzEcS/ktDAmw0cIXO3eyLsXxOWS7DonC
	dSacli4wT41RmbtvKdMCI2JwgIHMHKi8lkRRDxBWPW9Qb48gWozdFxoz6cYTiE9kFN783W90yBx
	oZoreosEpyOeG1Bfbn/u2woPToQCCFQTcN2vSNTFJudHlR9qQ63KXCTWstOpQAnFhTOKckxiC+g
	zCR0zvWpwVM6zOJ3hGifsu+uPTfSz95Z2+JUzF3z2LZf3mT9KPB3Ini6IIHGwwWAU23BACCt9n2
	B4ka244WxhtjRbOGEt6mAiQXqcErbZMlAuo+1lgYw96g0F0qSsQ4epRIAARvOxjQqAVadqyj6dO
	dJ8bLERvMFgIvfqY80ukzLa6zK/1ZAwwmVL12mESr0qoh8vGk7Kt4vJT2m9Pi0SeMGTQa5aMmgl
	mmjEgAdzbGZK2RFQK37rBjiG4tFfxbAVBffKGsw9AyiBylzJSlnwCNGW5CpdETt/BdJrdDxZhSV
	S
X-Received: by 2002:a05:6808:1a02:b0:564:22ae:a68c with SMTP id 5614622812f47-56b968c7f46mr4463769b6e.13.1794459673581;
        Wed, 11 Nov 2026 21:01:13 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm7779876b6e.11.2026.11.11.21.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 21:00:59 -0800 (PST)
Message-ID: <e158710e-bf16-4010-8bf1-b8ee0ff2347b@gmail.com>
Date: Wed, 11 Nov 2026 21:00:47 -0800
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
Subject: Re: [PATCH v3 0/3] MIPS: CI20: Enable SMP with two CPUs
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
References: <20261112041422.2997275-1-f.fainelli@gmail.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261112041422.2997275-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/11/2026 8:14 PM, Florian Fainelli wrote:
> This patch series resurrects SMP support for the CI20 board. This was
> submitted back in 2020 by Zhou Yanjie.
> 
> Changes in v3:
> 
> • Align the second line of the readl_poll_timeout_atomic() per Brian's
>    feedback
> • Collected Paul's R-b and T-b tags
> 
> Changes in v2:
> 
> • Moved SMP sources to arch/mips/ingenic/ and the header to arch/mips/include/asm/
> • Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and CONFIG_SMP directly
> • Renamed JZ4780-specific SMP symbols to XBurst names
> • Changed CPU enumeration to assign consecutive logical IDs and removed the explicit two-core limit
> • Changed mailbox IRQ allocation failure from panic to logging and returning
> • Shortened commit descriptions, removed Codex attribution, and adjusted source credits and sign-offs
> • Kept the clock polling patch and CI20 defconfig changes unchanged,
>    added Paul's R-b for patch #1
> • Updated the kernel baseline to include additional upstream fixes

Looks like Sashiko found some issues to address, I will do that, re-test 
and re-spin.
-- 
Florian

