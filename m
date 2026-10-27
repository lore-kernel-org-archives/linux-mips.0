Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793138960;
	b=4d+VFHAjy17NLV/fqRLNmnPfUMi7WAHS1fAriGA9gZHZTTRiiyqszDtlGdrLyncjGde1
	 bKQUTgEk/wUmNZTbTgcUjcE+Va5JtLz3xm6ayUo9a3CHDeSNhvdETOtyypR1+cPxLmNqe
	 xB6YeGBD6aOHS2Afz/fKTH0JJ5WrXHnUFYKaT2gXCcyHfOaNhRVGfmrEpHx65us2tb4LE
	 beb0ty8EpEc1kqns9wXvyD6Nk9y8vM2vkVg7qsM2pL3N6jWpwzlOQTxx9HVHcJfeS0wIp
	 A8EzLSMsnYKLUaovsX2tw9kLsTqX+96cNUc9vLoyDuTgeahLYwreJmqUUEfE/H+GILA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/PLmL+V/SYmlIq7ZPKJzSVA7G2MVgEzQyQAcifW2km0=;
	b=s8HW/70YffnW0qWJK1clhkU8ok6e/r7pA93Re3XiFmi1bcD4ryhrsqxapEdo8adPMGbY
	 742hbIfRoGk5JMYhZYnE16lQ0SYiRDAbF5ZziLPmiiIO1qsLfPjE7EEFE7VyUZ/VZ8FX9
	 /ucxVyEczttn+Tkwe3h6JzW6QaF3y1cvxyIXOrlQv1pR0xLsKrEBAaIEEh6JEBVZKr7w0
	 nbFwbEA/rVsQWUrmLNrolUjU0aUWHtur1TLUVWCTKCLk9lud/P6EGuFOweOVbyVDebG5N
	 xFunAYIoXy6r5mg3bcNmNOuHqbfAqB/JJHsgRX9I/uW7MLlOMtv+smjT3nnNh931yQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PdkMk9ke;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDE9606A333
	for <linux-mips@vger.kernel.org>; Tue, 27 Oct 2026 22:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CDE9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PdkMk9ke
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1101707f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 27 Oct 2026 15:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793138958; x=1793743758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PLmL+V/SYmlIq7ZPKJzSVA7G2MVgEzQyQAcifW2km0=;
        b=PdkMk9kewIP8utyRGSc4jW43jNTAMvQDKKnT3gKuktZwVf28pYzlLA/+8SiuCRAfrI
         iTP6Wp32ZYmkYmhcNHY+LWMn13O7ReplBh3xR1RTmCprKzhXgsxWqnqvaqpUJ8giL+V1
         +xe0jxSNWptp05NM6xsnj84Gham/RG7I0v7BixpSZKpen9On/xnh5L/fo/U7koThVBIs
         HkAGjIXALNX70uCl3tdEmETxOS2rCvbb6GpILbnhsIveWjpCvtJ7r+xzlfu8vNUfNXfp
         uI9APCpJhu2wiO6jOdmntGI32eOTlFJirCXh5Dkr1AW6sJNNS0tkpH1V/MPuBRsJjy0s
         UL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138958; x=1793743758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PLmL+V/SYmlIq7ZPKJzSVA7G2MVgEzQyQAcifW2km0=;
        b=THlSCOjGqgPMVQZj2ONpJNVEfpZj0RtjIuqaq750luHsxaP2K2KhgZpAu5LeWsJIIQ
         Qcu5VH7k1izlQizDeVzWN3wMdu8y7v1Hac7G4AEz+j+TRbbSfepVoM/5jo9CHimrl9jf
         awGcWCjwl+NbL7+rAaUxZn8u48b4C8IMBTLXT6AZTxuGP3faskkeIeN5uuD1a5d9ms3P
         O4v12yAli1g0dtUpjVvzXipoQGpFX+XSz8WohdGoBPeTrlSJRwOuUQbrEA4+r3uAaVAY
         0v0j7j8XcS4G6jsr9mpWDRTI7CNH1zHT0NbYePDNpfTvVwfY53ajjH2S8/64DGZCkCwH
         4fxw==
X-Forwarded-Encrypted: i=1; AKwUvBxfsogJRHQPXDN07JrNNupKTuxUhQM/BRvSY54Z7kpr95Ms3G7YdAOagCb5EQPDhR6MNKmg8NP8ZaFK@vger.kernel.org
X-Gm-Message-State: AFq9FYI9vMYCgB9t9eUH/OOa3A8TNYFqmocZHpb/KipcJUlXyrXbfytK
	j7DkrylNpwv7qGSedHTrCIdR0gDc4By5WytgKJ/ECw2W+QSZUP1TvghPcxNLHdge4FE=
X-Gm-Gg: AYBFou3L9PBdtJGrkAOBHsjOJ7WHSfmNNjXTiFHt2XxP8vIvvY9EM88bMBZ7ZyeB/sL
	rk9wwqmAeQZwbUrTMb4a6Ekl39FKx7RXCxaR6spwUSzfIG2oZM1RSfzLV1/FQKKya0WAH91AJW3
	Bsq0lEFODIESYMOcAwwMt/p4vHS/RRZoLNTvebe0POe/RL85uMAnUCHXsGf5H8TzOFLOfK90qg7
	e96+ZT9ZtltfthDdiTSqeEqN1AWG9xtjcy7/Yf6Yjh9G/It9EpmpqJUKZ4M3JuGp4PniJPaz2Zu
	CYg9QnFe4Uf3ml8syBkLpOa07jx1ffUB68OwyfuOJ9R1tIAsx9U1urU3rXiXik63KKSGWk43pfd
	R3TV7G47fwRsnKxihjk2EZiFlEROmTlel6OYgfQj06cOtUpzQxJYlSNL2mAJOAvs0u2Re+/WOxf
	cIjl+FIhGbUBJns+Qf7E9FCPlXTyPAvWrYZ8Tsp6d+GVeftpRxUQFZJqrb+HeyrIU2AiN1PX3YK
	E8m44nRdzetyv9sB9EF7s+4MYWhp5zcEfmHYBEi1Ex69YiM678PBZNAlSHyrub6dyExK+6TDKoj
	k6tugcBzQv4y
X-Received: by 2002:a05:6000:46c6:b0:48e:6f:19b2 with SMTP id ffacd0b85a97d-48e55a51a7dmr5924445f8f.25.1793138958515;
        Tue, 27 Oct 2026 15:09:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5cfb:af57:9834:741b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm25306661f8f.21.2026.10.27.15.09.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 15:09:17 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
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
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: Add the Ingenic X1600 LCD controller
Date: Tue, 27 Oct 2026 23:08:02 +0100
Message-ID: <20261027220802.56348-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <465cb935-2648-458b-9cfc-9b7fd5dc53c5@kernel.org>
References: <270ef5220fdd5ec3e0b88ba5c4ce044992fca41a.camel@crapouillou.net> <465cb935-2648-458b-9cfc-9b7fd5dc53c5@kernel.org>
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

Hi Krzysztof,

No, it does not. The X1600's controller fetches its frames from memory
itself, through its own descriptors and DMA (programming manual,
section 10.3.1 and Figure 10-1: AXI -> DMA -> async FIFO -> TFT/SLCD),
and the manual has no IPU or other block in front of it.

So the only link in its datapath is the output, to the panel or bridge,
which the binding's port describes.

Will send a v3 with your other points after -rc1.

Thanks,
Olivier
