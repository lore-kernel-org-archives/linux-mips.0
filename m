Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500363;
	b=p4Qln7mzW24Bipuv97ClHm7LpLIES9RftZpr8EIRFsrLXzfL/yn4/Mzp7vb4t+m3uVCI
	 Svv6Y5HeIfHCC1/a/sxCMC2z4e/h2osAv3z4xyB9XVKTUo0VsfP9sIA2pD/f/E6NOKq/Z
	 i78fzagjZTx27Wn+mUeYJ/n9iraVGpNF/X7feuhffTCIu1xZtSUEOI1KcCnI5AgbEvwQM
	 9vKrBrQN3K5u5a9KSw1HT1f+co+BFDCvjE6snw+Ul/+s6UKq7WwR59ElVjYS9SmTNnR6c
	 mXgyZyAPiFO+H4ANicyjRlmI4PKNjNpp6aIpluqKXYwPHGFLfJ2PGw691O0s9wR+tcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=zC4m+uV/YPD15AHdZCPuybHwTTw6+LRxv/oRPoTCzOM=;
	b=jPU3Q+cGsD41ANEz8NnCIyNKGEr079vN/j0aaIkHAzO4IGsDipLfG4fPAQw/3pefGr3F
	 lNPwbdbGwgOpFMvCV1SPF0/iPSWOY6aye7hi6ITnh8n3TQk5Yz4EthetA4K208eARdsg9
	 aziTd1kyMmKjH2ykAJ96LRzqblVqyOBHtBxVgDDF4kpw66Zjdag2Dvbc3vknSHnEGyecA
	 ZTLr/m7YSI5Nv7ErlZEDl0QiDgAOCSMzTvbD7jCYh+Fl8vMZ6LUMJ+AF9b1ZTufvSs4Fu
	 bF7WgFJj2HpKK5AJiAzyqC0LNh6E0br0u8WNakASx2XHFHDZyswj56haUd5epZ+TNiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXymAPkg;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3600606A31C
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 16:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3600606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXymAPkg
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so6174085c88.1
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 08:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794500362; x=1795105162; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zC4m+uV/YPD15AHdZCPuybHwTTw6+LRxv/oRPoTCzOM=;
        b=SXymAPkg7f5xQgkpMDyHIHCXo5cOdQ03I9FAN9FlFhLNy0ekJnF8d513tLBZNoLRdG
         lOkhqN71obDm+PVplCDpIhvtuNTsYZNq05k3StDBbu+B+ebcrIfTHO98jrN6GZdbuuul
         JKifPpayHcoKLe/ydW9eegm6C8WLJvD0Fi3mdAhvArF/QtS+jNjTEMv1sV6LbWC3b6gl
         aZ+4U8/zSb5AIAWOElaCywg+FdfwBh0x9jF1ypFvXPUSAoBx9TcHO3MZ3ctb+FEPEDcs
         SmV8eJP1quYwVSXusZV3zPc4TbueJ8pDefrrUTqvuU8czLkg1maBUKM0jH+P9VJHO/Pg
         GWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500362; x=1795105162;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zC4m+uV/YPD15AHdZCPuybHwTTw6+LRxv/oRPoTCzOM=;
        b=wzNN8SFGB10me5iaBZbjZZJKjbTKZWQi61aoKYzh5gJGVElxT7JSj8OB6FCaVdvrkB
         38xQeE9/hsRnnYxL2BLeWai5YVCjNGeQJJ8wzsp5oh0lJ1HM1jK0LggNq7ldEuCe7UXZ
         gEtU6vxsj1SAeo1HPf3d8v+hJBFKLbkWXDhjKkBTeY97qJonh3V+UnLBXx6s20CE6MVX
         bs1OuIxHXYXWYfzdcyENlGkAVGI03lURs7Pb33SDdcmMZuxHIp32DIIiEekg+/nnpxiw
         ZAsFfOnkGTzKPaXba/Gepdr9TyL2VW500xCAxcxiozROPvHElnunnL9uu2epZld39d4W
         c1rQ==
