Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742156;
	b=LbK8WqMLZROPoGaOK7PkTJxrKQTl8q3DvviNthrbgpGWbEFDGHwd3HUfNBzqed4m3DGH
	 3ltdcqALYzaE31y7ZtEaefKM9rdb96+nTNX7cWF9Wo6/eClcU46DCdAKkpAds7cZnwiv8
	 sQldMqfOBMw7m2/OgO/iYSMUiGL581FoHmjjldr1VATuxrzcidJikNQ5LLRBmwNPKkMbN
	 zc5tpvF/OTqAtZNWnl4KF8u5hUCmR5PqcndohzN9pWSrCpNyFENytRQkr4rW7miAfPE64
	 4LF5rpEEtLkhqLkZQmNty7i7avcvBaaA20WLK4FoW9XEfYT7f2rMQHzRqg4Ofp1KZxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=azPPo8H7+DKD17rL0rWwBjVEKBbc6amwqtN9WdKwMgc=;
	b=zh3ZCp2QcoTcgWU0PoJ7zP3RAS8VjG686H9DiFTAzH4cN5E6KsaynegxvzI1U4R0B2FV
	 qw+HOucLoRLDq95AalwEEHdyEzUNjCbiW+KKYOrGNrkDxSqwFv8XAbOwE1B8KlamzwvW9
	 fpFDgsGFFoKxZ45bRVE5A3vSoy+m7mgwr33hNWgsZyKio5zeE/2uhfXz5jq1dGS0xOvXQ
	 Mi9wddNqpi4baSYAR9A2uAe2hcFBQjgwZFFbDF9S4gZYzlc3Cntr73ZiI03JZgNDq66+r
	 yrvtFWjsn/K2DAVIh6H/wD7eMGCATBJCiCkVsGs7Cb9RavFldTitvY1VHqewXUkrT+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uG0kV9tr;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAEA606A333
	for <linux-mips@vger.kernel.org>; Tue,  3 Nov 2026 21:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BAEA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uG0kV9tr
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b244fb7fffso139235c88.1
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 13:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742155; x=1794346955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azPPo8H7+DKD17rL0rWwBjVEKBbc6amwqtN9WdKwMgc=;
        b=uG0kV9trF+tpH5NGG08X2nXLCYrNuuLYjRzsFhR+KujNcKwgdzFodzwzUBThLeO40q
         bFtlq26uYDUXkvc+hIE/0/HJE0PHd8x92/AmZQEDmueeUixdh1+ORtHEJtJym0HCvpbk
         O1FRmG1pWdQ+4Y8DQD9eF9sO1K4IZvEk2XebYJVfvCd2haUghPNIfioNcdJCeSztKlgH
         lx18/3kxQ6WxcLja3A8ZpVfnwCY0hBGaYu3BJhU7I4Pk/omDVcKwZ1WvjsK3dnLp6Jy/
         Rhpn4FhzTB865NMRltmKeeOwlgPwk3q+Xe0QazrIkT7TyVn53BjOE4Jd9dgRsE2Q0myk
         eESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742155; x=1794346955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azPPo8H7+DKD17rL0rWwBjVEKBbc6amwqtN9WdKwMgc=;
        b=afRKR82XzcZXeXVwhq3cN8O6MZ/BNEiaowx79zNiTUx3u23vt3FZ2kWDXY+0Cb2e6K
         hGBVnjknfz3bk9Pl4kE0UGmmxVOP6O8a0jzTg88tUYdZPd/JlBmSNjrWf3Zf2O+BRvuY
         E2A7gFgHu2RoKuvr5x8iKpsljnESoeWUPYdoWcDHVrcTw4un5Dlhz5pnGQjGArTq7vX6
         kvoAlwMvn+DjT/TyzDQLW1YngZn1LmFxRmCxUVC50hN/F61lVBlwUdHC34g4LSRDirSC
         zxhmjr1zlY1A5/ZM1Ev6T9AEy01RqgYfa/z9UBbkGszYFf7xgFPc5QjkSJP3A0j8x2E2
         pjDg==
X-Gm-Message-State: APuU4Z/XCyw4+pnBaUKQTg0UeE4IC0z4jymp4eAEPnHmaB0jdmJb+htp
	0UBxqkchUAsbRntwW7v4/jBz3KuhxLmkGv3bwx8XcYZS/qJbyXxG87Ce
X-Gm-Gg: AYBFou3zIg3gTvkLvcmXAwQxrFGnLzsdBzq70u8cOc9aXPQTZaYLUx8AWqsyYDTY70n
	RVJVNhY4XbMi8CgcmKMBDOdDXRrlF1URD1lxckDsfAJQGvVTUILFosmrNbOdK/LOmoldyGdqHNc
	wZOVYz47ZEMWCawAnCJ987KxV8rYC4BoVOLJ7C2BdUCuKZ/wqmcvVAdq4oZAp99Xguw1pHqfqdv
	ceDr9aAaHy3UwTl+N8V9qNlgrcq+htwyoeaV8kmsSIvd9BBqFKDPSHdP6t0tADIOhXLPdHVm7Kg
	ZTzbdVolg9m8+Af4nBspWrEoEkUJ/ozv7YVOW/AV4ikom6v0vP2Dh2Q6qPL5Qr3yPYtkGxB0Dqp
	2HU31wZGGO0vXE/G41fmB/FWOUZnFWMruFyfxGNUNNmIgw1+EolKFOzk6bcJu9Zq9szwS+nBw7k
	u5m7DpWGBhxIXsa5GkViQoZdA4RCAk4+uUoPJk6T3nwwR/SXiavbsNd5H3Omemw9YgTFTGAlvw+
	sQReiKbD4iGXni5inqyP6oYQavm8OYEkv+AJrH9wpoiSODEmGaoX0oDCCzhQqvCZ84wtI41pTOM
	Y34m92DvyJ1NhHS4y5jCURnz3N17tGDr9hfNnp6PoAppeO2xv3clgms=
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr20007496c88.26.1793742155167;
        Tue, 03 Nov 2026 13:42:35 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c69c3fsm1460505c88.20.2026.11.03.13.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 13:42:34 -0800 (PST)
