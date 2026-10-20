Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460319;
	b=YGkp4oqfUIrHqirSpMcoIGWLh1FCeQe4V/7zFbrw2O+noLG3Lpa5ONXTaqSmcefd4kPt
	 1qBEcGDpQOtFJB4LTt5qJgBgNR71qtpTev5Lc9uCtWVkFARM53TlDxOIWiJrbM2ulmykP
	 AMt6ZNwTojQwusXAs0r7e4OArncrgN6IXFx14Oh4HbM6JcC4kgvrZXLrvMggTNhaLO1Y/
	 e6i1EF/GMwglYFWdKUjrIqNTRuINPdukmKMXiqB3J97gErb+CjTJTobb4Mzeqa3NHrzNQ
	 1haurMGYz7eDq9O2BKQGXvzItvCwPlYc5ktCEy2q/mAGcrsboJRN9QXbRFOy8MASLCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=LjwwN5Dzf8X1Yx08q6zZspcMWuK38LtYvZHShxnEiOc=;
	b=Zha/9jzHOUjnjqFPyNmb5xuob7vGDnLIU8qGoK8YpkFsHt5f53njfFy/eqX+eLtYMRH1
	 wpAkI/oglEF+qEe2L3K1zS+DIrRVu7hgffWMFhPMvZfI9TnbOXDJ1lbiF83VrSLl28u51
	 6KJ0xjvgf6CNYmT6zwtTSz3J4pakncSfKvVc1GSnI3Y1SZMzmKIV1c0a4re+Uv/PnYjBJ
	 5RuQCXo5MlPsTDsGrXNMHhChyAS2UN0e/MFCpPKFvThGmdgSVKC4rv6hmvAGn6E3+5dWh
	 1C32imDz2sA7UoqnNQS79r1mLYM5i9ot6SUrXWnYbQAkNeQCTAPvdSBzQVks99hgYsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rhK27hUj;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E032606A31A
	for <linux-mips@vger.kernel.org>; Tue, 20 Oct 2026 01:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E032606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rhK27hUj
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6602715eec.1
        for <linux-mips@vger.kernel.org>; Mon, 19 Oct 2026 18:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460318; x=1793065118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LjwwN5Dzf8X1Yx08q6zZspcMWuK38LtYvZHShxnEiOc=;
        b=rhK27hUjeHRnkhbrVNJ2XwhZq7l4qeNjK188G/cQOCNGrllyZZrjFdmE7BBmC6PbZ0
         FqpQMmlLnaWvKqtvLwsP3VoeRu8uWRcYOA9ni1wMMT2H0G3ODy0x+IpphTIFPd3Yv0/I
         OiK8oGmEqGaMBBu1Yvhzln7e6Zgm2NH1kyRSgAGkThUXOFf4T9CG5Xg4Lb8dgNxQK1OY
         zGI7XFWCPwMcaI/ldYUB8ytRSo0huZB2FgurXz984M4tjKyRWOS8mLPdz+yFxO5kyzxO
         2AePlDfj0/lvRVnUnyQdoseg+5cRhVxFR/kx6i0QWz1eDRegxuSi8pCDH+bgI2hbVJQ8
         cXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460318; x=1793065118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjwwN5Dzf8X1Yx08q6zZspcMWuK38LtYvZHShxnEiOc=;
        b=Tg1ZTDRDiT+u+CnlPqUlf7xM9csMHL9TRrwlMVanT7dXcAbZiuBwgrliVMzmQB6/yL
         z4OF8dKUYoYbzB0B/j1fE8uEp80GqDAOdDAA0K5JSgknxPxFwkZc/9g4Gx9mPVwo2kun
         iTIvF+TiaKKpJC5JJQx0oDwyLPD5BzyOZ7oKVa/uBTexJ/CTmHuGJeKhw0xLtI3yGpqf
         6QLsD/4zIT6LmpkuPQMn1odUbaWEI8JF2X/+eBllkOovPUX4eTrEXr2dLxpId8wJuq/Y
         binvR2A/nnImNK4f41funu1ASSTFEDlxzmFVuR2zqwQTQuh53eGWCJhOQKYwjitfexn9
         u0yQ==
X-Gm-Message-State: AFq9FYK3jLW/1m/EQvgPjjESkXXAldDA0Vcbz9wXjk2h3HZ6y2Mwj9Iv
	nqAXb0bsBCJwe/Jgl7hnry3JoxqHrpURhoG3xYrFKDS1xHN4WQ502CGH
X-Gm-Gg: AYBFou3QbSGGK22JvlRernOIHv58z83RJoWW5RInhiYks7zVvAxMHmGAmJWtMmCuIcE
	SD8LBxo5Iwq5rpqaWBwAfHFFbSJlp16bZR+OfUwWj4js4pVHNUR8a5weUsPxOSqHFr0xCv1SKl5
	rsB5HtJz41YBamHEbLrs/90F+iKjOC9Jtn9zYb7oDuOR46fJVlahQjTQUsX1FCO1LW6SgwYSMM1
	fHsQBF6x9YAkkqfAAehr1inaVtP9OBXxSMx7lYEhW7zetKZQQan2uWUfU5JUPD2Q/VwQpr3dp0Q
	6Za1w6bDpfQTk2SLAwmhxILgN4eXWmL5a69fFnBzA564yCm7JvfgZDSXq5ymBOPlxROI7iZ/x6J
	e1u5C7pGY3fnwonuV+39u5Qe2iPQGttBZ7XBW9gMDvDU9GyzS/1+1GiPvx/WhC8cnN+aOhblbPN
	8hMvYeWmHsVI3GV0a5kNx1c1J9iQA94sYT1g/lIkWu0lG+qAZujAThiRnuOCkFT2JeZPiBCWWkl
	4wJhVNkTAkg
X-Received: by 2002:a05:693c:20c5:20b0:35c:2986:35ab with SMTP id 5a478bee46e88-361a1668b4dmr13507939eec.13.1792460318438;
        Mon, 19 Oct 2026 18:38:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm37720983eec.7.2026.10.19.18.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:38:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:38:37 -0700
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
Subject: Re: [PATCH 2/5] dt-bindings: watchdog: gpio: Describe minimum
 heartbeat intervals
Message-ID: <704e79be-3fa0-46fa-aaa9-d13fb9d933ac@roeck-us.net>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-3-f.fainelli@gmail.com>
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
In-Reply-To: <20261016221617.2223004-3-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 03:16:14PM -0700, Florian Fainelli wrote:
> Some GPIO-controlled watchdogs require a minimum interval between input
> transitions. Add an optional hw-min-interval-ms property to describe this
> constraint, allowing the watchdog core to defer early keepalives.
> 
> Also remove the 16-bit limit on hw_margin_ms. The generic GPIO driver has
> no hardware register imposing this limit, and its heartbeat interval is
> stored in an unsigned int. The MTX-1 watchdog has a nominal 100-second
> hardware timeout and requires at least 1.6 seconds between transitions.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
