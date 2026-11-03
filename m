Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743577;
	b=xNv1Nxp5/9YBKojcT0cOHWr0eqGW/u10UazEaVZxqhKyDU9PKsGb2z8Z1GYNVKAnKqf4
	 f/NGeuiyoxeTF3yBd4QSIx/PuinUM1t8flhKGmHqz4ncBTQc03QyR5wusmVDG79NpOVXK
	 mcMHmzAJpT6XuLut8g/m2c1/yJ7pIGSWtsDMz6rVseQtpFOGyX9RgIs13bUZwbgRxc0Zf
	 Po+aLvQaCwlphIK9JFDo18rUCREWkcS+vunbwFXgevRyjzpBYXuIZ5P2MWebXQvha1tp0
	 GGVfXBSshnN8yvJLC9EzXw/maCBk60O3/5b4ex55swajddeo4D7DqjSlhDQR65qGyuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hv0Uio0iKv6YWg4emi8XyGAuTMh6jvPk4JOtOEL/kqI=;
	b=1dzwI0p+V/sjHELr6PPp+vjlYRfVgyZWkSvKy44EkEqygehjRwBc+664a1e8kerKCaSg
	 qDsXMEUIy7qQTLP6dFAC4NglfApRGojxcbTw95QFGEIpTjVtdDAudLuqnpomL80W8NFh9
	 zXB6WllnlCxu0iS0ZxQJPf6i7aHvf8S4d/TF++Q1rlTZ0UGTbXgNvCwCtg28sFZtayB4Y
	 JpIZgSgKgztXThTRVKUe+m5gJgSyaFijlCEkdZzR6uteFQS2HqzUoYgY4A402G+M3penE
	 YuWR0cUNi7vb6rTnZfZyXsW70YXPverU9e6aeYnbdD0ymiU/kfPxdNoBuFC7RK9JTXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWPaHvnX;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB77606A32D
	for <linux-mips@vger.kernel.org>; Tue,  3 Nov 2026 22:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB77606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWPaHvnX
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5364648ae07so64571cf.1
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 14:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793743576; x=1794348376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hv0Uio0iKv6YWg4emi8XyGAuTMh6jvPk4JOtOEL/kqI=;
        b=VWPaHvnXR4QbSC5IyHVKu5R88jNYS/0KrZk5ghuorRGJARgbf8FsaNzpnVC2zLJEdX
         pa9OJ3WVP+4YhQdgWFAwTzIJTVifMCP1ol6riFYHBz7ZMlHr3lBDY9A/+PsoKRCNQFOx
         sligINswxDpSji18Eb/9ET++sAXIUl3P+I9AqvOXKCmnXaWp9JZOO8bgk/K2DZHWGkkP
         CswXp/YDWUFeWiCLCNzlSzODJQBe+lBNurqJxHZAJTVuav4ZUcsx+KO6BOJcYlC+8AEV
         M4+nGfRIKClahBvqOlhLzMDiENOkewQ+hn24ujf1KlZJgz71U8BMNYZnDJwZVIbtu8Zs
         jSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743576; x=1794348376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hv0Uio0iKv6YWg4emi8XyGAuTMh6jvPk4JOtOEL/kqI=;
        b=UInuvG+yXghNwJ0+zEWu3r1iF5eq1jAOzYNgDv6AENy2zjTCnVnhBV/vfVaOGf8FNm
         jBuDNOnCB8Fbrr0iwUyzzQS2uP0uHnA1/02wYo/bl2E8c6gMj/9VNxDodV5KrQNWB7H4
         reQmSJJye4FRPtN08lwepuO08EmT84fMwedOmPSPlpB/Qk4qkQPhGQFoDZRDE3j3z4OO
         MZvFQEPmc101TvcC6aK7GVueh82VrRW3Y53YwDhmUwNheyu/BfVd7L85AvqZFTZe5yfn
         zkUxIPoevN0v4/6iLN6iXM/E3Wny1hmi4csqOPLL6p+vgrMZ3Vk1qxAHWWvYL3n9Hlsm
         +GUQ==
