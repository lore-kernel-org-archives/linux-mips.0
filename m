Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964167;
	b=5kxK6CddcWSn/z8WzvI4u1ShSfmpGS/b6gE/kexmnVYyy1KZpD5vwsm2/r3EFVkq+9wD
	 8zQX1pMBmXNHL3TptfhzhQPq2X6pVmnLJV5Epfsfi/S4xf9H8Od1GWYTS5NUjMeQUJpLF
	 7HKaR+5eZuU3VzDKIkO6phTkEj9itzzZsMbPCNYhUa2vjPt3SizXzijYSGe/1Tp4Ueeh2
	 dG4ifr5rbaNTU1wYpbfi3IbX2D9IO7OTHiGOp9kboERO1H+LH+98u71XOC0Jf4fRK4DAA
	 a6dIAICUoG8BCIdiRu43BDNAv1RBUVzG8A+mGNagQbiix3XO2e8cN7FUxjY7iBJ5VpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ieGADuHKQdAMTXfJjcI0pPXfovk5qK/wiv1qHG7Gn7U=;
	b=rerqQ4NUMkfCRFiiUNVLUBNdKUOt99s8/p1HrlzbpIBCgGpAX6gyBTdSDJ9tvI7KcVun
	 5dYZhki00kqGf+HEtzKe0V9/JLL5BSc6ckgKL9vQplJI2idJRvnStsXd4UgWR+LZjm8hD
	 OTOqp2qfm7rr3DS1hlPOX9tmgAQgpM6zGJpWA/UK4d7hI1ZSnYFuZGiXvwPYAQQiES+kB
	 1uNqJRAywOZwuZpj2lSWHhQoGpWhnAYL05fXrDLTZC39uf3YLmBFaOWMyypOwgThEXQ5O
	 pLvGHe22ljZtZwVerMX8uhj21CWjWD2XKfzeEdUCn9KiAtQ3ZDvb1THsZOvRHtWKoJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A56bH+AK;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEE8606A330
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 11:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDEE8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A56bH+AK
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491971ac844so449928f8f.2
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793964165; x=1794568965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieGADuHKQdAMTXfJjcI0pPXfovk5qK/wiv1qHG7Gn7U=;
        b=A56bH+AKoKn3WxGkU/3FShzWyjMsOWNXmrDjIMbboHHrTJksHZGtdhCYMn9Lv90sC5
         rkYXo1y7hX4deXW2sWOoz1Ac2mbU5okpF8OWrr7bm1GrRw8jBtYFo6a/zBui61xax3pb
         MxM+Hgcmv4uwI9ilLgwv08sZ5aBb9rG6kDxrv/no5lF61erZujFajEcHhgPTadNbLwon
         NXstFFc5hlWtNweNmvNby/AFeMq0ftId2PcCN7wb8fvPlTXFADo0HqfVVJ7GGN30q57W
         /D2t9o9OspR62OBxhuhrHVRGv8sJfx7t8PVb/a5eZappR2Y4uMYS7v7j+PqntEt2VIq6
         4Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964165; x=1794568965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ieGADuHKQdAMTXfJjcI0pPXfovk5qK/wiv1qHG7Gn7U=;
        b=S5MU7bvnay6hSkMzwvAG2gGNyIrCbf0WV2zb8S5wFWdEMXcbhWz3XFIjBbKdzTGAuE
         XjrtADm29v0FPAF7cbMtpYs7AQaMEQUL6Ms5rVgyYUFFJsGPdlfsjXsUvCecaIp8HfPT
         LthfCp/WoEJUFdlv+5BQgpJjj+zAda9Z0QkKOiqXepHilNmBFnxAoyWIsJGfDm9/kTwm
         SjBez99m/xol/o86pisFKH7Ebm5s+M48B3QAue1nqBFO2U0NLVY8QyGtop5CanJ1NSUJ
         ytX+tfzDt0UbnOTS3gnAcvyjNDQH/WAmPZp96jJou2L5TZNVEKNYkBRuCufnaZKcQNmR
         z2Sg==
X-Forwarded-Encrypted: i=1; AL+hErH/sE7481FARAvBXAnCJgF53h5HDXxtvQYLgX82u1wNbjHjpKBPJupEvbbAXX+SUUj/YLxF9c0Qs+/N@vger.kernel.org
X-Gm-Message-State: APuU4Z+C6oe5u/L0OZ2QdLcC5ZedI8Gjpmx+od1mqLxuGlDd5oox90SV
	FdlBhM27cHwGxXhVee8+RNqCMC7gve5XluhE0SxwxbQey7LJAS+ZXAZmkRtemkDA+vU=
