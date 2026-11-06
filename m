Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992473;
	b=OnXZi0HkjJUonIsvZp/OWvl5c9YV3/OfXEy04HkI661/FLqI56pZgpHizhMYhETN6J/+
	 r8NmulueFKsdz+D0u9VqAQQGgaU9j+BLDgD1JznCcH63JlgxTYjEli2he5/xxfq5RHivT
	 nllS2v70sNqWaQA94iRVGDtEqxXQs6qDeCDdXFAjiGnHaQEvl/VpHqM+44+S4qSKdHc0v
	 6P87A7W+sCQVbVidWHvGDUoEV3NjC8Py6xlaKt57fWqFnk9N+i5vpMG86cuXoHCn2nCVv
	 DHBgL8soy+jX7ecAZwQGjAZ7tyYX1hVPYRCGWz4L19A4vVACp3Blq9q4bB+4wuC8TEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ny7CBnpzaEmqmRZNMZQTuMsTlRnHeslB+C3vtjdk+QE=;
	b=gedmKuGspjN3ruwc6OdkGFnn3vqhljJ01ioOncW/pVXVFU86o/plbrypst78ThwUlyBK
	 7sb+VAnEYcIU5dj5uVUvx0hU8e1z6nZNke08tvtR8ODfjdCWQ/JuaM9EUD1/bDCc277t7
	 xUcoIL8qd4t8l7c0YkwJgghd8i/E8c5oGZFI7eoAhcgpJ+tYljVevnGZB/nPtHce0AN5h
	 usGPF9e3+jCliUUEuBkFDy1LeNJUbHk+q9nVY64NRx+Jvy+KWpc5qerZsImgiONKNKVU3
	 jroCcwk1BDMfNw6VVyoAZKYd703D0qXiC8ZGGsl+XETbdvshZI8vnWRN4xyvyaEYhEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B6GYI6dl;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73196606A326
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 19:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73196606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B6GYI6dl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so9914585e9.2
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 11:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793992466; x=1794597266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ny7CBnpzaEmqmRZNMZQTuMsTlRnHeslB+C3vtjdk+QE=;
        b=B6GYI6dlXSvHyTGhyRFO5S2jaPx3hf2P1YluVp2quvZLGc7kf34BHwcGQouH+BohH9
         gRCBTUvtOBJZ2t63Q2ZNxjjPpYr3e9v8/mqD2LbXAiLJilee4HLye0Pc72q5RFYr0b5m
         d05nZNrI1aJ0/ecnDi1RT6NrdfG/UN7Kcfv3kjOBbcSBxmbDIEJr8ZGI56JHHeA/BwoT
         GBEs92I+HJzXrqU9B1prrc/JCyXu9iFuy70HqZxdHmLB3muxwPXSl/6ha3eoLmMXK31n
         AGQRc6Tnxt2H2IQx5XRXVRl/hGDv4niG2E0OnSGIA0OknklYFzci2i39qPrVRJVLDkCn
         3c3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992466; x=1794597266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ny7CBnpzaEmqmRZNMZQTuMsTlRnHeslB+C3vtjdk+QE=;
        b=rXcZCBapodgBwTTpZP3s9mDfRFpqw5xS/quITpfZHMFpVSX486mIiEb9GYPwIrKv6q
         cftTV52HpmJr+imuI2apC/m7K5V2rL/wXYhhg5pZ04UbvYZ7apSwXmU0RV1MMVNIGWmV
         cUaceRG22oEror01JZL4a+W9qSaZjI6Sd18g2t8lk3Zh+wATAXKqKlE7Ws/fLqDLbeFi
         LAZYnJQchI6usuqD951Uby33NwFccLPjgedK+QxaULs8M7X3z9lieYSXZ1uaphNIRgYv
         eD0upMXICk26YcSQzY52pct++1/CzQP7M6RS7oe62igDQ4eGKF3t+LgfG8vnKyVVBuAj
         LE+g==
X-Forwarded-Encrypted: i=1; AKwUvBzsgpHTeeM7LfFovZSyHRxmfQoRphXdYyvaP0xEWEekwVr9NOv0SgIwRSd5CC8jfH5hrDSyiYBW6n3D@vger.kernel.org
X-Gm-Message-State: APuU4Z/T7yV2jw3Ay12xURkZnIOulZ/QHsG1ggYdLJ6SHs65my0z0zDI
	FgDC0+ZPPdmAoQTKm03kIlrSedXWYwlyS7SBmy+sOTveYs38qbxu868h2Ys5vcWiRMM0x/zMIJN
	3mVfGOhw=
X-Gm-Gg: AYBFou1ZBG5LLopaCV6x25lBiMr5l0UXJjRZrSYJLb5pDn7nTJcCpADCc5PFf6kT+k/
	jw2kQ+uJLk+Kat9hXQ3tw5XBxqXhld5I8exJbZHPBMfTiW5uijIEXSRLG2/HZ611iviMEFLps62
	m3JBZS6bLMHeH5rt47O+stkmfHbZAkoB8FjrRqQfjsivstD/a9zRcS9DFdOPpvasuP8RZMbq8eh
	N4/j6mcgRN/P0jxCHK03l/kwSuRf0zwGdn8cnIHmf1i0cbq+JWwt++UKHKpmTx3byG4rV2sYX48
	5up6aIDGO7CuQ4TnJ3iNFRCYT6CmNKnFW1MuRxnjDnZwofGgwno3o3HDChqMkOtNkfneU+HktJh
	49+ID8fxKk0azlmGrWvmKZftcf860PBaSjDSvj4ysdB9rxA+LWjVb7vkBYGEJESgFw707MJX8hQ
	zF/8k3tCilL5XBRrBN1W7wFBWKbAJidw0ANdAxHD93z1ELX/31cmZLwx1uyWOHYBaOq6U7nwfQq
	ojYWwGpRVeJVhgVu1A89K0HKtgAJwb0CL7YRAHNHlchBq7EEWJzuusQo935GYVSdu0NndDDZ3PR
	ufBywLlTgPJ9PUL9mVbnm5NSVmKhItBODbV0L95ikTOSTjPQFZIIax19MGvRUQ==
X-Received: by 2002:a05:600c:5295:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4b6de973c5fmr58007235e9.6.1793992465400;
        Fri, 06 Nov 2026 11:14:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:30ce:e69c:9ae:c94a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm670335e9.13.2026.11.06.11.14.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 11:14:24 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Paul Cercueil <paul@crapouillou.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] drm/ingenic: Add a driver for the X1600 display controller
Date: Fri,  6 Nov 2026 20:13:08 +0100
Message-ID: <20261106191308.31303-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <71aa432f71144f446dba2037ab5664eea3569fdc.camel@crapouillou.net>
References: <20261106112000.1612-4-olivier@mgcrea.io> <0a2e8ea782fa819a547e0a3075303bd74a7fde72.camel@crapouillou.net> <20261106143827.15926-1-olivier@mgcrea.io> <71aa432f71144f446dba2037ab5664eea3569fdc.camel@crapouillou.net>
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

Hi Paul,

On Fri, Nov 06, 2026 at 04:06:50PM +0100, Paul Cercueil wrote:
> Is there really a point in enabling the clock on-demand? Why not keep it enabled
> always? It makes the driver more complex and I don't see a real benefit.

Fair enough. I have nothing on the R1 to measure what the gate saves,
and the PLL it divides from keeps running for the MMC controllers
anyway. v4 enables the clock in probe and keeps it on until unbind, as
ingenic-drm-drv.c does, and moves the timing block to
atomic_mode_set() as you suggested first.

Thanks,
Olivier
