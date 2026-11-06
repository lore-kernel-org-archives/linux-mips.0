Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959228;
	b=WET18I4JQtwK8Jxyn1kZh61xv5Kv0UwCh1qj75bTjhtnbTei0+LCWO4CFpTmgafvrfE3
	 sbgXoJqJ+O6zuTaA2f1qyMh5/uMcVSgKJlzPXxPN+VQyQJtM2vSobK0YV4cWVYR50UCP1
	 sAOTSfR90yDEklNGKZ9o0D+JGJf4teIFb6bMpPzYbV0svONelCrOjabWH5lePbrgV2lY1
	 DIri2cSXzmNpZPVPm5RGQlQbzdo3Bgtsji8VKPrAWPe+sLr18RcjT7gPu9upT9CwqQ4ed
	 OCTUL1yOli/qy8/MFINNeZmvr8PqeGSZgupKiDJOJRHeKhd57CR/zYd/7z09L6mBVPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yCBgBKMY+oy3XViUBHf7wx1cUIY9nYtt/kQ1CMxL0X8=;
	b=S1jntvcR+3TxQcOYz3Y9KJ64uDNZ5xorVU+l26TqcQcnRDSE4ijTaZI2ytC/A9m0BasS
	 /NkFExPurb2oT0STqtDfzAU05+pgyfdKo+GUS0Rmyy4w2rmI9RKR6PGDHuMshIxbjenbk
	 7TCeDSOBtuTiwJmEyucWGW2EjlgygNlQKsYmJOIRhgjbieJFX3m503p4NnfDtcPYMMH2r
	 pQ8Y+JAaxKhtnfxvejfn6TSioikyyUQmo/cYPNOLgolhs8GNMwWYg3Oq7qCxNDEwGfJth
	 FHB4ZAtSZ8YHpr/M6am0Wlnb5mMoqOsHbUUytgGQrlZpRRkiHFMwgeInI4TNh1vSMTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jOeFNwHa;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DDD606A329
	for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2026 10:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0DDD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jOeFNwHa
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a215e64962so4564965e9.1
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 02:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793959226; x=1794564026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCBgBKMY+oy3XViUBHf7wx1cUIY9nYtt/kQ1CMxL0X8=;
        b=jOeFNwHao332HVD3QfiQaM5lk7vcAcuQZLCaMifPIknjCvH/ze3hFfWuBV4EoN7tMk
         wEoP/XwX4ULThqV1kMKSVTIyKos0MpEI9/DM853jGT8B7QZDLkJWTiv12Wf4NYzsPLyQ
         FnrFI0FMPmbRz2Y6dHMQ2pFDb+paJuVVTRzZdrhHt00cALOA+uVDF4nOEtghJt+1Qp0d
         KQM1ioBMXXiJUeyCl3m2BusET9eM7dvmLWYgyAMoVFBNIyR7KRbY19rKvslC07zpMwdw
         z1BhkBlaqompvfLdAX95pJqHTOLThpCQ2uHrbpMh2aRtIrZxi50iL47D5iHIE2IriNRQ
         XfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959226; x=1794564026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCBgBKMY+oy3XViUBHf7wx1cUIY9nYtt/kQ1CMxL0X8=;
        b=rL0svqmYtozKy7jNhoRM8Z1OQ0Bp/v2SBqcCFupt51rYjDQ8M5hXjr9Kkbree7fVjq
         rkmiaRnmHe9bZeM7AYcxtIPa9o3DehOmkc2UutDbgi3QNazgUMU0tGAbhkhe8i5ZuDCP
         97KdTKH4XDt6paldKKMIM9Ufa1U3GT30es9fDrAAomCiEYa6+CbGqENiJaMbf46IUoGH
         VdqVGPr/04cmWBFTYmjgaivjRGXWa87h22jdemM77Zu1t4mHZ/agkMtIVN2F1X4K+21j
         +2nFDUuhzElzcG2s09qJ0yUMhxGkHoOeTfCmPd4MC0enFialGN3oEEIyA7TrB3vTsv+e
         +jcw==
