Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351341;
	b=kCbWvKoxiiyLzYXil4toOYOBnSyYKtXMP0y0YH/TJQ4NA2BVulcgUd4C1w7NBtJR55if
	 ezn7yx6wZ8xmmF/C6cR/Vnp+ERCrWra6heoB8xdPpFYyZJaHvWjasNGMbOhsU1JDCZQxx
	 71zmf+cON7ul/73PDqeFVQZIGD3ifkEy/7slLVVe/Ej4xePw3VrFZx50Q47QLDEvY7uDp
	 MxL+T2aMJSXBKa/+onCmGzmtErwI4mqHiiEVipMLpgCTlOrkHTu3OvQ3QQPrwpGHH7mNB
	 ahWALNPCagNCuV/KbxJ0MLxqNl4ph6vCern6cCs48qiAVQyWVdxXeHB7TxEXUhnv+hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NjLyddmhAPXtNb3QKE/8D0uZ863VQXkt9WgAWFpo7lM=;
	b=3mnQx5kTvzGMxZGXr38DWaQa/E4res1UVeXVK1o4TfzNb72/+lL+BGh/AnimfrAZj5ya
	 amZzOh44lUtKx7+2AZva9h64RjuZ9r/i+QQkdP333acCMRyEUvYGnestCOu8LaOxFMsLW
	 gKFAUuOQh/3Lz5XsCujb/BExivZszXz7KHmtI6IVGtNjm/xZ+hDvrBhe5EtwEcK2EjJMC
	 8+PP1y1VI7vhsZxorcmxTZ+PLCSDhK77p2tpi7t9pMKopYnSObqHzccS4j6uFAxe6rRap
	 fQTHgar/MY9SEdE4lvICml7pWdvjngGYROwI5sw6axAeoRnBSXuQBWUFoFWgwQzdQXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=iWfDGmTC;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BCA606A32A
	for <linux-mips@vger.kernel.org>; Sun, 22 Nov 2026 12:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35BCA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=iWfDGmTC
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1913689f8f.0
        for <linux-mips@vger.kernel.org>; Sun, 22 Nov 2026 04:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1795351339; x=1795956139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjLyddmhAPXtNb3QKE/8D0uZ863VQXkt9WgAWFpo7lM=;
        b=iWfDGmTCde2bt+wepq4PgJNyha1vow8HgShJhgAqgwEb4VqiIG1qAiKLIKiWaGRuxd
         f8R6vPe1+sThZNdOoA0Mq356EC2okYJ243uZQdz5uLx7ZsNjaqfeymrnBu2nUSX3KkFt
         YgB7/fupJe1qhGJlFwKWug3Ng1ZX/n1BdxOf5Jjvnk70H94tQnTcRAB1K9VrdyKhjJko
         LnW8pJK3Oe1kytqRL+BYgKvMiCn9vuCirhPSy6vw+PNkvaNOsUsgwZlsKRHzqWW2qvcS
         WcUTjr5KMnUfMGamPt2r79Go/SYQtMvprdmDjIHkSPDd674WlwFczVf+G/FHc1QPveKO
         xVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795351339; x=1795956139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjLyddmhAPXtNb3QKE/8D0uZ863VQXkt9WgAWFpo7lM=;
        b=2gBsheXBW20frbnf8AVyd92G4OS2kzRt0u3TDTEX1yn5QpZ1A8da3BvUs7B1HMa9C6
         0Ic1nVuqaff7qkeAKeTzbhuCAHLKWAfjIPLFxDMba7UEojp8x7TwOFrDRO6ksjB9oQI9
         rDa9QrFCEFeNNeU2S3dYlTlSCydER7U5VQijM57YWhViJ6rZcP2g71alKE6+eX4Ir9Mc
         xmI4YWSwMuDFMykVjIQPKlPwm3EWKUX/zcglvC6wzLSIxsGf3BnRNSl5Oh31upQTj7+Y
         YJ5KSQqK1cbCY30TuK3ur49BGiJAVM4VBvjtlkmI1Mn2JbVS8A4lMUpuRWjZdmB89Dew
         RdAA==
