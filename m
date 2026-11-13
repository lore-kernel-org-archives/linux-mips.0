Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606765;
	b=JKH4FrsFN7tJn2VlI/IEbpTPffqimMyTmyXziE8tpNrpNSrA+WEXcvJbeOXdH6L94XmP
	 Hgv4ssT5zyh6uFaitLupKjR5d4ArJL+uWaOhvi5BREWGtfQGYJdPCKw9ZLpd9C4s9LLmx
	 rJ7WN2LxfGxaNgvzb2GMgd/dKcaa7/Mw1ezu3W7tcydi3W2bK27muLDMBAbrtFZLpPscw
	 1E1aWxr0YxVCZDQODn6zchbyxJ3QiSzdt/voNEgK2zQ8WU00B+IJa6H8M6qVWFRsy+ATG
	 QTMD85F9mMPzWfkuvtjUm6wcwNf0PtbxiOZsHknLwrwduqcR1LVdcUZzxvSgaywNWcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4aTwoA3JVNFzNecITbnhpCA3ymHcrWrY5aiKQKruUmg=;
	b=OvIgHxAvi+/Aau9wiAJX7qC01yvKiglJ1Dq6TEdjAdxRBg6t2puN8/7hG1077oWuz5Gq
	 OteLc9MW4zmxAw6oVpytLMXxlO8dk+sT0RAcJPfBBKVGNDQ2JezHccohF3ziXK/VaqK9g
	 h1L7AWa3Aw8pM0bemftFdGYFIo9V2RYcZPB5z8/qrQOsis9p9NCBcqWLNL6MiQSYebTDw
	 F/zPlg2PXxJhozn9s8EVJrTj0Kb4FuKYMqKmGQ3ajVQKXOLJFkrUACay+47kMHn/mKB5P
	 t0IXpG9dCQeNIEPG9HQBB9mmBhKuIjszekgvvk95eczuffaeGwcLYkBhNCeOsmWLw5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRzdrfDm;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83F606A338
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 21:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C83F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRzdrfDm
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so4244229eec.0
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 13:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606762; x=1795211562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aTwoA3JVNFzNecITbnhpCA3ymHcrWrY5aiKQKruUmg=;
        b=NRzdrfDmke6+7URTy6cA/bYqVIwAsHCBYZRdEPsPoxiZBgtPoIol4ds1aDg5PEBrCZ
         0N2UA/seMm7ZsPAE/DvaOwbrtMdUAzFlxbt2vO/G3sDDiQhU2ruhK6Sl63qghZ//1Rdf
         RO+JRPW/RIc4fyTFq2uXz6lwysk9jP9nkLhAGyJxxf0BAmWs4osKNnHJq1b7WUUVKJMQ
         PTFgy9LU2XoQNOY5YhQ9dfXAEfHK2mKs09I7owAbB0ydXmGzL+pWbpFmvga7LAMGPMz9
         mG7U6Odb5qOvTA2xLi8Bh/ZAq8DqjFswbVI08K0cba/B1A8rQ1ULSDqRj4+OdiTS2u4t
         Qwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606762; x=1795211562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aTwoA3JVNFzNecITbnhpCA3ymHcrWrY5aiKQKruUmg=;
        b=CHiDOB5j5TQdrqk9Y69wfhaJ4HVsPtnGr53t8h+MfQhn+N+G+EbaxuXRomrKpnUdB5
         eUaMUOZsjtGyKP0D6or1HkitiAnVNt+36goxUs43NpcIQdMzDqOcgTZ4yuWMwZuXp79J
         Vmwy1ztJA7UiBiiwx9rZOPU+Gzsd1pE+xbOlT3RN8oiXNB0GSUQE2Nz6WcErDh4sKMEV
         AsIcNkDF+Zs1lLyg4cOoQVEv/t9F2UOtAeUSepTvdD6OAUFkfZrCcjzo98+cHBgJv5lO
         i1reka+iVAd80pNX+8YX61uGSumMuRlwqus3fiX0gHgMofHo1Lyh8OgPLwYD2Qk8hQfu
         EFyQ==
