Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613101;
	b=4xcaYJexxaXqWaWRDfDE+hB8ZJml79mLZGVnkGIAXMMncr+PUDhey//FKHsRbU346ooY
	 8CsZOUY345WbR3szEF04tAkJ/BWhCl6pqueJDOFQdgWOirFvFvFVLYVP2kXWSirR0Yhu9
	 +vIpRx4P139kCsRJn6ghIkl5c7uLrHl8tmCEJcPotuRAR//yaLfLUdlppbD9R9YR752/3
	 nFkDJkGWjqoYWX27HUN39Lyl+Wi4pBjp1FhngrTRY74D82DdnBUaCeIoUMWNDEvECTPRN
	 JFX+m+Ej133L+4nMZYd1zcDqkL/ZRlyubOM3PhhmFMw1CmUlpprgayiYYxuxng90XRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yem/FCFQ19eiUX+mO8WtB6J4U2HGPncanaJPXy64y58=;
	b=W+juYMRD3kQhxGRzCcTfbdnnTZHDFYj0qgkHmvkGXWd2jNAg1L+ZsGW+7KlTJXg0GvjS
	 6Jisx9Dd8jK0HT77UjiWn34CPaAVM56J2EWu3gPysEfdaMCmWip7g6lCiQwdkGxeuassc
	 ugvN32vz9qI5l/E6Xn92PyaYE9KeLvrA0J15eSVl77P/Q4ilO7FPMIBn5/GFqp5JdMn9v
	 zEW8U5eJ6EXWFYwC9laRkuUSsDN34HlHe4F0ra8/E6LZnG/6F38Qe/wNhNl2luwR8JWye
	 bKRMn19ETEk0MqRFzgJgQW1Iv8bH1juS7rO22tvkRDDT/mo1jmz3KXTguvBjJkgoROg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ym1TYH9+;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE267606A322
	for <linux-mips@vger.kernel.org>; Wed, 21 Oct 2026 20:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE267606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ym1TYH9+
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f1cf92c9eso109802885a.0
        for <linux-mips@vger.kernel.org>; Wed, 21 Oct 2026 13:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792613100; x=1793217900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yem/FCFQ19eiUX+mO8WtB6J4U2HGPncanaJPXy64y58=;
        b=Ym1TYH9+MGUbPFXjUtxvTI/tyvFxuDDo2d7X9M9Ad72puFTEACheu1aWHQ7SprkB6s
         yz3XSeURAPin0XpP8yZvMZXFNEICUQvD3uWS8zbBxOovJDbk0GoBb2XU02coqMuvaLG+
         jAYLnKOefHN91xV65mm0s6KPPogMitgV5F6mxopjxAyhL59OWhDs0wQNKAam/sVbF+3F
         jVDUbl6jcQrsI7Dw62Ft5oQ16uStdgrGXn2Wz0Dalyli2HPTHsbnRVLeacs1UPtBuWOU
         237XA7UujSPxhC/bU8ytWFKp4zEbpUN0NRJ645IGh879Uy+CbHPCQWpwkDkrkDWiLy2y
         q1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792613100; x=1793217900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yem/FCFQ19eiUX+mO8WtB6J4U2HGPncanaJPXy64y58=;
        b=i8LsOJVUNUa+fon+a6/mTP4/jKYJLeoBep12Z4bHFI1Px4gmwVhcu3QQilGwGGA8pk
         qP1qN0v1JO91lrNPKSfDDIrhk8P7FrfzSPVyUYiSPKco0MVrWGZpbn0G7I4oHeAOnDtc
         K7Pq4E+BlqY/ILaYK71exGpw1+9v6B8QVS4FQe1qOj7LSNAlrh/8dT5JV2/4/05XO0HR
         bVeZjn9tijh0y0LEoNiEJsuh84mc9OHTIPe9yreycvhmFqlycrvrpVudcOHlrYX4k/BC
         IpN5vMoxtWTtFxDS64W2BbfTpGWx/ZjsIasJVjcPSbg/w8d6WNrrw6TfTB/Bgc9niguN
         pwBw==