X-Gm-Gg: AYBFou1uYErOWTYaXSjZPd+ExuN6Y4RpeO2qxmsxjHSfUHTr9shmODwmoPnrtfdIf0r
	sHf9bgbxwtdFUliX//62DjJP6mV6M3t81nED2ks3V0XwpGdey2ycV1hk4lPTJoVauQHplA5ivaE
	pfpREnIVVmKpq3d8KpSFXFOEouYzn6CLhgH29RZcp1bbL/jZA3PeqHSaMQjesMmQnlTZD8CbD3E
	tFcKusdd/JyPR1C9Xxab3hvWmeCxr5KmcGyxdx0DDwVtn3wZaokqI+I8Sn7Iv9mKCdreHeo83eC
	DWlCKXjPZJi5sQ9iPpS8IIqSCIMHx00H320Frm6KCZAsED9h/T20TzhoOPuslcaU7ujkoJB/6gP
	oUo83yT7n5/OQlE6QgeaqR6AIctyDrhucxrMcx5diiDOWwQxX8laQVTEeNBNRLWScB1Cdc2BQWE
	EFAVLWMkAib25gYjsFA8Ly2KW/FOyrafJ0pkuMsgn4g2byo6KNE3y4kXM39DMgJlvQRwI0x9mQW
	RrrTOmSpnNraV9X5QihZj30VD1rH3kmAVtpV5bFTQNAxAwOujxYvvg5xR66wv6AH75YU4YMWW4/
	rjW/znQlQGUHS3/2nuzimAdut5QNDbbqjOkVbZWAHfggsDMsnJeIXpj+Moj1ebf954ngbLJrl0S
	NzqOl+oU+
X-Received: by 2002:a05:6000:1861:b0:493:803e:800f with SMTP id ffacd0b85a97d-493803e802cmr669893f8f.29.1793964165187;
        Fri, 06 Nov 2026 03:22:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-493070bde9bsm2890244f8f.36.2026.11.06.03.22.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 03:22:44 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: display: Add the Ingenic X1600 LCD controller
Date: Fri,  6 Nov 2026 12:21:28 +0100
Message-ID: <20261106112128.14213-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <09A3F895-9007-414E-8EE0-17BD18E63F53@goldelico.com>
References: <20261025191640.13592-3-olivier@mgcrea.io> <09A3F895-9007-414E-8EE0-17BD18E63F53@goldelico.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Nikolaus,

On Thu, Nov 05, 2026 at 11:27:12AM +0100, H. Nikolaus Schaller wrote:
> The manual for the x1600 is a bit ambiguous, but the x2000 and x2600
> documentation identifies this block as the "DPU (Display Processing Unit)
> Display Controller" (located at base address 0x13050000 on all three SoC).
[...]
> Please update the compatible string to "ingenic,x1600-dpu" (with "ingenic,dpu"
> as the fallback) and rename the file to ingenic-dpu.c to reflect that this is
> a scalable DPU driver not limited to "LCD".

Agreed on the name, v3 uses ingenic,x1600-dpu. The X1600 manual says
DPU too in its register and clock names, and when I checked the driver
against the X2000 manual it came out as the X2000's DPU without the
composer.

No ingenic,dpu fallback though: writing-bindings.rst asks for SoC
compatibles rather than family names, so an X2000 would be
ingenic,x2000-dpu, with the X1600's as its fallback if its registers
allow.

The driver keeps its file name for now. It only drives what the X1600
has and what I can test (parallel RGB from one plane), so the split
between the core and the interfaces, and the X2600's rotation, is better
shaped by whoever adds the X2000 with a board to test it on.

> However, this approach triggered a kernel lockup during boot
> right after successfully running lg35583_get_modes().

I can't reproduce it here, the R1 comes up with its panel at every boot
(with v3 again today). With nothing on the pins I don't know yet where
it would hang. If you get a log of it (the last lines with
initcall_debug) I'll have a look.

v3: https://lore.kernel.org/r/20261106112000.1612-1-olivier@mgcrea.io

Thanks for the review,
Olivier
