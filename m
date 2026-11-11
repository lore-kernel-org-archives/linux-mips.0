Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424890;
	b=kSnIllMjVwHJcBOUwiPyqRcDI6H2q0st86Y2yn86CjlRZ208BFZBlemUa5tqjhz36Ghh
	 ATkD9Y+JQEk7TmlvfY1kma0IjTfGxY8HbN8db8VM4RXgYhpRIMkCZAU945gXAf0PUbfBF
	 6N+Xsf3W1oobQM1RIGj1zhVcam+hE2JMjWnGAEsfs0MOTxVSgbtOqHzSh4vue46pCUKDf
	 XfvMEgFTDm90ppsA29mLupj4lCvVPprbZFEgC2WO7QQeEzE7ghPSmRRdbKLIIKVdHIiLO
	 rStvOjDLztJ1Vmh/O9Q61v8h42yWgUCJ/Tu1hbxpENnobpWcgsDH2rb5WfUT+EYSKMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EOz/+k6Rphfauu1mzh1ygpzQgMQ6Co5lqmSQNO16YRU=;
	b=WyTd/t3KpIye5i8RaZGHLMaItIgD2BLpuVxCESLhxHsMMMyVJQQEo9iHkYCP4ZC8R15N
	 +FIcjboI1Ob1WIfju3ZX/iDmdxaOZqRNpFZvCSzdNv0V7xkY278+0bk54SA5s2ym9brrk
	 SK+Fjo2yQca8vf3tV/kk+23CYH69CQdIOza2UdzcTg/rvVCWkAbcGD303eCqRdWXRUtmi
	 WlBYFCOyiFixIStsTVZHPqtdm55+leRXJrZa5YN7UC1YJYKxuSblyDdUsIeuWH5tQCFSy
	 w7e1avQdxi758IxF8iQGv8Jj5Cli69UnqljNA+mlxpHrYkdvuMaJzrPQXd/fqX4TMAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0aNYUXD;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1A2606A327
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 19:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1A2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0aNYUXD
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1788077a91.3
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 11:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424889; x=1795029689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOz/+k6Rphfauu1mzh1ygpzQgMQ6Co5lqmSQNO16YRU=;
        b=t0aNYUXDdRAZpqsbOIRoanjkWthLrq9de/FZxXADbekc3TgpX5MGsP0isyhoiLOqHg
         04lnghKOUMfOOHWfuePk6lKRbCLcRBcNrmM7q529KZNdIGKrJNCUQnGo7ndGsSEBf6Rp
         QssCN7HeBGbLIG2BwTcpJ0OtCo0ikqLkYlngBgW0R78Asv2OI1UtWkQ5dNkACWhvPKiQ
         MnF/2AP9lPuNQFQwAR5etpUQ3+GU6/eSb6EkdVxWs4s8DZD+RpgXC6DwpmIUGZ0PT8UN
         TErDiRt59CF6DjrlXofNjc5t/3SiBT7qwPf28HtWRhUTbONWCjDln5BjHvWJOLPKBsr/
         rIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424889; x=1795029689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOz/+k6Rphfauu1mzh1ygpzQgMQ6Co5lqmSQNO16YRU=;
        b=yF7IKzOZtzvEJmuLpcFog41JNYP2zYFmeLTsVkTiaUGGfp40KXHKoogI64ioe62MQT
         bxDbIyYHNkp09HCG0EwBwBYRSYuOlZuJjIUIvlBS0whkLyh2kSQZOKGV5OdSi/nh7CaP
         T9NN1QEJrJByvHbclAMMWlV6TEArJ3fLn9BZZW97NPwyMmWQ01YbzdwH+m4LkCv5i/Ps
         k43pCssQM4gFajpVHAPHUm1yBt6OZ/yxSebkEWJiIOq+Q/lsCZYC5BzSBAesnUwiyXF8
         KAOFX6x32ig0gqUg0EGBV7Eq1nOKxDBhCo0xCQ2VJAjneMpe3Yzy4Wb9QVWwPgt+tGPo
         4/8Q==
X-Gm-Message-State: APuU4Z+EaCtBBs7sL1bgGdZsGm31VOQIvPbMV+7VeP+pEMC2CbQrHCWr
	MufTBGvAbXisyHW18gzH5E8ZoK4CE7WvS/RrhjHM7J8z21Mq2wTrE0oM