X-Gm-Message-State: AFq9FYIltr+g/xpT7pAYBX06656f0dggpzvaMx5lZtus09axBFYjX6m6
	RX5hh1HlJqew3eGqA8CfEZ4RiHxr1W4hkawpRy81ksX4kbktmQTn/cTN
X-Gm-Gg: AYBFou3PNdLbDOSNfJ9bO5u1FgUzOTOCxrsKqQ4H08hLCtk8oZVGtwUnAJeomI3YoBJ
	J/YRa/BRRmZKsJ9q8zZb7D3oGra6bgwgeP/YGCFAtUif3IPngOWx6bunqfivuWK3u9YeP1HHDMX
	/2JPbWkCxXJKWWJhn25KODWM/s5xubAPxwBeBtRcAz2ukoYVlmyAB2mkhl+kIDivwJYJz1l3Uo0
	ZhSHHs0izOwsUx1vvYp6LB56hy2nYoG1yUj/7Rn9uyPmxwNz3m+q7gdSHZXG7VROkVqSXiJUpVX
	K3l0Tz3TC0BCLnuhEPOG+9YbYP4Y6mBZDlrdC2aJ6dUip5tM6N7WV04alFSOLZXGWAXJGU37kxv
	qyeacyudecrCtaP/qkpGJ3+YF3e2QrrdPTQCrqZndpXe7xaOZqNh2mvc2GI0GNOZ5X2HSWegU77
	054mgt9BDGd41TVAaO3eTKWj1mfHuavXnrWXCE/8FH79AfYw6nLj+3RgdhG6JWuMaYqOk80EBgu
	MX2tLJPLqmN9KEU8maSfWyE49LguiSOSVzdpzZxSL8CMnZ3xrG1OW6sCkYdY34b0oKhPC1fXpWX
	l/pl+FA=
X-Received: by 2002:a05:620a:45a2:b0:93f:12d4:67cb with SMTP id af79cd13be357-93f5803d490mr595358885a.80.1792613099719;
        Wed, 21 Oct 2026 13:04:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d98978sm336971485a.10.2026.10.21.13.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 13:04:58 -0700 (PDT)
Message-ID: <5388e60d-6418-4b84-8a88-5e647248025d@gmail.com>
Date: Wed, 21 Oct 2026 13:04:55 -0700
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
Subject: Re: [PATCH] MIPS: Cobalt: Include legacy IDE ports in the PCI I/O
 window
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bjorn Helgaas <bhelgaas@google.com>, open list <linux-kernel@vger.kernel.org>
References: <20261015203107.545047-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2610201758400.22065@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2610201758400.22065@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 10:13, Maciej W. Rozycki wrote:
> On Thu, 15 Oct 2026, Florian Fainelli wrote:
> 
>> The Cobalt PCI I/O window starts at 0x1000, excluding the VIA IDE
>> controller's fixed compatibility-mode ports at 0x170, 0x1f0, 0x376 and
>> 0x3f6. These resources cannot be claimed under the host bridge window.
>>
>> Since pcibios_enable_device() was converted to pci_enable_resources(),
>> the unclaimed IDE resources cause device enable to fail with -EINVAL:
>>
>>    pata_via 0000:00:09.1: BAR 0 [io  0x01f0-0x01f7]: not claimed; can't enable device
>>    pata_via 0000:00:09.1: probe with driver pata_via failed with error -22
>>
>> Lower the PCI I/O window start to 0x100 so the fixed IDE resources can
>> be claimed. Keep the reserved ISA resources below 0x100 outside the PCI
>> window.
> 
>   Why not go with 0 (unless that's not what the system controller supports
> as the bottom of the PCI I/O space), and just set PCIBIOS_MIN_IO correctly
> as several platforms do instead?  Is there a southbridge in your system?

0 does not work and gives me:

[    0.205993] Skipping PCI bus scan due to resource conflict

There is no south bridge AFAICT, the CPU connection to the GT-64111.
-- 
Florian
