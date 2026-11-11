Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426972;
	b=x5igsoh5qcAn/kXK4EjPEfTMMePQDcYRU+qX9uk1sjhjuQgw4k+MTOeSyMw6EudTFWPc
	 2406jgxVkFonLkEtpQSaUhHJT5uru+ruFheuVT33lQD7lII36BfjfJflvZccPsfUDQ9oy
	 Hf2pRxpICWVVsq4wr7LYrktf0pkkxBerfAZ7nIhwQFrEoX3D2tONpNKKFYxC2x4gfFKvu
	 5EVe+Qf5BCGvqgtiGLKCGyztClrpKlBPBGWICzc8bfwEOpeHrvdCwYflJ/VyOQTvjisv1
	 Yqn3eEBPPP9z9M9ZpohKCvENZdpPWtVdK7Cgj1itkdQpFV/8sLaZqg/zlz3FFwOcjdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=upfL+B9eEMA70OzYaC5FfA43/7aUmNJ/6D8byJUgj14=;
	b=iLBkTPx0tx8OJX/UBBKmjb0k38GaBlAa5oxZPJmpBWrHCqV2jcVodmew5s7f4ZxlokeA
	 rm3WY+Y5QzmpNVN8UN2j/JPw5e8HHgQXzodmSazbngRnmNtAfUm1LYzqKgnpSQWz3iHyB
	 OSAlFc/8IhQ2l2mGEbCKvo3xOYmwwBzfdVLGVjpidIoSbrgyW3seV9mv5jIJWrDx8pgm9
	 kisEovBXcTxQmTES9hGBXR8iDOetROXI3s6GwiDaC3sJSaoEJ2c9wa63w7ir53ppmqCJh
	 RjPlXOFNmspjSnf3ub+PT40sD5SdNY6+3XXgiqYD3BhDdCejrcIYsCOQD/1yLEYuGFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1tI7V8p;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8135F606A333
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 19:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8135F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1tI7V8p
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so6302195eec.0
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 11:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426971; x=1795031771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=upfL+B9eEMA70OzYaC5FfA43/7aUmNJ/6D8byJUgj14=;
        b=H1tI7V8pjUpsuRRzZxXCHtNfRWQ0HPt2db8FnCzwtKcYlM2KREK94qWkufa2iRf9+N
         4JyI7xr+7Kimla/MYNC0whOkjw5Hzw/EbXDRKjJieN8SuKcTOn65AvZ94wyw3IdeyKQz
         OKcvyNwmju4xiv4NideVKrE4tCS8/KjkJV3BYFL5TndTHT71MQ+0HvajTH9cgBFYCJbE
         6WMiR2/78gyOvJCgk2G7aMsPNPAtulnu73rMZZf71rzArs4ImllTtP5KbtnC2LcPAeb5
         3EvUTypAl51nwPEBEDZEHA+MB7NeIh09bPftYZ+PVQ2QMbjv3YIZlTmsU7YYGbS+nx/D
         aWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426971; x=1795031771;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upfL+B9eEMA70OzYaC5FfA43/7aUmNJ/6D8byJUgj14=;
        b=cZiKkHySAXH9VDiH5OFKldnmbKUk6wdKY2vH+pTGdXw+wNr4WLsysHE0C3ah7wNRYX
         zxyq15y+JFoKIVY+6jERTxeQZsCtbNPQ897I3Yq1OwfbZsiNqCor2azIINXITAfxHNti
         kw7fc8j3cCXzSO2d8FyUJuu0WoUTl1bT1h+RJmrwcUsPKrLIHxiVNaDHFScRDbFT8SIO
         KZAqNJF0FX1GPIltqJj6Lk4D//hr9imsVMejFnUsWjDZESZnihDFzqdAZ87LfPnaOwqp
         a865/zdE/PUgm7EboXwQchMl7/sx6B1AM0dfSsboYM7A8G8Dh6RJBS6xwBaatytRXNnt
         hhQg==
