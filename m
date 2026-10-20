Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460388;
	b=yYxdc/1jNbhGys+ezWY7KoRN+uy7Fm/9d9vHHI1XGf3K9iYiqJSF0d1CMZHI8iOsR9lR
	 z1flAWW0D5J8U7o/wVr6p90G39fNKziwVCpDtD044+WTwhvz4WAa/sti8b8UdJdBE11TZ
	 3dUVS8zIWOkcFi6+n8SD2ps5Gofl18z68uYo5pJOFHoSA8vVNhI48V5PGvQjMgbAzkYzi
	 GUTZcXhYVXGtL+QUU8b8e34JGpQgUlZdV+SB3VhVGIOwv8s/o9yT/eeaiCFYx2PJxyiKS
	 oKpX1N0iRAH4XFzT6pWxdiJuXR1U9xbsagRrx/ZwztpJbdRFJ/4b1IHrqjMNcaPgQ0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=RnAh5BgwbBUv22MFv8wV5yaYN/qwaGj857cNozmhPaE=;
	b=gL/daxHow4Xi21IN4jBDFc8WWaJk13cnMVX+/x+OWNi2famnqsO8hyURqdPCjGEJw+XO
	 5bmT/mWECsCiOzz/Kh+UiGy8EkatfJYq15PJupncGawUmQEuCGkcSpFG7eCRMsQrmT9q4
	 XO1c8ka0vF1HLgubwmNnNYbInlIr6u8WrnBaOFZCNZAXmAY6pT+gselFYLMcYe4Ba/rXx
	 cJltPxQj0ec6CIutg64nKXgeLwnpZS6pWop5RM5U7kHyEAbNmPQ4ICj4Oa2SBcD4ZAUhM
	 0//GgqFY1pexfqvOoW7FVyjYJbjtQ0ekQm9+MepU11qk4W9HTt+J8bZJ8Arf7d5W+zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RkcZ5cU4;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13860A2614
	for <linux-mips@vger.kernel.org>; Tue, 20 Oct 2026 01:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F13860A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RkcZ5cU4
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5820115eec.0
        for <linux-mips@vger.kernel.org>; Mon, 19 Oct 2026 18:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460387; x=1793065187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RnAh5BgwbBUv22MFv8wV5yaYN/qwaGj857cNozmhPaE=;
        b=RkcZ5cU4XWT+80H9xiHfw/ZuxBl6gyGBS8H5OG1Ui5ovV0ctyZ8z4qUpRFqR9Cw3xk
         cE1gBX1g/vACLt1CLIrwHL8EmS5VeFqqrm0ueJiNdaRG5pmtJcXR9T0nI7/4wPFmx2Fc
         P6NuIHhpjNjq4DlS4dHIFp7F86kFVhySspEVGioyhs5SYNt0R0L1G+hf/6crdY5kskpr
         nh2IfgchMcIyBNiXQy8wSrHaA5HKlohWQIHEC0fRwpOhVMISs9wo+dk/5Oz2XD2EB5Cq
         WKb0vsQRYsDrrlm5Uw96Kk4QP2RpxUG/EAN5jYsQhxtaIKcG4NpiN9GSXndRffebXt6E
         7YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460387; x=1793065187;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnAh5BgwbBUv22MFv8wV5yaYN/qwaGj857cNozmhPaE=;
        b=qsFK7L4KMkFTIf0OFeE9f6o3if5GVsKuXmYGt+J/Xe4aRWT+IfF3q7jX5fUdCPfr1t
         D/FGh1zPaXfn7Jt1bxXYQ5o5vD3CrXIPmOWknuL695jIjcjiRZP81mJKOYVsY3GkwRbw
         QgrEeNG+lYx6TGgqXO1L6Y4q2uLETGmgGqLEQ+M423t6Xh9WQNrbLsDFh6Hb2ZOwtKdK
         S+LG8yKY2hWA7/R/6+A6K8wDFk7v0dltWPV0OhxGrJLphh3HLu96OG2DutoOXyhTbAR/
         uSN68jWp3+zfX57CADZira1afqEtswC8NOr2MvD8t6Ju6MGa6VFbvf43Nse9qfjnpXaG
         YRdg==
X-Gm-Message-State: AFq9FYJzlpVImSOUmKmc03L7j89BXzVRhhjWBdHwQ4x5UQDZ8vCqKg/E
	lBZL9CSdQ8rzAmy/t6iPLRZI2B5xfpFmh49h7AGPAIZ1VfMbynREd9FH
X-Gm-Gg: AYBFou1hslTsaWtxIIt28bt8624aFPU+lZfFcVOfwVrcwoEVgWC86GCbpWDPjnK6nFb
	hTSRJ9OTMntaeEVsY2WnQFwkS4t1CVNoSoqKWQSgAY8FPEeOzd7fCL3al5mc4NqtQ9LtqRyTWBt
	junnPDw7rXN+CHVJ8rs3uDhDH3d0lanIerWKjDiSuL5u2JG+3QzK8+kvny+vk95JXf2Kb08t/+S
	8E8qy/MBoDVf1uSEqp5q2wB/pI0s+3G5T3sfWyGWeQS0+Y0Egoe671+gIWjycnj7LVzEIuncZye
	1LThT4EgQxtMiI+3c9yGhJeHvRMv3Irayj+VmUkzxl0hR9wPCIKLNpzSPQnD0LC4uGJzRq34SZ7
	w7CPA58ZjVk0vAJ32EP6rNy3z0rf5/e0hVF6IjJTJR2+YeaI2HLNFIfpPSCArm8RX8L5I6LaZ6J
	4LSetIj3LfV/+D57j6DfJ4zWuvNsXvIc5lALJr0/puy060C5IZNcmUIbgZm9YgP9dzX7x5mUu+j
	+8Gqv5yVUQX
X-Received: by 2002:a05:7300:7a99:b0:358:f678:46b6 with SMTP id 5a478bee46e88-361a2343165mr14073141eec.22.1792460386817;
        Mon, 19 Oct 2026 18:39:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm45216643eec.20.2026.10.19.18.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:39:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:39:45 -0700
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
Subject: Re: [PATCH 3/5] watchdog: gpio: Support watchdogs with a minimum
 heartbeat interval
Message-ID: <cde332c2-3628-4bac-9a4e-55d85fe06628@roeck-us.net>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-4-f.fainelli@gmail.com>
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
In-Reply-To: <20261016221617.2223004-4-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 03:16:15PM -0700, Florian Fainelli wrote:
> Read the optional hw-min-interval-ms property into min_hw_heartbeat_ms so
> the watchdog core defers keepalives that would toggle the GPIO too soon.
> Reject zero intervals and intervals at or above the hardware margin.
> Devices without the property retain their existing behavior.
> 
> Remove the arbitrary 65535 ms upper bound on hw_margin_ms as well. There
> is no register width to constrain this software interval, and the MTX-1
> watchdog needs a larger margin with a 1600 ms minimum ping interval.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied.

Thanks,
Guenter
