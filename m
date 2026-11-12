Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509727;
	b=Mg5W5OJ5VATU/3jC6oyDVafE0k6O4A7mJRSF3BNyNxr64tidJTCLDB8r435pmQWQpRyv
	 GLZkphl7B9qDXExaHGhQ8l316pFVSuEO5ip49hYBF+LJ2QMmS7HBLF9r1tRXwv0EjIIpy
	 WzdI30oTMb3okLZhFzqJHsDSXIJshcoy6QUIcJd6tPY5GX6lOShMHvx0BByAi6CacejSf
	 NpMOn5dj7+0RrnHWBajDqxNO/ICGZoNO4hxJBIcX+aa0cv3rv298TBie8X3hPLvzUNfOh
	 ZnDW4MSznvZm0370vRJ8pEamPvbp2L6kd1Su3O3w0ahU8g0YfYVfBkjSD/xJd+AYOTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=T97M8E+1OS922A7v1/zJrg/XyMcn9TaXRosAfSHf8V4=;
	b=ZQOm0msvLNFCFCNpddNuGvUQESzsZ7o2saFcgApIDHcHcx1vADBIElMW1Ah3u12G7CYD
	 3VGunmD5VbyJ5HuDCgUo3zaCUV80jTbZaY5sKKZFgGHGFGYGR/m5f7rCt2a/XNhH0WOGz
	 sspMbV9Vv9fc4I0e9880K6L0//DX/bpHd+vyHsrYonAhmnNuYYHUP0B50IhKUbmw2HHhy
	 43g/U6I98r3yOdtVXOo4Z2YmfnD0iwvuTlvkI0kblnWGn2zF0E7/uWOm4u5a/0XFVZqUZ
	 ZKQ9Atbvz8v9ms1iLDi3gvSKgHHsFYapAeXo4qniw07IEQ0Od/9cJrbdB8/BO15ZZUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHu+NpDI;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE88160A3801
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 18:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE88160A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHu+NpDI
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so62102a91.0
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 10:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509726; x=1795114526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T97M8E+1OS922A7v1/zJrg/XyMcn9TaXRosAfSHf8V4=;
        b=LHu+NpDI16jcjf0qVYJd5SEQguMAnZHKvWVIxXJlTA77p2KAfDtnXVy7AfTTmVj79c
         c8JI2iN6DJX+dz+sML7pMeIv2EENJLry/JEkQeSS8edeWiwrFswE28A5jPv1rlUtpo/C
         wm9MgfqSPtxsQLp5zuwW8ivvNWgeBHHv6TogXXU5QeNAcNzMOMLOjLXOW5uhq7nUtb81
         GOCL82aDJOqL8vNbxNF0GEg6gFOKT2Gn4PiE1G9XbY5k1xCOdtkJDRQ65Th1SuxKIUdl
         5311csriCm+rWv3zl+HDSAgI4UpDyQVihaByHAChJ1cAXMNwcoeTDSgzRVoxYopwSg78
         q8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509726; x=1795114526;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T97M8E+1OS922A7v1/zJrg/XyMcn9TaXRosAfSHf8V4=;
        b=qG1SprdQfvBOx9lwzXGuRM7v4hC0C5sBr+vbPG0dlIavCArzXiIAFXKQtarQE4n3a6
         R8eIJcqbE8PsMtCKjI/1vD1tUQjLEx23YWEpy7QKFtp7/Qoj7J3yRbzbUwCwxYXBBP78
         UX9u3X+ZvvdhRyrJSQ1Ub7zHI+3Oi5j062hxZtkhUpVIfCbR4yNSQnENiVSHHHkMk5c4
         wpQVrXCrWxSZ6gPPeObbZjJiZ5Eo1pPHTTJGxKGktV59ALys5P4W1qTCOZu8C7ykOb9l
         BEcQ3nGgBy1TeDEf2lNh5RUC6CM03rHAh8idqawEoQ76zV/Tmy4AUROsTR2JO7nE70bH
         ljwA==