X-Gm-Message-State: APuU4Z+CEaIzJ26bjJY9fFTvZ/TkmJnZx0adHY6mu4I2fpMPoG2ahOon
	yl45pRRyijb4R7C2cwgS0IrdYF//BnnHysu/izKWX2booPQ0x3bkc0cG
X-Gm-Gg: AYBFou01RPOSDiyWzsEEuJzQ7NM6aiaXqwuyVmhPFzm6v3f6fWFPlHctYbEVGTHnYim
	2IpZLRi7H6IvDVVVb9+nQ85+b3zwWYNFmCk96EYHuYMqjRRUB8TgDsgiA5RjTFLPN6phMpPuMnW
	5sybF/0X67wjZ5wQ324lrqqRRAKRvE9EToADZjCxqqXcH520bwfZqvlep1WoYPzvvXU8QkelDHp
	25bDR6EWSSXksXPAFgqqmM+Q42wRIjX0ef68wgHlV9150rGvAU5Gv9OUbrwDOpoUmH9JekHwkPf
	ksSZJQSYikEHuLFgPIID0dJM0hdDgIM9kd6gUaY91cmniSJXMyuVc1pjfwAWTZSvbbSyb+uh2+M
	KI53zkjiGBeDn0D7lb+QNjej0WshqY8PDysfk1t8x9f83yuW0sgTG+1Id4LUWkxU6tv1wXyEDTz
	16rEB33Yr90mzpM8fN1KcmuGKhmnG7bo5mq3BJ/D+6zDzIMS3OdpkKh/CTHhI++VBJgaLc2SlmI
	mxJTbo3DhHCXbgeShqVyw9S4GR8QD9hwvVLSoCy+JkF5/NHf7+zOjwaUDGuU4X3EdqzRoKXN8TR
	akrhZLID9D6ao++4U3ZCV55hcLAiY6ib9AmEmRLKZnwaUfiedalXfaQ=
X-Received: by 2002:a05:622a:1f90:b0:535:a5fb:645b with SMTP id d75a77b69052e-542b83f7705mr214523681cf.70.1793743576258;
        Tue, 03 Nov 2026 14:06:16 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10cf31desm6749061cf.23.2026.11.03.14.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:06:15 -0800 (PST)
Message-ID: <9a6429d6-ecd5-45df-bcb3-6bfa235008a9@gmail.com>
Date: Tue, 3 Nov 2026 14:06:13 -0800
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
Subject: Re: [PATCH v3 1/3] serial: sb1250-duart: Fix console message
 clobbering at channel resets
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2608060322360.55540@angie.orcam.me.uk>
 <alpine.DEB.2.21.2608060337580.55540@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2608060337580.55540@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 03:54, Maciej W. Rozycki wrote:
> Ensure any characters outstanding have been sent before issuing channel
> resets so as to prevent messages issued to the bootconsole from getting
> clobbered.
> 
> Contrary to device documentation at the time the transmitter empty bit
> is set only the transmit FIFO has been drained and there is still data
> outstanding in the transmitter shift register, so wait an extra amount
> of time for that register to drain too.  This also prevents subsequent
> messages produced to the console from getting clobbered, owing to what
> seems a transmitter synchronisation issue.
> 
> When called from sbd_serial_console_init() it is too early for fsleep()
> to work and even before lpj has been calculated, and therefore neither
> udelay() works.  Therefore delay by hand, observing that roughly 170
> iterations over an Input Port Register read are sufficient for the
> transmitter to drain with the BCM1250 SoC clocked at 800MHz, so using
> 2048 iterations should give enough margin including in particular for
> the faster BCM1480 SoC clocked at 1GHz.
> 
> Fixes: b45d52797432 ("sb1250-duart.c: SB1250 DUART serial support")
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: stable@vger.kernel.org # v2.6.23+

Tested-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