X-Forwarded-Encrypted: i=1; AL+hErES5zIQGSqY9QFlqzK8lM7O+S0sE91wSkEh6SACQ9OLEcwJbgH8kzkHsBKDpb7yuAbcDDP1JpEzDqCV@vger.kernel.org
X-Gm-Message-State: APuU4Z9r0YUwRy+/ZeksSlUqx8DOSrxS0YEHrKWO/OV8OFAY9c814g15
	9v4sf2XUtknih3PWenXQnOYlwU5TQkpPqjjMAMmazgRmR6EhhDVuTYrd+66qiIvyL00=
X-Gm-Gg: AZFdTZfuXp2dtHcUwMveZTVF4KOSR1fqaDIEaNacwWxUtDjHtMg/A1N+OY0Vy+L9mGP
	I2M5xEdAKpJEwYKm1Msmgxckc7ZtXBVOFGjuLcsQ9TeTNdDqTkS1SAfzQcPJmkq9aoLndH6/7Nl
	ovjYHzBWEAiFNZEllzsvGYjD0BdoWyOjLED1uOxHm0YL3Oyeg/MXkH4RAO+UkyJPwbKDH16kzLu
	qN3503UMjNYggJpr0EXRpknXVqxuqKjd2qCv+EDUhOPVgtRFcMp2mYwBcJIuVSJyOnPAWLcOTtn
	v4RPc8aVXLOEcsZyiTLahGtUXR+Lf3AR443rtsnZwdsZPuZhZ0Nfhw9wwuPU6ElVDNQg44WtLSm
	pDDRHD4YuLuw1QMpBXkzZrb76xxft+cgf4/4La9oL0s4tt6SVrIoqoPDnS9vhxNhgN8urah7ui9
	HDf8+Xgf5vaUQdQfK19kPPicqk6L9gGOjCfOGQkVw2+lPterR+PmlrW3IiTz9s+YkX6CGk5tVPh
	93wBsoZRretOL0GjHSc3lFLyquBBTUJ7db5GZf2isfjip2V6AtF1gTCSp7LTSAPXAPvDNiaGmLQ
	kwNVmlHHP40MIwl+n0dGs4c0DwtSWgQu8SStKnNv17OscmWu8BZi0oHVvKSoOg==
X-Received: by 2002:a5d:5d0a:0:b0:4a8:eed3:760 with SMTP id ffacd0b85a97d-4abb225faa7mr18135404f8f.31.1795351339007;
        Sun, 22 Nov 2026 04:42:19 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:a5ac:a6f0:7687:6596])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm16091531f8f.56.2026.11.22.04.42.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 04:42:18 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: ingenic,i2c: Add the X1600
Date: Sun, 22 Nov 2026 13:42:17 +0100
Message-ID: <20261122124217.9668-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <C17AD04D-6EE7-4CF8-8DB1-FED4A16C66AB@goldelico.com>
References: <20261024212520.91401-1-olivier@mgcrea.io> <20261024212520.91401-3-olivier@mgcrea.io> <33b5ee36-e293-4356-9906-54e99ba3557e@kernel.org> <at8jCGfp9dKjieoo@zenone.zhora.eu> <20261109190345.61480-1-olivier@mgcrea.io> <384F58FF-41C4-46AC-8B2A-1B6ABCDA6981@goldelico.com> <C17AD04D-6EE7-4CF8-8DB1-FED4A16C66AB@goldelico.com>
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

Hi Andi,

On Thu, Nov 12, 2026 at 11:06:39AM +0100, H. Nikolaus Schaller wrote:
> So at the moment I have no device using I2C at high speed to do real tests.
>
> Please go ahead and if I find something we can write updates later on.

Nikolaus can't test it for now and is fine with it going in. Could you
take v2 as it is, with the two patches swapped as you offered? It still
applies on i2c/i2c-next.

Thanks,
Olivier
