Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781181;
	b=OgWGIpxcLwncpjTKYYHGbgKo6sLgErrzUmbTvxUh/U9KKO7xXiLxG+T80ZER06oeeynG
	 vpbRX8xCHK13UwyHJWysOeHuW5IzUD9QlHLxWlLN7nXlpFQOJ1T9gOiBwF+Jr5nLteNOb
	 6PHdQ0+Q74uv8DFZkaz2SJdb9hcIR32FHtikhMCyeZczkxwDfKTBhKJH0duAN1yH0DCTm
	 P6wN7D4d4bHWdsGVA5XJSr2Y+LcLkC3vpxOqCLL65/btBl2Qn1E5D4AMDaIc1L58lMd+g
	 x37sQCQM6VELLqhVY3t3r9Z5vOOQm3JXb+fwGt4lQ9Bwx5E1PEunylZmBI6NXpLvZKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781181;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v+la3jMKr6nPIrYEiR5T+L2vDOYUs+pDzg8N/ii9g/I=;
	b=brfiw8QECwg72nOQjv4HseRYPC3d0xggh/ZEboaIv31XkKUBm1rencPjHa1WDV+7fWD9
	 3ZNCIuH8rLVB4QWiJREhWSmTnsB+NTRu/GpUUFu8T5+UM8BHh+BvQyGCgb3wEl+WEBlzg
	 QB2KoP/+qaDS+WWyRIZESKIMXdiWvWDJLtXeME7dWw0KEJkjqIkOQVtIfCMvFqKhyGUsY
	 906uA0Zix3GN9SVMc14XFMkGqh67nNF06xVttUYHnGFYHHZvmTo2IIQ79QndjDBFZycFd
	 5CNWMZIX82+zWTJWwDAsyIM5RmDcvAMYFIrghNuhhjGSlQj7St7Jdo8jUGDHz0vDDyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF35606A326
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 08:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF35606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso176534a12.3
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 00:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781180; x=1794385980;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+la3jMKr6nPIrYEiR5T+L2vDOYUs+pDzg8N/ii9g/I=;
        b=sMs7HKdNJxYJbqlB5b34N5lWipGxlpPUhNdcYUVf0XvDEUzfdl88E62OcXvUG2BNvf
         nFksI19MrShEplwo/oVsx+sfKQCQnyGzwQh26YrYHCuaLg0V7eNss/SmumpecaQsE8pM
         rC15btS8sZkoFEVF5gzcL2wJdNoD9v7iGDi85/FqccvKlf/4yLpmaNcUQaySN6+ur9Ip
         l0s8uYr5YN4hHmmzRvKu5LzFLCaUfD8s751uGk76KVdFFwwFMrP2wI35EM2SAyi4l8A9
         i8ZEl6waRWzc/6wegU4ikCMY2VGSD1V3b0XrlOjz093oJMnFLU0Lu3jeSpg3cxWfcBZX
         Rq4g==
X-Forwarded-Encrypted: i=1; AKwUvBzjFJzaXL2usLusJlEsRHiweGet+bmWU0rvvIBbE3c8BEARKDmtvbbl0c6ajcF4tvrt/aNHp/9W241H@vger.kernel.org
X-Gm-Message-State: APuU4Z8/3OJffwL3J3qxt9wng/6TQqs4sr4voeLow9T6R8GDlec+P7BO
	1bfL8tW9Xz/9TmpSCapwRXXS+gMYz+4drLBNiFvWGAVhWP6OZCTzTt54z+LpNW9F
