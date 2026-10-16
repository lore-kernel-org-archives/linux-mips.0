Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1B82DFA3A
	for <linux-mips@vger.kernel.org>; Fri, 16 Oct 2026 21:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185386; cv=none; b=dQvJIyvXo4axk7lh16VxAHXmnfN87PEwyGNrYphJTzma8xTNYLCoTnf2hvnLlly9HCJDygj0InASVefk55xg4Wffs75e++fwwUrc4nKkZCY6m001I2xwpD9J4VwIa1Aym5HoHPsmLZZ4LjHqUEAaYWSuFvauv3cs6D579Nf6eVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185386; c=relaxed/simple;
	bh=7/bNxtRll67btWwDxcWS4IqKYbzxFfp3PoRRMN/9Iqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIllDiqgvnaCYRNannFnSgJv5Pri0IpqYvRCK7zxGZnKtZC//ehgBWVp+rgdhK1JPrYrZ4jts14lgsTQsZ9ixqNfdB7l3Nz4hGYzcqiZ10QmsdrAA1chHrhepNqY734HkVG9NmK1aB9RdB1N6Ce8g3bawj9Fzw+KP67PRn/x2O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McnByjtK; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McnByjtK"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93cb9e9405fso17835885a.2
        for <linux-mips@vger.kernel.org>; Fri, 16 Oct 2026 14:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792185384; x=1792790184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lo7z+unZo9FeRj233bs5npQNwPD9yfSMG4t6HAWiNzA=;
        b=McnByjtKXhJrHA6Yuk/PyALMVVOmwCkKetAsro0/KWtwVo8fc1QKeO3b5EoIsfsoPh
         erLmWlT0xgqI/auIHnsQv0Ko+ha2tEwPV6vBuBCuHbl+PRxtDOz/aNkGWgrtent98Sla
         Ju03+pVckLzd2OoMlxGN0N9sYBFW6eIk6dR1gA8G5k+IXp+12yN/5vDD8Ic0mTxKugdZ
         2CYtaZrq+fdoKNW//wGniMOlhVppWxSqRhs24wb0EpISXfRzTVlSQI88ZhNSlqHcFd2z
         6L8pWefT/Cd06BxqGx4IzIWAW0svktJ847aFmNeFwfKh6rNdKA1XTGprULwoMxOs0i/k
         u0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792185384; x=1792790184;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lo7z+unZo9FeRj233bs5npQNwPD9yfSMG4t6HAWiNzA=;
        b=bl7nM2aubuk4+c2XHcdRD1ESIjTi0RrKidJvBcN73OnP939gRp6kFGriesdScv3OQ2
         jZA6DjJV2J/kexbnsv5sExUmwXvtVGj3oZiRyEzkxM8Tyg/1DoZsjs1XWPRxLOdAr4dJ
         H6oNut2QxV04xTErKydXm4TbrJ5Z5sHFwB9PgRNxmzrBljt7DPjNa6fsETsbAUuP3Vqd
         O4+M6yrJTf9fEQ2CVL3v299vdz8Ed99A2Wya+MncGsVRKH23ctEg35QbRYy0iL0yiMGC
         Zy1ur78QoiuzGuUhkdB75SSkUEKn7TRF5+rMlN6FtwksG3UbH5qyTS7h4NRBMzPrn2yX
         yuXg==
X-Gm-Message-State: AFq9FYIVsnsltW18ghevBldpdSqFaptEq2kX3tNGDHwN6kA8uwtKjRhf
	uiIqnthcl9yF3iUe+7rnLwnJ+Zw27+Cyxzz7zc+cB6BEFdoIxeOWM+gI
X-Gm-Gg: AYBFou1iI6gDSEMm5ohaBkADODa5CrsgTWEUiIH4l2PUxD0tw+6pT7DfonGAaNagowQ
	EqC034sfqr0Kkf50Sk70A9diAU0C98MJRvU8dwv6+1bmIslJGIpTPN7Hd6+NgVrCg0bUPF1lgnJ
	qX1ms/s/jYSviLi4sEFYIEA1WD5FUH/xQybWq0L2FqQ/Ic1gMfYDf7YxL7IWzvwIhuwCXXwZXFj
	nspJdhmChI0Dv8xCgu22N3o9MJsCgj1bQd8E7awuBEDEvC8iyM1bgNWZ4wqQP4uzE/sMNkljRJ6
	/dWscRszRXxlFepVfRIPANWbS8aJ63SYkgGhmyeiCMz75CURmj5SHURMygt8mW8AAVhCvXeHj1+
	YvEIafsiEm4FwXSDL6xc/p3dLZACd4m+XKUsq7hbfgMz49/Vkp7LHxduvKzotPznniUht/D4/Ir
	Uelo+2UBstMTCAITHsjlGDstVG3WcM+UJns/4XVlbM3wV/Fb0W1rdb3dMfBHb9wqDfVb6tYn71+
	yYyZWAQmYfBPlxSn2xmv00a
X-Received: by 2002:a05:620a:6410:b0:93f:8dc:a710 with SMTP id af79cd13be357-93f29df845dmr166724685a.80.1792185384429;
        Fri, 16 Oct 2026 14:16:24 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a0cf9a0sm306303185a.2.2026.10.16.14.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 14:16:23 -0700 (PDT)
Message-ID: <fbce6f14-10a0-4d4b-99c3-be8e7168c952@gmail.com>
Date: Fri, 16 Oct 2026 14:16:20 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: Alchemy: Save the Ethernet address before reusing
 PROM memory
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mips@vger.kernel.org, manuel.lauss@gmail.com,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261016173157.2083454-1-f.fainelli@gmail.com>
 <atJ-8ttrdqhiRCp2@casper.infradead.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <atJ-8ttrdqhiRCp2@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 12:45, Matthew Wilcox wrote:
> On Fri, Oct 16, 2026 at 10:31:55AM -0700, Florian Fainelli wrote:
>> Alchemy keeps pointers into the firmware environment and looks up ethaddr
>> when initializing the Ethernet devices. By that point, memory allocation
>> can have overwritten the environment, causing prom_getenv() to pass an
>> invalid pointer to strchr() and panic during boot.
>>
>> On the MTX-1, the struct page layout change in 9ddb3c14afba reduces struct
>> page from 40 to 32 bytes and exposes this unreserved firmware memory.
>> Bisection and boot tests confirmed that the parent boots while the change
>> reproduces the panic.
>>
>> Parse the Ethernet address during prom_init(), before registering RAM
>> with memblock, and keep the six bytes in kernel-owned init data. Return
>> the saved address during device initialization, preserving the existing
>> YAMON formats and command-line fallback without reserving a fixed
>> low-memory region.
>>
>> Fixes: 9ddb3c14afba ("mm: fix struct page layout on 32-bit systems")
> 
> This is an inappropriate Fixes line.  That may have exposed the problem
> (... 5 years ago; how often is this being tested?) but it's merely
> restoring the layout to that which existed two years before that.
> The correct Fixes line wuld be something related to this driver.

Fair enough, because this landed as a the first bad commit, I used it as 
is, but you have a good point about this being a pre-existing issue that 
just became apparent with 9ddb3c14afba.

As for how often the platform was tested, not very often clearly, but 
that's about to change since I have it restored in my test rack.

Thanks
-- 
Florian
