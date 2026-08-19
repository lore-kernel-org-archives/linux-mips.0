Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670EE399018
	for <linux-mips@vger.kernel.org>; Wed, 19 Aug 2026 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152234; cv=none; b=L8WqTsF9kXgAXdp/wXPX+MKkgyHn5ps3/X6JVRpl07qbSj9+1aJVGOHuQdpoISCq6NIjiTnfcrmmjPhybWlhw/oAHwgqJPyTf/IaMJzYrD8/iMKxkKfDidfFO35Y0MYievPRCU13Zrj8yUaVqJFZJAqfgPE5XiAcer+rmx+dABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152234; c=relaxed/simple;
	bh=mlFiUKgQggRMc/OJyKurQ3JWwmAPn39IOAT8jFs7Tvw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=FCuqfq/VlC2EqGUl9C54ZfVwmlupxmD+w9g1T38Q7Kc87+RXK5Wr80u9yNKKTu0uvEfuASG/2MebrOdUXhi9ziv7an0kOvoDQ7B0NuMBH+52CKnrgCildgGgAGoyB7WZt4RxjTbpLaNsTLQY7cAWTkMyoCeVRLtQJSxqU6yVI5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCMM31UA; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCMM31UA"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1535836a91.3
        for <linux-mips@vger.kernel.org>; Wed, 19 Aug 2026 08:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787152233; x=1787757033; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mlFiUKgQggRMc/OJyKurQ3JWwmAPn39IOAT8jFs7Tvw=;
        b=HCMM31UAdZtkV4lCYfQPG91MlQD3JC5ygdsWXopnaPmbdzw8X55S31yEK7vCyyy2MG
         PGrdUCmTyXVh74Qd88Hkxd2Pp8DKB6OU/QhWuFpeukGM3Zni5W4sfl7JVlMRa9HjPouf
         mIktF+LfuihTc7baRQjQrKtuMJkuDaoT7q3no0/IyyeYBb5pzRXNLrt10B4XH2hrHMAR
         6h6P12dpiYT5I7LFHLNo94/mbLSAcnyTwTfwJBdexq0DbpkJflop0MqAqVERiaQ3SHCV
         Socffc6Io3Ojb37VEO0CW03UDJubFLoGdyfdwQ/zD4YfpQwDuc/2G3k0xjmQ8/1mVVOS
         Oqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152233; x=1787757033;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlFiUKgQggRMc/OJyKurQ3JWwmAPn39IOAT8jFs7Tvw=;
        b=De5NrYw1JWKvblfxwY3gGFrSK0a1MZV0oHO+zr22lxmJXb2QAZM90Rs8/JPJX8CXqt
         4ei567Ks6w8R7BaAcs9daw3xyEpua+kEroqDU9JnUt+Azn0ygpD1YtpA+dP+/VfP3ZQE
         supEBVeKfjzTHPt6WHbr0KeawoEyhRWk50qbE2Ouv1PViQzp7ASS4LmPgqbJGtM8+tTg
         hzKSBWa11QyoTuGzdXHivw4gEPVuY2wVa3Pnz98thf5wwiTtAW9flZJxI19NiwSemnMW
         9R+V7k2bW/W7dDNruTbo+BOk1aGhUU0OzATDmzon0yNbX+eZPNXsY2WzMnkYYnbgffCw
         GMgw==
X-Forwarded-Encrypted: i=1; AHgh+Rrdy8sdQ5Jx1wJ0UCL0t+sxVTPAXhFPildm67OGTx6AqNb4XfJa3q1gf4q9fQY8z4OwbSXW+/9kOxPX@vger.kernel.org
X-Gm-Message-State: AFuF++mY09i4TRRMj98Q4X3mqJWEp+Pwl3WLfI3xHbTuLtwJfGCuxS26
	aQlDhGl7mPSTfoQeWk8oES5SS5hcG7GRh7eJP/vg00Qoz1MXPwKj3YJWoE5ylg==
X-Gm-Gg: AR+sD13pvbeQluNftuuWhZLcVWxpz7qXuign6hBVazApJjZAR5vecVYV7ns+y5rMYBD
	lUgStmgmj4Ml44+TzgbnlvZeJNFNOJ+WCE1i+ep3hkG8mmMhrM2qrR2AGCSXVqAjMOXfEQvJme+
	R5KkPnXFp98er8TSAOYLjUEwKWOavzCpvN7nn79WL096t+Iv73PjhGgykKMkJaWGI//47D+Q8BC
	TitPz3v2IKqit89yowOhUYL4JD8Zuv6NHGeEi3SbXICLmW1SYa+YfOzsCo3rd9t0RW951iU0ZZX
	Yx1qMVOamWm3bSnXGZjP6okBzDQBIpet7AxXqqIX8aQ9/6KCfxVG97/7sHacy7G+w0tP9eE2tGf
	un8QDMemkYcFb5RbX83Mq2SwVtndrEv5r7FnzmeHwLW4rbOl+6UUbgKyF/LceKVPDTl9jPyocNr
	00wnXxAuxdyPQMWlnh6uAv0w5nyCRwIpBovmlDQl4Jn/iCt7YgXWNGihRR2SUsOc5P9jWU5Q==
X-Received: by 2002:a17:90b:544f:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39580f0943emr10846765a91.5.1787152232706;
        Wed, 19 Aug 2026 08:10:32 -0700 (PDT)
Received: from localhost ([2400:adc1:447:6d00:6351:4475:eeb9:18f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm7189580c88.12.2026.08.19.08.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:10:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 20:10:18 +0500
Message-Id: <DKT0L6TUJDS0.1USKEHYON3OZJ@gmail.com>
Subject: Re: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
From: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
To: "Binbin Zhou" <zhoubinbin@loongson.cn>, "Frank Li"
 <Frank.li@oss.nxp.com>, "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
Cc: "Keguang Zhang" <keguang.zhang@gmail.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>,
 <linux-mips@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
 <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
 <an9teadkgwUsmMnQ@lizhi-Precision-Tower-5810>
 <735044e7-07e8-462e-b94f-4fea1b5b1838@loongson.cn>
In-Reply-To: <735044e7-07e8-462e-b94f-4fea1b5b1838@loongson.cn>

On Mon Aug 17, 2026 at 7:07 AM PKT, Binbin Zhou wrote:
> Emm, sorry, I don't have any test equipment available right now. As far=
=20
> as I know, Keguang is the maintainer of this driver, and he has the=20
> necessary test equipment.

I apologize for the late reply Frank and Binbin.

This patch has already been tested and reviewed by Keguang Zhang who is
the maintainer for this driver. v2 was based on his suggestion.

Link:
https://lore.kernel.org/all/CAJhJPsUmpie6NkrzuTK-8C4NP2FFKQMG3nY8626_C9Qjdu=
4M0g@mail.gmail.com/

Thank you for your time,
Mahad Ibrahim