X-Gm-Gg: AYBFou3P8H9SA6fyK9vDGmHCUTizXRnSSSnUODUt9XSe5q6tU5xJbNN5pUZCuEgGWl8
	QQNlYldwx42PLgxOIgvF8UwW2CydZIhHv5umhsqAzZagea4x88fAb8JkPEwLRVp0tcoEthUwfyl
	PDZ84tNW5AoQgxUJxgHj0c3caqiq8GNkSrBRCfKtl167vBfvEknaEzuhknPa0twJR3v//dqofxK
	ky2lVa10guF/Oy+NkeFYE/9vA2MmqQSSy0rOpVFZeLAbKEuoCtmqqZdlCOPU72GQB2GhON7auV7
	nH7RgR0d468hGPlYzMtvtcITaSJ8dCcoRXwHhj2cdwGUr+dpf9EMLNP6y2RL3JVc4+POKFjaHlU
	L7oH0gAxPxKGJrceeApPRd1Hh+/PXcfLelW04JpjIYmprVcSFA+FQk5TWlNAiDxZpKFk5KqrNl0
	y8GuUEqw9q7ksvI+i0Np8JzfGwEhpsxXH60Za3xPo5mau+SyWyip55ew97uZceuQUwZEB+VvjVm
	ZM3/hYT/WqVz4NcFzuCTd3gwO4BmWHJjI8K9P/7Hs7GAeGmT+BNk5vaIZcNcrny6AuRiprj5msd
	W+Frxu4IaEwl686wl8jP+a+1DnBjsyEzuiPQsTdf2F2W85qTJBnTKOzmmN5exIG84SF7iwOXhhG
	uFw==
X-Received: by 2002:a17:90b:57cb:b0:3ac:7872:d1b7 with SMTP id 98e67ed59e1d1-3b182eec0f1mr3136688a91.32.1794424889401;
        Wed, 11 Nov 2026 11:21:29 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42a4csm596583a91.4.2026.11.11.11.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:21:28 -0800 (PST)
Message-ID: <dd549ba7-8c19-4c77-aef4-b3607298f6b0@gmail.com>
Date: Wed, 11 Nov 2026 11:21:27 -0800
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
Subject: Re: [PATCH v2 1/3] clk: ingenic: Poll JZ4780 CPU1 power status
 atomically
To: Brian Masney <masneyb@kernel.org>
Cc: linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, hns@goldelico.com, paul@boddie.org.uk
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
 <20261110043131.1985993-2-f.fainelli@gmail.com>
 <179442247882.1131744.13316822371180932611.b4-review@b4>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179442247882.1131744.13316822371180932611.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 10:41, Brian Masney wrote:
> Hi Florian,
> 
>> The CPU1 clock enable callback runs under the clock framework's spinlock
>> with interrupts disabled. Its readl_poll_timeout() can sleep between
>> reads, which is invalid in this context when SMP powers up CPU1.
>>
>> Use readl_poll_timeout_atomic() with the existing interval and timeout.
>> This is a prerequisite for the JZ4780 SMP bring-up path. The original
>> CPU1 clock implementation by Zhou Yanjie is already upstream.
>>
>> Cross-built for CI20; the subsequent SMP-enabled image brought up both
>> CPU cores. Development and validation used Codex assistance.
>>
>> Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
>> Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com
> 
> Cc: stable

OK, I will add that, thanks!

> 
>> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   drivers/clk/ingenic/jz4780-cgu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
>> index 1e88aef7ac0f..f5983033583a 100644
>> --- a/drivers/clk/ingenic/jz4780-cgu.c
>> +++ b/drivers/clk/ingenic/jz4780-cgu.c
>> @@ -242,7 +242,7 @@ static int jz4780_core1_enable(struct clk_hw *hw)
>>   	spin_unlock_irqrestore(&cgu->lock, flags);
>>   
>>   	/* wait for the CPU to be powered up */
>> -	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
>> +	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
>>   				 !(lcr & LCR_SCPUS), 10, timeout);
> 
> Since you are making changes here, please fix the alignment of the
> next line with (.

Certainly, will submit a newer version shortly.
-- 
Florian
