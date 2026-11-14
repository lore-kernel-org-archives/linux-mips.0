Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676560;
	b=skYqdgyyEh9xDMY7U+HzHl6+xPdQnYEYQm5+Y1kP/oaN1+hJAWS675cqz5tbzJM8IZa9
	 OFMvdzhox0qaVN4PBP3Tsl80JUtsoNEG2fI9bu6SEyvMdOzQzqrIBqipibmF0cr7XQf+b
	 O7H4kdQAVbYmHoBaskLMs65FbmZd2TsSxjbq8kkLsC88QMHkVWRd3f1ewp/xOUqi4LI0f
	 IJMlnzWXfg9rpw+iidzV6O76O01/PYNBvaT5BvuErzsgKz9BinaFovASyLd6YFYBMtDn1
	 NszViusWMSumuEFI12aNQFCNuAs/B7El/KOn/yTPmwHY5tknuCpDMvsAiI5dSqZLWqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676560;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Hs/PkOTJBUnLc2WxQnpdLATsC3XXPb/XE2GbbAtWhEw=;
	b=QKwKAMKGg99eREn4Al3wNXkaALPkbBw+FuF8dYwGU3jkZyZoZ1Pa+Huw+UZt4HbgbU0J
	 FjnxHg+wLeUt2s364cBWhfyiJFpQwXr5x49k+UJewL8b4vsRrBeRjU6XrN2cNEmpMZ3NW
	 nNpLmP3HTC4hxPG1q4rddLXR9mLgWxQDu7krDQKcB2X4ivPRyPb+eOzElwfvNbWjzHW5T
	 k6zxT7sFC1IWfzSCgsl0eGyoa4vrhk1zwY7aAFwXLt5lJnAyFKeW9DJ4DSlrSmVcyUWa7
	 wmTetEP6lmKFTuXhvgkSkL+H5yRU6t4rjSWhNrNog/Clz4MhmWOVAZPOZn8aVFLz8mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=IQXunpTp;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3B606A327
	for <linux-mips@vger.kernel.org>; Sat, 14 Nov 2026 17:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AB3B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=IQXunpTp
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id SEIVxGimHRiNxSHM8xCRss; Sat, 14 Nov 2026 17:16:00 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SHM6xcI0XdRrRSHM7xmYaa; Sat, 14 Nov 2026 17:15:59 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6af8974f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=rxihhvIKAAAA:8
 a=XYAwZIGsAAAA:8 a=DtZlJFn97RoajThK6kYA:9 a=CjuIK1q_8ugA:10
 a=vyXZNj8PikhivSrfMdal:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hs/PkOTJBUnLc2WxQnpdLATsC3XXPb/XE2GbbAtWhEw=; b=IQXunpTp3P2M6XyKFh39c7GJ7T
	wZ61qrjKhD8BiNlKLaUwzvDV5mX/iRsySGUY+CsvsR8XtG3YuL9qpsKnTzYJh3j8UXodUzJ5MzAB+
	3oDKtNuLlkKbeOcWDxTtwUX7rdd3X4YEX+CCrM7vzCTHOXiBe921ol/3c4cQwkg1hTjjVle5xORjO
	DYc8x3rSYiR9CgM0FNAzVEwmsiVa0p6IAQOco0SjNCwMjREmz4vCdTT2YWQ1rwNqe/Ld8PQMcYqL2
	CsA1JFP/TUmGl8RKYCMIa7Zr6lIM43mxrG3VKnt7gtZ6kwewzkpaqgGoHwdosHZn+uvWX5aQ0F4ys
	bawXKeoQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34542 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSHM6-00000000ZoN-11s0;
	Sat, 14 Nov 2026 22:45:58 +0530
Date: Sat, 14 Nov 2026 09:15:57 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rong Zhang <rongrong@oss.cipunited.com>
Cc: Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rong Zhang <i@rong.moe>, Yao Zi <me@ziyao.cc>,
	Icenowy Zheng <uwu@icenowy.me>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: watchdog: loongson,ls1x-wdt: Add
 compatible for Loongson-7A
Message-ID: <6179a943-b12b-46dd-bb64-c187ff779bb1@roeck-us.net>
References: <20261113-mips-ls7a-wdt-v2-0-e8abd6b2f77c@oss.cipunited.com>
 <20261113-mips-ls7a-wdt-v2-1-e8abd6b2f77c@oss.cipunited.com>
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
In-Reply-To: <20261113-mips-ls7a-wdt-v2-1-e8abd6b2f77c@oss.cipunited.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSHM6-00000000ZoN-11s0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34542
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 14
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDL+tlS7y3u6ywwO+UJftl68NeWMNAO1fRhRYBODgaWOGPK7YxIr7o+YWUu/AqlQiLzJ71ojGxXtbr1LwGKHmm2veNFVFZYMNj8dTYU7mAMuWIm8y0hK
 oE7Wj7Qni9zJXZRmh93gkNWrWzwr8Q5/YrvmPLYV5OJChj9nxpw0oCPOdmkmNzThjAV9wAtl10kXt0Z8LqhhvpI6S4MzPLmkBA0Mq+TJR8BnkR8dqsGfSe8f

On Fri, Nov 13, 2026 at 06:51:08PM +0800, Rong Zhang wrote:
> The Loongson-7A has a watchdog compatible with the one on Loongson
> 2K0300.
> 
> Add "loongson,ls7a-wdt" compatible.
> 
> Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
