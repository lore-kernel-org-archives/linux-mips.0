Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815392DC350
	for <linux-mips@vger.kernel.org>; Sat, 22 Aug 2026 00:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787359110; cv=none; b=m+Lc9H3NxcXVzvbUBo4D55GSWtLbpB8kUhNQHx5wNpArkkSUaB/QCti0TrsACIfnuJeEsSV/nrFBBo2tMlIB2TyjLKFY+br58Xyr4D3iAGe735EnwGJ4nVhBLsAlO8uC20/MVlxreO42G+NaG5hWV4LoyuyNKAkhuk7eFTBd1As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787359110; c=relaxed/simple;
	bh=FgV99Qog+S83qCLEPgCgW94Dvh7PPZJ+zujmvNY2aHU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bwMXPeVdNEkA+dySx4chf/594Sxhyrct6ctFKfsF/9M+JiWl4gzBKfo6RdhABOhC5s7YNKKk4z9lkrwyjO9NPbKjM/ys1fnFG5nfJIG4rCfA1O//tjkrj+58v7GmMEWqPRRZTd49c41CnioLITkWWxIwgo3+1hkeaqpgvuYDrso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlKiJyMK; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlKiJyMK"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1469c1b83so2064918a12.1
        for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 17:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787359109; x=1787963909; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FgV99Qog+S83qCLEPgCgW94Dvh7PPZJ+zujmvNY2aHU=;
        b=KlKiJyMKGzHf+LiNP6MDdX61mykk9s2FZt5VrtZdngrwjRfRxxkoYxSnN//n4LIs0w
         4n2Q6miUsxG0EC2ndq849eYn7BPj7V4LJT9EzB9MWZIckQa2VVOS1yj1DA4MJj9xh8bM
         /NUXSAlt4ZwNFQ249ZtTBpqyohw5IaNGWLljfukXJlbcCk4wF9Ql9gjI0yj691OWmqrJ
         JRHVuM1sOQzM+JLSchRQIZu5/Erf2qPGyaRKj5GpkKpwOqqNr5RX57Ksp1WRxEZFtHl+
         8PqUyuTZjF9KoS2NzSj/5hXwpcKPYhZOR3PNGBKGeo4w0O3NDhIM82tQdzCv3GmsEG1d
         K5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787359109; x=1787963909;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgV99Qog+S83qCLEPgCgW94Dvh7PPZJ+zujmvNY2aHU=;
        b=O1XMQSGVAwXJJ1Fr6dU6SMw+DxN2HlKkegTKhxoGXslhSrh6miVuSMcis80gtjIruO
         cyfQIweliEdqeUQ6OrTk4kIxpw1A3Nnc1Aprrs88DtYn7WcZFl4jRPSYNUNvWwj9fRsk
         Dddl3nDbCQn5dWFMzxX/QyWn22lYQWYNHtZW2Vw/Z++/Dom0Mok+2Z1iWcF+5oGuwcL2
         CnKrOY6n/ax/Bh73bjeBM/ap/1xf5oYpluSsSoqKyW2zLzff/T20n2i0in9VdF2n9qHT
         LeSaGW6lvBiiFkzSAuRM7/ZUs3mEbtj02BHcnBDnWY5kmopMMsTJrsytnkwgxa56m0Pz
         Lo3g==
X-Gm-Message-State: AFuF++lNRr5AsGwlUzUq5vp3Do/ActXKp1WRh5SzcJyS1EdOBL8pF7u2
	PInvro7BIuYy1DSGskhcTBhDVmKbqam9TYWBMPU62d71Vq8St8RWdHLQ18fSpngf0xo=
X-Gm-Gg: AR+sD12nwI527btY1JmRhtmvoo/VXbNH0QSSeaIKw4U1o0Ir5D5zPNN3n/nzTd9oXXb
	7M2+n5plz2eikRMKmGiIJIiHx4CBUarrpYT7WFrty2R95SvHYz3p+z+JxsrBCnVTkzku4MzVm2A
	DUu8LLSV3SEPEvPK6NgIxTno15Xsn7ElMlsB/ITna1k4unP/xKMtsSIE02i51hGdIx4XT8dzBle
	5Xwhil6MqH7kWNg9fugnAzmKI1g4GYtamcH1NACRYQHeUmRUyxgSNH7Lkoszlzy2l/S7BpFNMSD
	B2pOQk2SB6MV4yoyXIZgW2eI87mxAWlkQVnFpzxtqNAZYzIiY9xwVKrFK67GCsfu1zYVSCZogcN
	1BjThF+2DYpkayK0NdzIx+LWGksKHSVcJJdBTnOZEWbICpD4K9myvbfKu5Tqh65XuIS+4I+MHr4
	vPF8Y1xIhLcDzNUEHDApuoUkFppzs71qjZemUc4IJun+K4N6oHIjgTrhQIHaNG0lR5xEcPMeZgN
	TIOApTqvuOxZHovHxofv3uKEeukhCT1z8onTFt27PlCU5NUr7bxJg==
X-Received: by 2002:a05:6a00:2283:b0:848:3f07:c5a2 with SMTP id d2e1a72fcca58-851f9bb67d5mr15831949b3a.4.1787359108945;
        Fri, 21 Aug 2026 17:38:28 -0700 (PDT)
Received: from [127.0.1.1] (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef36048sm138146b3a.26.2026.08.21.17.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 17:38:28 -0700 (PDT)
Date: Fri, 21 Aug 2026 17:38:28 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: OCTEON: pcie: fix kernel-doc comments
Message-ID: <178735910069.2385329.4700301768239156444@gmail.com>
In-Reply-To: <20260822002543.2381024-1-hanzhijian1991@gmail.com>
References: <20260822002256.2380061-1-hanzhijian@zepp.com>
 <20260822002543.2381024-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Please ignore this patch; it is a duplicate of an identical patch
sent a few minutes earlier (<20260822002256.2380061-1-hanzhijian@zepp.com>). =
Please review only that
earlier message.

Sorry for the noise.

Han