X-Forwarded-Encrypted: i=1; AL+hErGZ9ecoSIGkB5efglt55dMbSVomMfbdohjw5sgf3BL1RBtlR+3hxco89SRiWqqnckhlR26tTge6MnCz@vger.kernel.org
X-Gm-Message-State: APuU4Z+fL9vAH2a9m4Tf9ySy5BZLwCa2AEeWn+1uP4oI6rE5mc04BSpb
	SahGJU+d/yR+mjkrxOocPSWw7CbnX8n/UTw1rTcsGqKYLwa4rfwhUYr9XAHIVDqFc4Y=
X-Gm-Gg: AYBFou0mk6fPe36RJzT90JVV1mK/vDs3uPTnAamD2KW7GhqxgkrOdtk792WsKmiHmte
	MV6Yb8QyTsZdgH0BN86uVnb2wHsMwSzz8NOAdzfhBhDWcIpLnipJnPpbUQNN9HlSRNYNmH5TNU3
	vP+EKPXFz3FlE9vlNF/STc/Qx0BetWSmeCo7bGayMM/t9GXAuu5HXRhaNkUP258xLzJajspudAi
	Yo9wGpIC0Jt1oR9Nm+W2MwzAbfOD2h5F6Pl/mUykjvD4jd9mXcETPEkXRfVFGL3/uBJbZO3S/2+
	a2qBsehK66zLW+gGtDFQ2qHz74RtvS5SQnkMegS6gDi0CLJCfjMRmSZRHDZM9/xuO9cjCRsG5pW
	1sb3DhDVIzt+f9YqWHTm9NhUSVEyumltxJgqCbsXFd85hWGG83KKdW8wI6eujLLBaZkRQnEeHeQ
	O1j7+37F3a//n0Q0qcKFy8T6TrRSSuyOSMpB7/CbbsyWIKzCSpphYkuCX8jHmi3DQab2/+XQDwq
	aUMDyxpUhILpwd8dbUY6lpw6FBD9Srn3nTPlw+A/aD5fz+Ov41rNzoYUfFSt9x/BOL8g65i9tEB
	1OX9Opqsizf/KL6L2E4aT5IP+BQzqf1IUv8lyI2zyeilVH+1ex5Fprs2klmPc5gyNkbVV3377iH
	vX4dMz0pDLP/pb71ns3ghPpT/nw==
X-Received: by 2002:a05:7301:906:b0:35d:4185:5395 with SMTP id 5a478bee46e88-37686171e97mr4425039eec.16.1794426970704;
        Wed, 11 Nov 2026 11:56:10 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512b6asm17414286eec.10.2026.11.11.11.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:56:10 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] MIPS: ingenic: Let Config.VI tell whether the icache is virtual
Date: Wed, 11 Nov 2026 12:56:09 -0700
Message-ID: <20261111195609.2694096-1-hunterlaux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1a6aac61cb167ce0eea611afe73e8c87782edd43.camel@crapouillou.net>
References: <20261110-mips-xburst-icache-vi-v1-1-efba689606dd@gmail.com> <1a6aac61cb167ce0eea611afe73e8c87782edd43.camel@crapouillou.net>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Paul,

On Wed, 11 Nov 2026 17:23:31 +0100, Paul Cercueil wrote:
> The docs I have do say that both caches are "virtually indexed, physically
> tagged". So the patch looks good.

Thanks for checking.

> If anything it's missing a Fixes: tag (with stable@vger.kernel.org in Cc).

I don't think it needs to go to stable. The vtag setting doesn't cause
wrong behaviour, only extra icache flushes. I can add a Fixes: tag
without Cc: stable if you'd like the origin recorded.

>> -#define cpu_has_vtag_icache	1
>
> Don't remove it, set it to 0.

The Config.VI probe already reports it correctly, so I left it to the
probe. Would you prefer the constant anyway?

Hunter