X-Forwarded-Encrypted: i=1; AL+hErEtgLSYi+xfkCsqdYfWSrH+Cb0NlMonOPkgf3Hcb2yTGV0jFqnQHLfiamvKbQd5WGUxIXZQ2ij7WrhA@vger.kernel.org
X-Gm-Message-State: APuU4Z+8OUx8YWItUmkFKZRkU0KK7wTO1NCIuE5vDuNIltRarN1WgYQA
	xUbw3341FgozyR27vPTjHMT+LotlEpH4D7uQKkQbu5spDJTZnlVNezeaFhDgYA==
X-Gm-Gg: AYBFou10CHYN2m7B0bFhFxq8Qmhcnv4ebwD6UUaXD7z7nPPaPbhziVQh/mRJXSpeAws
	dH1h8jwWg3ePGS3MkfW/dcteigDz0cjsm7CCS8RDUba8x+lrkhBabhpMrkrKwzZKFd9Dj8QZ0ec
	diSZOCZUOy0y8jdq8ZPfDEky0AvZF1nGTyF6LZ4msRUPTF6hwMsC9IMBTMtMkawGBknq7HSWYP0
	g98JzMxsAPdxC/9FILAQvwfSJiGLS/YWKSbFUuEbivFJZ9CkkeZ2Fx4oQd46W1wDfUr0IMHliPQ
	VQ0FlYf/PRlWA079KMEB3NM/75vy2TufZmTYUk0YIvycwHMJBIpBA+1xxYCkD/q/+DjQSt2tvkh
	OK/+1reJphOEaS/C4XhJYOEBiMd/7rp3Tt37DS/hj0na3pvn0PDr1NvOCpMWAmEDhlwpRwZBWC5
	a3CjoIIgIKDqqKXTDAzbf8UY0+vkrckLpsI9QrKsUbY19OOP24TGLfJOvTB6ujEfcAX7nLrCd+W
	m1MGOHfxsHt9fKn35OczCYkTCaM38HNt68GL0FVpOb63V8w0QRYV6qL4PCsn7rY7ssfwvRJTtHJ
	QbYCg4W8jUyHrAN/9+i2hFZc6DfICQ9WREMFYCIuINupCYC7PMX1Z8qe
X-Received: by 2002:a05:693c:6384:20b0:36a:1709:458 with SMTP id 5a478bee46e88-379675fc98cmr3524667eec.27.1794606762096;
        Fri, 13 Nov 2026 13:52:42 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm11022781eec.28.2026.11.13.13.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:52:41 -0800 (PST)
Message-ID: <bf28da39-23ae-4d17-af17-fe46177d8c80@gmail.com>
Date: Fri, 13 Nov 2026 13:52:40 -0800
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
Subject: Re: (subset) [PATCH v6 0/4] MIPS: CI20: Enable SMP with two CPUs
To: Brian Masney <masneyb@kernel.org>, linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, hns@goldelico.com, paul@boddie.org.uk
References: <20261113190836.470937-1-f.fainelli@gmail.com>
 <179460306211.1364508.5876481329838567672.b4-ty@b4>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179460306211.1364508.5876481329838567672.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 12:51, Brian Masney wrote:
> 
> On Fri, 13 Nov 2026 11:08:32 -0800, Florian Fainelli wrote:
>> MIPS: CI20: Enable SMP with two CPUs
>>
>> This patch series resurrects SMP support for the CI20 board. This was
>> submitted back in 2020 by Zhou Yanjie.
>>
>> Changes in v6:
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/4] clk: ingenic: Poll JZ4780 CPU1 power status atomically
>        https://git.kernel.org/clk/linux/c/2c45b7e1e2f7
> 
> Best regards,

Thanks Brian, I will remove that patch from future submissions.
-- 
Florian