X-Gm-Message-State: APuU4Z+ZdVYY+b6H3g6yG1S9DzvNLV+37W2cSF/iVA0VUT7eHA/vEitj
	fznm5Adgv+6cT/0sRBMwiAZ327IpVDStEZeX9xMeW9i0wORvm8F3Phqu
X-Gm-Gg: AYBFou1Y7XZvhthMuVCnlCF+1+0Ch2p4ZWoHqKt+Eg4sBqgX73qb4mfL7tlueuH7b90
	hYoXTOQQwfL57nTifqe1U65XoZ5HkoSzToZEVH9XOk+JDHnWhps4JEP+4dCcR8l8pJuyoCTLQG+
	rObFC3lO6VcESP/0Z97IyY1+IMkUJa+mzrX1SFG+vaWw1293/5qtZynyHpSLrbFLEVi/EoXXxY3
	QyOQ6kBuc2NqJi4eZ9qc9ddsCPX67sF8g5X8DFXP6/yIgYrrEHq8TtUGvEBTXOrfgn70+3+kVk1
	UWNSCGLC7pNxHXY7XZP7hAgVRClbOLJdfwPXzdoPQlleWGvTSbEA4qVImWYpvwalS9NP/uepnRS
	DW6QA13zOiaO8NbFr/oGg6ulRllcGfdjxfW6B7wP6A1q45Acrpc4vCwO/GYy/PaL+LXQS0mAUL4
	78Q6P8xos68TKz23gdlFDhjSThd8v1QdpkJJQCvPLgcIZYj8nsgbf0fcjCfSUxxDrWGwGQgUHYx
	TcA14bwRvyHxo45bnTqDnADng0wdkm/PE3lx4NXZlaq64ct/LM4x6lXyaO2utH+SnxHayOgDQMw
	8aeN46hZ244+vzbOg7hOC/RnhsCKzOI8R4SSbQUwuNwZsgXh04JlxAe2iw==
X-Received: by 2002:a17:90b:554e:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3b1b07ef11bmr29915a91.3.1794509726107;
        Thu, 12 Nov 2026 10:55:26 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm669758a91.0.2026.11.12.10.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:55:25 -0800 (PST)
Message-ID: <5836cf85-78e8-417e-9142-666afbe1d056@gmail.com>
Date: Thu, 12 Nov 2026 10:55:24 -0800
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
Subject: Re: [PATCH v3 3/3] serial: sb1250-duart: Convert to use a platform
 device
From: Florian Fainelli <f.fainelli@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2608060322360.55540@angie.orcam.me.uk>
 <alpine.DEB.2.21.2608060406470.55540@angie.orcam.me.uk>
 <e211bf3f-d696-4bc5-baff-e27b933a89ae@gmail.com>