Message-ID: <e211bf3f-d696-4bc5-baff-e27b933a89ae@gmail.com>
Date: Tue, 3 Nov 2026 13:42:33 -0800
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
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2608060322360.55540@angie.orcam.me.uk>
 <alpine.DEB.2.21.2608060406470.55540@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2608060406470.55540@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 03:54, Maciej W. Rozycki wrote:
> Prevent a crash from happening as the first serial port is initialised:
> 
>    pata-swarm: PATA interface at GenBus slot 4
>    workingset: timestamp_bits=62 max_order=18 bucket_order=0
>    Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
>    CPU 1 Unable to handle kernel paging request at virtual address 0000000000000208, epc == ffffffff8067f8f8, ra == ffffffff80666330
>    Oops[#1]:
>    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-dirty #27 NONE
>    $ 0   : 0000000000000000 0000000014001fe0 0000000000000020 ffffffff80666130
>    $ 4   : 0000000000000000 a800000100e6f118 ffffffff8112cbc0 0000000000000000
>    $ 8   : 0000000000000002 0000000000000000 0000000000000000 0000000001a80000
>    $12   : 0000000000000000 ffffffff809fd488 000000004ddf14dd ffffffff00000000
>    $16   : a800000100e6f000 0000000000000000 ffffffff8112c1d0 a800000100e6f000
>    $20   : 0000000000000000 00000000000004d0 0000000000000004 ffffffff8112c1d0
>    $24   : 0000000000000001 0000000000000003
>    $28   : a80000010007c000 a80000010007fcb0 00000000000000ef ffffffff80666330
>    Hi    : fffffffffffffdb9
>    Lo    : 0000000000000035
>    epc   : ffffffff8067f8f8 __dev_fwnode+0x0/0x8
>    ra    : ffffffff80666330 serial_base_ctrl_add+0xb8/0x180
>    Status: 14001fe3	KX SX UX KERNEL EXL IE
>    Cause : 80800008 (ExcCode 02)
>    BadVA : 0000000000000208
>    PrId  : 03040102 (SiByte SB1)
>    Process swapper/0 (pid: 1, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
>    Stack : 0000000000000000 ffffffff80cd5178 ffffffff80cd0000 ffffffff8112c1c8
>            0000000000000260 ffffffff806655c4 a800000100275bc0 ffffffff8064ac88
>            004000408112c000 0000000000000002 0000000000000000 ffffffff801965d0
>            a800000100786ba0 ffffffff80cd5178 a800000100786ba0 0000000000000004
>            a800000100275bc0 0000000000000000 0000000000000000 ffffffff80cd5178
>            0000000000000000 ffffffff8112c1c8 0000000000000260 00000000000004d0
>            0000000000000004 ffffffff80bf0000 00000000000000ef ffffffff80d171dc
>            ffffffff80d17120 ffffffff80d25658 0000000000000000 ffffffff80d50000
>            ffffffff80d2f928 ffffffff80d50000 ffffffff80d25698 ffffffff80cfcecc
>            00ffffff80b84428 0000000000000000 0000000000000006 0000000000000006
>            ...
>    Call Trace:
>    [<ffffffff8067f8f8>] __dev_fwnode+0x0/0x8
>    [<ffffffff80666330>] serial_base_ctrl_add+0xb8/0x180
>    [<ffffffff806655c4>] serial_core_register_port+0x174/0x8e0
>    [<ffffffff80d171dc>] sbd_init+0xbc/0xf4
>    [<ffffffff80cfcecc>] do_one_initcall+0x64/0x150
>    [<ffffffff80cfd284>] kernel_init_freeable+0x25c/0x30c
>    [<ffffffff809ff6e4>] kernel_init+0x24/0x118
>    [<ffffffff80112d20>] ret_from_kernel_thread+0x14/0x1c
>    
>    Code: 67bd0010  03e00008  2402ffea <03e00008> dc820208  67bdffa0  ffbe0050  ffb70048  ffb60040
>    
>    ---[ end trace 0000000000000000 ]---
> 
> -- where a pointer is dereferenced that has been derived from a null
> pointer to the port's parent device.
> 
> Since no device is available with legacy probing and it's not anymore a
> preferable way to discover devices anyway, switch the driver to using a
> platform device and use it as the port's parent device.
> 
> Use platform_driver_probe() because SB1250 DUART devices are embedded
> onchip the SoC and therefore not that straightforward to remove.
> 
> An unfortunate consequence of the switch to a platform device is we now
> hand the console over from the bootconsole much later in the bootstrap.
> The CFE console handler appears good enough though to work so late and
> in particular with interrupts enabled.
> 
> Conversely, only starting the console device so late lets the port
> initialisation code always use fsleep() for transmitter draining, so
> drop the other variant since it is now dead code.
> 
> Since there is one way only remaining to reach sbd_init_port() now, drop
> the port initialisation marker as no longer needed and go through the
> channel resets unconditionally.
> 
> Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # needs to use .remove_new for <= 6.10

On BCM91250E (Sentosa):

Tested-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

