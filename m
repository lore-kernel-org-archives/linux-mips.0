Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850774;
	b=xNhPTRtOGMe+g++jZm/gn672dfXqrn9g2PG1OVGcvZnI+0WJpMPc9ldKFbuhRqIv+Z3U
	 UPNpRL4uHbUBB/kKAwvJrsIZU+WWJ4SX3L3O9cGzDFQX7THNmxExi0+cYZ8AaMoMpeT5U
	 CLKpg2t6AMG1qnjIT2a9wFew2q0xWDC+8pzb/T4rkeQ0t4B8BPmRg5WU5jA1B7ci8JB+5
	 xXLfTnsZextP4vAlwNojSMbUwXodhxTHsSplWdceubCZBYsDlpT1aVW3hxZlQeUHvO95k
	 zPhVK2aq9M/+fVPsli3eUV0XUzNT16rZBWbp4ds0XV8TphuS+CFXXc982xFJ2ULbSMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QMSpt+sY72i1M2L44KdgeulnfD/aRihzzJUadrpWjOI=;
	b=WPt4dY10E0vspoIy9yQeYy7mUcjeOJdUa8sgkzmYtSE1EMjuDic6rQN4AopJTfNBUFuJ
	 2v6UsokZcPM83v0sOweFqB8LnJawW1QEj8EpdvZTTViFWIM6uplzsrlKXCIwYGZSfIWOG
	 4NFN55q7kOK8TP+U0fAANXrs1phZnf3ixt8qbKbURCS8FaqHlmyxCBe0DzMWRw9ZiGWGt
	 W4sL3TAm4hSKytrY2wmxt0CQHr+xsVp0SFjPYiNo5wVQxEtsFhtN6LI3DnpnGPwHNo2Ns
	 KcMdvlqTCYpdTzcR+vAXYk/tQu0Oi+7KVTifEsIhwCR7nE64yzY5PIBgAZ3Bm04XnvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txMlmASh;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C289606A322
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 17:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C289606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txMlmASh
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1664083b3a.2
        for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 09:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850772; x=1795455572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMSpt+sY72i1M2L44KdgeulnfD/aRihzzJUadrpWjOI=;
        b=txMlmAShpsuPhoJ/7M+0e78MAWKLvh4/QsrbUYFSF1VCz+gFDDAcDwamsObcovXaFs
         VgpNyUsYnBMHulTgRUwpDg6F8ZRZJJ67LWhNGJg068/HcE2PzukhV1HbBcjs0W0qgQ8d
         x99n2h1iF10HBDa7d53PhPQFFiCgoDschMCey2NVBbxpFVn3thHs5lOArB3q7k31Vnpe
         7sZaqskDDaMVi5CAxlZJyuAukg3Nr+p08iJ61Nx/Xxq1GM3E8ButNcb857y/WxPE1nSH
         DKgiJ3xCB87jLB3Lso97g0Ix52VwmRajzGdfCKY9cj3miKs4hgyPCU4mmpUaPypIw8pz
         QjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850772; x=1795455572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMSpt+sY72i1M2L44KdgeulnfD/aRihzzJUadrpWjOI=;
        b=Y72ukl6TAkcvQu2IKpUfVmC9jxMzcbHmDaAmPv/GQI9ciyKdhuta/emL51uT5Okv9p
         U9ScibQjsVz/2bnAmyL5HdffYZnUAvuTPfqSPzVbTZfnwwsWIJ5hJCsMRSalOjZ5D86Y
         8fn6VMJ6EsuRLK0dwej8+mXzlMx6WmroeNBP9AwFO5NrfSLlWd+PbdaPhmgbM26WcZ3S
         nYhZRcG4sjxrZy3kf4iHIDhgoHpl9rNRT7evvkwIaaa+vKRcOUpy6Rva8HDsuUIfiAXO
         LNokehErT3WQReQxiihcgafngXnvNQrzVxj3PZuJ+QPmmBl6moA3D/vTghN93caghgv8
         X1mQ==
