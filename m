Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795652958;
	b=Yxh5uM091+Q7boFpaF6nwEu6tRMSMzVZqRxz9fseHEHo/MFcGE1Xczb4/TJJjMTdJ9gB
	 LEtosLisOqJOFCP8sjFKmeCrIzg448w3s6Dg+mn5EFuOByvNrtftbX05pigt95bczowEo
	 bhyF2CfainpFAk1cUHQGezQuDRaWrh2sN6YwdI27yv9h5Hz+/atLL67YAFPYB/cLNJ8j6
	 BceuAift+WHS6ROpNN3v16Ytxqo3S4gZ0s22gHAJSzcA/Q5zzFq4iy4bUn9h8JKOfoDPG
	 ePAlgySl90TsamI43/1pAa8AiRBUNW3oFDZ459V82r+A/ePNfgj2UyRgSC6bgNopVPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ica91CLq/2YhNsGz5gWhVwzBtrOD+YGQQy5zyrqi82Y=;
	b=XF8kDO8Hi7NdVPtwyglHvNb6lf/LKNceqkM1rVCYtXy06ZDsQBkRVIxL7+XUlG9ul/rS
	 Op/Zh1FQOzz8zYZxuNtcv9GhIcUnz4MI+k1FGlaNNhEfPgsZ4apT2q0jSDaAmTbftKnCM
	 ft0RFgJy0KswULGoLSzJn/BswXvbyLdm4AeTKAZcfFJjqPHpj7MIQApUpL3a5o72o2u5u
	 VIQdgEDsNbB3W/Khn8sgc/IhM3tk4j717L2MvUV2VrWQ8WrBztEmBOq6+lcma4Q3ejo9y
	 st0kebteUjQ8yF0HFCG0OmfVi2QEEnMTyC45aZ++pbaeQ/QYH6RoihFW9WEp3w/ekrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ub5+Ywzd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4807606A323
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 00:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4807606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ub5+Ywzd
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38431138772so8370698eec.1
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2026 16:29:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795652957; cv=none;
        d=google.com; s=arc-20260327;
        b=PMVZEGPnZHkChh+cGDxPKRIlzDAsd75YfwkQgDaw59pcUJB5ycQedRXY1Kk9njAgW/
         0PaT/2r/1aAkojXiHhcyI70+Jy/0KbFCtbHgBD7l93MMUJk+HbEUlpWHthozlG5xpZCU
         77my8BAuhclytaLpdYz9ML8bY+oamO3mw2bIHcZLVbxMkY2x12IuF0NUBLmtEFcACTvy
         LMrS3TAKHYrBrHVvax5JxB0KfdTfmSBx5Fb4qXONLVlrdii08kgQePA74EmlT7px495K
         dQQ64JvUsbdbs9ZWQSsWcZsF4uGjSija6Zi7c/JEU1MkiMd57fpGmSKXFBQf8mqAdSjt
         QRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ica91CLq/2YhNsGz5gWhVwzBtrOD+YGQQy5zyrqi82Y=;
        fh=4zqGfQUAcuprANjqwstMwKfTpGa5RB+n4vJbXryPW7A=;
        b=UEszlz95bjeO8fRQheDeri+EKuzGzZvhRYVlqZm08noHEYQv9qdzzSFHTDGk9RbOUJ
         xQvtExHvhc3mDWnLpmSXUSZ5ekKOduiuSIXkvc7OBEpUgFE9jGMcAfkokHgw1I3QwGBN
         ogCJCqUKGgjcEQxuXCYMqCzqVnfrTGeOR872PrdkKM4pGeueqrXfiBzukvyW2tEpGkZP
         k4v31nBl0w8bIvwUBoOPxT72rPQCONqIiJIcPZcSul3ylGsP2sOyD4MQiY/M1Tjuz227
         vZW8tNVMDLh32RtojyaiitIYAbtV1XnUNfSeqxhKqHBvt/X0eILRhiJh2kFZ3EGlfiPm
         r7Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652957; x=1796257757; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ica91CLq/2YhNsGz5gWhVwzBtrOD+YGQQy5zyrqi82Y=;
        b=Ub5+YwzdiuUN8y2thMXw/sAFQdoXSSYjGpdKeJT6yudZpa6OQPF5A5pOG0YOuQyTOz
         UO5l1qOYE48beCTfkdndGsGv9b56Pq0zCGsYdGmNnEH0NrLN11jXldzWodGidVN/lVIM
         vlJ4cIhsgtYNu050gcL5H1l54B0bPnt1ZNLQUdFrTpOGhNMcoQIsq/kKPMVs1pzJViCK
         4zlrbc/Gz0v+dzhyTavQHdklHOnI5M5AVrOuaNiO3G9zb/bMAtv/E28wXsMpd7p6VVPt
         nNn9jXivYJXPzS3bYIt3xhQurVGJZSF2tDjaodfFawCgpCYxRAXebA1U+SXVJly/SooP
         YPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652957; x=1796257757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ica91CLq/2YhNsGz5gWhVwzBtrOD+YGQQy5zyrqi82Y=;
        b=umIghAB1BD7UoJ/iw7SH/LHlRRaD+tUYqIYVfcBc/edWv+3bT7cBzaYCs5rikG+ycb
         3HFYAEiESsWvwJPft0MggvLox61RWnZ0AVPzI+ZBWGff5ElMX9LFHW0w/ZbygW/D1Cpt
         A8LrseResCKR4cafFwysIwRPWzGiTdJ1BBqNcx1ag8ycCSzUcVN4Fl3axStBJf9X36Qz
         ldAUqVtZeYAb1/7FiMyPmGx7KHcw1DoQUZxvuHrPfoXLqQjEZooOU+HhXI/XdHELHTx/
         PhgHHaT/aY/nsRzzTVPj3MZ0ZJNwX84ksxuc0kP9TCxJ/4R6rEt05dISSi32njguTO3I
         8x5w==
