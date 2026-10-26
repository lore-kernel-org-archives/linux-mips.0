Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008813;
	b=w58yRnR6LM4pvKLPYfyJxOLJmu19BaeeAUCmk1oE2M9bNlL4b2/oSDh/ZQC9NrXv/578
	 dgrwBucc8NNjfqzAsXzLoMVYY6H4Qa7Tfe1Qp5jQ4dnMJB+zbKA3qnqhrd5+1Y9Epp8D8
	 s2SrVNVT5jQuMWZ1fuh3FiUdX4M3TD/1rfqzJbbBPskqbP8vNnHyX9m0WeQFoSKo4z+8J
	 WsUmSnxurYQG+AkRNXwMjyp2pYDgKKBWv7PvlxrnKplOE6vEoVqjYSKkAHc8/ia2Ao9qD
	 SZqHR+zxW34+ydWro04ZT9HikAVsDptpfzcND4UQa0KfNZ+a36ou86Gcglh1+gCaNEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JxMaWVtUV0uwXPkwo9Mu+D6xSwARN7kCHxKOQvkbv58=;
	b=CbbIlLIC/21CDpzaiFe4/oI6aHpBuQvnZi5ENdhn2AQGKFCmsL5bHnmfeATCb+EJ+Pxt
	 Xg8GOSvcxJjnfAz7FCWt3Jy2WW10EOzQO/hzJcUaCOS7ev4itCHMmGTMG4hQ/qtc6WctK
	 gkKlcBkvNJwwdOloSoqJqIomabZEDU4wEQaCgvdZhtENLVCsS9hHdf6nSzSu9HWWBBfZi
	 qDH8wHYIBxvCEAF8Vu25147L7dpshUruLVuV9uxISqlMYXpRajqJkwuTYnr5dkHuAmHpp
	 NYj9fovrSpi4294Q+pX2E3tgF4ZJSceYTK2w1kZKKZtILSkMhBdH4Iugk+PoxsPK2AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rO9H/JJi";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE73606B469
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 10:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE73606B469
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rO9H/JJi
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so4490535e9.0
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008811; x=1793613611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JxMaWVtUV0uwXPkwo9Mu+D6xSwARN7kCHxKOQvkbv58=;
        b=rO9H/JJiNVMoiSub6cjqmC2tT3lU2Gip1qc+hCn0V192ZnRtIPYPHh6ywTdpoL67dx
         u0E7cWwXQA4Ww74WYuBC0SfnqVTzEJ/B0co6Fl6RmJkg9VK36ePgDIKRuio70j+Kniwj
         9WtODl4KfhStM1ILHf8rjV8fU5A4nVmr3T+itpLquLk/w7elg/qrpM255BdimiA3QwTq
         u7mjNK/St9prrUNO6Z8YLgWR7PUBI5gbq1c+4L6Gv5QI3VPRBcdpc1nd3ENyFsQhtl+G
         I7hSH5iUvaEl3Nl2u1zHrqlSOxmu0mqhcre13RDT2dxEFypZ1EKvE7wbxXIStUPHvWYq
         0mnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008811; x=1793613611;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxMaWVtUV0uwXPkwo9Mu+D6xSwARN7kCHxKOQvkbv58=;
        b=Zc3ahdJ9aO3MZLg8unwYj3KGBnYjHDcmrElPTlbZxqJa64SiUsXazZxv8khFaNcT3F
         5CEATral1auoqZediPpRBjUxrINAkdY/Ww2lEXncvcI+6I+CMftAUiSywtndAafkSIg6
         okh7+KHeFscIt26YjSw2VuSECJsgKFL/Fyf+gX5h6XwH36ys/kljAgT/JKRlZfWhaEoZ
         wZkXz2h1tdWiGwKHseiwDiqOdGZ7H9p+Ns+WQmvAMezLMrEF8xah+nPI9bmCyXqho2St
         osp5GHipn7/9krucBxCtwEZ/fCvAucu/qkzQLFhpszrQgCsLQS/m8cJPZM4GSQZ4tBCK
         Y57w==