X-Forwarded-Encrypted: i=1; AKwUvBwUYd1JXDvtcSNWF4Z90t381Q2D/ryn10cVIIxVvUb4qDdDTJNbcAeE97m2tkEqs1rlNIIC8Nw2pitL@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vui+hBFfhuwUzguaDK7GrOzYBmRsFZqtDtbO4ALdMmXlmrHRy
	ojsHa4m66uPWq8IUS5KTNq4NZrFmlQCBl4/bxrCNs/wFyjhKDI84m6BRXWbRpVe5KvY=
X-Gm-Gg: AYBFou1dSOXpZDiFufwo3NddFMtwYxr8jZ3IeuCNSAs0z1e5LkyFnaDYxOR6oj+LmUJ
	1Ua/wwPpPVEU53EBEe0TRu798nnn/YRufomPL2EoRycyRbuYos19x0F3mHOTKLQFrRZ5/LCD+CT
	Ebuupl3JTOpx8+e2KXV9bijEVQFFKCCAZ9EFiuLmxj+ksvRPdA8W37ZYnSWQeKUSH5a7A4v1tfS
	ycZzdv4gUwGQ3JCyqZdL1VX++311b348eBevyOOFTMVk72xV5xbtemkSI5T2yZa9j8r67ovca7I
	wV9d2ZkCm+WfhCmMesRD3NI/vJtARwhGcYAKUU63g5ODH7+/O4rmbZRLKp8loXaafp2YNnGN8SO
	Jkd5YU2sPHEsVnBKhgKy0V2E2plIYjzg2lE0rjCo/UW6fyWPPv+n9q5Xnipg0brC52TJSVKUpG5
	uK9USXYibP+SXwilaz9HFqWFCZ870itjOCtSW8H+INGpfBbF4ghb5/9g3JkitYs1zHMSR7L42rX
	JCqeaHKj/hoxa4cWGSJ4TbuvOnh0y51fV79O5PLTeG7GeS1qyjrt7GG5+5tDlcFksNB59HfcG3t
	PcB85dHVnXPZTZNTTIZlonao+CmFqxgeH7n0OwnochyQGyaA3ONuNT1x/HF/2GdIX388GQ==
X-Received: by 2002:a05:600c:4f55:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4b6df5eac54mr35512905e9.22.1793959225655;
        Fri, 06 Nov 2026 02:00:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b79sm2824397f8f.20.2026.11.06.02.00.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 02:00:25 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Fri,  6 Nov 2026 10:59:09 +0100
Message-ID: <20261106095909.67659-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <eeec310a-a271-4e56-8958-a03318f07e82@kernel.org>
References: <20261105213210.87457-2-olivier@mgcrea.io> <49e69d9c-6cb1-453f-bbf5-e2202f97e4ef@kernel.org> <30B040B3-D371-443C-A66D-11EF89FC7C63@goldelico.com> <f74bf2cc-c459-4b9c-ad94-c60afcaed3cf@kernel.org> <05798D24-C5A7-41BD-8FDF-F7075F2F0D01@goldelico.com> <eeec310a-a271-4e56-8958-a03318f07e82@kernel.org>
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

On 06/11/2026 09:23, Krzysztof Kozlowski wrote:
> On 06/11/2026 09:18, H. Nikolaus Schaller wrote:
>> So this tag should not simply be dropped but moved to the driver code.
> Yes, please. Thank you for testing, it is important and should be
> credited, just accordingly.

Right, my mistake, I carried it to both patches. Sorry about that.

Jonathan, could you drop Nikolaus's Tested-by from 1/2 when applying? It
stays on 2/2, which already has it. Or I can send a v6 with only that
change if you prefer,

Thanks,
Olivier
