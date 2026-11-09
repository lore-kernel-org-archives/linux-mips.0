Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251180;
	b=p+vV5cyNlTYmBx06o9eXZCaagWj39zadHOzKOx01fUQzldhE1g3rx1QfYVRwGsFCOu3P
	 6xvGf/Ru+pMISOk06s4n9iViomBusf5QbS+zM0t+maJF1tnh221AVDOy15LRPfozaORpp
	 r2XrOcWa7UPndnRRgADOov95cVMIhXSsyX9M/u2MHwy5oRIFcV6p37dLyea/AabESDiGb
	 CARNhtLzIB9ABmCAP1D9m95r+q9Un1Y8UuR+GQykfuIMqIV/jGab7UuZa5y6v1Lvfl97P
	 0EbQheGGvHNWe6uCoPMy4qMP4Ty0aCy0eLMH7vyCK/B/H0aNU5uYDlCbpmTctQc0QDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=li5d2lfP83FaELH3ZUfaKJF8RdMswZJcZZJT9tiY5Ds=;
	b=J8zpoH7m4D5VzFcfl1/IGxrgEVBWW5pmBD03yhpIhi5/YHRR748pUkLKoDfMp6CnSlf4
	 Xmdux2VyMjU3g9THsnqFxXDvR1bkQBeT1FT1iT4l6I5SLNbriRtK6KxpjicJSayU5YlFC
	 HDENbviB8B63TeuiP01W1vqtxZNFT7MK5S2PGDVgsqo1eAvxPAOAg8RrG6G72g71wGQmK
	 1mMuf5q6cEH2ipTaGRZqAT2EXD/TAJ76e5N6xyzxb9uShqGmx9i1Ai9lrROs5sBCc/kkR
	 fy0Lkmg1hzKCzYRuUYil31THcVh3EdMqKksmKP9dKTQxSzQwpThijH8c2HXq3Gwkncw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=DzTk3SoV;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82A606A31C
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 19:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C82A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=DzTk3SoV
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so2244405e9.2
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 11:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794251178; x=1794855978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=li5d2lfP83FaELH3ZUfaKJF8RdMswZJcZZJT9tiY5Ds=;
        b=DzTk3SoVBRaFcDjESOSlDz+HluB5pvDxRqpoAgww6sSmdd7ztACk0SYKoJNXXElEzi
         ECwOk9lzQmIkXUZDisPBU/I3rITknP4L9GV/qOVXGKoIGiQZYdM25oyuzBiqiu3TP0LP
         PSKPrRyrxSUNI4NJupNbxi87jQGw9w2QAgGLQf3sNbi1oPBHAc9nFnHWFA7NqXb1N9pv
         oHakxtaaompDOsaKYA9XD6ftQfsAgYD6Mx1jbHmkNhE9RPjeCYKSm1zhYksnbnA0G7ny
         GLuGN8vJW+lPB+6Qld9RCBsVduTHl9g57S9Upio6p+CdYoZeXn2seSyBMrjqNTAjG5mo
         JFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794251178; x=1794855978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=li5d2lfP83FaELH3ZUfaKJF8RdMswZJcZZJT9tiY5Ds=;
        b=VjM7ECn7gsNelcjK3MF9xjeAPBWCBMEwFR/r0NJ7DqiNclE4+WXqTly2iQsz2b+x1b
         rpPY3WokTvcrUoFD4Ck4y7J7LlLjwzkglRFOSkcmBZu6mPKrJypvza8ChVwMPvdnXrHM
         3OnnZYStHbQHbQVwFSZQizQ7rmKn5WSdgsDiYk9KCZmGUOpvphtn5odrBV3KArgnkh3/
         HOi88PqFiSIFq3vuuObbbibKuqrmKEEtO8HoKth5lsHnI5B6gK3rJqK76y2TytGWOOoz
         ydwePXQHN3AdtQVXYQ/oyFsTYSiiH7Zenq5YVYdxO8aa4Fmah+fi+OuRzxoTZqq09pyj
         p8pw==
X-Forwarded-Encrypted: i=1; AL+hErG5xrtmmcWaDuoPPKafdEM/WcDbbhYkO3TKMBKIjNoWJmVa/IfCaSoMvy91nWyqQJSIvZW1sevbfWT6@vger.kernel.org
X-Gm-Message-State: APuU4Z/ULd2Mfg836RQfnQJwxCyVXIGKrzSE5syk1U/D9pGnTK5WzCDa
	fs2yOkzufMUlzmhpEv8w3U4/nXrp9nB0jPGgxERcC7d7+d9l2ICCBpS/M6I8dStm4oE=
X-Gm-Gg: AYBFou2pHbsnAITp4b8/+4i8ezVmiHcvKDIJWIYYEO50q3pDkgLZeiKvltZ5wd6iRbc
	6deb+CJnVsFDQKifm7X4X6NxOYdCndDcwU0pRWUq8QbDnAQOCbdaZ7s8VIzMBhr+qGGb2lEAgFJ
	ydtaOTT1EMDx7cpCMypADoVceGRQYW8po+WofT/vEUgDl0OOO/Ughwux/v7xTX+jKbihk+cWjjX
	nN9Q7erqsD2lLbkARCeVaXllunIJcHYL+XAwk+na1U3dycptabnHTyMAdQzkuLT1+OyYAA5Blv4
	MjPQVri/QtZMBuIRWMVc3nSOB/HJnXsm3PecCsu8a1KLwJgRdnZS4Uax1IAJuvu7gXfZNgKVuuF
	eNkt0geYu5M1PZn/M96RFra6yhx+vJwkpwUVECp2PIZLKYs5Kisoo44CgFO3c/268HFvgsIl6lk
	bXJZ0jrk5ypY3OaGM8CiKcJdXVEGH+giw5v/6CPt9H/OvmqqXaqjHBpxjOQpwTmMQhOrQ33eWyc
	ZNof+Pe6NIBMPIqkSJBcCjz07ft8ybw5gU3M7TP62C9TsfWMk23zD3EQVtIXjW27GkMw2ytVD73
	lkZYgEY8jILdUsaBp4QWYnFvf3iBoJjLitv7M5dxCtcM8Rbk1azJVCQPZknGf28=
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4ba02341314mr3514265e9.6.1794251178564;
        Mon, 09 Nov 2026 11:06:18 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba476sm10178685e9.2.2026.11.09.11.06.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 11:06:18 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Vinod Koul <vkoul@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dma-jz4780: Fix NULL dereference in tx_status after terminate
Date: Mon,  9 Nov 2026 20:05:02 +0100
Message-ID: <20261109190502.71581-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023080953.16963-1-olivier@mgcrea.io>
References: <20261023080953.16963-1-olivier@mgcrea.io>
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

Hi Vinod,

On Fri, Oct 23, 2026 at 10:09:53AM +0200, Olivier Louvignes wrote:
> jz4780_dma_terminate_all() sets jzchan->desc to NULL. The cookie of a
> cyclic transfer never completes, so a later jz4780_dma_tx_status() call
> with that cookie finds no descriptor on the channel's lists, takes the
> else branch and reads jzchan->desc->vdesc.tx.cookie through the NULL
> pointer.

Gentle ping on this one. It has Reviewed-by from Paul and Frank, and it
still applies on dmaengine fixes. Without it, closing a playback stream
oopses (trace in the commit message).

Could you take it for fixes?

Thanks,
Olivier
