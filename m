Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793052478;
	b=uCOYC1OHZbaIi359j5msnvstCOn2a3mhXYbQq0B57EbDmBW8uDA4Q/xeOa+xVkSLXO0b
	 r67naJH70k/DXYZxw1cSmYRYfhrCJEQpBNJZS0PJld5sWS7t6Yuyy3dVqTZzZcapdBEa6
	 lfnAtz8ONPVHRueSUm4FDWzQnB0kSpN/8Vs13EiTMTFxiUx+zOL4dRJtc735LXMsFxg4a
	 psL90foeJvJx3fCw5oS0HQfI9zT6eKJgccCIHVOJi0I2Ic2QaIfMicHxsoielthjcFLSG
	 PANaXKhMx8X9M41C5waDynQmxlCBzzQpXtuMk6W5lZxHV7ZLCG1JXB++ie8G84a7aPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052478;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=FTKggi0RacZ9ZRgKp/gx5uvsP4Zzh5sa3f9zHGmidIc=;
	b=f35AsazlZnwCi8Mxw8LVuusvb2h9L7SyOzZ6W0hvyaJ/wgOMA9FvRkAKb3zu96JD0duC
	 rOSWWgUlCfS6Q42EGLOA2DN4JBFjBvzE6e88OVU5B1ld4MoCVPbknUxwK3t6rdEWsSKI9
	 fnMCxAqKSlEArDk8DTeLaLxft56smB8FJGwIFRW0Ri5MOkeThiukPVQLhspx7OnY0gi+5
	 z0PjQwxkvCaB0IG8o35C+rCMjOTLk2TL4U6WzN4QkLhww7FbzzwxkXIolSRhg/hQ3hJJH
	 sSLB9fDKZI8nLYq9UuSxIjUX9NP15ElQXgv/AsJCTAQYu/tYRIyKfroowve86hiuqlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=MdY20Q+9;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A95C606A31A
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 22:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A95C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=MdY20Q+9
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id LSk3xnkGoaC0ULSrFxZyo7; Mon, 26 Oct 2026 22:07:57 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LSrFxpW3lVnUjLSrFx2k5e; Mon, 26 Oct 2026 22:07:57 +0000
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=6adfcf3d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=V4Dx7h__d2wgc-tc1C8A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FTKggi0RacZ9ZRgKp/gx5uvsP4Zzh5sa3f9zHGmidIc=; b=MdY20Q+9CL1J71KupKdI+SnPrO
	SzurKl9K7p6xIIb2j8tDVeeMTLPjlzg9ZHcHj3YZD14A2BAaOidqgGpFHZN4IlCaox9NgtRhTLEz5
	QAS5NQyAKWxPB2wiKQwm7JITkbU8yJ3UWWwk7J6Idro4ZBxxNHKWHnATJHQI3WStxNDlTZ/P9yBiU
	gmH3UWPtZg2j59RUNXxSdI38O2RWW6aWyod/tle6r0rlIq5tmOpHHYHcmW9NmhjxjtTJYadCS9PLl
	zRF46coEz/A1QguHCgBafIl3RmjYbmLljJ85WYXuRfwgOcn/AF1zVnlSj8t1vmEnHuBw6yAkQDRl0
	4Rpnq8CQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48554 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLSrE-00000003s0a-248u;
	Tue, 27 Oct 2026 03:37:56 +0530
Date: Mon, 26 Oct 2026 15:07:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, manuel.lauss@gmail.com
Subject: Re: [PATCH 4/5] MIPS: Alchemy: Use the GPIO watchdog driver on MTX-1
Message-ID: <25597f7a-2972-44bc-aec5-76e81519af31@roeck-us.net>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-5-f.fainelli@gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016221617.2223004-5-f.fainelli@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLSrE-00000003s0a-248u
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48554
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 42
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJyJUvFkDtJSKI6PY8VJydNV9f/MN16fvfSlJLwaeoDUEOR5jo9uPW+5SFbqHoOCG9H65beXTeYoozYt8GQjiC6n+dQHKzQRVdmFDzeAIvG0TM0r4Mgw
 JD91xu0YvWIYZ40qnRfTGC+CKzlUc+9O0UIZpGZbNAsuR5iyTM43mIqjz/BSb3zcPEc+t9L3T4IYSwUwTR20/ugyeG08+URWU4xc3ORh7NGAsDubG5hFv196

On Fri, Oct 16, 2026 at 03:16:16PM -0700, Florian Fainelli wrote:
> The MTX-1 watchdog is serviced by toggling GPIO 215. Describe its toggle
> algorithm and 1.6-second minimum interval through the existing software
> node properties, and register gpio-wdt instead of mtx1-wdt.
> 
> The nominal 100-second circuit reset the test board about 82 seconds after
> starting an unclean-close test over the serial console. Allow for circuit
> tolerance and console transmission time with a conservative 70-second
> hardware service margin. Keep a 100-second initial userspace timeout and
> let the core schedule keepalives for the longer userspace timeout.
> 
> Mark the watchdog always-running so the core services it before userspace
> opens the device and after a clean stop, without trying to disable the
> hardware by tristating the GPIO. Enable GPIO_WATCHDOG in the MTX-1
> defconfig.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Applied.

Thanks,
Guenter