X-Forwarded-Encrypted: i=1; AKwUvBx+P6DSFGUmdLXNw7Ohik4/1oZCTO5gxF2vA5+SV+Sa0TnC+Vph/svJGAVgXmGlopZVsMzI5RD911qR@vger.kernel.org
X-Gm-Message-State: AFq9FYLzSTfW+6RWZ7h7ZtqnoBIjF0loe6rK7oDiTeam8qL+iNkm9Al+
	lvRgUfJOuSiFUTtF9N/fzS5OJXSz0B9PtEQk+tC30jcCtCpXIR3E4Rha
X-Gm-Gg: AYBFou18rC21q3zmtOWS7PSmVht5J/WybMFSATHvrIpx6HX2Vco64nh8tiaRj/cTAy+
	e0WqD/IldlUH/bAgfxQaU11gCuoZaL752+hxwGZGqZNYZzJXByu8uEReJ2qmNIBYQcC0c7H7YH5
	M8Tusvd0j0afTdWRFZfg7RXUu0I5vzSKedKeBQlJya0cgbcVn5hGUa2oIscfeHZdPl9wAs9sC70
	ocjj8w5xhVZyqNSrjDSHKi39Me2xEt/BOcvg+zsoyRs28D9Y5reFCrC8rUmRNbfeHXc78Np32Va
	pl4KpOHr2Aid1sD3G8FS5l2iR4jF3w4+eH9qHdNKU/3RgXLmbaMbIE4vhhTRT+uB02OfLxI1lqb
	uDNclSU4J4PRVU65At4UnRNRr9FxqS6AZNwX8utlZ4gF05fYZEtrCwZfKSnTfUwmWHBfSfz2DtP
	MI5E4hC/HqoxYcr+0pYLXMDVQjF1bwdOLAEr7zsKJCq0lGbjGPn/AdqDVZb39bCvgxdEmZ7ZDHb
	VJfzzLUY9uNuJTHi9IDpF4rjW3YAnji4QyiE+3N78bB/q4vYboelsn3J6HR2fPiCTFdppHDVkoR
	aLXIOWX+U6hZXRhkJhVE+crmT5p6ZVxt1PSvl1jh+i4gIUuCXJr1nhl7cltjsgc+CHNYDVRGoxb
	zFU6/Z2B67r08KQJQjCpHgywzTdEp64JzwIkRIAvDTirhd8RyjM5/3YMxMo1NqT9C4M6xZ7jh9b
	u+7NVa3Xh39FSOelUdgL7BTx2koZJvWC5zormHTwyEq/esICDA3hkvLARB7yZsGA==
X-Received: by 2002:a05:600c:3d8d:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4a35acc2edbmr93717435e9.33.1793008810377;
        Mon, 26 Oct 2026 03:00:10 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbc718sm154241835e9.2.2026.10.26.03.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:00:10 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:00:08 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Cercueil <paul@crapouillou.net>, "H . Nikolaus Schaller"
 <hns@goldelico.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Message-ID: <20261026110008.00005296@gmail.com>
In-Reply-To: <20261026083631.48406-3-olivier@mgcrea.io>
References: <20261026083631.48406-1-olivier@mgcrea.io>
	<20261026083631.48406-3-olivier@mgcrea.io>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 09:36:31 +0100
Olivier Louvignes <olivier@mgcrea.io> wrote:

> The X1600's SAR ADC has four auxiliary channels, each with its own start
> bit, interrupt flag and 12-bit result, and none of the touchscreen or
> battery engines of the JZ47xx ADCs that ingenic-adc drives. Add a small
> driver that exposes the four channels as voltages against the 3.3 V
> reference.
> 
> The registers are in chapter 19 of the X1600 programming manual. The
> ADC clock divider is even, as the manual has it (an odd value divides
> by one less); the vendor kernel writes the divider minus one, which
> gives a slightly faster clock than it asks for.
> 
> Tested on a HiBy R1, whose play/pause and volume keys sit on channel 0
> behind adc-keys: all three read and report correctly.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---

The driver looks good to me now!

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
