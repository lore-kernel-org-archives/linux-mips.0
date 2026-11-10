Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330885;
	b=PPiQvyK3/JnJYX7yKDmoQuV9G7ReboDaRbuyDe9WgqNxfZHRavlywEoVcKDL+u9nkkUi
	 /slPJSFkvzcKoll6lkKp6hbUOo/gFrB+aKhEoPdw2x2POJHfwWrrcQHxdJQrTdTBSJ9hl
	 jjq28iXvDUI81x04w/SGI9PTeKGuqWJi2HOxIxHjsgzvsjUz+6dsdPuqE0USKIZAVxAE6
	 S5mkwffqCi5aZo/XbW8iaQFt+sNtNllalel9fCsiEF7MAl7G2WtYo+bpgK0Z6CXBud9T2
	 hA0l3QxS6JR9D5Ia21x1Q3m2aMg7rDBpAxGg5Z5XOOb7PFzXgTk5LbuDQzthpBL1y+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Oujdvcye93Xof0isVHmwpB1y2xPdgyYOn7LBWK9psyI=;
	b=4p1tVR7d/J2Su+ZfK4YnpMBKHQtv6EJ4Xl6F9PrSH2B17EEVq5G8i5/SLN7lIjYK21TO
	 nkEmuUD/UUc1HVGPX95THrU+j2h6ZQfO4A1yhuJCB1JgEDChMJdxmRRvq1bHImW/Gkm2P
	 ihj0Qex1foaRtn5M6XS/dvfnaYUQVPkTEYOhIzp/yPkRVANGevO+YkP5N9SjVOnpce5Mz
	 v6bfhIT+kXfZtiiIC9j7jYYNrCnakaBDEUk5nCII4Fk9jTImggaiZwX8G89sznykMoyYZ
	 l7QOUyTS3OpZZivTFpqW9uMZqgePgsjSTi7sN37q20GLF1si0Daogt71gVhAxkEJ6SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Isk1ca0I;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB81D606A323
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 17:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB81D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Isk1ca0I
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53bb57f1310so24622881cf.2
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 09:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794330884; x=1794935684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oujdvcye93Xof0isVHmwpB1y2xPdgyYOn7LBWK9psyI=;
        b=Isk1ca0I30RMY+8oOixfoUtKFUb92r+JB+FTOYbGORvjFe+4pLoPI7uWL/tCbKyIwv
         g8Gue7qlz7uzKqJFZJZxmfyi4VVDrfyej0NqTTJbJkEeSEi2ahOGDInhkt1oy8//7Dvm
         Jlbxg0qJF97m4s5nQYSYsZpHILdgIQ35oT/T2aA0aBilW39XdEadvUkQf94wgYxxFJPj
         ZvkARhwpbsSpWkH3OBA1IGSqBBLxWOt+lgCanmJG2TL1sKUC0Zxf78nYDUwOBQryCIQ8
         h+ViZhY1z7aIqM8Em8vpLa9rsx6NxlNpkswBuchqitA+MMr2JjWoXh7iImMJvvP87We/
         1yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330884; x=1794935684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oujdvcye93Xof0isVHmwpB1y2xPdgyYOn7LBWK9psyI=;
        b=ln9zchVUQ+hoA9DorwHPikllrOvXob7RXRWf27J1lT+BfAilLtpUVePg7ipdfqWDyh
         rwBSso6Hnm5HDpgzmQsrkdtYeJ9jaf7zPP9/NAk5pP/pIjuebhClxumjGTNOFRUj8YZa
         BxPnZSjwks/O0s+jUhAOZVHwRTdod0nfMC5hlKtnzJnvBnpilR4odiQAM4OigbRfCMEq
         dJ/hYE/LD35U0x3dN3JNv/i9koY/9NvUsG5H+IsNnAGY7fpSlQ/Y0wthnZu/TBEVlSgY
         8hTyQiA/SfvUzHpJNZaDHS4eAEvkQDZju8/YN7rAgmVix6rOUUalIb4QDiPlS4kPSRyb
         VvwQ==
X-Forwarded-Encrypted: i=1; AL+hErG36yhxAY/NRpjIhtV2S7D4bML4szhGEYawqckY38/cm9q4be0Y4UjpkC3pKz5/GNKFXQbuOb1WrORB@vger.kernel.org
X-Gm-Message-State: APuU4Z+XeL/oNv4B0jWvgQebaJ7f5thIPvLX+Wx+dP1y3T2OBQK2W3QB
	wyRBkBlEZ4zFAzrjMAiAbIgxk3PUDnwHjyZ8/X18QBt+i5fqi49mDsV/