X-Forwarded-Encrypted: i=1; AL+hErFlPEndH8Qt8BeMVsNZdE9821weWHlgMquRj1uX1+gj4dpPnA5RO3zp9ZEEsPBoEMPezgEsEQCesH4q@vger.kernel.org
X-Gm-Message-State: APuU4Z8ovJBxBrybvBbp+UmMA+nryE6Lj2DzOcsavrxIkId2cjDIPWyv
	LlfsTDC3HCuquvygcwc/3nD8GQhPWr549Js+RTm2z0iDdoABbiXNV1YM
X-Gm-Gg: AYBFou23itdezGDoCsWRJ80BRzyyW1RBf/UV/MA4m5m4vbzcWO052wkW2S3YhbCjsFC
	gR5Miz/EGZpvEB8o0swyGlPreTB2nkgwyY+fnp7m8btQoOZbxDLSBqQ1LatL7XBJmCi5z4HTkZ1
	uz521XUVcWsDLB5Ri4fn0nYClqXUfdK76FdVN8pngzTM/bNW69Ip9GU3jkTBgQb2p3oSO20vEsd
	tTj6zBfdx2NtfRMJ6HzMbHEKlJ/D+VhfkkY1Q98+UVkjYbn+mH09JZMpNkQktIRr1vfdtTxsf6O
	sQ3f5D8gA1VhHPM4e7QwBeQ8qEiiu215cJfAhj092zsJ3l6QKpb09tAbXTSJrmG3FJXTZC5CvV2
	lceCcYmlvqKStKE8mjXEj5mM80XD4xws2eZrdBPAKhXJGKNPi5dOG85gqiub2/mqiMdPtQjn/w2
	cirx4gJO2/7/pUSkDNCf8c1qBIsLDXvFE4ehx6k1hWx5XtLAvFwbMOjIjwYvyNXQfIjxfEFZurb
	ZC7LgSpbMAEb4AXU8Uzer8NzcIaoHx/8+4E0WupWywOJU72Btno6X1fdSSyaAZW+souvKvOO/VD
	EZfBiwz8mSDRuri5Bl7MUYGVVGf4G4guwVrfMbdEIl/yeJIlAsgpx/zy
X-Received: by 2002:a05:6a00:1989:b0:89e:33ba:54ce with SMTP id d2e1a72fcca58-8beb753d177mr10045044b3a.46.1794850772361;
        Mon, 16 Nov 2026 09:39:32 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b354sm3920789b3a.47.2026.11.16.09.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 09:39:31 -0800 (PST)
Message-ID: <382e993f-cd76-4f47-a7ef-33c2fa00d1e3@gmail.com>
Date: Mon, 16 Nov 2026 09:39:30 -0800
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
Subject: Re: [PATCH v6 3/4] MIPS: Ingenic: Add XBurst SMP support
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
References: <20261113190836.470937-1-f.fainelli@gmail.com>
 <20261113190836.470937-4-f.fainelli@gmail.com>
 <d4bfcda4545330a687edc350326264a031336109.camel@crapouillou.net>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <d4bfcda4545330a687edc350326264a031336109.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 08:07, Paul Cercueil wrote:
> Le vendredi 13 novembre 2026 à 11:08 -0800, Florian Fainelli a écrit :
>> From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>
>> Add support for the second XBurst core on the JZ4780, based on Zhou
>> Yanjie's 2020 series and Paul Burton's original CI20 SMP implementation.
>> Use the CP0 mailboxes for inter-processor interrupts. Initialize CPU
>> presence and core IDs explicitly for generic kernels, and reject CPU
>> offlining until CPU teardown and restart are implemented.
>>
>> XBurst stops its private cache clock when executing WAIT. Write back
>> the data cache before entering idle so that the other core can access
>> data belonging to the sleeping core. Select this wait handler only when
>> multiple CPUs are possible, and check pending work after the cache flush.
>>
>> Enable the secondary clock outside the raw SMP lock. Use the CKSEG
>> aliases and pointer-sized assembly helpers for generic 64-bit builds.
>> Development and build/CI20 boot validation used Codex assistance; Sashiko
>> AI review identified the locking, topology and generic-kernel issues.
>>
>> Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
>> Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
>> Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> [florian: forward ported to latest version]
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Paul Cercueil <paul@crapouillou.net>
> 
> Good job cleaning that up.

Thanks Paul, Sashiko still had some feedback so there might be a v7, 
looking at the comments to decide.
-- 
Florian