X-Gm-Gg: AYBFou0YLCjQNiUbWvaPHB7NHlTA/JeH4qfZdXwvDJDldscZ5DnWx1P+CQ3om1AKcaR
	bylVvzz6xU46mmzBy/nkgBRvxDQu3LbBnH6Y2u+EaRlyWBCulkaWBS3qP/eFIT6ircpeghMCzcZ
	56gxPFjUeIO43LaKbzHaaPOsWON5QOpn3Ph52GYxXfgNbsLN/ZAxlvR2XCcXIc80byfjAr5XqfJ
	20dMnGlSN/LB5xbKjn7pUywGCzTjyd8ESXycyxCkNJuLyhd2yVLQix5UDOS9liDyAWcbkzvH9uw
	j4jn3EBGYK4mg20ROY9F+/IEGrblVatGCWdHGP8eU3F3oLSt3d7ozI6mleVdlZztLsd+w6eyA4b
	zfrLiqI128n3bMIZBy1QOh5U/nMPyuggXcUZFHpyoJ8b2zAWANEI7MNFigrG4DP0w0rzTTx2KP5
	zlYidMfXOMZ4+3xNzdRZgLVI0QqEO6kd0S4jJ552kMF3w2dFjYcz9iiehMcKCmMaE6RzPhSHB3D
	PtBo+oq52CnrL7XneiJmY8rdpOHYnOK7YclFfO3kpzOGHVSGK49AP3S+S2r9wZw8AGZQM2Aay/q
	w7glbTYD8LmE4zOMe6NdjAaOmCorZ2CBG/K1ZpRU1BwivWpMjKl/ykulVPv6yMVlb7KlfxK3Yn6
	sMJ2AZEVbxQOUL7gU6OprUFKJ9Lm35oIY5slghQIq/XY=
X-Received: by 2002:a17:90b:4a84:b0:3b0:97bc:62d with SMTP id 98e67ed59e1d1-3b097bc076emr1262126a91.32.1793781179725;
        Wed, 04 Nov 2026 00:32:59 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb467f798esm759563a12.10.2026.11.04.00.32.59
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:32:59 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-369f33df08eso730619eec.0
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 00:32:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy6yi0q5yYXoYlyqOJuJBuaJnhvHa63duKa3R/CQQ5DvKe9mEF+nosqBquw7THGWemO5XECSjG3Atr5@vger.kernel.org
X-Received: by 2002:a05:7301:f09:b0:35c:ba31:6fef with SMTP id
 5a478bee46e88-36a424438d2mr23103058eec.36.1793781178690; Wed, 04 Nov 2026
 00:32:58 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev> <fc273wsjhyvtoqjnuiipramnvjvti4n26yxgvr23neuawnz2zp@krm4cfn6pfkb>
In-Reply-To: <fc273wsjhyvtoqjnuiipramnvjvti4n26yxgvr23neuawnz2zp@krm4cfn6pfkb>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:32:47 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4-voYM1Uw8+0pYArJoHknyyg5CMB-mbG=qn89agxxYug@mail.gmail.com>
X-Gm-Features: AclHuK9LKKTlOPvX59pIytGyTkFgOT4Kv7Bs2y1OMNJDw7pUXgmS8KoRNSgAgSU
Message-ID: <CAPY4CJ4-voYM1Uw8+0pYArJoHknyyg5CMB-mbG=qn89agxxYug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO controller
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> If you're a co-developer, please add your Co-developed-by: prefixed with
> a list that looks more like:
> [...]
> The above is completely unreadable.

Thanks, v2 will use Co-developed-by with the changes listed that way.

On Wed, Nov 4, 2026 at 3:12=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Wed, Nov 04, 2026 at 02:21:37AM -0500, Joseph Telaak via B4 Relay wrot=
e:
> > From: Chuanhong Guo <gch981213@gmail.com>
> >
> > Document the GPIO controller found on the Siflower SF19A2890 and other
> > Siflower MIPS and RISC-V SoCs.
> >
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > [jt: from Chuanhong's siflower-7.1 branch; Joseph Telaak as the binding=
's
> >  maintainer, GPL-2.0-only for the deprecated GPL-2.0 SPDX identifier,
> >  example indented by four spaces, commit message, subject]
> > Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> > ---
>
> If you're a co-developer, please add your Co-developed-by: prefixed with
> a list that looks more like:
>
> [Joseph Telaak:
>   - did foo
>   - did bar]
>
> The above is completely unreadable.
>
> Thanks,
> Bartosz
>