X-Gm-Gg: AYBFou0dUThTwIpc/vEy6FJp/nU5zXsL/b7KSjWmaK22DiZ/JMI5W1ZX4iO6/o8+Ki6
	OFAG2ZjfbvH3bRzsS7tJe+3cPDphBPf1QYsrQUYzHPPfYhiJHDSWGm6Y/OFZz2AHJsyyAkreirH
	iTUtNvWz6k50d4bpU10lqBiQoxeJDCK1mGyf0LSq9lqtzmpu01DOb3du9dYZJDtEKlE0wMd5zfz
	XEWAPy0GsbhkzaijlB0lNkB1UP/Um/tKyPJCqJ0Cpgpts+qBRKIDJqHM/Ns6sBHzR/RL+XHspgX
	7ZCCy2tauTYs9IsGEe2LTnJWQlb4VRB9/5X6QRBaNVVxxw+Zk1GSoGFxrNUeBai2OMiu9Wi+0ab
	RfgEsOJ5vcfNFvRvYQf0NaPh6FH8t3+TG5coPoJwsAk7CcZI4cpgzrc3SEXNmKAd0IsJZnd2xK4
	swpTTVCGX5Rz93D8wcXB6XEa7pVDcuvTzqV0tv4UAm+6DHjggP9OAy46/SgB74IKWCbbTxvdIo2
	WVoIVIx4kd7hphX9HXzNOT7HBJlC6G3RgmELJG+6Fw1AaYbEBGUatNxicxJO5S0C9FpoZQ6alQ6
	a14cfzQxpG8xmtHI+p6Wcqe0RYPAGCzdzktB24tU3Ft8mtoPpg8twFxQ
X-Received: by 2002:a05:622a:1911:b0:54d:a34f:c736 with SMTP id d75a77b69052e-555271342c7mr48254351cf.17.1794330883512;
        Tue, 10 Nov 2026 09:14:43 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04d8397sm25744446d6.18.2026.11.10.09.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:14:42 -0800 (PST)
Message-ID: <135a8f3d-9eb4-43e7-a20d-056362a29c14@gmail.com>
Date: Tue, 10 Nov 2026 09:14:40 -0800
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
Subject: Re: [PATCH v2 0/3] MIPS: CI20: Enable SMP with two CPUs
To: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
 <d40bcc5d7742025db9a67af5c77796745e284e45.camel@crapouillou.net>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <d40bcc5d7742025db9a67af5c77796745e284e45.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/26 07:44, Paul Cercueil wrote:
> Hi Florian,
> 
> Le lundi 09 novembre 2026 à 20:31 -0800, Florian Fainelli a écrit :
>> This patch series resurrects SMP support for the CI20 board. This was
>> submitted back in 2020 by Zhou Yanjie.
>>
>> Changes in v2:
>>
>> • Moved SMP sources to arch/mips/ingenic/ and the header to
>> arch/mips/include/asm/
>> • Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and CONFIG_SMP
>> directly
>> • Renamed JZ4780-specific SMP symbols to XBurst names
>> • Changed CPU enumeration to assign consecutive logical IDs and removed the
>> explicit two-core limit
>> • Changed mailbox IRQ allocation failure from panic to logging and returning
>> • Shortened commit descriptions, removed Codex attribution, and adjusted
>> source credits and sign-offs
>> • Kept the clock polling patch and CI20 defconfig changes unchanged,
>>    added Paul's R-b for patch #1
>> • Updated the kernel baseline to include additional upstream fixes
> 
> You should also have a changelog per-patch, in each patch's header.

This seems to vary on per-subsystem basis, for netdev where I contribute 
the vast majority of the time, putting the changelog in the cover letter 
works, but I will do it on a per-patch basis next time.

> 
> Your patch [1/3] has a Fixes: tag but does not Cc stable@vger.kernel.org, so
> you'll have to send a v3.
> 
> I reviewed [2/3] and it looks good to me, but I'm a bit concerned about
> Nikolaus' reported issue.
> 
> Thomas, if you can wait a few days, I can test it on my CI20 and if it works
> report back with a Tested-by: tag.

Thanks Paul, yes please do test it because I could not reproduce what 
Nikolaus reported, that makes me think there must be additional 
configuration options and/or patches being carried that could be 
responsible.
-- 
Florian