X-Forwarded-Encrypted: i=1; AL+hErHPGu0NqK/HgtR0grExKYXsAZhitaHkR3tZt3akZTOOTssvmPynUxk4akDkk3Mt98WbvbTa2SwD3P4L@vger.kernel.org
X-Gm-Message-State: APuU4Z+yQ1bDUArmfLHp5Csslc05tLGwFFheHadjB9oslKWpI20xZNKF
	WAi/oHDBZF0X4SGGnuUsVHWDXUbZfkk9ndT4aG+kiroXAS0ZElpht2Qj
X-Gm-Gg: AYBFou0oWa69dXmDo+m6XizJSDW5nIVNGcSMaOUqHubLN8huLjOLTl0xepQLZZ7P9al
	bSxTuYIFmYDIAk491wotw9T5CYhWRMpG0yVmdZn6m/10NYhdqLRfTalmAklawTtfOx8oq3i/BIa
	GW80fZSZPyYV9rjZ+xg7lSC4fD4S7fgoxf/w8XCf2xSZrkozLesbljrKrEgrg3ihvYF3l9ETlRt
	D6wUbychFOKiaZyOF5A8PCXqFTNokTdXVurmVtmL2QO5uWqDbt2L/McbjHc0CX8bFIPT35UVcAP
	t/937eWNr1QHJm2kfk6GnwEQbbTpov98C73vYGRlHJkgfqjiNvj7OTVia6qoDQvbhglYi/VgKQl
	VfWTVWcYnQS41oevO6tVu2zMiVL8/1pQk3kgyxA6O5uJ61bSZlOiARKA3K6nqUWZIf4wVJ/jDZI
	kU/SRy+EjRZaUoPOTwcv8OtaCFgCVuyfOgjrXbgRKUqtcIOtcil7CROAukiDS69DM9d5SMKdreR
	gAQDOgNbdUH3HcbfQ03fUJdXYnDwiLqQzU2dH3qMW2OtTiPgTXu/Gas5MVX17cju3YBwlsnM4Rx
	VHGQhDjjQR5MHwRU6mMcu7Ch/8FxpEfN4S1HUQftOC5/7qrDpzVI27IaEbp6ORfaDXDEBH/atr4
	51Gnz
X-Received: by 2002:a05:701b:2802:b0:14c:d84c:7182 with SMTP id a92af1059eb24-1b503104d0fmr31761c88.22.1794500361623;
        Thu, 12 Nov 2026 08:19:21 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm79377c88.8.2026.11.12.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:19:20 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
 Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Subject:
 Re: [PATCH] MIPS: ingenic: Work around stale L2 data after DMA on XBurst II
In-Reply-To: <988F3625-C300-4C68-AC70-E371E5D9A496@goldelico.com>
References: <20261111-mips-ingenic-l2-war-v1-1-0d9dec232a7a@gmail.com>
 <988F3625-C300-4C68-AC70-E371E5D9A496@goldelico.com>
Date: Thu, 12 Nov 2026 09:19:20 -0700
Message-ID: <179450036033.3574224.1997492818519568890@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Nikolaus,

On Thu, Nov 12, 2026 at 11:24 +0100, H. Nikolaus Schaller wrote:
> - LX26 board with X2600 (isn't running stable for unknown reasons and
>                         sometimes damages the µSD contents but your
>                         patch didn't help to solve)

I don't know that the stale L2 data is behind your instability or µSD
problem. A quick way to rule it in or out, independent of the patch,
is to turn the prefetcher off (MSCR.DisPFB2):

  devmem 0x12200060 32 $(( $(devmem 0x12200060) | 2 ))

With it off I saw no stale reads here.

> Maybe the individuals and teams working on the XBurst devices should
> coordinate somehow to avoid double work and potentially incompatible
> fragments?

Agreed. I'll follow up off-list with what I have for the X2600.
What I have working on my board is here, on top of v7.3.3:

  https://github.com/jolting/linux/tree/ad5x-7.3.3-rc1

The patches I send upstream are cherry-picked from it.

I don't have any dev boards. My X2600 is in a Flashforge Adventurer 5X
3D printer, which is quite cheap, and its mainboard is also sold on its
own as a replacement part. A few of the printers make an X2600 test lab
that doubles as a print farm.

Hunter
