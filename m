Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251104;
	b=CO3nLLOKtB7n+fLJ0jaziMBSd2wlTT1LXh9QX5NACsETIeGQ0WcA9DsrdZiqAaWW2Bs6
	 cE/K9i8Q61P3xWE1U62CiPQJKFxO+mYmADb1QHwezwhveA8yvFGQIR5b1wkqFJ9R75sTn
	 o2cxs/LEXRpuYSFVsKmdJ6RdJJ1Y4qryNH/+7qs6r9hq4IIpCA5Z4BHKfw4yF4+Xx9fl3
	 QCeVc6SscFATBBepn+HDrxGLi6vcCBHZ0vg9IGgowl54uqrzwFP4UFRVCqZrQ3DqrxFqG
	 dIh540En6k0aRJXUP5jmlVzoq7FEFR8PByofbUgYbFpPO0bs7h+Psgak6Q2d3Jo9ryA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6Ccwykaou03iEXdgsVl2ojrfIyiLm62r6nS34ODXJLk=;
	b=DJVyY6CZ3G6ADqroi58dkUXYbhVqE3eCUb9EzqocqLihenBE3XLTjBiymVqmlAs8iOm8
	 hbtmYNBgx9awmpjosQPjihCt83F0Tvtpm3GUbh8BmChzPIlrFspVvdCnNTFz//7ocg252
	 Km4zjFqrkQ51pv3FeWmVFl+O1AJixjvJ1O25vA90zaVd8+CtQoiXqqel9mD2SjlUr0VCT
	 ThMQViP5oe2C40Guu/N86fJWL9eA9BFSS/Dca88zjicmpV5o/EBjuh5oADA9d7P372Chv
	 g7pyZjbsWAgFjYuVZzq7Fh7nRjFAABjtxSnalGrq7kKZy+/WUaOwF4JfJ8EH7/8hC9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=jv7CoQJf;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E39B60A381C
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 19:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E39B60A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=jv7CoQJf
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214af2076so9122125e9.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 11:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794251102; x=1794855902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Ccwykaou03iEXdgsVl2ojrfIyiLm62r6nS34ODXJLk=;
        b=jv7CoQJftGCU4PBxF1KDzpDlQUH9a8qKtj4O92bLRSO3djfFWCNS1FPah4as/ZdEgO
         p1HOwXwuJgdCE6rZXINhR7fxok3QUuovGgTfG+CGDPmFFhwd1p5bYlMIGp2TV+d87Omx
         VEqk2lwx+EYiC2G/yYeLVjsyJO6PHsmHkL1H8yYGfpOi3rApQI3lCnQMficcBNzs6jTg
         syLYLv1+W77kS1CnuO0iXi1LSilW3fO8LSsGTLA74K0rBtkCWq2aTpTCeFPk6QAv/Jky
         WCCMP1dmI3MmMIE2klExHJ+omw3u7NxIvq9kmB/BREtssb5sjTqHdJiTXxdok0QifDx/
         l9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794251102; x=1794855902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Ccwykaou03iEXdgsVl2ojrfIyiLm62r6nS34ODXJLk=;
        b=ecVCmFurURVSCEyDRBr/18QiKoevrzJTOlMsV3CObDYyQYauOuJKnjqHVwKwXiHXLI
         WnTYBxwkAS3mbrygoa4iY+Sd16jgKFlFkIbVs96hww0xESLaE8suAWT0ZFGewlW7F85B
         8BhKKWOh24EDoHUCrdD8T0//qJ45dacZ9PgvCZ/0ZAmg1fW70jKsxqL9OMxgUiVDImVN
         xWo3MVVURqB+BS2quJU28iP7QAuKVJ8yHzoow9Cp7q/lVEDR2QEs7Q4oDMZwbNOPubjU
         ouCS17uttzQmfXS4kgPuATcyy0sifs/gFWtUvXN5VTsuG1zzgQoA7xF6qzhJBD5C3nkX
         xVUg==
X-Forwarded-Encrypted: i=1; AL+hErFyzLcxDZm2NRW755fzxvlDCGO+S76CCrioHnbbHwAvEjtxVdR/nx+ZyxTntTHdmtJgqsFESb2fxQ6G@vger.kernel.org
X-Gm-Message-State: APuU4Z+mu/WQZ1ITTetdt68s3W12ARfNnK8T1SW+KWwWQBYUyjzgBd3M
	883OiQyJYyR/evOz7/Pg7k8E84AgBHO9pCiVYyyzI2eEGGbXKEVAmOoDdZ13gfGMrW0=
X-Gm-Gg: AYBFou1wfyeWdV+CH1n3Gy6UyAiAzwsVlKXyfTrV/05lFc9Dh5m56hz7Fpz9svtjOcN
	Eok5B8gfp5LTaSN9OZcCTyuukfe6FqNiDa9QbjXggQlkcTpyBCilTGzqhGuoZAHMJlqkl3vVIZV
	twy3Hwgpql0bm3f1bbHIn+3uYhdH77hCd/qFGRnRASbBk8NggZhcq696HNMRRH/qRVmWoMQikLE
	2uRp84kNDv8mWHlKfmR1ADh1kFcdVBwjyA8rlkcoK7lGk0flcECPEZ8oq/aIwPEsDRPxBauUtUu
	hsil8cRyGmx/1w0mq3PsunJBX5HRKJ8Py3SIQ3VwLzEVtdHJdctzDw7NnhdfnXJxfhx5ZwqPsLy
	syz6O/iX4l/M4nVqR/eV77p2HC/mP0Ji5HunaFZxrbuhs0p3GvD3i7xvQoXFn2QR9aqXJglHBTc
	46T3x4N8+SyWA6kNHW+PdzZnP0bIZL0AYNHhYVxXxrDzdgFqBoCxuMInZqR6iaAmxueK6CjdLNo
	hC5xhL6DWE04yn2uxMlKUUUmTBk+2Em4GWQg1PjkhU/n64htI7pHyYi+HvRitTE+mgXOiAPadMT
	1+h+xE2r1xKcdoEUY8F3ti2xWwX5/7b9Dd9SGO41jtXyslskj86Oxhz0DgV5PWs=
X-Received: by 2002:a05:600c:6291:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ba0234ead8mr3131845e9.22.1794251102350;
        Mon, 09 Nov 2026 11:05:02 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm543440f8f.10.2026.11.09.11.05.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 11:05:01 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: ingenic,i2c: Add the X1600
Date: Mon,  9 Nov 2026 20:03:45 +0100
Message-ID: <20261109190345.61480-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <at8jCGfp9dKjieoo@zenone.zhora.eu>
References: <20261024212520.91401-1-olivier@mgcrea.io> <20261024212520.91401-3-olivier@mgcrea.io> <33b5ee36-e293-4356-9906-54e99ba3557e@kernel.org> <at8jCGfp9dKjieoo@zenone.zhora.eu>
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

On Mon, Oct 26, 2026 at 10:54:49AM +0100, Andi Shyti wrote:
> I'll wait for Nikolaus ack/r-b for applying the patches.

Could you have a look at v2 when you have a moment? It is the version
after your review of v1: the spike filter programmed on the X1000 and
later, and the X1600 falling back to ingenic,x1000-i2c. It still applies
on i2c-host and on v7.4-rc1.

Thanks,
Olivier
