Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003772;
	b=1yZk9mnm/+TJ/OdL8xW06U86uNUwvlS9zZbXdpEefUERGEUCCx+QO7un+ooQymIiyw0u
	 Ze/JVYTFSC8FBahlkjm6fcyFB13jtbynszutHgzYOsZwEaZCgDWJHk9QyGYmpXBNGR9cZ
	 mvvlrdv7ySlbtIj+yaim8JbLlkWfo2gMKA9EMRslc+Xks36vH+I9xnygvzWSdXPqRCT1C
	 LOC2B3jKY4XwyT4LuS6sM2PUDxOXIJeptcQ6FcwGqdqwkvQZbJqok5/QryTaVb3ekW8P+
	 Uq9eRcdvcen8DDXjyivR0a3wufJZ5tkUMssgU1wTbDKhAn7m4dryjOjTexZ3DrRunXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RgXmha7CcSQWW68lEObtrAB+EUYAPG7XpUlj/LZ3mcs=;
	b=Nw7ABpbEzQw8Iaoov8XAObwoIvJUzFPVC+7sHTWAjvmMGpwQ5I2aGJp5p9btfLBiiu8W
	 pMSsXe+ScvNjDBCBMqQiK3uSzPSF5U3IpfSCHtUpcC8a9CYGI7u/7OAMR7/1xnHC5yOKb
	 L2Jj8odLKaJD+tNHKLExKYY0zM2+DvF7ml06MLWtGdl48ECnAukClmBApIS4yQvVQ55RA
	 ibX720qPZRMAVazdnf4eET4Ov/CmwMD4FNWz8ivEss/Bf4a6CSfoJzP46xRrdrtU8KOf6
	 sx+6CGVYK8DXSi1UcskePOh4NSoolU6TN9NhozpoRC9+IgY29SR+7y16vilyuPp4LIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mGQJ5UIA;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD49B606A321
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 08:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD49B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mGQJ5UIA
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so8585505e9.0
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 01:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003770; x=1793608570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgXmha7CcSQWW68lEObtrAB+EUYAPG7XpUlj/LZ3mcs=;
        b=mGQJ5UIAjeAsqYsIBhhQC0hB4fWg9EkY0mtMeaR8jnwNlB852EvDVO259FZj8wXLUU
         SubmyClKZxzskwEi/dMo4MTox7VHMrua9XESny39VGJLqeSgw9bGUN34r1L4kOTrxmoA
         k4FVc5tr3tmKrZ9SOvcmmGhR5unbpsUkmKyzjsma0OpsiBBTModDy0kyaLLpS50wNDd0
         RcA+x4QxASsVtbx7T4QEvtD3W3mAfQd4QiIm2HaXLUwlWfuEcYsjc63ORfxMahf9VzoG
         agW0415AWW/dvl4qbQgE+cPYQJI0uuKm7VIIJiifaLJsEzOSuS2n8oCiOuIiTkONfhtD
         qujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003770; x=1793608570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RgXmha7CcSQWW68lEObtrAB+EUYAPG7XpUlj/LZ3mcs=;
        b=DXLB06yt0lGoodxL5UBI3Iv4I6KqegTmOzsj1HuVvqBHokoz1thvQr4jQCcp/vWbNH
         r3wnaDP2HqgoxbGARcVoyiIlfZ/Yn3jCmnlQSyDC+ZbwwZ5DGesjTNHkdHMRKK/GOCCX
         RRNA5CIQlV1PCxHwyjhXgycEc8EjTRzOjbzrVQozJHa5GfsNbt/LdbsrZO86VG83IqL0
         0IqdZhfiYMUqs6q8CIatFq/T5lXY7uOqYICalWkF88QE4s8AXmB94WUPsH+bqoa5qY1v
         Qo7pTRuj2ioZ+ldUWtXxwlbvL8z5aehVeZFIawpfYuGuem+XIdWk7ARGtxA4iXFS6ukR
         sFuw==
X-Forwarded-Encrypted: i=1; AKwUvBzJvt/J/kshhZZN5PQZmEDyVVbALDL4eQ2ML2PAwrXEhFVSMXGT8NWckj3bFRdMOcZBTmHMUiS8f+Xj@vger.kernel.org
X-Gm-Message-State: AFq9FYIn+kwD1LIr8/tIU1tgzxOUr1wJSiucLPme8v2lfvezx/sjiEj8
	min0nY7tOjolKlATNdoq7yNLJ/ygAUVJnpJR95ztS7gJsjwG61tYcvDjQvUe8tMGf4g3HbVNxgR
	Fjr806EQ=
X-Gm-Gg: AYBFou3Bk40+/LlNo4dTFD9CODEk5PAkY0t9Wvl8L/LOj2pd35+JCutFama78ogx/A5
	+NvTJfEGSZ3S2DqJwgNgVrXijiavpA9HrhfovyxxU+7mF3IVwBuNZcqc3yp5VxK2duLN6U1MriU
	UTkLEln/yaJww5xHAb5+QxKajHMzIui8PW/zgNTXB0jmsWs0/GCx0eWr5X2Fy5Ahi5NmFkSEsPx
	op3g+F01nq8xQYzvnKMpjv1fXn3f5R9zQAwkHv5UCH8mBDity7FGfqfrp1yC0ZjooLeqbw++ece
	IM0wi5uIisyUpGDAvTV9sSGoGn1SCkL7mlWZ8N6tPLF+wBTqVQWXxzunZqePkpcKAgdiIkYmpO8
	QlQj5uYSdBA49puv0VXZnTLs2Y5rRVyjkhVWvfOE7Cl2ScFeRd01J+HiaJXdT/dO7CPAGpeNsaA
	QR9gvs96WtaZM+XQyHiyGbSF+dsoLj7oJ5fuBbR9VhwafcYm77u9l06h2Tjl0cL/2oy4SDqp0+4
	S8MmLSJBDw3nf9XpnBUMziT1gInimml4t6BNpYixdZrh1Eq1xOjZDWTVnLv07qsYOnmhlPsQizF
	ekE3wq3bQR375g==
X-Received: by 2002:a05:600c:3e8c:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4a35acab6cdmr93617695e9.28.1793003770060;
        Mon, 26 Oct 2026 01:36:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a59d998sm186175175e9.15.2026.10.26.01.36.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:36:09 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Vinod Koul <vkoul@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
	Paul Boddie <paul@boddie.org.uk>,
	Andreas Kemnade <akemnade@kernel.org>,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: Re: [PATCH] phy: ingenic: fix unbalanced regulator_disable() warning
Date: Mon, 26 Oct 2026 09:34:54 +0100
Message-ID: <20261026083454.29787-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <96da5fe557f3b2501447358895bd78decc4633ef.1735482146.git.hns@goldelico.com>
References: <96da5fe557f3b2501447358895bd78decc4633ef.1735482146.git.hns@goldelico.com>
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

Hi Vinod, Nikolaus,

I sent the same one-line fix on Saturday without finding this one first,
sorry for the duplicate:
https://lore.kernel.org/all/20261024051756.79342-1-olivier@mgcrea.io/

Please drop mine and take this one, it is the same change and it came
first. It still applies to phy next.

Tested on v7.3 on a HiBy R1 (Ingenic X1600, dummy PHY supply): without
it the unbalanced disable warning comes at every dwc2 probe, with it
there is none and USB still enumerates at high speed.

Tested-by: Olivier Louvignes <olivier@mgcrea.io>

If you want a Fixes tag, mine had:

Fixes: 31de313dfdcf ("PHY: Ingenic: Add USB PHY driver using generic PHY framework.")

Thanks,
Olivier