Content-Language: en-US, fr-FR
In-Reply-To: <e211bf3f-d696-4bc5-baff-e27b933a89ae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/26 13:42, Florian Fainelli wrote:
> On 8/6/26 03:54, Maciej W. Rozycki wrote:
>> Prevent a crash from happening as the first serial port is initialised:
>>
>>    pata-swarm: PATA interface at GenBus slot 4
>>    workingset: timestamp_bits=62 max_order=18 bucket_order=0
>>    Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
>>    CPU 1 Unable to handle kernel paging request at virtual address 
>> 0000000000000208, epc == ffffffff8067f8f8, ra == ffffffff80666330
>>    Oops[#1]:
>>    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-dirty #27 NONE
>>    $ 0   : 0000000000000000 0000000014001fe0 0000000000000020 
>> ffffffff80666130
>>    $ 4   : 0000000000000000 a800000100e6f118 ffffffff8112cbc0 
>> 0000000000000000
>>    $ 8   : 0000000000000002 0000000000000000 0000000000000000 
>> 0000000001a80000
>>    $12   : 0000000000000000 ffffffff809fd488 000000004ddf14dd 
>> ffffffff00000000
>>    $16   : a800000100e6f000 0000000000000000 ffffffff8112c1d0 
>> a800000100e6f000
>>    $20   : 0000000000000000 00000000000004d0 0000000000000004 
>> ffffffff8112c1d0
>>    $24   : 0000000000000001 0000000000000003
>>    $28   : a80000010007c000 a80000010007fcb0 00000000000000ef 
>> ffffffff80666330
>>    Hi    : fffffffffffffdb9
>>    Lo    : 0000000000000035
>>    epc   : ffffffff8067f8f8 __dev_fwnode+0x0/0x8
>>    ra    : ffffffff80666330 serial_base_ctrl_add+0xb8/0x180
>>    Status: 14001fe3    KX SX UX KERNEL EXL IE
>>    Cause : 80800008 (ExcCode 02)
>>    BadVA : 0000000000000208
>>    PrId  : 03040102 (SiByte SB1)
>>    Process swapper/0 (pid: 1, threadinfo=(____ptrval____), 
>> task=(____ptrval____), tls=0000000000000000)
>>    Stack : 0000000000000000 ffffffff80cd5178 ffffffff80cd0000 
>> ffffffff8112c1c8
>>            0000000000000260 ffffffff806655c4 a800000100275bc0 
>> ffffffff8064ac88
>>            004000408112c000 0000000000000002 0000000000000000 
>> ffffffff801965d0
>>            a800000100786ba0 ffffffff80cd5178 a800000100786ba0 
>> 0000000000000004
>>            a800000100275bc0 0000000000000000 0000000000000000 
>> ffffffff80cd5178
>>            0000000000000000 ffffffff8112c1c8 0000000000000260 
>> 00000000000004d0
>>            0000000000000004 ffffffff80bf0000 00000000000000ef 
>> ffffffff80d171dc
>>            ffffffff80d17120 ffffffff80d25658 0000000000000000 
>> ffffffff80d50000
>>            ffffffff80d2f928 ffffffff80d50000 ffffffff80d25698 
>> ffffffff80cfcecc
>>            00ffffff80b84428 0000000000000000 0000000000000006 
>> 0000000000000006
>>            ...
>>    Call Trace:
>>    [<ffffffff8067f8f8>] __dev_fwnode+0x0/0x8
>>    [<ffffffff80666330>] serial_base_ctrl_add+0xb8/0x180
>>    [<ffffffff806655c4>] serial_core_register_port+0x174/0x8e0
>>    [<ffffffff80d171dc>] sbd_init+0xbc/0xf4
>>    [<ffffffff80cfcecc>] do_one_initcall+0x64/0x150
>>    [<ffffffff80cfd284>] kernel_init_freeable+0x25c/0x30c
>>    [<ffffffff809ff6e4>] kernel_init+0x24/0x118
>>    [<ffffffff80112d20>] ret_from_kernel_thread+0x14/0x1c
>>    Code: 67bd0010  03e00008  2402ffea <03e00008> dc820208  67bdffa0  
>> ffbe0050  ffb70048  ffb60040
>>    ---[ end trace 0000000000000000 ]---
>>
>> -- where a pointer is dereferenced that has been derived from a null
>> pointer to the port's parent device.
>>
>> Since no device is available with legacy probing and it's not anymore a
>> preferable way to discover devices anyway, switch the driver to using a
>> platform device and use it as the port's parent device.
>>
>> Use platform_driver_probe() because SB1250 DUART devices are embedded
>> onchip the SoC and therefore not that straightforward to remove.
>>
>> An unfortunate consequence of the switch to a platform device is we now
>> hand the console over from the bootconsole much later in the bootstrap.
>> The CFE console handler appears good enough though to work so late and
>> in particular with interrupts enabled.
>>
>> Conversely, only starting the console device so late lets the port
>> initialisation code always use fsleep() for transmitter draining, so
>> drop the other variant since it is now dead code.
>>
>> Since there is one way only remaining to reach sbd_init_port() now, drop
>> the port initialisation marker as no longer needed and go through the
>> channel resets unconditionally.
>>
>> Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers 
>> to enable runtime PM")
>> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
>> Cc: stable@vger.kernel.org # needs to use .remove_new for <= 6.10
> 
> On BCM91250E (Sentosa):
> 
> Tested-by: Florian Fainelli <f.fainelli@gmail.com>

Could we apply Maciej's sb1250-duart patches because this is preventing 
the use of those systems while everything else works just fine.

Thanks!
-- 
Florian