X-Forwarded-Encrypted: i=1; AL+hErF6NuzvOQK/Cj+JoQgDxuMs0nNzeZXgpgBXtUtCGHPzTrfaVWPavJgovK/qNLMrfVDEOfPejxybg1lp@vger.kernel.org
X-Gm-Message-State: APuU4Z8uDf6/pZ5fXqvmO/SIXelEE8jEQku4WfW387dvWg2w0E5XkJQU
	5I6zL4X5OUeqy8bW4s59HxIYz74uIO/myObn78rUmgFC86xl1DLydLUBSwYhLOJRQPB6YMk+SjG
	u2IUa+OhNxeQ8Bp+aPmaIuPG/0G5seDI=
X-Gm-Gg: AZFdTZdf4IvWD/SGCiPy6eEiqOZ8l/h3PvewsSvyFhKWrAVR4oYAhVASJfjRnzN0m86
	efL/JNWTZbkpKiZwBqK8AoISvr2QJMybD3z3HMDvpTXMM7GtJcYr2uM/aU1p5i2BMZntzb4z68J
	TAT15Lu/fNzkXYNuyCGk1HEPYLKfiDqHTHEmmyuv5bnGBeKy9EkFSLfukdjIbs5u2murUAeU1VW
	OdP9R4hUnoNY2TlPBK8n8nSIlV35B1spgDvhN3Oo/1zRLETpZkMHXNdWNLjEmJ/ls63YAwMwtad
	XuugbXFACrCcqCdxrsNhDIU26PvJ0gVCZ9mGawKRKd+xSwXUXCFpc8GD15wJD2/OzZuP5vyI94w
	xXG9+8cnarWberr6xG2BnfjB59QZNpH3Qe0EsL+I=
X-Received: by 2002:a05:7301:dd8b:b0:372:32a1:b384 with SMTP id
 5a478bee46e88-38571510675mr21743896eec.33.1795652956755; Wed, 25 Nov 2026
 16:29:16 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
 <20261125072026.2997493-5-prasanth.r@lineo.co.jp> <awdYin-gfFlMzm5K@SMW015318>
In-Reply-To: <awdYin-gfFlMzm5K@SMW015318>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Thu, 26 Nov 2026 09:28:39 +0900
X-Gm-Features: Aa3M54ppWwPKU2GXBN__reMNMjMzYNk4yHpP-osEJU5EF1y5sgVMcffyz3AkPvI
Message-ID: <CAG7eodGWsRtuQWgN5=7c7b9E7JKhLXAhZxRGgbDW9JpkSzhX2w@mail.gmail.com>
Subject: Re: [PATCH 04/12] rtc: mxc_v2: clear the wake IRQ on unbind
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Support Opensource <support.opensource@diasemi.com>, Paul Cercueil <paul@crapouillou.net>, 
	CL Wang <cl634@andestech.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	Prasanth R <prasanth.r@lineo.co.jp>
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

> Needn't it at commit message, you can move it after --- to tell maintainer
> you use AI help.

Sure, I will move it in v2.

> all devm_*() API need check return value.

Will be fixed in v2.

Thanks,
Prasanth
